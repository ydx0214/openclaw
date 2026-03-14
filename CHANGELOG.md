# Changelog

## 2026-03-14

- 下午15:30：新增 `playbooks/markdown-to-word-conversion.md`，标准化 Markdown 转 Word 文档的工作流：明确使用场景（论文/报告初稿、协作审阅、排版需求）、转换步骤、常见问题（图片、表格、代码块、中文字体）、快速命令汇总，并更新 PLAYBOOKS.md 在 document-ai-understanding-workflow 后新增 5.1 编号，减少 Markdown 转 Word 任务中无标准流程、格式问题无人可查的返工

- 下午：使用 `find-skills` 工具发现视频生成和图像生成的主流技能，更新 `playbooks/skill-discovery-workflow.md`：新增 inferen-sh/skills@ai-video-generation (18.7K安装) 和 inferen-sh/skills@ai-image-generation (18.9K安装)，这两个是目前最高安装量的视频/图像生成技能，为小红书/抖音等内容创作提供了新的能力选择

- 上午：探索语音能力方向（Speech-to-Text / Text-to-Speech），使用 `find-skills` 工具发现高价值语音技能：inferen-sh/skills@speech-to-text (1.2K安装)、elevenlabs/skills@text-to-speech (1.7K安装)、openai/skills@speech (342安装) 等，已更新 `playbooks/skill-discovery-workflow.md`，为未来集成语音转文字/文字转语音能力做准备

## 2026-03-13

- 在 `playbooks/browser-research-briefing.md` 中增强 Route A 和新增 Route E，填补浏览器研究结果到文档起草的对接能力空白：在 Route A 新增 "Output Delivery" 部分，明确政策/FAQ研究结果使用 research-evidence-pack -> document-task-routing 的路径；新增 Route E (Policy/FAQ to Document Draft)，提供完整工作流（证据捕获 -> evidence pack -> 文档路由 -> 带源引用的输出）和可直接复用的输出模板，明确使用 evidence pack 确保每个事实性claim都有source anchor，使文档可审核和可更新，接入 PLAYBOOKS.md 与 TOOLS.md，解决政策/FAQ研究完成后需要再次手工整理才能写成文档的重复劳动，减少source anchor丢失和引用失真的问题

- 新增 `playbooks/screenshot-post-processing.md`，填补截图后处理的标准化工作流空白：明确6条路由（裁剪/缩放/格式转换/压缩/尺寸查看/拼接），提供完整Python PIL命令示例和快速命令参考表，接入 PLAYBOOKS.md 与 TOOLS.md，前置连接 windows-desktop-automation 截图，后置连接 batch-file-studio、xiaohongshu、浏览器上传工作流，减少截图后需要临时拼代码或开Photoshop的返工

- 新增 `playbooks/resume-to-profile-import.md`，填补简历文件（PDF/DOCX）到候选人档案（candidate-profile.json）的同步工作流空白：明确工作流步骤（简历文本提取 -> AI字段解析 -> profile合并 -> 完整性验证），提供快速命令汇总（office-local extract + job-hunt-studio profile-status），接入 PLAYBOOKS.md 与 TOOLS.md，连接 office-local（文档提取）+ job-hunt-studio（档案管理）+ careers-site-application（网申投递）三个能力模块，减少用户手动从简历复制信息到candidate-profile的重复劳动

- 在 `playbooks/xiaohongshu-mcp-workflow.md` 中新增 "Video Note Analysis & Frame Extraction" 第四条工作流，补全小红书视频笔记分析的标准化流程：搜索视频笔记 -> 获取详情 -> 下载本地 -> ffmpeg 帧提取 -> 分析/封面生成，提供单帧/多帧/时间戳三种提取模式的命令示例，明确帧质量验证步骤和与 multimedia-source-asset-readiness、xiaohongshu-cover-image-generation 的集成点，补全之前 video-frame-extraction-capability-integration.md idea 中的 next steps，减少小红书视频相关任务无标准流程、帧提取命令分散的返工

- 新增 `playbooks/skill-discovery-workflow.md`，填补使用 find-skills 工具发现和评估新能力的标准化工作流空白：提供何时使用、常用搜索关键词（图像/视频/语音/文档/浏览器）、评估候选技能的标准、试用决策框架（按安装量判断优先级）、集成决策框架（长期使用/特定场景/回退），并记录本次发现的高价值技能（语音1.4K-1.6K安装、图像7.6K/3K安装、视频777/271安装），接入 PLAYBOOKS.md 与 TOOLS.md，减少发现新能力时无标准流程、评估标准不清晰的返工

- 新增 `playbooks/cron-task-workflow.md`，填补定时任务和提醒能力的工作流空白：明确任务类型（systemEvent vs agentTurn）、定时配置（at/every/cron三种模式）、Payload配置、交付模式（none/announce/webhook）、验证步骤和常见问题修复，提供常见场景表（健康审计/自我进化/用户提醒/系统监控）、Cron模式速查表和具体命令行示例，并接入 PLAYBOOKS.md 与 TOOLS.md，减少创建定时任务时配置错误或验证不完整的返工

- 新增 `playbooks/document-ai-understanding-workflow.md`，填补本地文档（PDF/DOCX）AI理解的工作流空白：明确何时使用AI理解文档（摘要、关键信息提取、跨文档综合、结构化输出）、提供完整的prompt模式（总结、提取、综合、结构化）、处理长文档的分块策略、与research-evidence-pack等下游工作流的集成点，与 browser-research-briefing.md 的"浏览器AI辅助研究"形成互补（一个处理网上信息，一个处理本地文件），并接入 PLAYBOOKS.md 与 TOOLS.md

- 在 `playbooks/browser-research-briefing.md` 中新增 "AI-Assisted Content Understanding" 部分，为浏览器研究工作流添加AI辅助理解和综合的能力指引，包含4个具体场景：跨页面综合、结构化数据提取、约束发现、AI结论验证规则，适用于定价对比、政策研究、技术文档等多页面复杂研究任务

- 学习使用 find-skills 工具发现 AI 能力生态中的新 skills，通过 `npx skills find image generation` 和 `npx skills find video generation` 发现多个高价值图像/视频生成 skills（ai-image-generation 21K 安装、ai-video-generation 20.7K 安装等），为后续能力接入提供候选方向，并把"使用 find-skills 发现新能力"记为能力评估的默认入口

- 新增 `self-evolution-log/ideas/video-frame-extraction-capability-integration.md`，把视频帧提取能力(ffmpeg)正式接入多媒体工作流，明确 video-frame extraction 的任务族（视频内容研究、视频封面提取、视频素材检查）、与 multimedia-source-asset-readiness 的集成点(Route E)、常用命令模式、completion proof 和下游交接规则，并把此能力增补到 PLAYBOOKS.md 与 TOOLS.md，减少视频相关任务中"有视频但不知道怎么提取帧用于分析/生成"的断层

- 新增 `playbooks/xiaohongshu-cover-image-generation.md`，把小红书封面图生成从通用多媒体工作流升级为平台专用 playbook：明确 3:4 比例、标题安全区、色彩风格等平台约束，提供 Generation Brief 模板、3 变体 Prompt Pack、Delivery Pack，与 xiaohongshu-mcp-workflow 形成"封面生成 -> MCP 发布"的完整链路，减少小红书封面图任务中临时拼凑比例/prompt/验收标准的返工

- 新增 `playbooks/short-video-cover-generation.md`，把短视频封面/缩略图生成从通用多媒体工作流升级为多平台专用 playbook：覆盖抖音/小红书/视频号/YouTube Shorts 四平台的 9:16/3:4/16:9 比例、分辨率、安全区规范，提供平台对比表、视频上下文锁定、Generation Brief 模板、3 变体 Prompt Pack、Delivery Pack，与视频编辑/发布流程形成"封面生成 -> 视频交接"的完整链路，减少短视频封面任务中临时查比例/错平台/安全区踩雷的返工

## 2026-03-12

- 新增 `playbooks/xiaohongshu-mcp-workflow.md`，把小红书 MCP 工具接入正式收口为内容研究、趋势分析、内容发布三条主链路，并与多媒体工作流和浏览器工作流形成标准交接，减少小红书任务无标准流程、发布失败无 proof 和多工具协同断层的返工
- 将 `self-evolution-log/ideas/browser-page-state-checkpoints-template.md` 正式落成 `playbooks/browser-page-state-checkpoints.md`，把多步浏览器任务中的页面状态变化检查点固化为 `action -> state checkpoint -> proof -> next action` 循环，并接入 `browser-upload-handoff.md`、`browser-research-briefing.md`、`browser-download-handoff.md`、`web-form-execution.md`、`PLAYBOOKS.md` 与 `TOOLS.md`，减少多步表单、上传、下载、研究任务中因页面状态变化后未刷新snapshot就继续操作导致的 stale ref 和假完成返工
- 新增 self-evolution-log/ideas/policy-faq-to-document-evidence-pack.md，把政策/FAQ研究结果转化为文档草稿的证据包结构化为 verbatim-ready claims / paraphrase-ready points / re-check required / missing information 四层结构，并接回 playbooks/research-evidence-pack.md 作为 Route B 的补充模板，减少政策页面、官方FAQ转 memo/guide/报告等文档任务中的"结论写出来了但不确定哪些能直接引用、哪些需要回源复核"的返工
- 新增 self-evolution-log/ideas/known-path-upload-artifact-lock.md，并回接 playbooks/attachment_readiness_pack.md 与 roadmap.md，把"已知路径本地文件 -> 浏览器上传前准备"收紧为 exact path -> upload role -> handoff intent(route-next) -> local proof -> upload field mapping -> page-side acceptance target，减少把"本地看过文件 / Explorer 选中过文件"误判成"已准备好上传"的返工
- 将"已知路径本地文件任务走 file/system fast path"接入 playbooks/local-file-delivery-handoff.md、playbooks/desktop-operations.md、PLAYBOOKS.md 与 TOOLS.md，把 打开这个文件/文件夹、Explorer 选中文件、本地 reveal/open/review、导出后本地审阅这类高频任务的默认链路收紧为 desktop-execution-lane-selector -> file/system lane judgment -> local-file-delivery-handoff，减少把已知路径任务误做成 Explorer 里重新找路径的 GUI 浏览返工
- 新增 `self-evolution-log/ideas/known-path-local-file-intent-card.md`，把已知本地路径任务进一步收紧为 `exact path -> handoff intent(reveal-only/open-for-review/route-next/delivery-pack) -> proof -> next route`，减少"资源管理器打开了/应用启动了"被误判成真实 handoff 已完成的返工
- 将 `known-path local file intent` 正式接入 `playbooks/local-file-delivery-handoff.md`、`playbooks/desktop-operations.md`、`PLAYBOOKS.md`、`TOOLS.md` 与 `roadmap.md`，把已知路径本地任务的默认完成判断从"路径存在/窗口打开"推进为"精确 artifact 已验证 + intent 已完成 + next route 明确（若需要）"，继续压低导出后本地审阅、上传前本地确认和 Explorer 选中文件场景里的假完成
- 将 `self-evolution-log/ideas/desktop-execution-lane-selector.md` 正式落成 `playbooks/desktop-execution-lane-selector.md`，并接入 `PLAYBOOKS.md`、`TOOLS.md` 与 `playbooks/desktop-operations.md`，把桌面 / Explorer / Office / 本地 GUI 复杂任务的默认前门判断固定为 `end state -> lane choice(file/system vs browser handoff vs semantic desktop vs visual/coordinate vs capability-gap) -> proof plan -> action`，减少一上来就错 lane、乱点、过早坐标化和过早升级能力的返工

