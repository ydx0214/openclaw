# Task Health Rollup Template

用途：给后续 `task_health` 原型脚本提供最小输入/输出约定，直接消费 `status\*.last-run.json`，避免继续解析自由文本日志。

## Input

扫描目录：`status\*.last-run.json`

每个文件至少读取：

- `task`
- `status` (`ok | noop | fallback | error`)
- `path`
- `summary`
- `timestamp`
- `details`

## Output

建议输出一张轻量表：

| task | status | updated | summary |
|---|---|---|---|
| build_dashboard | ok | 2026-03-11T17:52:06+08:00 | dashboard rebuilt from latest weekly report |
| weekly_summary | ok | 2026-03-11T17:41:50+08:00 | weekly summary generated |
| auto_commit | ok | 2026-03-11T17:52:10+08:00 | commit created and pushed with verified remote alignment |

## Minimal Rules

1. 缺文件：记为 `missing`
2. 时间过旧：记为 `stale`
3. `error` 优先级最高，其次 `fallback`，再其次 `noop`，最后 `ok`
4. 首页只展示最近一次状态，不回溯全文日志
5. 人类看板与机器状态分离：看板渲染表格，脚本仍各自维护自己的 `last-run.json`

## First Version Scope

只做：

- 读取 `status\*.last-run.json`
- 生成一张任务健康表
- 标记 `ok / noop / fallback / error / missing / stale`

先不做：

- 告警推送
- 历史趋势图
- 自动修复
- 多仓库聚合
