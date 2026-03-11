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
- [x] 为岗位定向简历补一条“简历变体 -> 交付文件 -> 输出校验 -> 上传交接”的固定收口流程，减少上传错文件、旧文件或未验证导出的风险
- [x] 为 Word / 论文类任务补一条更短的可执行入口，默认包含 inspect、style-report、render-check 三步验收
- [ ] 将“职位官网研究 -> Career Application Prep Brief -> 材料缺口 -> form pack/简历变体 -> 浏览器填表”固定成求职类复杂任务的默认准备链路，减少边填边补材料的中途返工
- [x] 将“多页浏览器研究 -> Research Brief -> 下一流程输入（如 Career Prep Brief / form pack / 操作清单）”固定成默认衔接规则，减少查完资料后再次手工整理的重复劳动
- [x] 将 `Research Action Pack` 正式落成 `playbooks/research-action-pack.md`，并接入浏览器研究到表单 / 文档 / 简历 / 操作清单的执行交接链路，减少研究完成后再次手工整理输入的返工
- [ ] 继续把 `Action Pack` 叠层接到更多研究类入口，优先覆盖官网研究、政策/FAQ、文档转执行清单、产品对比后的决策交接
- [x] 将文档类复杂任务的末端收口固化为 `document-delivery-pack.md`，把“编辑/转换完成”提升为“一个可编辑源 + 一个明确交付文件 + 已验证下一步”的标准交接
- [ ] 继续把 `document-delivery-pack` 接到更多文档类入口，优先覆盖 Markdown->Word、PDF/Word 转交付、简历之外的一般 Office 交付场景
- [x] 将“浏览器下载触发 -> 本地落盘 -> 文件校验 -> 下一流程交接”固化成标准下载接力流程，优先降低 PDF/JD/导出文件类任务中的假完成与错文件复用风险
- [x] 将 completion proof 内嵌进 `browser-download-handoff.md`，把浏览器下载类任务的完成标准收紧为“精确本地文件 + 强证明信号 + 明确下一流程”，继续压低下载预览/提示误判为完成的风险
- [x] 将“已下载本地文件 -> 按执行目标分流到文档 / 求职 / 多媒体 / 解包流程”固化成标准路由规则，减少下载完成后停在本地文件、后续链路接不上或走错工具链的情况
- [x] 将“浏览器上传控件 -> Windows 文件对话框 -> 页面侧验收”固化成跨浏览器/桌面的标准上传接力流程，优先降低官网投递、附件表单、资料提交任务中的卡点
- [x] 将 completion proof 内嵌进 `browser-upload-handoff.md`，把上传类任务的完成标准收紧为“页面侧已接受目标文件 + 至少一条次证明 + handoff-ready”，继续压低官网投递、附件表单、资料提交中的假完成风险
- [x] 将“结构化资料 -> 字段映射 -> draft-ready 验证 -> 明确 submit 批准边界”固化成通用浏览器表单执行流程，优先降低多步骤表单、带上传表单和资料提交流程中的假完成与误提交风险
- [ ] 将 `Form Fill Pack` 前置到更多浏览器复杂任务入口，固定“先锁资料来源/上传文件/敏感确认/验收点，再执行页面动作”的默认准备步骤
- [x] 将“多步浏览器自动化默认使用 aria refs + 固定 targetId + 每步后刷新 snapshot”固化成浏览器任务稳定性规则，并接入 `web-form-execution.md`、`browser-research-briefing.md`、`browser-upload-handoff.md`、`browser-download-handoff.md`，优先压低 stale ref、跨步误操作和动态页面重绘导致的返工
- [ ] 继续把浏览器状态刷新规则扩到更多高频 browser playbook，并沉淀按任务类型区分的页面状态变化检查点
- [x] 将 research / prep / delivery / form / upload 这些已有 playbook 的默认串联顺序固化进 `openclaw-agent-delegation.md`，减少复杂混合任务中起手路由正确但中途接力断开的返工
- [x] 将 completion proof 内嵌进 `windows-file-dialog-handoff.md`，把 Open / Save / Save As / Select Folder 的完成标准收紧为“本地结果 + 源应用接受 + handoff-ready”，继续压低跨浏览器 / 桌面 / 文档链路中的假完成风险

## Phase 6

- [x] 为跨浏览器 / 桌面 / 文档任务补一份统一的 completion proof 模板，先定义最终产物、主证明信号、次证明信号、假完成陷阱和 handoff-ready 条件，继续压低复杂真实任务里的“看起来做了、实际没完成”问题
- [x] 将 completion proof 正式落成 `playbooks/completion-proof.md`，作为浏览器 / 桌面 / 文档 / 本地文件交接类复杂任务的统一验收覆盖层
- [x] 将 completion proof 内嵌进 `playbooks/local-file-delivery-handoff.md`，把本地文件交付类任务的完成标准收紧为“精确交付物 + 可见证明 + handoff-ready”，继续压低导出后错文件、旧文件和末端假完成风险

- [x] 将生图 / 视频生成类复杂任务统一为 `Generation Brief -> prompt pack -> acceptance` 默认前置流程，优先降低多轮 prompt 返工和交付失焦
- [ ] 将多媒体生成流程正式接入更多任务入口，默认按 playbook 执行而不是临时拼 prompt
- [ ] 为多媒体任务补“素材盘点 -> 参考图收集 -> 平台规格 -> 版本对比记录”四段式工作流，提升从模糊创意到可交付结果的稳定性
- [x] 补一份 `multimedia-prompt-pack-template.md`，把 `Generation Brief -> shared guardrails -> variant prompts -> acceptance -> next revision axis` 固化成可直接复用的首轮 prompt 输出模板，降低生图 / 视频 / 图生视频任务里从目标确认到可执行 prompt 的断层
- [ ] 为多媒体任务补版本对比记录与可复用素材清单，减少多轮生成后的资产散落与回退成本
- [ ] 如果多媒体任务持续高频，考虑将 `multimedia-prompt-pack-template.md` 提升为正式 playbook 或接入统一多媒体任务包