- 新增 `self-evolution-log/experiments/browser-use-browser-capability-trial-pack.md`，把 `browser-use` 作为 OpenClaw 现有 browser lane 之外的候选 AI-assisted middle lane 压成一份可复用试投产验证包：明确真实任务族、官方能力声明、前提/成本、false-ready trap、本机最小 proof 路线与当前 `trial only` 结论；同时把这条方向写入 `roadmap.md`，避免因为 README / demo 很强就过早把它误判成已适合接入主 browser 链路

- 新增 `self-evolution-log/experiments/stagehand-browser-capability-trial-pack.md`，把 Stagehand 作为"浏览器 AI-assisted middle lane"候选能力压成一份可复用试投产验证包：明确真实任务族、官方能力声明、外部依赖/维护成本、false-ready trap、本机最小 proof 路线，以及当前 `trial only` 的投入结论；同时把这条方向写入 `roadmap.md`，避免因为 README 很强就过早把它误判成已适合接入 OpenClaw 主 browser 链路
- 将 `browser-auth-state-handoff -> browser-admin-report-execution-pack -> browser-admin-report-workflow` 进一步收紧为登录后后台 / 报表任务的默认前门链，并在 `playbooks/browser-admin-report-workflow.md` 增补可复用 `Admin / Report Proof Card`，把"已登录后台"推进为"账号/工作区、scope/filter、页面状态、产物与下一路线都已被独立证明"，继续压低错 workspace、错 scope 和导出后断链
- 新增 `playbooks/browser-admin-report-execution-pack.md`，并接入 `PLAYBOOKS.md`、`TOOLS.md` 与 `playbooks/browser-admin-report-workflow.md`，把登录后后台 / 报表 / 管理台任务在页面动作前先压成 `task goal -> auth lane -> scope lock -> page-state checkpoints -> output/handoff` 的小执行包，减少账号/workspace、筛选范围、输出类型和下游交接分散在执行过程中导致的错 scope、假完成与下载后断链
- 新增 `self-evolution-log/experiments/omniparser-omnitool-windows-trial-pack.md`，把 OmniParser / OmniTool 作为"桌面 screenshot grounding 补强"候选能力压成一份可复用验证包：明确任务族、官方能力声明、安装/权重/license/维护前提、false-ready trap、本机 smoke test 路线，以及当前 `trial only` 的投入结论；同时把这条方向写入 `roadmap.md`，避免因 benchmark/README 很强就过早把它误判成已适合接入 OpenClaw 主桌面链路
- 新增 `playbooks/browser-auth-proof-card.md`，并接回 `playbooks/browser-auth-state-handoff.md`、`PLAYBOOKS.md`、`TOOLS.md` 与 `roadmap.md`，把登录态浏览器任务在 lane 选定之后继续收口为 `auth class -> preferred lane -> visible account/workspace/role proof -> false-ready trap -> downstream workflow` 的小证明包，减少把"页面打开了 / 像后台 / 没看到登录框"误判成"当前会话已足够支撑后续后台、上传、下载、表单和 ATS 任务"的返工
## 2026-03-12

- 新增 self-evolution-log/ideas/known-path-upload-artifact-lock.md，并回接 playbooks/attachment-readiness-pack.md 与
oadmap.md，把"已知路径本地文件 -> 浏览器上传前准备"收紧为 exact path -> upload role -> handoff intent(route-next) -> local proof -> upload field mapping -> page-side acceptance target，减少把"本地看过文件 / Explorer 选中过文件"误判成"已准备好上传"的返工
- 将"已知路径本地文件任务走 file/system fast path"接入 playbooks/local-file-delivery-handoff.md、playbooks/desktop-operations.md、PLAYBOOKS.md 与 TOOLS.md，把 打开这个文件/文件夹、Explorer 选中文件、本地 reveal/open/review、导出后本地审阅这类高频任务的默认链路收紧为 desktop-execution-lane-selector -> file/system lane judgment -> local-file-delivery-handoff，减少把已知路径任务误做成 Explorer 里重新找路径的 GUI 浏览返工
- 将多媒体默认起手链继续收紧为 `multimedia-source-asset-readiness -> multimedia-platform-spec-card -> multimedia-generation-workflow -> multimedia-prompt-pack -> multimedia-iteration-log (if needed) -> multimedia-delivery-pack`，并同步更新 `PLAYBOOKS.md`、`TOOLS.md` 与 `playbooks/multimedia-generation-workflow.md`，同时补入小红书封面、图生视频、产品/Logo 敏感生成三个高频入口压缩路由，减少已有素材任务里边写 prompt 边补裁切/比例/安全区/保护元素导致的返工

- 将 `self-evolution-log/ideas/research-decision-pack-template.md` 正式落成 `playbooks/research-decision-pack.md`，并接入 `PLAYBOOKS.md`、`TOOLS.md`、`playbooks/browser-research-briefing.md` 与 `playbooks/research-action-pack.md`，把多选项研究的默认收口从"比较结论"推进为"可复核的 Decision Pack + 明确下一执行路线"，减少工具/平台选型、职位路径比较、政策执行路线选择和 OpenClaw 新能力投入判断中的二次整理、重复开页与决策理由丢失

- 新增 `playbooks/browser-upload-subtask-rule.md`，并接入 `PLAYBOOKS.md`、`TOOLS.md` 与 `playbooks/browser-upload-handoff.md`，把浏览器附件上传正式收口为独立子任务：先锁 `field + artifact`、做本地 proof、按 `browser-native / browser->windows-dialog` 选路、再以页面侧接受证明和下一安全动作收口；同时把默认上传链更新为 `local-file-delivery-handoff -> attachment-readiness-pack -> browser-upload-subtask-rule -> browser-upload-handoff -> windows-file-dialog-handoff (if needed)`，减少资料提交、后台附件更新、多附件表单和导出后二次上传里的错传版本、页面未接受却继续和把对话框关闭误判为完成的返工

- 将 `browser-auth-state-handoff` 继续前置到 `web-form-execution.md`、`browser-upload-handoff.md`、`browser-download-handoff.md` 与 `careers-site-application.md`，并同步更新 `PLAYBOOKS.md`、`TOOLS.md`，把登录后浏览器任务的默认起手从"直接进页面动作"收紧为"先选 auth lane 并证明登录态，再进入 form / upload / download / careers 下游流程"，减少因误用隔离浏览器、丢失现有 Chrome 会话或未证明登录态而造成的整链返工

- 新增 `playbooks/browser-auth-state-handoff.md`，并接入 `PLAYBOOKS.md`、`TOOLS.md` 与 `playbooks/browser-research-briefing.md`，把登录态浏览器任务的起手判断固定为 `task goal -> auth dependency -> browser lane(openclaw/chrome relay) -> visible auth proof -> downstream handoff`，减少登录后研究、官网登录后台和需复用本机 Chrome 会话的任务里因路线选错或未证明登录态而导致的返工



- 新增 `self-evolution-log/experiments/docling-windows-smoke-test-pack.md`，基于 Docling 官方文档首页、GitHub README 与 CLI reference，把 Windows 上复杂文档增强能力的最小验证路径固定为 `preconditions -> install -> baseline check -> 普通 PDF -> 多栏/表格 PDF -> 扫描件 OCR -> 6 维验收 -> invest now / trial only / defer`，用于后续判断 Docling 是否值得进入复杂 PDF / 表格 / 扫描件任务的长期能力建设

- 新增 `self-evolution-log/ideas/browser-upload-subtask-rule.md`，把"浏览器里的附件上传"明确收紧为独立子任务：先锁字段与唯一文件、再做本地 proof、按 `browser-native / browser->windows-dialog` 选路、最后以页面侧接受证明收口，并把这条规则追加进 `roadmap.md` 作为后续非求职资料提交、多附件表单、后台附件更新和导出后二次上传场景的默认演进方向

- 新增 `playbooks/multimedia-source-asset-readiness.md`，并接入 `PLAYBOOKS.md`、`TOOLS.md` 与 `playbooks/multimedia-generation-workflow.md`，把多媒体任务里"已有本地/下载素材"的前置环节固定为 `锁定唯一主素材 -> 验收清晰度/裁切/UI污染/主体稳定性 -> 标记 protected elements / forbidden drift -> 再进入 prompt/生成`，减少封面图、图生视频、产品图和截图派生素材任务里因错源图、低质截图、坏裁切和未标记保护元素导致的整链返工
## 2026-03-12

- 新增 self-evolution-log/ideas/known-path-upload-artifact-lock.md，并回接 playbooks/attachment-readiness-pack.md 与
oadmap.md，把"已知路径本地文件 -> 浏览器上传前准备"收紧为 exact path -> upload role -> handoff intent(route-next) -> local proof -> upload field mapping -> page-side acceptance target，减少把"本地看过文件 / Explorer 选中过文件"误判成"已准备好上传"的返工
- 将"已知路径本地文件任务走 file/system fast path"接入 playbooks/local-file-delivery-handoff.md、playbooks/desktop-operations.md、PLAYBOOKS.md 与 TOOLS.md，把 打开这个文件/文件夹、Explorer 选中文件、本地 reveal/open/review、导出后本地审阅这类高频任务的默认链路收紧为 desktop-execution-lane-selector -> file/system lane judgment -> local-file-delivery-handoff，减少把已知路径任务误做成 Explorer 里重新找路径的 GUI 浏览返工
- 新增 `playbooks/capability-evidence-pack.md`，并接入 `PLAYBOOKS.md`、`TOOLS.md` 与 `roadmap.md`，把 docs / README / vendor page / 官方能力页研究固定为 `Task Family -> Capability Claims -> Prerequisites / Constraints -> Proof Status -> Recommended Next Route` 的 `Capability Evidence Pack`，减少评估 skill / MCP / 工具 / ACP 方向时把 marketing claim、接入前提、本机 proof 和下一路线判断混成一层，导致"文档说能做"被误判成"真实任务已可做"的返工

## 2026-03-12

- 新增 self-evolution-log/ideas/known-path-upload-artifact-lock.md，并回接 playbooks/attachment-readiness-pack.md 与
oadmap.md，把"已知路径本地文件 -> 浏览器上传前准备"收紧为 exact path -> upload role -> handoff intent(route-next) -> local proof -> upload field mapping -> page-side acceptance target，减少把"本地看过文件 / Explorer 选中过文件"误判成"已准备好上传"的返工
- 将"已知路径本地文件任务走 file/system fast path"接入 playbooks/local-file-delivery-handoff.md、playbooks/desktop-operations.md、PLAYBOOKS.md 与 TOOLS.md，把 打开这个文件/文件夹、Explorer 选中文件、本地 reveal/open/review、导出后本地审阅这类高频任务的默认链路收紧为 desktop-execution-lane-selector -> file/system lane judgment -> local-file-delivery-handoff，减少把已知路径任务误做成 Explorer 里重新找路径的 GUI 浏览返工
- 将 `self-evolution-log/ideas/document-downstream-consumer-scorecard-template.md` 正式落成 `playbooks/document-downstream-consumer-scorecard.md`，并接入 `PLAYBOOKS.md`、`TOOLS.md` 与文档主链路，把复杂文档提取的默认验收从"lane 通过即可继续"收紧为"对具体下游消费者也足够可用"，按 `Markdown / Office / Excel / 简历 / Research Evidence Pack / Form Fill` 六类消费者分别检查 must-preserve elements、cleanup 成本与 failure cost，减少复杂 PDF / 扫描件 / 表格文档在进入高成本下游流程后才暴露结构失真、字段混淆和引用边界不清的返工

