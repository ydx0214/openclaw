# Browser Use Browser Capability Trial Pack (Windows / OpenClaw)

- Date: 2026-03-12
- Status: trial only
- Priority domain: 浏览器操作 / 查询资料 / 信息整合 / OpenClaw 新能力接入
- Candidate: Browser Use (`browser-use/browser-use`)

## Why this candidate

OpenClaw 现有 `browser` 工具已经能完成大量网页研究、表单、上传、下载和后台操作；但在下面这些复杂网页里，仍然会出现一种中间层缺口：

1. 页面结构变化快，但业务目标稳定
2. 需要先“看懂页面再决定下一步”，而不是一上来就走完全规则化动作
3. 希望先完成一轮自然语言探索，再收口成更稳的 browser proof / handoff 链
4. 遇到 unfamiliar page 时，想验证“AI browser agent 能不能缩短探索成本”，但又不想直接把它误判成主链路替代品

`browser-use` 的候选价值不是替换 OpenClaw 现有 browser lane，而是补一条 **AI-assisted browser middle lane**：

- 比纯 agent loop 更容易压成最小 proof
- 比从头写细碎浏览器动作更快起手
- 比“只会讲能力”更接近真实任务验证

## Source-backed capability notes

### From official README (`browser-use/browser-use`)

官方 README 明确暴露出的能力点：

1. **以 Python 库形态运行 browser agent**
   - 安装要求偏向本地 Python 环境（README 写明 Python >= 3.11）
2. **可以直接描述任务并运行 agent**
   - 例子里通过 `Agent(task=..., llm=..., browser=...)` 执行浏览器任务
3. **提供 open-source library + cloud 路线**
   - README 同时给出本地库与 Browser Use Cloud 路线
4. **官方示例任务已经覆盖高价值真实任务族**
   - job application
   - grocery shopping
   - PC parts assistant
5. **自带 CLI 与持久浏览器状态思路**
   - README 展示 `browser-use open/state/click/type/screenshot/close`
6. **支持自定义 tools**
   - 能把浏览器动作与外部工具组合

### From official docs homepage / cloud intro (`docs.browser-use.com`)

官方文档首页与 Cloud 介绍页强调：

1. **State-of-the-art AI browser automation**
2. **stealth browsers / CAPTCHA solving / residential proxies / managed infrastructure**
3. **Agent Tasks**：可以“用 plain text 描述目标，再拿 structured data back”
4. **Sessions & Profiles**：强调持久登录态和多步骤 workflow
5. **Browser Infrastructure / Proxies & Stealth**：说明其价值主张不只是“会点页面”，而是把更重的浏览器基础设施一起打包

这些点说明：`browser-use` 并不是单纯的 Playwright wrapper，而是把 **agent + browser infra + optional cloud** 打成一套更重的 browser automation capability。

## Real task families this could help

如果后续 proof 成立，优先服务这些复杂真实任务：

1. **弱结构 / 易变页面上的探索到固化过渡层**
   - 初次进入陌生后台、复杂 docs、语义差的表单时，先让 AI 帮忙理解页面与目标动作
2. **复杂表单的 draft 阶段**
   - 在不点击最终 submit 的前提下，先识别字段分组、上传入口、异常控件
3. **复杂 research + action 混合任务**
   - 例如先导航、再抽事实、再给出可执行下一步
4. **登录后后台的轻探索动作**
   - 在已有 auth proof 的前提下，帮助找到筛选器、导出入口、详情入口，再回接现有 `browser-admin-report-*` 链

## Where it does NOT help first

本轮不把它当成以下场景的默认解：

1. **已经被 OpenClaw 原生 browser lane 稳定覆盖的任务**
   - 普通 research / upload / download / form / admin-report
2. **需要明确复用你现有 Chrome relay 登录态的任务**
   - OpenClaw 自带 `browser` + chrome relay 目前更直接
3. **高风险收口步骤**
   - 最终 proof 仍应回到现有 `browser-auth-proof-card`、`browser-export-proof`、`browser-upload-subtask-rule`、`completion-proof` 等链路
4. **本地桌面 GUI 自动化**
   - `browser-use` 解决的是浏览器，不补 Windows desktop lane

## Main constraints / prerequisites

### Likely prerequisites

1. Python 3.11+
2. 本地安装 `browser-use`
3. 至少一个可用模型提供方或 Browser Use 自带模型路线
4. 如果走 cloud / stealth / managed infra，可能还需要 Browser Use Cloud API key
5. Windows 本机还要额外确认 Playwright / Chromium 依赖与环境稳定性

