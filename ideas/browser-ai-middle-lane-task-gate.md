# Browser AI Middle-Lane Task Gate

- Date: 2026-03-12
- Status: reusable rule
- Scope: Stagehand / browser-use / similar AI-assisted browser candidates

## Why this exists

OpenClaw 现有 `browser` lane 已经能稳定完成大量浏览器真实任务。  
对 Stagehand、browser-use 这类候选能力，最容易犯的错不是“没找到工具”，而是：

- 看到 README / docs 很强，就直接当成主链路候选
- 还没证明真实 capability gap，就开始接 SDK / 配置 cloud / 设计新流程
- 只证明“能开浏览器/能 act”，却没证明它能产出 downstream-useful result
- 没先锁和现有 playbook 的回接位置，最后造出平行流程

所以这类能力的前门，不该是“能不能接”。  
应该先过一张 **Task Gate**：只在现有 browser lane 明显不够、且新能力补的是“探索层缺口”时，才值得继续 proof。

## When to use this gate

对下面这类请求，先过这张 gate：

- 想评估 Stagehand、browser-use、类似 AI browser agent / framework
- 想知道是否值得把某个浏览器 AI 能力接进 OpenClaw
- 当前任务像是“陌生后台 / 复杂 docs / 弱选择器表单”，怀疑现有 browser lane 吃力
- 主要风险是过早建设，而不是当前这一步真做不了

## Task Gate

### 1. 先锁真实任务，不锁技术名词

先写：

- 目标任务族：
- 当前用户可见瓶颈：
- 这次缺的是探索辅助，还是最终 proof / handoff：

如果说不清任务族，只能说“这个框架很强”，先停在 `trial only`。

### 2. 先问现有 browser lane 是否真的不够

只有满足下面至少 1 条，才继续考虑 AI middle lane：

- 页面结构/文案变化快，规则化 ref 很容易频繁返工
- 任务需要先“看懂页面再决定下一步”
- 当前站点 unfamiliar，探索成本明显高于执行成本
- 现有 lane 能做，但前几步页面理解成本反复偏高

如果现有 OpenClaw browser lane 已够：

- research -> 走现有 `browser-research-briefing`
- form -> 走 `form-fill-pack` / `web-form-execution`
- upload -> 走 `browser-upload-subtask-rule`
- admin/report -> 走 `browser-admin-report-*`

此时不要升级新能力。

### 3. 明确它补的是“中间层”，不是末端 proof

这类能力只应优先补：

- unfamiliar admin page entry assist
- complex docs / help navigation assist
- weak-selector draft form assist

不应优先替代：

- auth proof
- page-state proof
- export/download proof
- upload acceptance proof
- final submit boundary

结论：

> AI middle lane 负责“先帮我找到正确下一步”，
> 现有 OpenClaw playbook 负责“把任务安全做完并证明完成”。

### 4. 只允许 task-shaped proof，不允许 README-shaped optimism

最小 proof 必须长得像一个小真实任务，而不是 hello world。

优先三类 proof：

#### A. unfamiliar admin page assist
- 输入：真实后台页 + 明确目标（找筛选器/导出入口/详情入口）
- 最小成功：
  - 1 条 account/workspace proof
  - 1 条 scope/filter target
  - 1 条 next safe move
- 成功后回接：`browser-admin-report-execution-pack`

#### B. docs navigation assist
- 输入：真实 docs/help center + 明确问题
- 最小成功：
  - 1 条 navigation path proof
  - 1 条 source-backed fact chunk
  - 1 条 next route
- 成功后回接：`research-evidence-pack` / `research-action-pack`

#### C. weak-selector draft form assist
- 输入：真实表单页 + 不允许 submit
- 最小成功：
  - 识别 >= 3 个字段/字段组
  - 定位 >= 1 个弱语义控件
  - 明确 `do not submit`
  - 给出 draft-safe next move
- 成功后回接：`form-fill-pack` / `web-form-execution`

### 5. 必须写清 false-ready trap

至少显式写 1 条：

- 只是安装成功
- 只是能 act / screenshot / extract
- 只是公开静态页 demo 成功
- 只是日志看起来像理解了页面
- 只是完成探索，但没有回接现有 workflow

### 6. 必须写清 IO contract

继续投入前，至少锁：

- 输入：页面上下文 + 任务目标 + side-effect boundary
- 输出：
  - next safe move
  - page element candidate / navigation path / field grouping / source-backed fact
- 下游消费者：
  - `browser-admin-report-execution-pack`
  - `research-evidence-pack`
  - `form-fill-pack`
  - 其他现有 browser playbook

如果输出不能被现有 workflow 消费，先不要升级成长期能力。

## Decision rule

### Invest now
仅当同时满足：
- 真实 capability gap 已被证明
- 至少 1 个 task-shaped proof 成功
- 明显降低真实任务返工
- 可稳定回接现有 playbook

### Trial only
适用于：
- 看起来可能有价值
- 但只在少数半结构化网页上可能成立
- 还没证明比现有 browser lane 更值

### Defer
适用于：
- 现有 browser lane 已够用
- 主要卖点只是 README / demo 强
- 维护/登录/cloud 成本高于真实收益
- 不能清晰回接现有 workflow

## Reusable output mini-template

```md
# Browser AI Middle-Lane Task Gate

## Target task family
- Real task:
- Current bottleneck:
- Why existing browser lane is not enough yet:

## Candidate role
- Exploration assist / not final proof layer
- Best downstream handoff:

## Smallest proof
- Proof task type: admin assist / docs navigation / weak-selector form
- Exact no-side-effect boundary:
- Primary proof:
- Secondary proof:
- False-ready trap:

## IO contract
- Inputs:
- Outputs:
- Downstream consumer:

## Gate decision
- Invest now / trial only / defer
- Why:
```

## Rule to keep

以后评估 Stagehand、browser-use、类似 AI 浏览器候选能力时：

1. 不从“能不能接 SDK / cloud”起手  
2. 先证明现有 browser lane 是否真有 gap  
3. 只把它当作探索辅助 middle lane 候选  
4. 只接受 task-shaped proof  
5. 成功后必须回接现有 OpenClaw browser playbook，而不是制造平行流程