- 新增 `self-evolution-log/ideas/document-downstream-consumer-scorecard-template.md`，把复杂文档提取后的可用性从"lane 通过"继续收紧为"对具体下游消费者是否真可用"，按 `Markdown / Office / Excel / 简历 / Research Evidence Pack / Form Fill` 六类消费者分别检查 must-preserve elements、cleanup 成本与 failure cost，减少复杂 PDF / 扫描件 / 表格文档在进入高成本下游流程后才暴露结构失真、字段混淆和引用边界不清的返工

- 把"本地产物 -> 浏览器上传"的默认执行链正式写入 `PLAYBOOKS.md` 与 `TOOLS.md`：`local-file-delivery-handoff.md -> attachment-readiness-pack.md -> browser-upload-handoff.md -> windows-file-dialog-handoff.md (if needed)`，把上传前文件锁定、本地 proof、页面接受信号和系统对话框交接收成一条标准链，减少简历投递、材料提交、多附件表单里错传旧版本、边上传边找文件，以及把对话框关闭误判为上传成功的返工

- 新增 `playbooks/download-cleanup-pack.md`，并接入 `PLAYBOOKS.md`、`TOOLS.md` 与 `roadmap.md`，把"下载目录整理 / 上传前文件清洗 / 审阅前材料收口"固定为 `锁定唯一目标 -> 预览保留/排除范围 -> scoped cleanup -> 验证唯一交付包/目录 -> 下一交接`，减少浏览器下载后停在散乱本地文件、上传前临时挑文件和打包范围过宽导致的返工

- 新增 `self-evolution-log/ideas/document-extraction-lane-selector-template.md`，把复杂 PDF / 扫描件 / 多栏 / 表格型文档的起手判断收口为 `文档类型 + 主要目标 + 下游消费者 + 可接受清洗量 -> 选择最窄提取 lane`，减少把不同复杂文档一股脑塞进同一提取链路、导致后续 Markdown / 表格 / Office / 证据包阶段才暴露返工的问题

- 新增 `self-evolution-log/experiments/document-intelligence-trial-pack-docling.md`，把复杂 PDF / 表格 / 扫描件文档能力的试投产验证固定为 `3 类真实样例 + 6 项验收维度 + invest now / trial only / defer` 的 `Document Intelligence Trial Pack`，避免新文档解析能力只停在"功能很强"的介绍层，改为先证明它是否真能把复杂文档稳定转成下游可消费输入

- 把 `resume-evidence-pack` 真正接入 `career-prep-handoff.md` 与 `resume-tailoring-from-jd.md` 的默认求职链路，明确要求在存在真实 JD/官网岗位页时先产出 `Resume Evidence Pack`，再进入简历改写，减少弱匹配硬写、反复重开 JD 和简历/问答边界不清的返工

- 新增 `self-evolution-log/ideas/document-intelligence-capability-gate-docling.md`，把"是否值得引入更强本地文档智能解析能力"先收口为 `Capability Investment Gate`，当前结论定为 `trial only`：先用真实复杂 PDF / 表格 / 扫描件样例验证结构化输出质量、下游可消费性与 Windows 可维护性，再决定是否升级成正式 skill 或接入文档主链路

- 新增 `playbooks/multimedia-platform-spec-card.md`，并接入 `PLAYBOOKS.md`、`TOOLS.md` 与 `playbooks/multimedia-generation-workflow.md`，把多媒体任务的前置约束固定为 `主平台 -> 输出规格 -> 内容约束 -> 生产约束 -> 验收 -> 交接`，减少封面图、短视频、图生视频和跨平台复用任务里因输出契约不清导致的返工

- 新增 `playbooks/batch-rename-apply-guard.md`，并接入 `PLAYBOOKS.md`、`TOOLS.md` 与 `playbooks/local-batch-file-routing.md`，把高风险本地批量改名/移动任务的默认执行顺序固定为 `preview -> apply -> verify -> handoff`，减少下载目录整理、上传前文件清洗和素材批量改名中的范围漂移、误触文件族与"脚本成功=任务完成"的假完成

- ?? `playbooks/resume-evidence-pack.md`???? `PLAYBOOKS.md`?`TOOLS.md` ? `roadmap.md`????/JD ???????????????? `JD signal -> evidence strength -> safe usage -> do-not-claim boundary`??????????????? JD?????????/?????????
oadmap.md，把官网/JD 研究到简历定制之间的中间层固定为 JD signal -> evidence strength -> safe usage -> do-not-claim boundary，减少目标岗位简历定制里反复翻 JD、弱匹配硬写和简历/问答边界不清的返工

- 鏂板 `playbooks/browser-stable-execution.md`锛屽苟鎺ュ叆 `PLAYBOOKS.md`銆乣playbooks/browser-research-briefing.md`銆乣playbooks/web-form-execution.md`銆乣playbooks/browser-upload-handoff.md` 涓?`playbooks/browser-download-handoff.md`锛屾妸澶氭娴忚鍣ㄤ换鍔＄殑榛樿鎺ㄨ繘鍗曞厓姝ｅ紡鏀跺彛涓?`snapshot(refs=aria) -> one action -> state checkpoint -> refreshed snapshot -> next action`锛屽噺灏戝畼缃戠爺绌躲€佽〃鍗曞～鍐欍€佷笂浼犱笅杞藉拰鍚庡彴鎿嶄綔閲岀殑 stale ref銆佷笂涓嬫枃婕傜Щ涓庢妸鍔ㄤ綔鎴愬姛璇垽涓虹姸鎬佹垚鍔熺殑杩斿伐

- 灏?`self-evolution-log/ideas/capability-investment-gate-template.md` 姝ｅ紡钀芥垚 `playbooks/capability-investment-gate.md`锛屽苟鎺ュ叆 `PLAYBOOKS.md`銆乣TOOLS.md` 涓?`playbooks/capability-intake-handoff.md`锛屾妸 OpenClaw 鏂拌兘鍔?鏂板伐鍏锋帴鍏ョ被浠诲姟浠庘€滄妧鏈笂鑳芥帴鈥濊繘涓€姝ユ敹绱т负鈥滄槸鍚﹀€煎緱闀挎湡鎶曞叆鈥濈殑鏄惧紡闂搁棬锛屽噺灏戜负浣庡鐢ㄣ€侀珮缁存姢鑳藉姏杩囧害寤鸿鐨勮繑宸?

- 灏?`self-evolution-log/ideas/desktop-persisted-state-proof-template.md` 缁х画鎺ュ叆 `playbooks/windows-file-dialog-handoff.md` 涓?`playbooks/office-output-proof.md`锛屾妸 Save / Save As / Export 绫讳换鍔＄殑瀹屾垚鏍囧噯浠庘€滃璇濇鍏抽棴 + 鏂囦欢瀛樺湪鈥濇敹绱т负鈥滄湰鍦颁骇鐗╁凡楠岃瘉 + persisted-state proof + 涓嬫父鍙畨鍏ㄤ緷璧栤€濓紝鍑忓皯妗岄潰/Office 瀵煎嚭銆佸彟瀛樹负鍜屼笂浼犲墠鏂囨。閾捐矾閲屸€滅湅璧锋潵瀛樹簡鍏跺疄娌＄湡姝ｅ啓鍏ユ渶鏂扮姸鎬佲€濈殑杩斿伐

- 鏂板 `playbooks/attachment-readiness-pack.md`锛屽苟鎺ュ叆 `PLAYBOOKS.md` 涓?`roadmap.md`锛屾妸娴忚鍣ㄤ笂浼犲墠鐨勫噯澶囧眰鍥哄畾涓衡€渦pload field + chosen file + local proof + page-side acceptance target + next move鈥濓紝鍑忓皯瀹樼綉鎶曢€掋€佹潗鏂欐彁浜ゃ€佸闄勪欢琛ㄥ崟閲岃竟涓婁紶杈规壘鏂囦欢銆侀敊浼犵増鏈拰鎶婂璇濇鍏抽棴璇垽涓轰笂浼犳垚鍔熺殑杩斿伐

- 鏂板 `playbooks/acp-implementation-pack.md`锛屽苟鎺ュ叆 `PLAYBOOKS.md`銆乣TOOLS.md` 涓?`roadmap.md`锛屾妸 ACP coding 绫讳换鍔＄殑鍓嶇疆鏀跺彛鍥哄畾涓衡€滅洰鏍囩粨鏋?+ repo/workspace + scope boundary + acceptance checks + side-effect boundary + handoff requirement鈥濓紝鍑忓皯鐢?Codex / Claude Code / Gemini 鍋氬疄鐜颁换鍔℃椂鍥犱换鍔″寘杩囪櫄瀵艰嚧鐨勬緞娓呭洖鍚堛€佹敼鍋忓拰寮遍獙鏀?

- 鏂板 `playbooks/browser-export-proof.md`锛屽苟鎺ュ叆 `PLAYBOOKS.md`銆乣TOOLS.md`銆乣playbooks/browser-download-handoff.md`銆乣playbooks/web-form-execution.md` 涓?`roadmap.md`锛屾妸寮傛瀵煎嚭绫绘祻瑙堝櫒浠诲姟鍥哄畾涓衡€渆xport trigger + ready-state proof + local-file proof + next-route鈥濓紝鍑忓皯鎶ヨ〃/鍚庡彴/瀵煎嚭涓績鍦烘櫙閲屾妸 toast銆乻pinner銆乺eady button 鎴栨棫鏂囦欢璇垽涓哄畬鎴愮殑杩斿伐

- 鏂板 `playbooks/multimedia-delivery-pack.md`锛屽苟鎺ュ叆 `multimedia-generation-workflow.md`銆乣PLAYBOOKS.md`銆乣TOOLS.md` 涓?`roadmap.md`锛屾妸澶氬獟浣撲换鍔＄殑鏈鏀跺彛鍥哄畾涓衡€滀富浜や粯鐗堟湰 + 鍙鐢?prompt 璧勪骇 + 涓嬩竴浜ゆ帴鍔ㄤ綔 + completion proof鈥濓紝鍑忓皯灏侀潰鍥?鐭棰?鍥剧敓瑙嗛浠诲姟鍦ㄤ笂浼犮€佸彂甯冦€佸闃呭墠鍐嶆鎵嬪伐鎸戠増鏈拰涓㈠け winning prompt 鐨勮繑宸?

