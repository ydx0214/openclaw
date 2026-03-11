# Roadmap

## Phase 1

- [x] 建立项目结构
- [x] 建立日报模板
- [ ] 让定时任务输出到该项目目录
- [ ] 增加每日自动汇总到 CHANGELOG

## Phase 2

- [x] 增加每周汇总
- [x] 增加问题分类（模型、浏览器、自动化、配置）
- [x] 增加高频失败模式统计

## Phase 3

- [x] 接入 Git 自动提交脚本
- [x] 接入 GitHub 远程仓库
- [ ] 让每日任务自动触发 Git 提交
- [x] 生成可视化进化看板
- [ ] 让每日/每周任务自动刷新首页看板

## Phase 4

- [ ] 给无人值守脚本统一补上 `preflight -> execute -> verify -> explain` 稳态流程模板
- [ ] 将日报、周报、看板、自动提交脚本按同一模板做最小一致化
- [ ] 补一份统一状态输出协议：至少包含 `task`、`status=ok|noop|fallback|error`、`path`、`summary`，作为后续任务健康汇总与告警的最小输入
- [ ] 在统一 stdout 状态行之外，补一份可选的 `last-run.status.json` 落盘模板，减少后续看板/告警脚本对文本解析的耦合
- [ ] 为 `task_health` 定义按任务区分的 freshness 规则，稳定判定 `stale` 而不是用统一硬编码时长
- [ ] 补一份 monitored-task registry（任务清单 / statusFile / freshness / required / allowNoop），避免健康汇总继续依赖文件名约定和隐式猜测

## Phase 5

- [ ] 将复杂文档任务（PDF / Word / 简历 / 表格 / Markdown）沉淀成正式分流 playbook，优先提升任务起点的路由正确率
- [ ] 为简历与官网投递材料准备补一条“资料检查 -> 简历草稿 -> 变体 -> 表单包 -> 浏览器填表前校验”的固定工作流
- [ ] 为 Word / 论文类任务补一条更短的可执行入口，默认包含 inspect、style-report、render-check 三步验收
- [ ] 将“职位官网研究 -> Career Application Prep Brief -> 材料缺口 -> form pack/简历变体 -> 浏览器填表”固定成求职类复杂任务的默认准备链路，减少边填边补材料的中途返工
- [ ] 将“浏览器上传控件 -> Windows 文件对话框 -> 页面侧验收”固化成跨浏览器/桌面的标准上传接力流程，优先降低官网投递、附件表单、资料提交任务中的卡点

## Phase 6

- [ ] 将生图 / 视频生成类复杂任务统一为 `Generation Brief -> prompt pack -> acceptance` 默认前置流程，优先降低多轮 prompt 返工和交付失焦
- [ ] 为多媒体任务补“素材盘点 -> 参考图收集 -> 平台规格 -> 版本对比记录”四段式工作流，提升从模糊创意到可交付结果的稳定性