### Likely constraints

1. **外部依赖偏重**：不是零配置能力增强
2. **计费与登录面更复杂**：本地 LLM / cloud / browser infra 可能是多层依赖
3. **很容易假就绪**：README 很强、demo 很炫，不代表本机真实任务已 task-ready
4. **与现有 browser lane 有重叠**：若不先证明 capability gap，容易重复建设

## False-ready traps

不要把下面这些状态当成“已值得接入 OpenClaw 主链路”：

- 只读过 README / docs
- 只完成安装
- 只跑通 hello world
- 只在公开静态页上完成一次简单点击
- 只看到它能开浏览器、截图或返回一段日志

真正 task-ready 至少要证明：

1. 一个**真实任务族**被最小证明
2. 输出不是“它动了”，而是“它产出了 downstream-useful result”
3. 明确它接在哪条 OpenClaw workflow 前面，而不是另起孤立平行流程

## Smallest worthwhile proof on this machine

推荐 proof，不从公开 demo 起手，而从 OpenClaw 当前真实高价值网页任务里找 capability gap：

### Proof Task A — unfamiliar admin page assist

目标：
在一个真实但不要求最终提交的后台/报表页面中，完成：

- 识别 account / workspace 线索
- 找到指定筛选器、导出入口或详情入口
- 产出一个可继续执行的 next move

验收：

- 至少 1 条 `account/workspace proof`
- 至少 1 条 `scope/filter target`
- 至少 1 条 `next safe move`
- 结果可回接 `browser-admin-report-execution-pack`

### Proof Task B — docs / help navigation assist

目标：
在结构复杂 docs / help center 中，完成：

- 找到最相关页面路径
- 进入目标页
- 产出一个 source-backed answer chunk

验收：

- 至少 1 条 source-backed fact
- 至少 1 条 navigation proof
- 结果可回接 `research-evidence-pack` / `research-action-pack`

### Proof Task C — weak-selector form draft assist

目标：
在不点击最终 submit 的前提下，完成：

- 识别字段分组
- 找到至少 1 个弱语义控件的合理定位方案
- 给出 draft-safe 下一步

验收：

- 至少识别 3 个字段或字段组
- 至少定位 1 个难控件
- 明确 `do not submit`
- 结果可回接 `form-fill-pack` / `web-form-execution`

## Recommended investment gate result

当前结论：`trial only`

### Value side

- 可能补 OpenClaw 在“弱结构、易变网页”上的探索层缺口
- 对 docs navigation、陌生后台、复杂 draft 表单可能有真实增益
- 与现有 browser proof / handoff playbook 有清晰接点

### Cost / risk side

- 与现有 browser lane 重叠明显，必须先证明 gap
- 本地依赖、模型依赖和 cloud 依赖边界更复杂
- 还没证明在 Windows + OpenClaw 体系内，能比现有工具链明显更省返工

## Recommended next route

不是现在就接入主链路；而是：

1. 仅在出现**现有 browser lane 明显吃力**的真实网页任务时，再开一次 task-shaped proof
2. proof 后按结果分三档：
   - `invest now`：若能明显降低真实任务返工
   - `trial only`：若只在少数场景有帮助
   - `defer`：若主要只是 README 很强
3. 若 proof 成立，再考虑是否要新增：
   - 一个更具体的 `browser-ai-middle-lane` playbook（候选）
   - 或把它接进现有 `capability-proof-pack -> browser-admin/report/research/form downstream`

## Suggested OpenClaw rule update

新增长期观察方向：

- **AI-assisted browser middle lane（browser-use 候选）**：只针对“现有 browser lane 已有明显 capability gap，但又没重到值得直接走 ACP / 重建系统”的半结构化网页任务。

执行规则：

- 以后评估这类浏览器新能力，不默认从“能不能接 SDK”起手；先问：
  1. 现有 `browser` lane 是否真的不够
  2. 缺的是探索辅助，还是最终 proof / handoff
  3. 新能力能否稳定回接现有 playbook，而不是制造平行流程

## Current decision

- 不接入主链路
- 不新增系统级配置
- 先记录为值得继续观察的一条能力方向
- 下一次只在真实半结构化网页任务出现明确 capability gap 时，再做 task-shaped proof

## Sources used

1. `https://raw.githubusercontent.com/browser-use/browser-use/main/README.md`
2. `https://docs.browser-use.com/cloud/introduction`