- 鏂板 `self-evolution-log/ideas/desktop-persisted-state-proof-template.md`锛屽苟鎺ュ叆 `playbooks/desktop-operations.md`銆乣PLAYBOOKS.md` 涓?`roadmap.md`锛屾妸妗岄潰/Office 缂栬緫鍚庣殑瀹屾垚鏍囧噯杩涗竴姝ユ敹绱т负鈥滃凡淇濆瓨/宸插簲鐢?+ 鑷冲皯涓€鏉℃寔涔呭寲璇佹槑鈥濓紝鍑忓皯鏂囨。淇敼銆佽缃彉鏇村拰鏈湴 GUI 缂栬緫閲屸€滅晫闈㈢湅璧锋潵鏀逛簡浣嗗疄闄呮病鍐欏叆鈥濈殑杩斿伐

- 鏂板 `playbooks/office-output-proof.md`锛屽苟鎺ュ叆 `document-delivery-pack.md`銆乣word-paper-fast-path.md`銆乣paper-formatting.md`銆乣PLAYBOOKS.md` 涓?`TOOLS.md`锛屾妸 Word / PDF / Excel / Markdown-to-Office 浜や粯浠诲姟鐨勫畬鎴愭爣鍑嗘敹绱т负鈥滃敮涓€浜や粯浠?+ freshness + 蹇呰鏍煎紡璇佹槑 + 涓嬩竴姝ヤ氦鎺モ€濓紝鍑忓皯鏃у鍑哄鐢ㄣ€侀敊鏂囦欢 handoff 鍜屼粎鍑枃浠跺瓨鍦ㄥ氨璇垽瀹屾垚鐨勯闄?

- 锟斤拷锟斤拷 `playbooks/multimedia-prompt-pack.md`锟斤拷锟斤拷锟斤拷锟斤拷 `PLAYBOOKS.md` 锟斤拷 `self-evolution-log/roadmap.md`锟斤拷锟窖讹拷媒锟藉复锟斤拷锟斤拷锟斤拷印锟絙rief 锟斤拷锟叫碉拷 prompt 锟斤拷锟斤拷一锟斤拷锟皆达拷锟斤拷谋锟斤拷锟斤拷锟斤拷锟轿?`shared guardrails -> variant prompts -> acceptance checklist -> next revision axis` 锟侥可革拷锟斤拷锟斤拷锟斤拷锟斤拷锟缴帮拷锟斤拷锟斤拷锟斤拷锟斤拷图 / 锟斤拷频 / 图锟斤拷锟斤拷频锟斤拷锟斤拷锟斤拷锟?prompt 锟斤拷锟斤拷锟斤拷姹撅拷冉锟绞э拷锟?

- 锟斤拷锟斤拷 `playbooks/career-form-fill-pack.md`锟斤拷锟斤拷锟斤拷锟斤拷 `playbooks/career-prep-handoff.md`锟斤拷`playbooks/careers-site-application.md`锟斤拷`playbooks/web-form-execution.md`锟斤拷`PLAYBOOKS.md` 锟斤拷 `roadmap.md`锟斤拷锟窖癸拷锟斤拷投锟斤拷锟叫★拷锟斤拷锟斤拷锟斤拷准锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷页锟斤拷执锟叫★拷之锟斤拷锟缴拷锟斤拷锟斤拷锟斤拷战锟斤拷锟揭伙拷锟斤拷筛锟斤拷锟街达拷邪锟斤拷锟斤拷锟斤拷俣嗖斤拷锟斤拷锟斤拷锟斤拷锟竭凤拷锟斤拷锟较憋拷锟筋、锟较达拷目锟疥不唯一锟斤拷锟斤拷锟斤拷锟街段伙拷锟斤拷姆锟斤拷锟?

- 锟斤拷锟斤拷 `self-evolution-log/ideas/capability-investment-gate-template.md`锟斤拷锟斤拷锟斤拷锟斤拷 `playbooks/capability-intake-handoff.md` 锟斤拷 `roadmap.md`锟斤拷锟窖★拷锟斤拷锟斤拷锟斤拷锟杰接碉拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷一锟斤拷锟斤拷锟斤拷为 `invest now / trial only / defer`锟斤拷锟斤拷锟酵碉拷频锟斤拷锟斤拷锟斤拷锟斤拷维锟斤拷锟缴憋拷锟竭碉拷锟斤拷 skill / MCP / 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷投锟斤拷姆锟斤拷锟?

- 锟斤拷锟斤拷 `self-evolution-log/ideas/research-decision-pack-template.md`锟斤拷锟斤拷锟斤拷锟斤拷选锟斤拷锟叫撅拷锟斤拷锟秸口达拷锟斤拷通锟饺斤拷锟斤拷锟斤拷为 `decision goal -> option evidence -> recommendation -> decision-switch triggers -> next executable move`锟斤拷同时锟斤拷锟斤拷 `playbooks/browser-research-briefing.md`锟斤拷`playbooks/research-action-pack.md`锟斤拷`PLAYBOOKS.md`锟斤拷`TOOLS.md` 锟斤拷 `roadmap.md`锟斤拷锟斤拷锟酵诧拷品/锟斤拷锟斤拷/路锟斤拷/锟斤拷锟斤拷锟皆憋拷锟斤拷锟斤拷锟叫★拷锟斤拷锟斤拷锟剿碉拷选锟斤拷锟斤拷锟缴诧拷锟缴革拷锟剿★拷锟斤拷锟斤拷锟窖硷拷锟斤拷执锟叫★拷锟侥断诧拷

- 锟斤拷锟斤拷 `self-evolution-log/ideas/capability-proof-pack-template.md`锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷小锟斤拷证锟斤拷锟斤拷锟斤拷 + proof signals + false-ready trap + IO contract + next handoff锟斤拷锟斤拷锟斤拷 `playbooks/capability-intake-handoff.md`锟斤拷`TOOLS.md` 锟斤拷 `roadmap.md`锟斤拷锟斤拷锟斤拷锟斤拷 skill / MCP / 锟斤拷锟竭斤拷锟斤拷锟叫★拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟剿碉拷锟斤拷锟斤拷锟斤拷锟饺讹拷支锟斤拷锟斤拷实锟斤拷锟今"的假撅拷锟斤拷锟斤拷锟斤拷
- 锟斤拷锟斤拷 `self-evolution-log/ideas/office-output-proof-template.md`锟斤拷锟斤拷锟斤拷 `lock artifact -> freshness proof -> format/render proof -> handoff proof` 锟斤拷锟斤拷 `playbooks/document-delivery-pack.md`锟斤拷`playbooks/word-paper-fast-path.md` 锟斤拷 `PLAYBOOKS.md`锟斤拷锟斤拷锟斤拷 Word / PDF / Office 锟斤拷锟斤拷锟斤拷锟斤拷锟叫旧碉拷锟斤拷锟斤拷锟矫★拷锟斤拷锟侥硷拷锟斤拷锟接和斤拷凭锟侥硷拷锟斤拷锟节撅拷锟斤拷锟斤拷锟斤拷傻姆锟斤拷锟?

- 锟斤拷锟斤拷 `self-evolution-log/ideas/browser-page-state-checkpoints-template.md`锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟街碉拷页锟斤拷状态锟戒化锟斤拷锟斤拷锟斤拷锟?`playbooks/browser-research-briefing.md`锟斤拷`playbooks/browser-upload-handoff.md`锟斤拷`playbooks/browser-download-handoff.md` 锟斤拷 `playbooks/web-form-execution.md`锟斤拷锟斤拷锟酵革拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷械锟?stale ref锟斤拷锟界步锟斤拷锟斤拷锟斤拷锟揭筹拷锟斤拷驯涞拷园锟斤拷锟阶刺拷锟斤拷锟斤拷锟斤拷锟斤拷姆锟斤拷锟斤拷锟斤拷锟?

- 锟斤拷锟斤拷 `playbooks/capability-intake-handoff.md`锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷 -> 锟斤拷锟斤拷锟斤拷锟铰凤拷锟?-> 锟斤拷小 smoke test -> 锟斤拷一执锟斤拷锟斤拷路锟斤拷锟斤拷锟斤拷 `PLAYBOOKS.md`锟斤拷`TOOLS.md` 锟斤拷 `roadmap.md`锟斤拷锟斤拷锟斤拷锟揭碉拷 skill / 锟斤拷锟斤拷 / MCP 锟斤拷没锟斤拷锟斤拷锟斤拷锟斤拷煽锟街达拷锟斤拷锟斤拷锟斤拷锟斤拷亩喜锟?

- 锟斤拷锟斤拷 `self-evolution-log/ideas/multimedia-platform-spec-card-template.md`锟斤拷锟斤拷锟斤拷锟斤拷媒锟藉工锟斤拷锟斤拷前锟斤拷为 `Platform Spec Card -> Generation Brief -> prompt pack -> iteration log -> delivery pack -> acceptance`锟斤拷同时锟斤拷锟斤拷 `playbooks/multimedia-generation-workflow.md` 锟斤拷 `roadmap.md`锟斤拷锟斤拷锟酵凤拷锟斤拷图锟斤拷锟斤拷锟斤拷频锟斤拷图锟斤拷锟斤拷频锟斤拷锟斤拷锟叫的达拷锟斤拷锟斤拷锟斤拷锟斤拷时锟斤拷锟斤拷锟斤拷锟斤拷全锟斤拷锟酵斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷傻姆锟斤拷锟?

- 锟斤拷锟斤拷 `self-evolution-log/ideas/batch-rename-apply-guard-template.md`锟斤拷锟斤拷锟斤拷锟竭凤拷锟秸憋拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷/锟狡讹拷锟斤拷锟斤拷锟?`preview -> apply -> verify` 锟斤拷锟斤拷锟斤拷锟斤拷锟?`playbooks/local-batch-file-routing.md` 锟斤拷 `roadmap.md`锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷目录锟斤拷锟斤拷锟斤拷锟较达拷前锟侥硷拷锟斤拷洗锟斤拷锟截诧拷锟斤拷锟斤拷锟斤拷锟斤拷锟饺革拷锟斤拷锟侥硷拷锟斤拷锟斤拷锟叫碉拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷募锟斤拷锟酵凤拷围漂锟狡凤拷锟斤拷

- 锟斤拷锟斤拷 `self-evolution-log/ideas/document-intake-brief-template.md`锟斤拷锟斤拷锟斤拷锟斤拷task goal -> source files -> output strategy -> constraints -> verification -> routing decision锟斤拷锟斤拷锟斤拷 `playbooks/document-task-routing.md` 锟斤拷 `roadmap.md`锟斤拷锟斤拷锟斤拷 PDF / Word / 锟斤拷锟斤拷 / 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟竭达拷锟斤拷路锟斤拷锟襟覆革拷原锟斤拷锟酵斤拷锟斤拷目锟疥不锟斤拷姆锟斤拷锟?

- 锟斤拷锟斤拷 `self-evolution-log/ideas/multimedia-delivery-pack-template.md`锟斤拷锟斤拷锟斤拷锟斤拷媒锟藉工锟斤拷锟斤拷锟斤拷 `Generation Brief -> prompt pack -> iteration log -> acceptance` 锟斤拷展为 `Generation Brief -> prompt pack -> iteration log -> delivery pack -> acceptance`锟斤拷同时锟斤拷锟斤拷 `playbooks/multimedia-generation-workflow.md` 锟斤拷 `roadmap.md`锟斤拷锟斤拷锟斤拷锟斤拷图 / 锟斤拷频 / 图锟斤拷锟斤拷频锟斤拷锟斤拷锟斤拷锟斤拷锟缴猴拷锟较达拷/锟斤拷锟斤拷前锟侥版本失锟斤拷锟斤拷锟截诧拷散锟斤拷锟斤拷末锟剿硷拷锟斤拷煞锟斤拷锟?

