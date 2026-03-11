# Changelog

## 2026-03-12

- 新增 `self-evolution-log/ideas/batch-rename-apply-guard-template.md`，并将高风险本地批量改名/移动任务的 `preview -> apply -> verify` 防护层接入 `playbooks/local-batch-file-routing.md` 与 `roadmap.md`，降低下载目录整理、上传前文件清洗、素材批量改名等复杂文件任务中的误改名、误触文件族和范围漂移风险

- 新增 `self-evolution-log/ideas/document-intake-brief-template.md`，并将“task goal -> source files -> output strategy -> constraints -> verification -> routing decision”接入 `playbooks/document-task-routing.md` 与 `roadmap.md`，降低 PDF / Word / 简历 / 表格混合任务起手走错链路、误覆盖原件和交付目标不清的风险

- 新增 `self-evolution-log/ideas/multimedia-delivery-pack-template.md`，并将多媒体工作流从 `Generation Brief -> prompt pack -> iteration log -> acceptance` 扩展为 `Generation Brief -> prompt pack -> iteration log -> delivery pack -> acceptance`，同时接入 `playbooks/multimedia-generation-workflow.md` 与 `roadmap.md`，减少生图 / 视频 / 图生视频任务在生成后到上传/发布前的版本失焦、素材散落与末端假完成风险

- 新增 `playbooks/local-batch-file-routing.md`，并将本地 ZIP/解压、批量改名、批量图片转换、按扩展名整理、校验和、文件名清洗按交付目标分流到 `local-toolbox` / `batch-file-studio`，同时接入 `PLAYBOOKS.md`、`TOOLS.md` 与 `roadmap.md`，降低本地文件批处理任务中范围不清、输出物不明确和“命令跑了但文件未真正 handoff-ready”的风险

- 新增 `ideas/desktop-action-proof-template.md`，并将“Final artifact / Primary proof / Secondary proof / False-completion trap / Handoff-ready”接入 `playbooks/desktop-operations.md` 与 `roadmap.md`，减少资源管理器、Office 与本地 GUI 操作中“动作发出去了但目标状态没真正达成”的假完成风险

- 新增 `playbooks/document-delivery-pack.md`，并将“source of truth -> delivery artifact -> output check -> next-step handoff”接入 `PLAYBOOKS.md`、`playbooks/document-task-routing.md` 与 `roadmap.md`，减少 Word / PDF / Markdown / Office 文档任务在末端交付时的错文件、旧文件和假完成风险

- 新增 `self-evolution-log/ideas/multimedia-prompt-pack-template.md`，并将“Generation Brief -> shared guardrails -> variant prompts -> acceptance -> next revision axis”接入 `playbooks/multimedia-generation-workflow.md` 与 `roadmap.md`，减少生图 / 视频 / 图生视频任务从目标确认到可执行 prompt 之间的断层
- 新增 `playbooks/research-action-pack.md`，把“Research Brief -> Action Pack -> 下一执行流程”正式固化为研究类任务的标准交接层，并接入 `PLAYBOOKS.md`、`TOOLS.md`、`playbooks/browser-research-briefing.md` 与 `roadmap.md`，减少官网研究、政策/FAQ、产品对比、职位研究完成后还要手工二次整理输入的返工
## 2026-03-11

- 新增 `ideas/research-action-pack-template.md`，并将“Research Brief -> Action Pack -> 下一流程输入”正式接入 `playbooks/browser-research-briefing.md` 与 `roadmap.md`，减少官网研究、政策/FAQ、职位研究、文档转执行清单后再次手工整理的重复劳动

- 新增 ideas/form-fill-pack-template.md，把复杂浏览器表单执行前的数据准备沉淀为统一 Form Fill Pack 模板，并接入 playbooks/web-form-execution.md 与 
oadmap.md，降低官网申请、资料提交和带上传多步表单中的边填边猜、资料漂移与误提交风险

