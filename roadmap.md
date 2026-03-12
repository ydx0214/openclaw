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

- [x] 将复杂文档任务（PDF / Word / 简历 / 表格 / Markdown）沉淀成正式分流 playbook，优先提升任务起点的路由正确率
- [x] 新增 `playbooks/document-extraction-lane-selector.md`，把复杂 PDF / 扫描件 / 表格文档起手的提取路线选择固定为 `文档类型 -> 主要目标 -> 下游消费者 -> 可接受清洗量 -> Lane A/B/C/D -> next move`，减少“先抽文本再说”导致的下游返工
- [x] 新增 `self-evolution-log/ideas/document-extraction-lane-validation-card-template.md`，把 lane selector 后的轻量验证固定为 `proof extraction -> reading order / structure fidelity / cleanup cost / downstream usability / proof over placebo -> keep/switch/trial`，减少把“抽出文本了”误判成“这条提取 lane 已经足够好”的返工
- [x] 将 `self-evolution-log/ideas/document-extraction-lane-validation-card-template.md` 正式落成 `playbooks/document-extraction-lane-validation.md`，并接入 `playbooks/document-extraction-lane-selector.md`、`PLAYBOOKS.md` 与 `TOOLS.md`，把复杂 PDF / 扫描件 / 多栏 / 表格文档的轻量 proof 验证固化为默认中间层，减少 lane 选对了但验证不够、直到下游工作流才暴露返工的问题
- [x] 新增 `self-evolution-log/ideas/document-downstream-consumer-scorecard-template.md`，把复杂文档提取后的“是否能被 Markdown / Office / Excel / 简历 / 证据包 / 表单流程真正消费”收口成一张按下游消费者判断的评分卡，减少 lane 已过但真正进入下游时才暴露结构失真、字段混淆和引用边界不清的返工
- [x] 将这张 `document-downstream-consumer-scorecard` 正式落成 `playbooks/document-downstream-consumer-scorecard.md`，并接入 `PLAYBOOKS.md` 与 `TOOLS.md`，把复杂文档主链路从“lane 通过即可下游”继续收紧为“lane 通过 + 对具体下游消费者可用”，优先覆盖 Markdown / Office / resume / evidence-pack / form-fill 五类高成本消费者
- [ ] 继续补 `document-downstream-consumer-scorecard` 的真实样例卡，优先覆盖 Markdown / Office / resume / evidence-pack / form-fill 五类高成本消费者
- [ ] 为简历与官网投递材料准备补一条“资料检查 -> 简历草稿 -> 变体 -> 表单包 -> 浏览器填表前校验”的固定工作流
- [x] 为岗位定向简历补一条“简历变体 -> 交付文件 -> 输出校验 -> 上传交接”的固定收口流程，减少上传错文件、旧文件或未验证导出的风险
- [x] 为 Word / 论文类任务补一条更短的可执行入口，默认包含 inspect、style-report、render-check 三步验收
- [ ] 将“职位官网研究 -> Career Application Prep Brief -> 材料缺口 -> form pack/简历变体 -> 浏览器填表”固定成求职类复杂任务的默认准备链路，减少边填边补材料的中途返工
- [x] 将“多页浏览器研究 -> Research Brief -> 下一流程输入（如 Career Prep Brief / form pack / 操作清单）”固定成默认衔接规则，减少查完资料后再次手工整理的重复劳动
- [x] 将 `Research Action Pack` 正式落成 `playbooks/research-action-pack.md`，并接入浏览器研究到表单 / 文档 / 简历 / 操作清单的执行交接链路，减少研究完成后再次手工整理输入的返工
- [ ] 继续把 `Action Pack` 叠层接到更多研究类入口，优先覆盖官网研究、政策/FAQ、文档转执行清单、产品对比后的决策交接
- [x] 新增 `playbooks/research-evidence-pack.md`，把“Research Brief -> Evidence Pack -> Action Pack / 文档 / 简历 / 表单 / capability intake”固化为研究结果的证据层，减少后续写作、填表和能力评估时重翻页面、引用失真和 source anchor 丢失的返工
- [x] 将 JD / 官网研究 -> 简历证据点 这条高频入口正式固化为 `playbooks/resume-evidence-pack.md`，把 `research-evidence-pack` 到 `resume-tailoring-from-jd` 之间的中间层收紧为“JD signal -> evidence strength -> safe usage -> do-not-claim boundary”，减少为目标岗位改简历时反复翻 JD、弱匹配硬写和问答/简历边界不清的返工
- [ ] 继续把 `research-evidence-pack` 接到更多高频研究入口，优先覆盖政策/FAQ 转文档草稿、表单要求页转字段证据包和 capability docs 评估场景
- [x] 为多选项研究新增 `research-decision-pack-template.md`，把产品/工具/路线/能力比较收口为 `decision goal -> option evidence -> recommendation -> decision-switch triggers -> next executable move`，降低研究已完成但选型理由不可复核、后续难以继续执行的断层
- [x] 将 `self-evolution-log/ideas/research-decision-pack-template.md` 正式落成 `playbooks/research-decision-pack.md`，并接入 `PLAYBOOKS.md`、`TOOLS.md`、`playbooks/browser-research-briefing.md` 与 `playbooks/research-action-pack.md`，把多选项研究的默认收口从“比较结论”推进为“可复核的 Decision Pack + 明确下一执行路线”，减少工具/平台选型、职位路径比较、政策执行路线选择和 OpenClaw 能力投入判断中的二次整理与重复开页
- [x] 将文档类复杂任务的末端收口固化为 `document-delivery-pack.md`，把“编辑/转换完成”提升为“一个可编辑源 + 一个明确交付文件 + 已验证下一步”的标准交接
- [ ] 继续把 `document-delivery-pack` 接到更多文档类入口，优先覆盖 Markdown->Word、PDF/Word 转交付、简历之外的一般 Office 交付场景
- [x] 新增 `ideas/office-output-proof-template.md`，并将“lock artifact -> freshness proof -> format/render proof -> handoff proof”接入 `playbooks/document-delivery-pack.md`、`playbooks/word-paper-fast-path.md` 与 `PLAYBOOKS.md`，降低 Word / PDF / Office 交付任务中旧导出复用、错文件交接和仅凭文件存在就误判完成的风险
- [x] 将 `ideas/office-output-proof-template.md` 正式落成 `playbooks/office-output-proof.md`，并接入 `document-delivery-pack.md`、`word-paper-fast-path.md`、`paper-formatting.md`、`PLAYBOOKS.md` 与 `TOOLS.md`，把 Office 类交付任务的完成标准收紧为“唯一交付件 + freshness + 必要格式证明 + 下一步交接”
- [x] 新增 `document-intake-brief-template.md`，并将“source of truth / output strategy / constraints / verification / routing decision”接入 `playbooks/document-task-routing.md`，降低 PDF / Word / 简历 / 表格混合任务起手走错链路、误覆盖原件和交付目标不清的风险
- [x] 将“浏览器下载触发 -> 本地落盘 -> 文件校验 -> 下一流程交接”固化成标准下载接力流程，优先降低 PDF/JD/导出文件类任务中的假完成与错文件复用风险
- [x] 将 completion proof 内嵌进 `browser-download-handoff.md`，把浏览器下载类任务的完成标准收紧为“精确本地文件 + 强证明信号 + 明确下一流程”，继续压低下载预览/提示误判为完成的风险
- [x] 新增 `playbooks/browser-export-proof.md`，把异步导出类浏览器任务固化为 `export trigger -> ready-state proof -> local-file proof -> next-route`，降低报表/导出中心/后台生成文件任务中把 toast、spinner、ready button 或旧文件误判为完成的风险
- [x] 将“已下载本地文件 -> 按执行目标分流到文档 / 求职 / 多媒体 / 解包流程”固化成标准路由规则，减少下载完成后停在本地文件、后续链路接不上或走错工具链的情况
- [x] 将“浏览器上传控件 -> Windows 文件对话框 -> 页面侧验收”固化成跨浏览器/桌面的标准上传接力流程，优先降低官网投递、附件表单、资料提交任务中的卡点
- [x] 将 completion proof 内嵌进 `browser-upload-handoff.md`，把上传类任务的完成标准收紧为“页面侧已接受目标文件 + 至少一条次证明 + handoff-ready”，继续压低官网投递、附件表单、资料提交中的假完成风险
- [x] 将“结构化资料 -> 字段映射 -> draft-ready 验证 -> 明确 submit 批准边界”固化成通用浏览器表单执行流程，优先降低多步骤表单、带上传表单和资料提交流程中的假完成与误提交风险
- [x] 为官网投递场景新增 `career-form-fill-pack-handoff-template.md`，并把 `Career Prep Handoff -> Career Form Fill Pack -> web-form-execution` 固化为复杂 careers 表单的默认准备链路，减少边翻资料边填、上传目标不唯一和敏感字段混填的返工
- [x] 将 `Career Form Fill Pack` 正式落成 `playbooks/career-form-fill-pack.md`，并接入 `career-prep-handoff.md`、`careers-site-application.md`、`web-form-execution.md` 与 `PLAYBOOKS.md`，把“准备资料”到“进入页面执行”之间的交接收紧为一个可复用执行包
- [x] 新增 `playbooks/attachment-readiness-pack.md`，把浏览器上传前的准备层固化为 `upload field -> chosen file -> local proof -> page-side acceptance target -> next move`，降低官网投递、材料提交、多附件表单里边上传边找文件、错传版本和页面接受信号不清的返工
- [x] 将通用浏览器表单的 `Form Fill Pack` 正式落成 `playbooks/form-fill-pack.md`，并接入 `PLAYBOOKS.md`、`TOOLS.md` 与 `playbooks/web-form-execution.md`，把 generic forms 的默认前置层收紧为“先锁资料来源/上传文件/敏感确认/验收点，再执行页面动作”，减少资料提交、报名注册、后台配置和多步骤业务表单里的中途补字段、错文件与 draft/submit 边界漂移
- [ ] 继续将 `Form Fill Pack` 前置到更多浏览器复杂任务入口，固定“先锁资料来源/上传文件/敏感确认/验收点，再执行页面动作”的默认准备步骤
- [x] 新增 `playbooks/browser-upload-subtask-rule.md`，并接入 `PLAYBOOKS.md`、`TOOLS.md` 与 `playbooks/browser-upload-handoff.md`，把“上传是独立子任务”正式收口为 `lock field+artifact -> local proof -> choose route -> page-side acceptance proof -> next safe move`，并将本地文件到浏览器上传的默认链路更新为 `local-file-delivery-handoff -> attachment-readiness-pack -> browser-upload-subtask-rule -> browser-upload-handoff -> windows-file-dialog-handoff (if needed)`，减少资料提交、后台附件更新、多附件表单和导出后二次上传里的错传版本、页面未接受却继续和把对话框关闭误判为完成的返工
- [x] 新增 `playbooks/browser-auth-state-handoff.md`，把登录态浏览器任务的起手判断固定为 `task goal -> auth dependency -> browser lane(openclaw/chrome relay) -> visible auth proof -> downstream handoff`，减少登录后研究、官网后台、需复用本机 Chrome 会话的任务里因为路线选错或未证明登录态而导致的返工
- [x] 继续把 `browser-auth-state-handoff` 接到更多登录态浏览器入口，优先覆盖登录后研究、官网登录后台、需复用 Chrome 会话的资料提交和 careers 登录后续流程
- [x] 新增 `playbooks/browser-auth-proof-card.md`，把登录态浏览器任务在 lane 选定之后继续收口为 `auth class -> preferred lane -> visible account/workspace/role proof -> false-ready trap -> downstream workflow` 的小证明包，减少把“页面打开了/像后台”误判成“当前会话已足够支撑后续上传、导出、后台操作和多 workspace 任务”的返工
- [ ] 继续把 `browser-auth-proof-card` 接到更多登录态浏览器入口，优先覆盖多 workspace SaaS 后台、Chrome relay 复用场景、登录后资料提交和 ATS 申请链路
- [x] 新增 `playbooks/browser-admin-report-workflow.md`，把登录后后台 / 报表 / 管理台任务固定为 `auth proof -> workspace/scope proof -> stable browser execution -> export/download proof -> downloaded-file-routing -> next workflow`，减少官网登录后台、SaaS 报表中心和管理台导出任务里因账号/工作区、筛选范围和本地产物链路断裂导致的返工
- [x] 新增 `playbooks/browser-admin-report-execution-pack.md`，把后台 / 报表 / 管理台任务在页面动作前先压成 `task goal -> auth lane -> scope lock -> page-state checkpoints -> output/handoff` 的执行包，并接入 `PLAYBOOKS.md`、`TOOLS.md` 与 `browser-admin-report-workflow.md`，减少登录后后台任务里账号/workspace、筛选范围、输出类型和下游交接分散在脑内导致的错 workspace、错 scope、假完成与下载后断链
- [x] 将 `browser-auth-state-handoff -> browser-admin-report-execution-pack -> browser-admin-report-workflow` 进一步收紧为登录后后台 / 报表任务的默认前门链，并在 `browser-admin-report-workflow.md` 增补可复用 `Admin / Report Proof Card`，把“已登录后台”推进为“账号/工作区、scope/filter、页面状态、产物与下一路线都已被独立证明”，继续压低错 workspace、错 scope 和导出后断链
- [x] 将“多步浏览器自动化默认使用 aria refs + 固定 targetId + 每步后刷新 snapshot”固化成浏览器任务稳定性规则，并接入 `web-form-execution.md`、`browser-research-briefing.md`、`browser-upload-handoff.md`、`browser-download-handoff.md`，优先压低 stale ref、跨步误操作和动态页面重绘导致的返工
- [x] 新增 `ideas/browser-page-state-checkpoints-template.md`，并将按任务类型区分的页面状态变化检查点接入 `browser-research-briefing.md`、`browser-upload-handoff.md`、`browser-download-handoff.md` 与 `web-form-execution.md`，降低 stale ref、跨步误操作与“状态已变但还按旧页面继续操作”的返工风险
- [x] 将 research / prep / delivery / form / upload 这些已有 playbook 的默认串联顺序固化进 `openclaw-agent-delegation.md`，减少复杂混合任务中起手路由正确但中途接力断开的返工
- [x] 将 completion proof 内嵌进 `windows-file-dialog-handoff.md`，把 Open / Save / Save As / Select Folder 的完成标准收紧为“本地结果 + 源应用接受 + handoff-ready”，继续压低跨浏览器 / 桌面 / 文档链路中的假完成风险
- [x] 新增 `ideas/desktop-action-proof-template.md`，并把“Final artifact / Primary proof / Secondary proof / False-completion trap / Handoff-ready”接入 `playbooks/desktop-operations.md`，降低资源管理器、Office 与本地 GUI 操作中“动作发出去了但目标状态没真正达成”的假完成风险
- [x] 新增 `ideas/desktop-persisted-state-proof-template.md`，并接入 `playbooks/desktop-operations.md` 与 `PLAYBOOKS.md`，把桌面/Office 编辑后的完成标准进一步收紧为“已保存/已应用 + 至少一条持久化证明”，降低文档修改、设置变更和本地 GUI 编辑中“界面看起来改了但实际没写入”的假完成风险
- [x] 将 `ideas/desktop-persisted-state-proof-template.md` 正式落成 `playbooks/desktop-persisted-state-proof.md`，并接入 `desktop-operations.md`、`windows-file-dialog-handoff.md`、`office-output-proof.md` 与 `PLAYBOOKS.md`，把桌面/Office 保存导出类任务的完成标准进一步收紧为“文件/设置真正持久化 + 下游可安全依赖`
- [x] 将桌面/Office 编辑后保存导出的默认接力链正式写入 `PLAYBOOKS.md` 与 `TOOLS.md`：`desktop-operations -> desktop-persisted-state-proof -> windows-file-dialog-handoff (if needed) -> office-output-proof/local-file-delivery-handoff`，减少真实桌面任务里 playbook 存在但没有被稳定调用的断层

## Phase 6

- [x] 为跨浏览器 / 桌面 / 文档任务补一份统一的 completion proof 模板，先定义最终产物、主证明信号、次证明信号、假完成陷阱和 handoff-ready 条件，继续压低复杂真实任务里的“看起来做了、实际没完成”问题
- [x] 将 completion proof 正式落成 `playbooks/completion-proof.md`，作为浏览器 / 桌面 / 文档 / 本地文件交接类复杂任务的统一验收覆盖层
- [x] 将 completion proof 内嵌进 `playbooks/local-file-delivery-handoff.md`，把本地文件交付类任务的完成标准收紧为“精确交付物 + 可见证明 + handoff-ready”，继续压低导出后错文件、旧文件和末端假完成风险

- [x] 将生图 / 视频生成类复杂任务统一为 `Generation Brief -> prompt pack -> acceptance` 默认前置流程，优先降低多轮 prompt 返工和交付失焦
- [ ] 将多媒体生成流程正式接入更多任务入口，默认按 playbook 执行而不是临时拼 prompt
- [x] 为多媒体任务补“素材盘点 -> 参考图收集 -> 平台规格 -> 版本对比记录”中的平台规格锁定层：新增 `ideas/multimedia-platform-spec-card-template.md` 并接入 `playbooks/multimedia-generation-workflow.md`，降低封面图、短视频、图生视频中的错比例、错时长、错安全区和交付件不清造成的返工
- [x] 将 `ideas/multimedia-platform-spec-card-template.md` 正式落成 `playbooks/multimedia-platform-spec-card.md`，并接入 `PLAYBOOKS.md`、`TOOLS.md` 与 `playbooks/multimedia-generation-workflow.md`，把多媒体任务的前置约束固定为“主平台 -> 输出规格 -> 内容约束 -> 生产约束 -> 验收 -> 交接”，减少封面图、短视频、图生视频和跨平台复用任务里因输出契约不清导致的返工
- [x] 补一份 `multimedia-prompt-pack-template.md`，把 `Generation Brief -> shared guardrails -> variant prompts -> acceptance -> next revision axis` 固化成可直接复用的首轮 prompt 输出模板，降低生图 / 视频 / 图生视频任务里从目标确认到可执行 prompt 的断层
- [x] 为多媒体任务补版本对比记录与可复用素材清单，并新增 `multimedia-delivery-pack-template.md` 作为末端收口模板，减少多轮生成后的资产散落、版本失焦与后续上传/发布前再次手工挑版本的成本
- [x] 将 `multimedia-prompt-pack-template.md` 提升为正式 `playbooks/multimedia-prompt-pack.md`，把 `Generation Brief -> Prompt Pack -> iteration log / delivery pack` 固化为多媒体复杂任务的默认中间层，减少生图 / 视频 / 图生视频任务里首轮 prompt 不可比较、不可验收、不可复用的返工
- [x] 将 `ideas/multimedia-delivery-pack-template.md` 正式落成 `playbooks/multimedia-delivery-pack.md`，把“候选图/视频版本 -> 主交付版本 -> 可复用 prompt 资产 -> 下一交接动作”固化成多媒体任务的末端收口流程，减少上传、审阅、发布和二次编辑前再次手工挑版本与丢失 winning prompt 的返工
- [x] 新增 `playbooks/multimedia-iteration-log.md`，把多轮生图 / 视频 / 图生视频比较正式收口为 `brief -> prompt pack -> iteration log -> delivery pack`，减少只保存最后一个 prompt、版本胜出原因丢失和下一轮改动轴混乱导致的返工
- [x] 新增 `playbooks/multimedia-source-asset-readiness.md`，并接入 `PLAYBOOKS.md`、`TOOLS.md` 与 `playbooks/multimedia-generation-workflow.md`，把“已有本地/下载素材 -> 选择唯一主素材 -> 验收清晰度/裁切/UI污染/保护元素 -> 再进入 prompt/生成”固化成默认前置层，减少封面图、图生视频、产品图和截图派生素材任务里因错源图、低质截图、坏裁切和未标记保护元素导致的整链返工
- [ ] 继续把 `multimedia-prompt-pack` 接到更多高频多媒体入口，优先覆盖小红书封面图、短视频分镜、图生视频首轮生成和跨平台素材复用场景
- [ ] 继续把 `multimedia-iteration-log` 接到更多高频多媒体入口，优先覆盖封面图多版本比稿、短视频镜头稿迭代、图生视频运动方向比较和发布前版本收口场景
- [ ] 继续把 `multimedia-delivery-pack` 接到更多高频多媒体入口，优先覆盖封面图定稿、短视频版本收口、图生视频交付和发布前审阅场景

## Phase 7

- [x] 将本地文件批处理任务正式沉淀为 `playbooks/local-batch-file-routing.md`，把 ZIP/解压、批量改名、图片格式转换、按扩展名整理、校验和、文件名清洗统一按交付目标分流到 `local-toolbox` / `batch-file-studio`
- [x] 继续把 `local-batch-file-routing` 接到更多高频入口，优先覆盖下载目录整理、上传前文件清洗、素材批量改名和交付包打包场景
- [x] 新增 `playbooks/download-cleanup-pack.md`，并接入 `PLAYBOOKS.md` 与 `TOOLS.md`，把“下载目录整理 / 上传前文件清洗 / 审阅前材料收口”固定为 `锁定唯一目标 -> 预览保留/排除范围 -> scoped cleanup -> 验证唯一交付包/目录 -> 下一交接`，减少浏览器下载后停在散乱本地文件、上传前临时挑文件和打包范围过宽导致的返工
- [x] 为高风险批量改名/移动任务补更明确的 preview -> apply -> verify 统一验收模板，继续降低误改名、误触达和范围漂移风险
- [x] 将 `self-evolution-log/ideas/batch-rename-apply-guard-template.md` 正式落成 `playbooks/batch-rename-apply-guard.md`，并接入 `PLAYBOOKS.md`、`TOOLS.md` 与 `playbooks/local-batch-file-routing.md`，把高风险本地批量改名/移动任务的默认执行顺序收紧为 `preview -> apply -> verify -> handoff`，减少下载目录整理、上传前文件清洗和素材批量改名里的误触与假完成
- [ ] 继续把 `preview -> apply -> verify` 防护层接到更多下载目录整理、上传前文件清洗、素材批量改名和归档打包入口，优先减少批处理任务中的范围漂移与误触文件族风险
- [x] 新增 `playbooks/capability-intake-handoff.md`，把“新能力需求 -> 最佳能力路径 -> 最小 smoke test -> 下一执行链路”固化成接入流程，并接入 `PLAYBOOKS.md` 与 `TOOLS.md`，减少找到 skill / 工具 / MCP 但没有真正变成可执行任务链的断层
- [x] 为 capability intake 新增 `Capability Proof Pack` 模板，并接入 `playbooks/capability-intake-handoff.md` 与 `TOOLS.md`，把“发现能力”进一步收紧为“最小已证明任务 + proof signals + IO contract + next handoff”，降低新 skill / MCP / 工具接入中的假就绪风险
- [x] 将 `self-evolution-log/ideas/capability-proof-pack-template.md` 正式落成 `playbooks/capability-proof-pack.md`，并接入 `PLAYBOOKS.md`、`TOOLS.md` 与 `playbooks/capability-intake-handoff.md`，把新能力接入的默认完成标准从“已发现 / 已配置 / 可列出”推进为“至少有一个已证明真实任务 + proof signals + 可复用 IO 契约 + 明确下一接力流程”，减少新 skill / MCP / 工具方向停在假就绪状态的返工
- [x] 继续把 capability intake 流程接到更多高频入口，优先覆盖“能不能做 X / 有没有 skill / 要不要接 MCP / 是否值得 ACP 开发”这类能力探索场景
- [x] 新增 `playbooks/capability-front-door-routing.md`，把能力类请求先收口为 `real task -> existing lane enough? -> intake / investment / proof / ACP` 的前门判断，减少一上来就读 README、接服务或开 ACP 的过度建设
- [x] 新增 `playbooks/capability-evidence-pack.md`，把 docs / README / vendor page / 官方能力页研究收口为 `Task Family -> Capability Claims -> Prerequisites / Constraints -> Proof Status -> Recommended Next Route`，减少把 capability marketing claim、接入前提和本机 proof 混成一层后直接进入接入/投资判断的返工
- [x] 新增 `playbooks/acp-implementation-pack.md`，把 ACP coding 请求的前置压缩固定为“目标结果 -> repo/workspace -> scope boundary -> acceptance -> side-effect boundary -> handoff requirement”，降低 Codex / Claude Code / Gemini 线程因任务包过虚导致的澄清回合、改偏和弱验收风险
- [ ] 继续把 `acp-implementation-pack` 接到更多高频 ACP 入口，优先覆盖“明确点名 Codex/Claude Code/Gemini 的实现任务”“capability intake 最终落到 ACP 开发”以及“需要长期线程的 repo 级实现工作”
- [x] 新增 `ideas/capability-investment-gate-template.md`，并接入 `playbooks/capability-intake-handoff.md`，把“技术上能接”进一步分流为 `invest now / trial only / defer`，降低低频、脆弱或维护成本高的新能力被过度投入的风险
- [x] 将 `ideas/capability-investment-gate-template.md` 正式落成 `playbooks/capability-investment-gate.md`，并接入 `PLAYBOOKS.md`、`TOOLS.md` 与 `playbooks/capability-intake-handoff.md`，把“找到能力候选”进一步压成“是否值得长期投入”的显式关口，减少为低复用 / 高维护能力过度建设的风险
- [ ] 继续把 capability investment gate 接到更多高频能力入口，优先覆盖“是否值得为单次需求接 MCP / skill / ACP 开发”这类投入决策场景
- [x] 新增 `self-evolution-log/ideas/desktop-execution-lane-selector.md`，把桌面/本地 GUI 复杂任务的前门判断固定为 `end state -> lane choice(file/system vs browser vs semantic desktop vs visual/coordinate) -> proof plan -> action`，减少本地文件、Explorer、Office、文件对话框与弱 UIA 场景里一上来就乱点、错 lane 或过早升级能力的返工
- [x] 将 `self-evolution-log/ideas/desktop-execution-lane-selector.md` 正式落成 `playbooks/desktop-execution-lane-selector.md`，并接入 `PLAYBOOKS.md`、`TOOLS.md` 与 `playbooks/desktop-operations.md`，把桌面/Explorer/Office/本地 GUI 复杂任务的默认前门判断固定为 `end state -> lane choice -> proof plan -> action`，减少一上来就错 lane、乱点和过早升级能力的返工
- [ ] 继续把 `desktop-execution-lane-selector` 接到更多高频桌面入口，优先覆盖 Explorer/文件管理、Office 保存导出、浏览器触发的 Windows 文件对话框，以及弱 UIA / 图标密集界面的 lane 选择判断
- [ ] 继续把“已知路径本地文件任务走 file/system fast path”接到更多高频入口，优先覆盖 `打开这个文件/文件夹`、Explorer 选中文件、导出后本地审阅，以及浏览器上传前的本地 reveal/open 场景，减少把已知路径任务误做成 GUI 重新找路径的返工
- [x] 将 `known-path local file intent(reveal-only / open-for-review / route-next / delivery-pack)` 接入 `playbooks/local-file-delivery-handoff.md`、`playbooks/desktop-operations.md`、`PLAYBOOKS.md` 与 `TOOLS.md`，把已知路径本地任务的默认完成判断从“路径存在/窗口打开”继续收紧为“精确 artifact 已验证 + intent 已完成 + next route 明确（若需要）”，减少“窗口开了但真实 handoff 没完成”的返工
- [ ] 继续把 `known-path local file intent(reveal-only / open-for-review / route-next / delivery-pack)` 接到更多高频本地文件入口，优先覆盖导出后本地审阅、上传前本地确认、Explorer 选中文件后继续进入下游流程的场景，减少“窗口开了但真实 handoff 没完成”的返工
- [ ] 试做 `OmniParser + OmniTool` 的 Windows screenshot grounding proof，优先验证它是否能补现有桌面自动化在弱 UIA / 图标密集界面上的盲区；在本机真实样例完成 `screenshot -> parsed elements -> target pick` 之前，默认维持 `trial only`
- [x] 新增 `self-evolution-log/experiments/omniparser-omnitool-local-capability-proof-pack.md`，把 OmniParser / OmniTool 从 README 级 trial 继续压成一份本机 `Capability Proof Pack`：先固定 `parser-only -> real screenshot -> elements json / annotated proof -> target pick judgment` 的轻量验证路线，再决定是否值得投入 Docker / Windows VM / agent loop 这条更重的 OmniTool 链路
- [ ] 在出现真实半结构化网页任务缺口时，试做 `Stagehand` 的 task-shaped browser proof，验证它是否值得作为 OpenClaw 现有 browser lane 之外的 AI-assisted middle lane；在完成 unfamiliar admin/docs/form 三类最小 proof 之前，默认维持 `trial only`
- [x] 新增 `self-evolution-log/experiments/browser-use-browser-capability-trial-pack.md`，把 `browser-use` 压成一份可复用 `Capability Evidence Pack + Investment Gate + Trial Pack`：明确真实任务族、官方能力声明、前提/成本、false-ready trap、本机最小 proof 路线与当前 `trial only` 结论，避免因为 README / demo 很强就直接把它误判成已值得接入 OpenClaw 主 browser 链路
- [ ] 在出现真实弱结构/易变网页任务缺口时，试做 `browser-use` 的 task-shaped browser proof，优先验证它是否真能补现有 browser lane 在 unfamiliar admin page、复杂 docs navigation、weak-selector draft form 上的探索层缺口；在完成最小 proof 前，默认维持 `trial only`