- 锟斤拷锟斤拷 `playbooks/local-batch-file-routing.md`锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷 ZIP/锟斤拷压锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷图片转锟斤拷锟斤拷锟斤拷锟斤拷展锟斤拷锟斤拷锟斤拷锟斤拷校锟斤拷汀锟斤拷募锟斤拷锟斤拷锟较达拷锟斤拷锟斤拷锟侥匡拷锟斤拷锟斤拷锟斤拷 `local-toolbox` / `batch-file-studio`锟斤拷同时锟斤拷锟斤拷 `PLAYBOOKS.md`锟斤拷`TOOLS.md` 锟斤拷 `roadmap.md`锟斤拷锟斤拷锟酵憋拷锟斤拷锟侥硷拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟叫凤拷围锟斤拷锟藉、锟斤拷锟斤拷锊伙拷锟饺凤拷汀锟斤拷锟斤拷锟斤拷锟斤拷说锟斤拷募锟轿达拷锟斤拷锟?handoff-ready锟斤拷锟侥凤拷锟斤拷

- 锟斤拷锟斤拷 `ideas/desktop-action-proof-template.md`锟斤拷锟斤拷锟斤拷锟斤拷Final artifact / Primary proof / Secondary proof / False-completion trap / Handoff-ready锟斤拷锟斤拷锟斤拷 `playbooks/desktop-operations.md` 锟斤拷 `roadmap.md`锟斤拷锟斤拷锟斤拷锟斤拷源锟斤拷锟斤拷锟斤拷锟斤拷Office 锟诫本锟斤拷 GUI 锟斤拷锟斤拷锟叫★拷锟斤拷锟斤拷锟斤拷锟斤拷去锟剿碉拷目锟斤拷状态没锟斤拷锟斤拷锟斤拷伞锟斤拷募锟斤拷锟缴凤拷锟斤拷

- 锟斤拷锟斤拷 `playbooks/document-delivery-pack.md`锟斤拷锟斤拷锟斤拷锟斤拷source of truth -> delivery artifact -> output check -> next-step handoff锟斤拷锟斤拷锟斤拷 `PLAYBOOKS.md`锟斤拷`playbooks/document-task-routing.md` 锟斤拷 `roadmap.md`锟斤拷锟斤拷锟斤拷 Word / PDF / Markdown / Office 锟侥碉拷锟斤拷锟斤拷锟斤拷末锟剿斤拷锟斤拷时锟侥达拷锟侥硷拷锟斤拷锟斤拷锟侥硷拷锟酵硷拷锟斤拷煞锟斤拷锟?

- 锟斤拷锟斤拷 `self-evolution-log/ideas/multimedia-prompt-pack-template.md`锟斤拷锟斤拷锟斤拷锟斤拷Generation Brief -> shared guardrails -> variant prompts -> acceptance -> next revision axis锟斤拷锟斤拷锟斤拷 `playbooks/multimedia-generation-workflow.md` 锟斤拷 `roadmap.md`锟斤拷锟斤拷锟斤拷锟斤拷图 / 锟斤拷频 / 图锟斤拷锟斤拷频锟斤拷锟斤拷锟侥匡拷锟饺凤拷系锟斤拷锟街达拷锟?prompt 之锟斤拷亩喜锟?
- 锟斤拷锟斤拷 `playbooks/research-action-pack.md`锟斤拷锟窖★拷Research Brief -> Action Pack -> 锟斤拷一执锟斤拷锟斤拷锟教★拷锟斤拷式锟教伙拷为锟叫撅拷锟斤拷锟斤拷锟斤拷谋锟阶硷拷锟斤拷硬悖拷锟斤拷锟斤拷锟?`PLAYBOOKS.md`锟斤拷`TOOLS.md`锟斤拷`playbooks/browser-research-briefing.md` 锟斤拷 `roadmap.md`锟斤拷锟斤拷锟劫癸拷锟斤拷锟叫撅拷锟斤拷锟斤拷锟斤拷/FAQ锟斤拷锟斤拷品锟皆比★拷职位锟叫撅拷锟斤拷珊锟揭拷止锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟侥凤拷锟斤拷
## 2026-03-11

- 锟斤拷锟斤拷 `ideas/research-action-pack-template.md`锟斤拷锟斤拷锟斤拷锟斤拷Research Brief -> Action Pack -> 锟斤拷一锟斤拷锟斤拷锟斤拷锟诫"锟斤拷式锟斤拷锟斤拷 `playbooks/browser-research-briefing.md` 锟斤拷 `roadmap.md`锟斤拷锟斤拷锟劫癸拷锟斤拷锟叫撅拷锟斤拷锟斤拷锟斤拷/FAQ锟斤拷职位锟叫撅拷锟斤拷锟侥碉拷转执锟斤拷锟藉单锟斤拷锟劫达拷锟街癸拷锟斤拷锟斤拷锟斤拷锟截革拷锟酵讹拷

- 锟斤拷锟斤拷 ideas/form-fill-pack-template.md锟斤拷锟窖革拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟街达拷锟角帮拷锟斤拷锟斤拷锟阶硷拷锟斤拷锟斤拷锟轿骋?Form Fill Pack 模锟藉，锟斤拷锟斤拷锟斤拷 playbooks/web-form-execution.md 锟斤拷
oadmap.md锟斤拷锟斤拷锟酵癸拷锟斤拷锟斤拷锟诫、锟斤拷锟斤拷锟结交锟酵达拷锟较达拷锟洁步锟斤拷锟斤拷锟叫的憋拷锟斤拷卟隆锟斤拷锟斤拷锟狡拷锟斤拷锟斤拷锟斤拷峤伙拷锟斤拷锟?

