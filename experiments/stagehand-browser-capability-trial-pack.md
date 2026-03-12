# Stagehand Browser Capability Trial Pack (Windows / OpenClaw)

- Date: 2026-03-12
- Status: trial only
- Priority domain: 浏览器操作 / 查询资料 / 信息整合 / OpenClaw 新能力接入
- Candidate: Stagehand (`browserbase/stagehand`, `browserbase/stagehand-python`)

## Why this candidate

当前 OpenClaw 已经能直接做浏览器点击、表单、上传、下载、后台导出和结构化研究；但在下面这些高波动网页里，纯规则化 Playwright 风格动作仍然可能返工：

1. 半结构化站点，页面文字/布局经常小改，但业务目标稳定
2. 需要“看懂页面再做一步”的轻代理浏览器任务
3. 从探索性浏览到稳定流程的过渡期，希望先自然语言验证，再收口成更可复用动作
4. 需要在 unfamiliar page 上先用 AI 找动作，再逐步收紧成结构化执行

Stagehand 的价值候选不是替代现有 OpenClaw browser lane，而是补一条 **浏览器任务的 AI-assisted middle lane**：

- 比纯 agent 更可控
- 比全手写低层选择器更快起步
- 比“只会介绍能力”更接近真实任务 proof

## Source-backed capability notes

### From `browserbase/stagehand` README

官方定位：

- "The AI Browser Automation Framework"
- 用自然语言与代码共同控制浏览器
- 目标是让浏览器自动化更 flexible、maintainable、reliable

官方强调的能力点：

1. **Choose when to write code vs. natural language**
   - unfamiliar page 用 AI
   - 已知稳定动作继续用代码
2. **Go from AI-driven to repeatable workflows**
   - 支持预览 AI 动作
   - 支持 cache 重复动作，减少时间与 token
3. **Write once, run forever**
   - auto-caching + self-healing
   - 页面变化导致脚本失效时，再把 AI 拉回环路

README 示例暴露出的核心接口：

- `act()`：单步动作
- `agent().execute()`：多步任务
- `extract()`：结构化提取

### From `browserbase/stagehand-python` README

Python 版说明了这类能力更接近“服务化 browser automation client”而不是本地纯脚本库：

- 安装：`uv pip install stagehand`
- 运行样例通常要求：
  - `MODEL_API_KEY`
  - `BROWSERBASE_API_KEY`
  - `BROWSERBASE_PROJECT_ID`
- Python SDK 暴露的核心动作包括：
  - `observe`
  - `act`
  - `extract`
  - `execute`
- 有远程 Browserbase 和 Playwright 组合示例
- 文档里也出现 local / playwright examples，但 README 主体依然明显偏向 Stagehand API + credentials 模式

## Real task families this could help

如果后续 proof 成立，优先服务这些复杂真实任务：

1. **官网登录后台里的轻探索动作**
   - 例如首次进入一个不熟悉的 SaaS 后台，先让 AI 找到筛选器、导出入口、详情页入口，再收口回现有 `browser-admin-report-*` 链路
2. **结构化研究前的页面理解层**
   - 例如官网文档结构复杂、导航层深、DOM 文本不直观，先用 AI 辅助定位，再继续 `research-evidence-pack` / `research-action-pack`
3. **多步骤表单中的弱选择器页面**
   - 某些表单控件语义差、文案轻微变化频繁、但业务字段稳定
4. **从探索到固化的浏览器工作流**
   - 先完成一次最小真实任务 proof，再判断是否值得把该流程沉淀回 OpenClaw 既有 playbook / browser rule

## Where it does NOT help first

这轮不把 Stagehand 当成以下场景的默认解：

1. 已经被 OpenClaw 现有 browser lane 稳定覆盖的任务
   - 普通 research / upload / download / form / admin-report
2. 明确要求复用你现有 Chrome 登录态的任务
   - 现阶段 OpenClaw 自带 `browser` + chrome relay 路径更直接
3. 对本地 Windows 桌面 GUI 的操作
   - Stagehand 是 browser-first，不补桌面 GUI lane
4. 强依赖 deterministic proof 的高风险收口步骤
   - 最终 proof 仍应回到现有 page-state / artifact proof / handoff playbook

## Main constraints / prerequisites

### Likely prerequisites

1. Python 3.9+
2. 安装 `stagehand`
3. 至少一个可用模型 API key
4. 很大概率需要 Browserbase credentials 才能顺畅走官方主路径
5. 若走本地 browser / Playwright 变体，还需额外确认 Windows 本机依赖与稳定性

