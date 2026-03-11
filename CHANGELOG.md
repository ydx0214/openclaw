# Changelog

## 2026-03-11

- 初始化 `self-evolution-log` 项目结构
- 建立日报、周报、问题修复、想法与路线图目录
- 准备接入每日“自我进化”定时任务输出
- 修复看板构建脚本对周报文件名的硬编码，改为自动读取最新周报，降低时间耦合风险
- 修复自动提交脚本对推送分支 `main` 的硬编码，改为按当前 Git 分支自动推送，降低仓库环境耦合风险
- 修复看板构建脚本对 GitHub 仓库地址的硬编码，改为优先读取当前仓库 `origin` 远程地址，降低仓库迁移耦合风险

- 让看板分类统计从固定 5 类改为自动读取最新周报中的全部类别，减少新增分类后的静默漏显示风险
- 修复自动提交脚本在新分支/新仓库首次推送时缺少 upstream 的问题，失败后自动回退到 `git push --set-upstream origin <branch>`
- 把周报分类关键词从脚本内硬编码抽到 scripts/weekly_summary.categories.json，新增类别时只需改配置，降低后续维护耦合风险
- 给 weekly_summary.ps1 增加分类规则缺失/损坏时的内置回退与告警，避免单个配置文件问题阻断周报生成
- 给 build_dashboard.ps1 增加“无周报时继续生成看板”的降级回退，避免初始化阶段因上游文件缺失直接失败
- 给 auto_commit.ps1 增加 `origin` 远程预检与明确报错，减少新仓库初始化时的推送排障成本

- 将 auto_commit.ps1 的分支检测与 origin 远程预检前移到 commit 之前，避免推送前置条件缺失时产生半完成的本地提交
- 将“无人值守脚本统一采用 preflight -> execute -> verify -> explain 模板”写入 roadmap，作为后续日报/周报/看板/自动提交链路的一致化演进方向

- 给 weekly_summary.ps1 补最小 preflight / verify / explain：缺日报目录时直接报错、缺周报目录时自动创建、写出后校验关键章节并输出结构化成功摘要

- 给 build_dashboard.ps1 补最小 preflight / verify / explain，并输出结构化状态摘要，减少首页看板静默失败风险
- 给 auto_commit.ps1 补统一结构化状态输出与 push 后 SHA 校验，减少“提交成功但远端未对齐”的静默失真风险
- 将 weekly_summary.ps1 的成功输出统一为 `status=ok` 结构化摘要，补齐日报/周报/看板/自动提交链路的最小一致协议
- 在 roadmap 中补充统一状态输出协议（`task` / `status` / `path` / `summary`），为后续任务健康汇总与自动告警预留一致输入
- 新增 `ideas/task-health-summary-template.md`，把最小任务健康摘要协议落成可复用样例，降低后续新脚本接入统一状态输出的成本
- 新增 `ideas/last-run-status-template.json`，为无人值守脚本补一个可落盘的最近运行状态模板，降低后续看板/告警对文本解析的耦合
- 给 `build_dashboard.ps1` 接入 `status/build_dashboard.last-run.json` 最近运行状态落盘，验证“状态行 + JSON”双通道输出可落地
- 给 `weekly_summary.ps1` 接入 `status/weekly_summary.last-run.json` 最近运行状态落盘，补齐第二条核心汇总链路的双通道状态输出
- 给 `auto_commit.ps1` 接入 `status/auto_commit.last-run.json` 最近运行状态落盘，补齐提交链路的双通道状态输出，消除任务健康汇总的末端盲区
- 新增 `ideas/task-health-rollup-template.md`，先固化 `status/*.last-run.json` 的消费模板，为后续任务健康汇总脚本与首页健康区块预留稳定输入
- 新增 `ideas/task-health-freshness-template.md`，补充按任务区分的 freshness 阈值模板，降低后续 `stale` 判定的误报/漏报风险
- 新增 `ideas/task-health-registry-template.json`，显式定义监控任务、状态文件与 `allowNoop` 语义，降低后续健康汇总对文件名约定的隐式耦合
- 新增正式 `scripts/task_health.registry.json` 与 `scripts/task_health.ps1`，将 registry + `status/*.last-run.json` + freshness 规则串成首个可执行任务健康汇总原型
- 给 `build_dashboard.ps1` 接入 `status/task_health.summary.md`，让任务健康汇总首次进入首页主视图，减少“有状态但不可见”的落地断层