- 锟斤拷锟斤拷 `ideas/browser-stable-automation-rule.md`锟斤拷锟斤拷锟斤拷锟斤拷锟洁步锟斤拷锟斤拷锟斤拷锟斤拷锟侥拷锟绞癸拷锟?`snapshot(refs=aria)` + 锟教讹拷 `targetId` + 每锟斤拷锟斤拷状态锟戒化刷锟斤拷 snapshot`锟斤拷锟斤拷锟斤拷 `TOOLS.md` 锟斤拷 `playbooks/web-form-execution.md`锟斤拷锟斤拷锟酵讹拷态页锟芥、锟洁步锟斤拷锟斤拷锟斤拷锟斤拷洗锟斤拷锟斤拷锟斤拷械锟?stale ref 锟斤拷绮斤拷锟斤拷锟斤拷锟斤拷锟斤拷

- 锟斤拷始锟斤拷 `self-evolution-log` 锟斤拷目锟结构
- 锟斤拷锟斤拷锟秸憋拷锟斤拷锟杰憋拷锟斤拷锟斤拷锟斤拷锟睫革拷锟斤拷锟诫法锟斤拷路锟斤拷图目录
- 准锟斤拷锟斤拷锟斤拷每锟秸★拷锟斤拷锟揭斤拷锟斤拷锟斤拷锟斤拷时锟斤拷锟斤拷锟斤拷锟?
- 锟睫革拷锟斤拷锟藉构锟斤拷锟脚憋拷锟斤拷锟杰憋拷锟侥硷拷锟斤拷锟斤拷硬锟斤拷锟诫，锟斤拷为锟皆讹拷锟斤拷取锟斤拷锟斤拷锟杰憋拷锟斤拷锟斤拷锟斤拷时锟斤拷锟斤拷戏锟斤拷锟?
- 锟睫革拷锟皆讹拷锟结交锟脚憋拷锟斤拷锟斤拷锟酵凤拷支 `main` 锟斤拷硬锟斤拷锟诫，锟斤拷为锟斤拷锟斤拷前 Git 锟斤拷支锟皆讹拷锟斤拷锟酵ｏ拷锟斤拷锟酵仓库环锟斤拷锟斤拷戏锟斤拷锟?
- 锟睫革拷锟斤拷锟藉构锟斤拷锟脚憋拷锟斤拷 GitHub 锟街匡拷锟街凤拷锟接诧拷锟斤拷耄拷锟轿拷锟斤拷榷锟饺★拷锟角帮拷挚锟?`origin` 远锟教碉拷址锟斤拷锟斤拷锟酵仓匡拷迁锟斤拷锟斤拷戏锟斤拷锟?

- 锟矫匡拷锟斤拷锟斤拷锟酵筹拷拼庸潭锟?5 锟斤拷锟轿拷远锟斤拷锟饺★拷锟斤拷锟斤拷鼙锟斤拷械锟饺拷锟斤拷锟金，硷拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟侥撅拷默漏锟斤拷示锟斤拷锟斤拷
- 锟睫革拷锟皆讹拷锟结交锟脚憋拷锟斤拷锟铰凤拷支/锟铰仓匡拷锟阶达拷锟斤拷锟斤拷时缺锟斤拷 upstream 锟斤拷锟斤拷锟解，失锟杰猴拷锟皆讹拷锟斤拷锟剿碉拷 `git push --set-upstream origin <branch>`
- 锟斤拷锟杰憋拷锟斤拷锟斤拷丶锟斤拷蚀咏疟锟斤拷锟接诧拷锟斤拷锟介到 scripts/weekly_summary.categories.json锟斤拷锟斤拷锟斤拷锟斤拷锟绞敝伙拷锟斤拷锟斤拷锟矫ｏ拷锟斤拷锟酵猴拷锟斤拷维锟斤拷锟斤拷戏锟斤拷锟?
- 锟斤拷 weekly_summary.ps1 锟斤拷锟接凤拷锟斤拷锟斤拷锟饺笔?锟斤拷时锟斤拷锟斤拷锟矫伙拷锟斤拷锟斤拷婢拷锟斤拷锟斤拷獾ワ拷锟斤拷锟斤拷锟斤拷募锟斤拷锟斤拷锟斤拷锟斤拷锟杰憋拷锟斤拷锟斤拷
- 锟斤拷 build_dashboard.ps1 锟斤拷锟接★拷锟斤拷锟杰憋拷时锟斤拷锟斤拷锟斤拷锟缴匡拷锟藉"锟侥斤拷锟斤拷锟斤拷锟剿ｏ拷锟斤拷锟斤拷锟绞硷拷锟斤拷锥锟斤拷锟斤拷锟斤拷锟斤拷募锟饺笔е憋拷锟绞э拷锟?
- 锟斤拷 auto_commit.ps1 锟斤拷锟斤拷 `origin` 远锟斤拷预锟斤拷锟斤拷锟斤拷确锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟铰仓匡拷锟绞硷拷锟绞憋拷锟斤拷锟斤拷锟斤拷锟斤拷铣杀锟?

- 锟斤拷 auto_commit.ps1 锟侥凤拷支锟斤拷锟斤拷锟?origin 远锟斤拷预锟斤拷前锟狡碉拷 commit 之前锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷前锟斤拷锟斤拷锟斤拷缺失时锟斤拷锟斤拷锟斤拷锟斤拷傻谋锟斤拷锟斤拷峤?
- 锟斤拷锟斤拷锟斤拷锟斤拷值锟截脚憋拷统一锟斤拷锟斤拷 preflight -> execute -> verify -> explain 模锟藉"写锟斤拷 roadmap锟斤拷锟斤拷为锟斤拷锟斤拷锟秸憋拷/锟杰憋拷/锟斤拷锟斤拷/锟皆讹拷锟结交锟斤拷路锟斤拷一锟铰伙拷锟捷斤拷锟斤拷锟斤拷

- 锟斤拷 weekly_summary.ps1 锟斤拷锟斤拷小 preflight / verify / explain锟斤拷缺锟秸憋拷目录时直锟接憋拷锟斤拷锟斤拷缺锟杰憋拷目录时锟皆讹拷锟斤拷锟斤拷锟斤拷写锟斤拷锟斤拷校锟斤拷丶锟斤拷陆诓锟斤拷锟斤拷锟结构锟斤拷锟缴癸拷摘要

- 锟斤拷 build_dashboard.ps1 锟斤拷锟斤拷小 preflight / verify / explain锟斤拷锟斤拷锟斤拷锟斤拷峁癸拷锟阶刺拷锟斤拷锟斤拷锟斤拷锟揭筹拷锟斤拷寰材э拷芊锟斤拷锟?
- 锟斤拷 auto_commit.ps1 锟斤拷统一锟结构锟斤拷状态锟斤拷锟斤拷锟?push 锟斤拷 SHA 校锟介，锟斤拷锟劫★拷锟结交锟缴癸拷锟斤拷远锟斤拷未锟斤拷锟诫"锟侥撅拷默失锟斤拷锟斤拷锟?
- 锟斤拷 weekly_summary.ps1 锟侥成癸拷锟斤拷锟酵骋晃?`status=ok` 锟结构锟斤拷摘要锟斤拷锟斤拷锟斤拷锟秸憋拷/锟杰憋拷/锟斤拷锟斤拷/锟皆讹拷锟结交锟斤拷路锟斤拷锟斤拷小一锟斤拷协锟斤拷
- 锟斤拷 roadmap 锟叫诧拷锟斤拷统一状态锟斤拷锟叫拷椋╜task` / `status` / `path` / `summary`锟斤拷锟斤拷为锟斤拷锟斤拷锟斤拷锟今健匡拷锟斤拷锟斤拷锟斤拷锟皆讹拷锟芥警预锟斤拷一锟斤拷锟斤拷锟斤拷
- 锟斤拷锟斤拷 `ideas/task-health-summary-template.md`锟斤拷锟斤拷锟斤拷小锟斤拷锟今健匡拷摘要协锟斤拷锟斤拷煽筛锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷秃锟斤拷锟斤拷陆疟锟斤拷锟斤拷锟酵骋蛔刺拷锟斤拷锟侥成憋拷
- 锟斤拷锟斤拷 `ideas/last-run-status-template.json`锟斤拷为锟斤拷锟斤拷值锟截脚憋拷锟斤拷一锟斤拷锟斤拷锟斤拷锟教碉拷锟斤拷锟斤拷锟斤拷锟阶刺ｏ拷澹拷锟斤拷秃锟斤拷锟斤拷锟斤拷锟?锟芥警锟斤拷锟侥憋拷锟斤拷锟斤拷锟斤拷锟斤拷锟?
- 锟斤拷 `build_dashboard.ps1` 锟斤拷锟斤拷 `status/build_dashboard.last-run.json` 锟斤拷锟斤拷锟斤拷锟阶刺拷锟斤拷蹋锟斤拷锟街わ拷锟阶刺拷锟?+ JSON锟斤拷双通锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷
- 锟斤拷 `weekly_summary.ps1` 锟斤拷锟斤拷 `status/weekly_summary.last-run.json` 锟斤拷锟斤拷锟斤拷锟阶刺拷锟斤拷蹋锟斤拷锟斤拷锟节讹拷锟斤拷锟斤拷锟侥伙拷锟斤拷锟斤拷路锟斤拷双通锟斤拷状态锟斤拷锟?
- 锟斤拷 `auto_commit.ps1` 锟斤拷锟斤拷 `status/auto_commit.last-run.json` 锟斤拷锟斤拷锟斤拷锟阶刺拷锟斤拷蹋锟斤拷锟斤拷锟斤拷峤伙拷锟铰凤拷锟剿拷锟阶刺拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟今健匡拷锟斤拷锟杰碉拷末锟斤拷盲锟斤拷
- 锟斤拷锟斤拷 `ideas/task-health-rollup-template.md`锟斤拷锟饺固伙拷 `status/*.last-run.json` 锟斤拷锟斤拷锟斤拷模锟藉，为锟斤拷锟斤拷锟斤拷锟今健匡拷锟斤拷锟杰脚憋拷锟斤拷锟斤拷页锟斤拷锟斤拷锟斤拷锟斤拷预锟斤拷锟饺讹拷锟斤拷锟斤拷
- 锟斤拷锟斤拷 `ideas/task-health-freshness-template.md`锟斤拷锟斤拷锟戒按锟斤拷锟斤拷锟斤拷锟街碉拷 freshness 锟斤拷值模锟藉，锟斤拷锟酵猴拷锟斤拷 `stale` 锟叫讹拷锟斤拷锟斤拷/漏锟斤拷锟斤拷锟斤拷
- 锟斤拷锟斤拷 `ideas/task-health-registry-template.json`锟斤拷锟斤拷式锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷状态锟侥硷拷锟斤拷 `allowNoop` 锟斤拷锟藉，锟斤拷锟酵猴拷锟斤拷锟斤拷锟斤拷锟斤拷锟杰讹拷锟侥硷拷锟斤拷约锟斤拷锟斤拷锟斤拷式锟斤拷锟?
- 锟斤拷锟斤拷锟斤拷式 `scripts/task_health.registry.json` 锟斤拷 `scripts/task_health.ps1`锟斤拷锟斤拷 registry + `status/*.last-run.json` + freshness 锟斤拷锟津串筹拷锟阶革拷锟斤拷执锟斤拷锟斤拷锟今健匡拷锟斤拷锟斤拷原锟斤拷
- 锟斤拷 `build_dashboard.ps1` 锟斤拷锟斤拷 `status/task_health.summary.md`锟斤拷锟斤拷锟斤拷锟今健匡拷锟斤拷锟斤拷锟阶次斤拷锟斤拷锟斤拷页锟斤拷锟斤拷图锟斤拷锟斤拷锟劫★拷锟斤拷状态锟斤拷锟斤拷锟缴硷拷锟斤拷锟斤拷锟斤拷囟喜锟?
- 锟斤拷锟斤拷 `ideas/document-task-routing-template.md`锟斤拷锟斤拷 PDF / Word / 锟斤拷锟斤拷 / 锟斤拷锟斤拷 / Markdown 锟斤拷锟斤拷锟斤拷锟轿骋伙拷锟斤拷锟斤拷锟斤拷锟斤拷锟侥ｏ拷澹拷锟斤拷透锟斤拷锟斤拷牡锟斤拷锟斤拷锟斤拷叽锟斤拷锟斤拷锟斤拷锟斤拷锟铰┬ｏ拷锟侥革拷锟斤拷
- 锟斤拷锟斤拷 `playbooks/document-task-routing.md`锟斤拷锟窖革拷锟斤拷锟侥碉拷锟斤拷锟斤拷锟斤拷取锟斤拷锟脚版、锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷Markdown 锟斤拷锟斤拷 5 锟斤拷路锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷 `PLAYBOOKS.md` 锟斤拷 `TOOLS.md`
- 锟斤拷锟斤拷 `ideas/browser-research-briefing-template.md`锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟窖?锟斤拷锟斤拷锟斤拷锟斤拷/锟斤拷页锟斤拷锟斤拷锟斤拷锟较筹拷锟斤拷为统一锟斤拷模锟藉，锟斤拷锟饺凤拷锟斤拷职位锟叫撅拷锟斤拷锟斤拷品锟皆比★拷锟侥碉拷转锟斤拷锟斤拷锟斤拷锟斤拷锟饺革拷锟斤拷锟斤拷实锟斤拷锟斤拷
- 锟斤拷锟斤拷 `ideas/career-application-prep-brief-template.md`锟斤拷锟窖★拷职位锟斤拷锟斤拷锟叫撅拷 -> 锟斤拷锟斤拷缺锟斤拷 -> Fill Readiness -> form pack/锟斤拷锟斤拷锟斤拷锟斤拷准锟斤拷锟斤拷锟教伙拷锟斤拷锟斤拷职锟洁复锟斤拷锟斤拷锟斤拷锟酵讹拷锟角白硷拷锟侥ｏ拷澹拷锟斤拷锟斤拷贪锟?Prep Brief 锟斤拷锟斤拷 `playbooks/careers-site-application.md`

- 锟斤拷锟斤拷锟斤拷锟斤拷锟?锟斤拷锟斤拷锟侥硷拷锟较达拷锟斤拷锟斤拷模锟藉，锟斤拷确锟较达拷前锟斤拷锟斤拷锟侥硷拷路锟斤拷锟斤拷Browser -> Windows 锟皆伙拷锟斤拷庸堋锟揭筹拷锟斤拷锟斤拷锟秸ｏ拷锟斤拷锟斤拷锟斤拷 desktop / careers playbook锟斤拷锟斤拷锟酵癸拷锟斤拷投锟斤拷锟诫复锟接憋拷锟斤拷锟斤拷锟斤拷锟较达拷锟叫的硷拷锟斤拷煞锟斤拷锟?
- 锟斤拷锟较达拷锟斤拷锟斤拷模锟斤拷锟斤拷式锟斤拷锟?`playbooks/browser-upload-handoff.md` 锟斤拷锟斤拷锟斤拷 `PLAYBOOKS.md`锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷洗锟斤拷锟斤拷锟轿拷筛锟斤拷玫亩锟斤拷锟斤拷锟斤拷锟?
- 锟斤拷锟斤拷 `ideas/multimedia-generation-brief-template.md`锟斤拷锟斤拷锟斤拷图 / 锟斤拷频锟斤拷锟斤拷锟斤拷锟斤拷前锟斤拷锟秸匡拷为统一 `Generation Brief` 模锟藉，锟斤拷锟酵讹拷锟斤拷 prompt 锟斤拷锟斤拷锟酵讹拷媒锟藉交锟斤拷失锟斤拷锟斤拷锟斤拷
- 锟斤拷锟斤拷锟斤拷式 `playbooks/multimedia-generation-workflow.md`锟斤拷锟窖讹拷媒锟斤拷锟斤拷锟斤拷锟斤拷锟轿?`锟截诧拷锟教碉拷 -> Generation Brief -> prompt pack -> acceptance` 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷 `PLAYBOOKS.md`
- 锟斤拷锟斤拷 `ideas/multimedia-iteration-log-template.md`锟斤拷锟斤拷锟斤拷锟斤拷媒锟藉工锟斤拷锟斤拷锟斤拷锟斤拷为 `锟截诧拷锟教碉拷 -> Generation Brief -> prompt pack -> iteration log -> acceptance`锟斤拷锟斤拷锟劫讹拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟叫版本锟斤拷锟桔和可革拷锟斤拷锟截材碉拷散锟斤拷锟斤拷锟?

