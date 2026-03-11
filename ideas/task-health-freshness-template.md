# Task Health Freshness Template

用途：给后续 `task_health` 健康汇总脚本补一层最小“新鲜度”规则，避免只知道任务最后一次成功，却不知道这个成功是否已经过期。

## Why

已有 `status\*.last-run.json` 后，`stale` 不应靠统一固定时长硬编码判断；不同任务频率不同：

- `build_dashboard` 可能每天多次执行
- `weekly_summary` 可能每周一次
- `auto_commit` 可能按变更触发

如果所有任务都共用一个过期阈值，健康看板会出现误报或漏报。

## Minimal Rule

为每个任务单独定义 `freshnessBudget`：

| task | suggested freshnessBudget | note |
|---|---:|---|
| build_dashboard | 36h | 每日链路，允许少量延迟 |
| weekly_summary | 8d | 每周链路，覆盖周末/时区抖动 |
| auto_commit | 36h | 每日链路，按最近一次真实变更检查 |

判定规则：

1. 缺 `last-run.json` -> `missing`
2. `status=error` -> `error`
3. 超过该任务 `freshnessBudget` -> `stale`
4. 其余保留原状态：`fallback | noop | ok`

## Suggested Data Shape

可先不单独建配置文件，首版可在 `task_health` 脚本里内置：

```json
{
  "build_dashboard": { "freshnessHours": 36 },
  "weekly_summary": { "freshnessHours": 192 },
  "auto_commit": { "freshnessHours": 36 }
}
```

后续如果任务增多，再抽到独立配置。

## First Version Scope

只解决：

- `stale` 的一致判定
- 不同任务不同阈值
- 首页健康表可稳定显示 `missing / stale / error / fallback / noop / ok`

先不解决：

- 动态学习阈值
- 连续失败趋势
- 自动告警
- 自动重试
