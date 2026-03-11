# Browser Research Briefing Template

## Why this exists

复杂浏览器资料任务最常见的问题，不是“搜不到”，而是：

1. 搜索目标不够清晰，导致抓到一堆无关页
2. 事实、观点、操作步骤混在一起，后续无法复用
3. 只记结论，不记来源，二次核对成本高
4. 没有收口模板，最后只能给出松散笔记，难以支持后续执行

这个模板用于把“浏览器查询 / 官网调研 / 职位与产品资料整合 / 多页信息比对”统一成稳定交付链路。

---

## Best-fit task types

适用于：

- 官网调研与资料整合
- 职位信息与申请材料准备
- 产品 / 服务 / 定价 / 功能对比
- 政策、教程、文档、FAQ 的多页汇总
- 需要后续继续执行的浏览器研究任务

不适用于：

- 纯单页快速问答
- 只需一个事实且无需留痕的检索
- 需要深度交互登录或复杂表单提交的任务（应切到专门自动化流程）

---

## Default workflow

### 1) Define the deliverable first

先明确最终要交付哪一种结果，再决定搜索深度：

- `quick-answer`: 快速答案 + 1~3 个来源
- `briefing`: 结构化简报 + 关键来源 + 下一步建议
- `comparison`: 对比表 + 差异点 + 推荐结论
- `action-pack`: 可直接用于后续执行的资料包

如果用户没说，默认按 `briefing` 交付。

### 2) Split the task into 4 buckets

查询时强制分成 4 类信息，避免混写：

1. **Objective facts**：时间、地点、价格、资格、流程、字段要求
2. **Page-specific instructions**：官网或表单里明确要求用户做什么
3. **Derived synthesis**：跨页面整合后的结论
4. **Open questions**：仍未验证、需人工确认的点

### 3) Source priority rule

优先级默认：

1. 官方网站 / 官方帮助中心 / 官方文档
2. 可信平台原始页面（职位页、开发者文档、政策页）
3. 二级来源（媒体、博客、论坛）仅作补充，不作唯一依据

如果结论依赖二级来源，必须标记 `需要二次确认`。

### 4) Capture each source in the same schema

每个页面至少记录：

- `title`: 页面标题
- `url`: 页面链接
- `type`: official / platform / secondary
- `last_checked`: 检查时间
- `key_facts`: 3~7 条可复述事实
- `actions_required`: 页面要求执行的动作
- `constraints`: 限制条件 / 前提 / 风险
- `quote_or_anchor`: 可回查的原句或章节名

### 5) Synthesize only after enough coverage

满足以下任一条件后再开始整合：

- 已覆盖 2 个以上关键页面
- 已拿到影响执行结果的核心约束
- 已能回答“接下来具体怎么做”

否则继续查，不要过早总结。

### 6) End with execution-oriented output

最终输出必须能支持下一步动作，而不是停留在“我看了很多资料”。

---

## Reusable output schema

```md
# Research Brief

## Goal
- 这次要解决的具体问题：

## Verified Facts
- [事实 1]
- [事实 2]
- [事实 3]

## Page Requirements / Constraints
- [页面要求或限制 1]
- [页面要求或限制 2]

## Synthesis
- [跨页面整合出的结论 1]
- [跨页面整合出的结论 2]

## Recommended Next Step
- [下一步最合理动作]

## Open Questions
- [仍需确认的问题 1]
- [仍需确认的问题 2]

## Sources
1. [title] - [type]
   URL: ...
   Why it matters: ...
2. [title] - [type]
   URL: ...
   Why it matters: ...
```

---

## Acceptance checklist

交付前至少过一遍：

- 是否区分了“已验证事实”和“综合判断”
- 是否给了来源，而不只是口头结论
- 是否指出仍未确认的点
- 是否给出下一步可执行动作
- 如果要支持后续自动化，是否已提取关键字段或要求

---

## High-value patterns to reuse

### Pattern A: Career-site preparation

适合职位官网、投递前准备：

- 先提取岗位要求、地点、语言、材料要求
- 再整理成 `facts / constraints / missing materials / next action`
- 输出最好能直接给后续表单填写或简历变体使用

### Pattern B: Product / vendor comparison

适合查工具、服务、平台：

- 按价格、功能、限制、集成方式、适用场景分栏
- 明确哪些结论来自官网，哪些是综合判断
- 最后必须给“推荐选项 + 不选原因”

### Pattern C: Documentation-to-action

适合查教程、API、帮助文档：

- 分成 prerequisite / steps / failure points / verification
- 不要只摘抄文档，要转成实际操作顺序

---

## Evolution note

如果后续发现某类浏览器研究任务反复出现，优先继续演进成：

1. 专门 playbook
2. 固定输出模板
3. 针对职位、官网、产品比较的专用 briefing 变体