- ??????? playbooks/browser-research-briefing.md?????????????锟斤拷??????????锟斤拷???????????? PLAYBOOKS.md ?? TOOLS.md????????????锟斤拷??锟斤拷?锟斤拷??????????????????????????????
- 锟斤拷锟斤拷 playbooks/career-prep-handoff.md锟斤拷锟斤拷职位页锟叫撅拷锟斤拷锟斤拷锟绞斤拷湛锟轿?Prep Brief锟斤拷锟斤拷锟斤拷缺锟节★拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷 Fill Readiness 锟叫讹拷锟斤拷锟斤拷锟斤拷锟斤拷 PLAYBOOKS.md锟斤拷TOOLS.md 锟斤拷 careers-site-application.md锟斤拷锟斤拷锟酵癸拷锟斤拷投锟斤拷锟斤拷途锟斤拷锟斤拷锟较的凤拷锟斤拷锟斤拷锟斤拷
- 锟斤拷锟斤拷 `playbooks/resume-tailoring-from-jd.md`锟斤拷锟斤拷 JD / 锟劫凤拷职位页锟饺讹拷转锟斤拷 evidence map锟斤拷emphasis plan锟斤拷resume variant brief 锟斤拷 answer themes锟斤拷锟斤拷锟斤拷锟斤拷 `PLAYBOOKS.md`锟斤拷锟斤拷锟酵癸拷锟斤拷投锟斤拷前锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷位锟斤拷锟较分伙拷锟侥凤拷锟斤拷锟斤拷锟斤拷
- 锟斤拷锟斤拷 `playbooks/resume-delivery-pack.md`锟斤拷锟窖革拷位锟斤拷锟斤拷锟斤拷锟斤拷锟侥╋拷锟斤拷湛诠潭锟轿拷锟斤拷锟斤拷锟斤拷锟斤拷锟?-> 锟斤拷锟斤拷锟侥硷拷 -> 锟斤拷锟叫ｏ拷锟?-> 锟较达拷锟斤拷锟接★拷锟斤拷锟斤拷锟斤拷锟斤拷 `PLAYBOOKS.md`锟斤拷`TOOLS.md` 锟斤拷锟斤拷锟酵讹拷锟斤拷萍锟斤拷锟铰凤拷锟斤拷锟斤拷痛锟斤拷募锟斤拷洗锟斤拷锟斤拷锟斤拷募锟斤拷锟斤拷煤锟轿达拷锟街わ拷锟斤拷锟斤拷姆锟斤拷锟?
- 锟斤拷锟斤拷 `playbooks/browser-download-handoff.md`锟斤拷锟窖★拷锟斤拷锟斤拷锟斤拷锟斤拷卮锟斤拷锟?-> 锟斤拷锟斤拷锟斤拷锟斤拷 -> 锟侥硷拷校锟斤拷 -> 锟斤拷一锟斤拷锟教斤拷锟接★拷锟斤拷锟斤拷为锟斤拷准锟斤拷锟截斤拷锟斤拷锟斤拷锟教ｏ拷锟斤拷锟斤拷锟斤拷 `PLAYBOOKS.md`锟斤拷`TOOLS.md` 锟斤拷 roadmap锟斤拷锟斤拷锟斤拷 PDF/JD/锟斤拷锟斤拷锟侥硷拷锟洁复锟斤拷锟斤拷锟斤拷锟叫的硷拷锟斤拷锟斤拷锟斤拷锟侥硷拷锟斤拷锟矫凤拷锟斤拷
- 锟斤拷锟斤拷 `playbooks/downloaded-file-routing.md`锟斤拷锟窖★拷锟斤拷锟斤拷锟截憋拷锟斤拷锟侥硷拷 -> 锟斤拷执锟斤拷目锟斤拷锟斤拷锟斤拷锟斤拷牡锟?/ 锟斤拷职 / 锟斤拷锟斤拷锟斤拷锟斤拷 / 锟斤拷媒锟斤拷 / 锟斤拷锟斤拷锟斤拷獭锟斤拷锟斤拷锟轿拷锟阶悸凤拷晒锟斤拷颍锟斤拷锟斤拷锟斤拷锟斤拷锟缴猴拷停锟节憋拷锟斤拷锟侥硷拷锟斤拷锟斤拷锟斤拷锟斤拷路锟接诧拷锟较伙拷锟竭达拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟?
- 锟斤拷锟斤拷 `playbooks/windows-file-dialog-handoff.md`锟斤拷锟斤拷 Windows 锟斤拷/锟斤拷锟斤拷/锟斤拷锟斤拷为/选锟侥硷拷锟斤拷 锟皆伙拷锟斤拷锟斤拷锟轿骋伙拷锟斤拷锟斤拷锟斤拷蹋锟斤拷锟斤拷锟斤拷锟?`PLAYBOOKS.md` 锟斤拷 `TOOLS.md`锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷洗锟斤拷锟斤拷亍锟絆ffice 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷应锟斤拷锟侥硷拷选锟斤拷锟叫的硷拷锟斤拷煞锟斤拷锟?
- 锟斤拷锟斤拷 `playbooks/web-form-execution.md`锟斤拷锟斤拷通锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷为 `锟斤拷锟斤拷准锟斤拷 -> 锟街讹拷映锟斤拷 -> 页锟斤拷锟斤拷锟街?-> 锟斤拷确锟结交锟竭斤拷` 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷 `PLAYBOOKS.md`锟斤拷锟斤拷锟酵多步锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷洗锟斤拷锟斤拷锟斤拷筒莞锟?锟结交锟竭界不锟斤拷时锟侥硷拷锟斤拷煞锟斤拷锟?
- 锟斤拷锟斤拷 `playbooks/openclaw-agent-delegation.md`锟斤拷锟窖革拷锟斤拷锟斤拷锟斤拷锟斤拷锟街凤拷锟斤拷锟教伙拷为 direct / ACP / local-tool-chain 锟斤拷锟斤拷默锟斤拷路锟竭ｏ拷锟斤拷锟斤拷锟斤拷 `PLAYBOOKS.md` 锟斤拷 `TOOLS.md`锟斤拷锟斤拷锟酵达拷锟斤拷锟斤拷一锟斤拷始选锟斤拷执锟斤拷路锟斤拷锟斤拷锟铰的凤拷锟斤拷锟斤拷锟斤拷锟斤拷证锟斤拷锟斤拷
- 锟斤拷锟斤拷 `playbooks/local-file-delivery-handoff.md`锟斤拷锟窖★拷锟斤拷锟斤拷锟侥硷拷锟斤拷锟斤拷锟斤拷/锟斤拷锟斤拷锟斤拷 -> reveal/open/review/唯一锟斤拷锟斤拷锟侥硷拷选锟斤拷 -> 锟斤拷一锟斤拷锟教斤拷锟接★拷锟斤拷锟斤拷为锟斤拷准锟斤拷锟斤拷锟斤拷锟教ｏ拷锟斤拷锟斤拷锟斤拷 `PLAYBOOKS.md`锟斤拷`TOOLS.md` 锟斤拷 `desktop-operations.md`锟斤拷锟斤拷锟酵硷拷锟斤拷/锟侥碉拷/锟斤拷锟斤拷锟侥硷拷/图片锟斤拷锟斤拷锟叫的达拷锟侥硷拷锟斤拷锟斤拷锟侥硷拷锟斤拷末锟剿硷拷锟斤拷煞锟斤拷锟?
- 锟斤拷 research / prep / delivery / form / upload 锟斤拷 4 锟斤拷默锟较达拷锟斤拷锟斤拷路锟教伙拷锟斤拷 `playbooks/openclaw-agent-delegation.md`锟斤拷锟斤拷锟劫革拷锟接伙拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟窖★拷怨锟斤拷锟斤拷颉⒌锟斤拷锟酵撅拷锟斤拷锟斤拷喜愕硷拷碌姆锟斤拷锟?
- 锟斤拷锟斤拷 `ideas/completion-proof-template.md`锟斤拷锟窖革拷锟斤拷锟斤拷锟斤拷锟斤拷锟缴憋拷准统一锟秸匡拷为锟斤拷锟秸诧拷锟斤、锟斤拷/锟斤拷证锟斤拷锟脚号★拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟?handoff-ready 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷 completion proof 锟斤拷锟斤拷锟斤拷锟?`playbooks/openclaw-agent-delegation.md` 锟斤拷 `roadmap.md`锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟?/ 锟斤拷锟斤拷 / 锟侥碉拷锟斤拷路锟叫的硷拷锟斤拷煞锟斤拷锟?
- 锟斤拷锟斤拷 `playbooks/completion-proof.md`锟斤拷锟窖革拷锟斤拷锟斤拷锟斤拷锟斤拷锟缴憋拷准锟接★拷锟斤拷锟斤拷执锟叫成癸拷锟斤拷锟斤拷锟斤拷为锟斤拷锟斤拷锟秸诧拷锟斤拷 + 强证锟斤拷锟脚猴拷 + handoff-ready 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷 `PLAYBOOKS.md`锟斤拷`TOOLS.md` 锟斤拷 roadmap锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟?/ 锟斤拷锟斤拷 / 锟侥碉拷锟斤拷路锟叫的硷拷锟斤拷煞锟斤拷锟?
- 锟斤拷 completion proof 锟斤拷嵌锟斤拷 `playbooks/browser-download-handoff.md`锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷杀锟阶硷拷战锟轿拷锟斤拷锟饺凤拷锟斤拷锟斤拷募锟?+ 强证锟斤拷锟脚猴拷 + 锟斤拷确锟斤拷一锟斤拷锟教★拷锟斤拷锟斤拷锟斤拷压锟斤拷锟斤拷锟斤拷预锟斤拷/锟斤拷示锟斤拷锟斤拷为锟斤拷傻姆锟斤拷锟?
- ?? completion proof ????? `playbooks/local-file-delivery-handoff.md`????????????????????????????????????????? + ?????? + handoff-ready???????????????????????????????????????
- 锟斤拷 completion proof 锟斤拷嵌锟斤拷 `playbooks/browser-upload-handoff.md`锟斤拷锟斤拷锟较达拷锟斤拷锟斤拷锟斤拷锟斤拷锟缴憋拷准锟秸斤拷为锟斤拷页锟斤拷锟斤拷呀锟斤拷锟侥匡拷锟斤拷募锟?+ 锟斤拷锟斤拷一锟斤拷锟斤拷证锟斤拷 + handoff-ready锟斤拷锟斤拷锟斤拷锟斤拷压锟酵癸拷锟斤拷投锟捷★拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟结交锟叫的硷拷锟斤拷煞锟斤拷锟?

- ???? playbooks/word-paper-fast-path.md???? Word / ???? / ???? .docx ???????? inspect -> style-report -> lane selection ????????????????? PLAYBOOKS.md??TOOLS.md ?? roadmap???????????????????????????????????????????
- ?? completion proof ????? `playbooks/windows-file-dialog-handoff.md`???? Open / Save / Save As / Select Folder ??????????????????? + ???y??? + handoff-ready????????????????? / ???? / ?????锟斤拷?锟斤拷????????

- 锟斤拷锟斤拷锟斤拷锟斤拷榷锟斤拷远锟斤拷锟斤拷锟斤拷锟斤拷一锟斤拷锟斤拷锟斤拷 rowser-research-briefing.md锟斤拷rowser-upload-handoff.md锟斤拷rowser-download-handoff.md锟斤拷锟斤拷 snapshot(refs=aria) + 锟教讹拷 	argetId + 锟截硷拷状态锟戒化锟斤拷刷锟斤拷 snapshot 锟接憋拷锟斤拷锟斤拷锟斤拷锟斤拷展锟斤拷锟叫撅拷 / 锟斤拷锟斤拷 / 锟较达拷锟斤拷锟斤拷锟斤拷频锟斤拷路锟斤拷锟斤拷锟斤拷 stale ref锟斤拷锟界步锟斤拷锟斤拷锟斤拷投锟教筹拷锟斤拷鼗娣碉拷锟?