- 新增 `ideas/browser-stable-automation-rule.md`，并将“多步浏览器任务默认使用 `snapshot(refs=aria)` + 固定 `targetId` + 每步后按状态变化刷新 snapshot`”接入 `TOOLS.md` 与 `playbooks/web-form-execution.md`，降低动态页面、多步骤表单和上传流程中的 stale ref 与跨步误操作风险

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
- 新增 `ideas/document-task-routing-template.md`，把 PDF / Word / 简历 / 表格 / Markdown 任务沉淀为统一分流与验收模板，降低复杂文档任务走错工具链和漏校验的概率
- 新增 `playbooks/document-task-routing.md`，把复杂文档任务按提取、排版、简历、表格、Markdown 交付 5 条路径分流，并接入 `PLAYBOOKS.md` 与 `TOOLS.md`
- 新增 `ideas/browser-research-briefing-template.md`，把浏览器查询/官网调研/多页资料整合沉淀为统一简报模板，优先服务职位研究、产品对比、文档转操作方案等复杂真实任务
- 新增 `ideas/career-application-prep-brief-template.md`，把“职位官网研究 -> 材料缺口 -> Fill Readiness -> form pack/简历变体准备”固化成求职类复杂任务的投递前准备模板，并将短版 Prep Brief 接入 `playbooks/careers-site-application.md`

- 新增浏览器/桌面文件上传交接模板，明确上传前锁定文件路径、Browser -> Windows 对话框接管、页面侧验收，并接入 desktop / careers playbook，降低官网投递与复杂表单附件上传中的假完成风险
- 将上传交接模板正式落成 `playbooks/browser-upload-handoff.md` 并接入 `PLAYBOOKS.md`，把浏览器附件上传沉淀为可复用的独立流程
- 新增 `ideas/multimedia-generation-brief-template.md`，把生图 / 视频生成任务前置收口为统一 `Generation Brief` 模板，降低多轮 prompt 返工和多媒体交付失焦风险
- 新增正式 `playbooks/multimedia-generation-workflow.md`，把多媒体任务沉淀为 `素材盘点 -> Generation Brief -> prompt pack -> acceptance` 工作流，并接入 `PLAYBOOKS.md`
- 新增 `ideas/multimedia-iteration-log-template.md`，并将多媒体工作流升级为 `素材盘点 -> Generation Brief -> prompt pack -> iteration log -> acceptance`，减少多轮生成任务中版本结论和可复用素材的散落风险

- ������ʽ playbooks/browser-research-briefing.md������ҳ������о�����Ϊ�ɸ��ü����̣������� PLAYBOOKS.md �� TOOLS.md�����͹������С�ְλ�о�����Ʒ�Ƚϵ�������������Ϸ�������
- 新增 playbooks/career-prep-handoff.md，把职位页研究结果正式收口为 Prep Brief、材料缺口、派生产物与 Fill Readiness 判定，并接入 PLAYBOOKS.md、TOOLS.md 与 careers-site-application.md，降低官网投递中途补材料的返工风险
- 新增 `playbooks/resume-tailoring-from-jd.md`，把 JD / 官方职位页稳定转成 evidence map、emphasis plan、resume variant brief 与 answer themes，并接入 `PLAYBOOKS.md`，降低官网投递前简历定制与多岗位材料分化的返工风险
- 新增 `playbooks/resume-delivery-pack.md`，把岗位定向简历的末端收口固定为“简历变体 -> 交付文件 -> 输出校验 -> 上传交接”，并接入 `PLAYBOOKS.md`、`TOOLS.md` 与官网投递推荐链路，降低错文件上传、旧文件复用和未验证导出的风险
- 新增 `playbooks/browser-download-handoff.md`，把“浏览器下载触发 -> 本地落盘 -> 文件校验 -> 下一流程交接”沉淀为标准下载接力流程，并接入 `PLAYBOOKS.md`、`TOOLS.md` 与 roadmap，降低 PDF/JD/导出文件类复杂任务中的假完成与错文件复用风险
- 新增 `playbooks/downloaded-file-routing.md`，把“已下载本地文件 -> 按执行目标分流到文档 / 求职 / 简历交付 / 多媒体 / 解包流程”沉淀为标准路由规则，减少下载完成后停在本地文件、后续链路接不上或走错工具链的情况
- 新增 `playbooks/windows-file-dialog-handoff.md`，把 Windows 打开/保存/另存为/选文件夹 对话框沉淀为统一交接流程，并接入 `PLAYBOOKS.md` 与 `TOOLS.md`，降低浏览器上传下载、Office 导出、桌面应用文件选择中的假完成风险
- 新增 `playbooks/web-form-execution.md`，把通用浏览器表单任务沉淀为 `数据准备 -> 字段映射 -> 页面侧验证 -> 明确提交边界` 工作流，并接入 `PLAYBOOKS.md`，降低多步骤表单、带上传表单和草稿/提交边界不清时的假完成风险
- 新增 `playbooks/openclaw-agent-delegation.md`，把复杂任务起手分流固化为 direct / ACP / local-tool-chain 三条默认路线，并接入 `PLAYBOOKS.md` 与 `TOOLS.md`，降低大任务一开始选错执行路径导致的返工与弱验证风险
- 新增 `playbooks/local-file-delivery-handoff.md`，把“本地文件已生成/已下载 -> reveal/open/review/唯一交付文件选择 -> 下一流程交接”沉淀为标准接力流程，并接入 `PLAYBOOKS.md`、`TOOLS.md` 与 `desktop-operations.md`，降低简历/文档/导出文件/图片交付中的错文件、旧文件和末端假完成风险
- 将 research / prep / delivery / form / upload 的 4 条默认串联链路固化进 `playbooks/openclaw-agent-delegation.md`，减少复杂混合任务中虽已选对工具域、但中途接力断层导致的返工
- 新增 `ideas/completion-proof-template.md`，把复杂任务的完成标准统一收口为最终产物、主/次证明信号、假完成陷阱与 handoff-ready 条件，并将 completion proof 规则接入 `playbooks/openclaw-agent-delegation.md` 与 `roadmap.md`，继续降低浏览器 / 桌面 / 文档链路中的假完成风险
- 新增 `playbooks/completion-proof.md`，把复杂任务的完成标准从“动作执行成功”提升为“最终产物 + 强证明信号 + handoff-ready 条件成立”，并接入 `PLAYBOOKS.md`、`TOOLS.md` 与 roadmap，降低浏览器 / 桌面 / 文档链路中的假完成风险
- 将 completion proof 内嵌进 `playbooks/browser-download-handoff.md`，把浏览器下载类任务的完成标准收紧为“精确本地文件 + 强证明信号 + 明确下一流程”，继续压低下载预览/提示误判为完成的风险
- �� completion proof ��Ƕ�� `playbooks/local-file-delivery-handoff.md`���ѱ����ļ��������������ɱ�׼�ս�Ϊ����ȷ������ + �ɼ�֤�� + handoff-ready��������ѹ�͵�������ļ������ļ���ĩ�˼���ɷ���
- 将 completion proof 内嵌进 `playbooks/browser-upload-handoff.md`，把上传类任务的完成标准收紧为“页面侧已接受目标文件 + 至少一条次证明 + handoff-ready”，继续压低官网投递、附件表单、资料提交中的假完成风险

- ���� playbooks/word-paper-fast-path.md���� Word / ���� / ���� .docx �������Ϊ inspect -> style-report -> lane selection �Ķ�������̣������� PLAYBOOKS.md��TOOLS.md �� roadmap�������ĵ��ิ������һ���������ޡ������ַ����ķ���
- �� completion proof ��Ƕ�� `playbooks/windows-file-dialog-handoff.md`���� Open / Save / Save As / Select Folder ����ɱ�׼�ս�Ϊ�����ؽ�� + ԴӦ�ý��� + handoff-ready��������ѹ�Ϳ������ / ���� / �ĵ���·�еļ���ɷ���

- 将浏览器稳定自动化规则进一步接入 rowser-research-briefing.md、rowser-upload-handoff.md、rowser-download-handoff.md，把 snapshot(refs=aria) + 固定 	argetId + 关键状态变化后刷新 snapshot 从表单流程扩展到研究 / 下载 / 上传三条高频链路，降低 stale ref、跨步误操作和动态页面重绘返工


