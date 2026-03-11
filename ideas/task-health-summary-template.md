# Task Health Summary Template

用途：给无人值守脚本提供统一、最小、机器可读的执行结果格式，便于后续聚合到任务健康看板。

## Recommended Fields

- `task`: 任务名，稳定、短、可枚举
- `status`: `ok | noop | fallback | error`
- `path`: 主要输出路径；无输出可写 `-`
- `summary`: 一句话摘要，给人看

## One-Line Output Template

```text
OK: <TASK> task=<task>; status=<status>; path=<path>; summary=<summary>
```

## Examples

```text
OK: BUILD_DASHBOARD task=build_dashboard; status=ok; path=C:\repo\DASHBOARD.md; summary=dashboard rebuilt from latest weekly report
OK: AUTO_COMMIT task=auto_commit; status=noop; path=-; summary=no file changes to commit
OK: WEEKLY_SUMMARY task=weekly_summary; status=fallback; path=C:\repo\reports\weekly\2026-11.md; summary=used default categories because config was missing
ERR: AUTO_COMMIT task=auto_commit; status=error; path=-; summary=git remote origin missing
```

## Lightweight Rule

先统一字段，再扩展细节。新脚本先接入这 4 个字段，后续需要时再补 `branch`、`sha`、`reports`、`categories` 等扩展字段，避免一开始协议过重。