- 锟斤拷锟斤拷 `self-evolution-log/ideas/career-form-fill-pack-handoff-template.md`锟斤拷锟斤拷锟斤拷 `Career Prep Handoff -> Career Form Fill Pack -> web-form-execution` 锟斤拷锟斤拷 `playbooks/career-prep-handoff.md` 锟斤拷 `roadmap.md`锟斤拷锟斤拷锟酵癸拷锟斤拷锟斤拷锟斤拷锟洁复锟接憋拷锟斤拷锟叫边凤拷锟斤拷锟较憋拷锟筋、锟较达拷目锟疥不唯一锟斤拷锟斤拷锟斤拷锟街段伙拷锟斤拷锟?draft-ready 锟竭界不锟斤拷锟斤拷傻姆锟斤拷锟?


- 锟斤拷锟斤拷 `playbooks/research-evidence-pack.md`锟斤拷锟斤拷锟斤拷锟斤拷 `PLAYBOOKS.md`锟斤拷`TOOLS.md`锟斤拷`browser-research-briefing.md`锟斤拷`research-action-pack.md` 锟斤拷 `roadmap.md`锟斤拷锟斤拷锟叫撅拷锟斤拷锟斤拷印锟斤拷锟?锟叫讹拷锟斤拷锟斤拷锟斤拷一锟斤拷锟斤拷锟缴★拷证锟捷帮拷锟斤拷锟斤拷锟接层，锟斤拷锟斤拷 source anchor锟斤拷锟斤拷锟矫边斤拷锟?`verbatim / paraphrase / re-check-live` 锟斤拷锟斤拷证锟捷革拷锟斤拷模式锟斤拷锟斤拷锟劫癸拷锟斤拷锟叫撅拷锟斤拷锟斤拷锟斤拷/FAQ锟斤拷锟斤拷锟斤拷证锟捷碉拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟截凤拷页锟斤拷锟斤拷锟斤拷锟斤拷失锟斤拷
- 锟斤拷 ideas/desktop-persisted-state-proof-template.md 锟斤拷式锟斤拷锟?playbooks/desktop-persisted-state-proof.md锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟絎indows 锟侥硷拷锟皆伙拷锟斤拷锟?Office 锟斤拷锟斤拷锟铰凤拷锟斤拷选锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷恕锟斤拷锟揭伙拷锟斤拷战锟轿拷锟斤拷锟斤拷锟斤拷锟斤拷志没锟斤拷锟斤拷锟斤拷慰砂锟饺拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟?Save / Save As / Export / Apply 锟斤拷锟斤拷锟斤拷募锟斤拷锟缴★拷

- 将桌面/Office 编辑后保存导出的默认接力链正式写入 `PLAYBOOKS.md` 与 `TOOLS.md`：`desktop-operations -> desktop-persisted-state-proof -> windows-file-dialog-handoff (if needed) -> office-output-proof/local-file-delivery-handoff`，把 persisted-state proof 从"已有 playbook"推进为真实任务里的默认执行规则，减少 Save/Export 后只看界面变化或文件存在就误判完成的返工
- 2026-03-12 15:13: 正式新增 playbooks/document-extraction-lane-selector.md，把复杂 PDF / 扫描件 / 表格文档的起手提取路线收紧为 lane selector -> document-task-routing，减少"先抽文本再说"导致的下游返工。
- 2026-03-12 15:24: 新增 `self-evolution-log/ideas/document-extraction-lane-validation-card-template.md`，并回接到 `playbooks/document-extraction-lane-selector.md` 与 `roadmap.md`，把复杂文档的提取路线验证固定为 `proof extraction -> reading order / structure fidelity / cleanup cost / downstream usability / proof over placebo -> keep/switch/trial`，减少把"抽出文本了"误判成"这条 lane 已足够好"的返工。
- 2026-03-12 15:53: 将 `document-extraction-lane-validation-card-template` 正式落成 `playbooks/document-extraction-lane-validation.md`，并接入 `document-extraction-lane-selector.md`、`PLAYBOOKS.md`、`TOOLS.md` 与 `roadmap.md`，把复杂 PDF / 扫描件 / 多栏 / 表格文档的默认起手链路收紧为 `lane selector -> proof validation -> downstream workflow`，减少 lane 选对了但验证不够、直到 Markdown / Office / 简历 / 证据包阶段才暴露返工的问题。

- 新增 `playbooks/multimedia-iteration-log.md`，并接入 `PLAYBOOKS.md`、`playbooks/multimedia-generation-workflow.md` 与 `playbooks/multimedia-delivery-pack.md`，把多轮生图 / 视频 / 图生视频任务的默认中间层固定为 `brief -> prompt pack -> iteration log -> delivery pack`，减少只保存最后一个 prompt、版本胜出原因丢失和下一轮改动轴混乱导致的返工
- 将 self-evolution-log/ideas/capability-proof-pack-template.md 正式落成 playbooks/capability-proof-pack.md，并接入 PLAYBOOKS.md、TOOLS.md 与 playbooks/capability-intake-handoff.md，把新能力接入的默认完成标准从"已发现 / 已配置 / 工具可列出"推进为"至少有一个已证明真实任务 + proof signals + 可复用 IO 契约 + 明确下一接力流程"，减少 skill / MCP / 工具方向停在假就绪状态的返工


- 新增 `playbooks/browser-admin-report-workflow.md`，并接入 `PLAYBOOKS.md`、`TOOLS.md` 与 `roadmap.md`，把登录后后台 / 报表 / 管理台任务固定为 `auth proof -> workspace/scope proof -> stable browser execution -> export/download proof -> downloaded-file-routing -> next workflow`，减少官网登录后台、SaaS 报表中心、创作者后台和管理台导出任务里因账号/工作区、筛选范围、页面状态与本地产物链路断裂导致的返工

- 增强 playbooks/browser-admin-report-workflow.md，新增可复用 Admin / Report Execution Pack，把登录后后台/报表/管理台任务起手压缩为 	ask goal -> auth lane -> scope lock -> page-state checkpoints -> output/handoff，并补入"页面指标留存""筛选导出进入 document/office""导出后二次上传"三条高频复用链路，减少后台任务里账号/工作区、筛选范围、导出状态和下游去向分散导致的错 workspace、错 scope、假完成与下载后断链

- 新增 `playbooks/capability-front-door-routing.md`，并接入 `PLAYBOOKS.md`、`TOOLS.md` 与 `roadmap.md`，把"能不能做 X / 有没有 skill / 要不要接 MCP / 要不要走 ACP"这类能力请求先收口为 `real task -> existing lane enough? -> intake / investment / proof / ACP` 的前门判断，减少一上来就读 README、接服务或开 ACP 的过度建设
- 为 `playbooks/capability-front-door-routing.md` 补入 5 类 `Front-Door Routing Examples`（现有 lane 已够用 / capability intake / investment gate / capability proof / ACP implementation），把能力类请求的前门判断从抽象规则推进到可直接套用的高频任务样例，减少"能不能做 / 有没有 skill / 要不要接 MCP / 要不要走 ACP"这类请求起手时的路由抖动与过度建设- 新增 `playbooks/form-fill-pack.md`，并接入 `PLAYBOOKS.md`、`TOOLS.md` 与 `playbooks/web-form-execution.md`，把通用复杂网页表单的默认前置层收紧为 `task boundary -> source of truth -> field buckets -> upload locks -> sensitive confirmations -> page proof points`，减少资料提交、报名注册、后台配置和非求职多步骤表单里的中途补字段、错文件和 draft/submit 边界漂移
- 新增 `self-evolution-log/ideas/browser-auth-proof-card-template.md`，把登录态浏览器任务的起手进一步压成一张可复用 `Browser Auth Proof Card`：统一锁定 `task goal -> auth class -> preferred lane -> visible proof signals -> active account/workspace -> false-ready trap -> downstream workflow`，并补入 lane 选择启发式、强/弱 proof 对照与 research / admin-report / upload-form / careers 四类任务的必锁证明项，减少把"页面打开了/URL 像后台/没看到登录框"误判成"已具备可用登录态"的返工

- 新增 self-evolution-log/experiments/omniparser-omnitool-local-capability-proof-pack.md，把 OmniParser / OmniTool 从 README 级 	rial only 再推进成一份本机可执行的 Capability Proof Pack：先固定 parser-only -> real screenshot -> elements json / annotated proof -> target pick judgment 的轻量验证路线，并把本机 preflight、proof signals、false-ready trap 与回退路径写死，减少桌面 screenshot grounding 新能力一上来就陷进 Docker / Windows VM / agent loop 重链路
- 新增 self-evolution-log/ideas/desktop-execution-lane-selector.md，把桌面/本地 GUI 复杂任务的前门判断固定为 end state -> lane choice(file/system vs browser vs semantic desktop vs visual/coordinate) -> proof plan -> action，并写入
oadmap.md 作为新的长期进化方向；优先减少 Explorer/文件管理、Office 保存导出、Windows 文件对话框和弱 UIA 场景里一上来就错 lane、乱点或过早升级能力的返工



- 新增 `self-evolution-log/ideas/browser-ai-middle-lane-task-gate.md`，把 Stagehand / browser-use 这类浏览器 AI 候选能力的默认前门收紧为 `existing browser lane enough? -> exploration gap? -> task-shaped proof(admin/docs/form) -> IO contract -> downstream handoff`，避免因 README/demo 很强就过早接 SDK、cloud 或平行流程；并把这条 `browser AI middle lane` 继续记为 `trial only` 的长期观察方向
- 新增 `self-evolution-log/ideas/auth-target-context-lock.md`，并把这层规则接入 `playbooks/browser-auth-proof-card.md`、`playbooks/browser-upload-handoff.md` 与 `playbooks/careers-site-application.md`：把登录态浏览器任务的默认前门从"已证明 account/workspace/role"继续收紧为"若后续要 edit/upload/continue draft，还必须再锁定正确 target object / draft / attachment slot / report scope"，减少 ATS 续投、后台附件更新和多 workspace 编辑场景里"登录是对的但对象改错了"的高成本返工

- 将 uth-target-context-lock 正式接入 playbooks/browser-admin-report-execution-pack.md 与 playbooks/browser-admin-report-workflow.md，把登录后后台 / 报表任务的默认前门从"账号/工作区/范围对了"继续收紧为"账号对 + 对象对 + scope 对"，减少多 report row、多 dataset、多 export entry 和多 record 场景里"登录是对的但对象选错了"的高成本返工

## 2026-03-12

- 新增 playbooks/browser-element-locator-guide.md，把浏览器元素定位的技术细节从散落的示例整理为系统化指南：定位策略层级（aria ref > role > text > CSS/XPath）、Ref 管理最佳实践、交互模式库（等待/滚动/iframe/下拉/上传/日期选择）、复杂场景处理（动态加载/shadow DOM/模态框）、调试技巧与性能优化，并接入 PLAYBOOKS.md 作为 rowser-stable-execution.md 的技术补充