### Likely constraints

1. **外部依赖重**：不是纯本地零配置增强
2. **登录/计费面更复杂**：模型 + Browserbase 双侧依赖
3. **维护边界更宽**：SDK、远程 browser、模型路由都可能成为故障面
4. **很容易假就绪**：README 很强 ≠ 本机真实任务已可用

## False-ready traps

不要把下面这些状态当作“Stagehand 已值得接入 OpenClaw”：

- 只看过 README / docs
- 只完成安装
- 只跑通 hello world
- 只看到 `act()` / `extract()` API 可用
- 只在公开静态页上做过简单点击

真正 task-ready 至少要证明：

1. 一个 **真实任务族** 已被最小证明
2. proof 不是“能点”，而是“能完成 downstream-useful result”
3. 明确它应接在哪条 OpenClaw 链路前面，而不是另起孤立工具链

## Smallest worthwhile proof on this machine

推荐最小 proof，不从公开 demo 起手，而从“OpenClaw 当前已有价值但仍会返工的浏览器任务族”里选一个：

### Proof Task A — unfamiliar admin page entry assist

目标：
在一个结构复杂、但不要求最终提交的后台页面中，完成：

- 识别当前 workspace / account 线索
- 找到指定筛选器或报表入口
- 给出可执行下一步

验收：

- 至少产出一条 `account/workspace proof`
- 至少产出一条 `scope/filter target`
- 至少产出一条 `next safe move`
- 结果可回接 `browser-admin-report-execution-pack`

### Proof Task B — docs/research navigation assist

目标：
在结构复杂 docs / help center 中，完成：

- 找到与目标问题最相关的导航路径
- 进入目标页
- 提取一个可复用事实块

验收：

- 至少给出一个 source-backed answer chunk
- 至少给出一个 page path / navigation proof
- 结果可回接 `research-evidence-pack`

### Proof Task C — weak-selector form draft assist

目标：
在不点击最终提交的前提下，完成：

- 识别字段分组
- 对一个语义弱、但人类看得懂的控件完成定位建议
- 给出 draft-safe 下一步

验收：

- 至少识别 3 个字段或字段组
- 至少完成 1 个弱控件定位
- 明确 `do not submit`
- 结果可回接 `web-form-execution` / `career-form-fill-pack`

## Recommended investment gate result

当前结论：`trial only`

原因：

### Value side

- 可能补 OpenClaw 在“半结构化、易变网页上的探索到固化过渡层”
- 对复杂 research / admin / form 页面可能有真实增益
- 和现有 browser lane 关系清晰：补 middle lane，而不是重复造轮子

### Cost / risk side

- 官方主路径对 Browserbase 依赖明显
- 凭据、计费、维护与故障面偏重
- 尚未证明在本机 Windows + OpenClaw 体系内，比现有 browser lane 明显更值

## Recommended next route

不是现在就接入主链路；而是：

1. 仅在出现 **现有 browser lane 明显吃力的半结构化网页任务** 时，再开一次 task-shaped proof
2. proof 后按结果分三档：
   - `invest now`：若能明显降低真实任务返工
   - `trial only`：若仅在少数页面有帮助
   - `defer`：若主要只是 README 看起来强
3. 若 proof 成立，再考虑是否需要新增：
   - `playbooks/browser-ai-middle-lane.md`（候选）
   - 或把它接进 `capability-proof-pack -> browser-admin/report/research/form downstream`

## Suggested OpenClaw rule update

新增长期进化方向：

- **浏览器任务的 AI-assisted middle lane**：专门针对“现有 browser lane 够不到、但又没重到要单独 ACP/自建完整系统”的半结构化网页任务。

执行规则：

- 以后评估这类浏览器新能力，不默认从“能不能接 SDK”起手；先问：
  1. 现有 `browser` lane 是否真的不够
  2. 缺的是探索辅助，还是缺的是最终 proof/handoff
  3. 新能力是否能稳定回接现有 playbook，而不是制造平行流程

## Current decision

- 不接入主链路
- 不新增系统级配置
- 先记录为一条值得继续观察的能力方向
- 下一次只在真实半结构化网页任务出现明确 capability gap 时，再做 task-shaped proof

## Sources used

1. `https://raw.githubusercontent.com/browserbase/stagehand/main/README.md`
2. `https://raw.githubusercontent.com/browserbase/stagehand-python/main/README.md`
