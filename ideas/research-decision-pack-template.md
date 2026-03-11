# Research Decision Pack Template

Use this template when browser / web research ends in a real choice rather than an immediate form fill or document edit.

Goal: turn multi-page research, product comparison, policy review, or capability investigation into a decision artifact that can support a real next move without re-reading all sources.

Typical targets:

- product / vendor / tool comparison -> choose one option
- job / offer / role comparison -> pick a target route
- docs / policy comparison -> choose a compliant execution path
- OpenClaw skill / MCP / tool evaluation -> decide adopt / defer / reject
- browser research with several plausible routes -> commit to one next workflow

---

## When To Produce A Decision Pack

Produce a `Decision Pack` when at least one of these is true:

1. the user needs a recommendation, not just a fact summary
2. multiple options remain plausible after research
3. the next workflow depends on picking one route first
4. the cost of choosing the wrong option is high enough to justify explicit tradeoffs
5. a future revisit would benefit from knowing why an option was chosen or rejected

If there is only one obvious route and almost no tradeoff, a normal `Action Pack` is enough.

---

## Core Rule

Do not stop at "A is better".

End with:

`decision goal -> option set -> evaluation dimensions -> recommendation -> reject reasons -> triggers that would change the choice -> next executable move`

---

## Standard Structure

```md
# Decision Pack

## Decision Goal
- What concrete choice must be made:
- What downstream task depends on this choice:

## Options Considered
- Option A:
- Option B:
- Option C:

## Evaluation Dimensions
- Must-have constraints:
- Nice-to-have criteria:
- Risk factors:
- Time / cost / complexity factors:

## Evidence Snapshot By Option
### Option A
- Best supporting facts:
- Key weaknesses:
- Sources:

### Option B
- Best supporting facts:
- Key weaknesses:
- Sources:

### Option C
- Best supporting facts:
- Key weaknesses:
- Sources:

## Recommendation
- Recommended option:
- Why this option wins now:
- Confidence level: low / medium / high

## Why Not The Alternatives
- Why not option A:
- Why not option B:
- Why not option C:

## Decision-Switch Triggers
- What new information would change the recommendation:
- What assumptions must stay true:

## Next Executable Move
1. ...
2. ...
3. ...

## Handoff Contract
- What downstream workflow can assume:
- What still must be verified before commitment:

## Sources
1. ...
```

---

## Five Buckets

Keep the pack in these five buckets:

1. **Decision Goal**
   - the real choice and downstream consequence
2. **Option Evidence**
   - source-backed pros / cons per option
3. **Recommendation Logic**
   - why one option wins now
4. **Decision-Switch Triggers**
   - what future fact would flip the call
5. **Executable Handoff**
   - what workflow should run next if the recommendation is accepted

Do not hide tradeoffs inside narrative prose.

---

## Route Mapping

### A. Product / Vendor / Tool Comparison

Output should include:

- mandatory requirements
- price / capability / integration / risk tradeoffs
- recommended option now
- when a different option would be better

### B. Job / Offer / Role Comparison

Output should include:

- target role recommendation
- evidence map by role
- constraints such as location / language / work mode / sponsorship
- next playbook such as `career-prep-handoff.md` or `resume-tailoring-from-jd.md`

### C. Docs / Policy / Execution Route Comparison

Output should include:

- compliant route
- blocked / risky routes
- exact stop rules
- next execution checklist

### D. OpenClaw Capability / Skill / MCP Evaluation

Output should include:

- adopt / defer / reject recommendation
- minimum proved task or missing proof
- integration cost / maintenance cost / real task value
- whether to route next into `capability-intake-handoff.md`, direct tool use, or ACP development

---

## Acceptance

Before calling the decision pack done, check:

- the concrete decision is explicit
- recommendation and evidence are separated
- reject reasons are visible
- at least one decision-switch trigger is named when uncertainty exists
- the next workflow is named explicitly
- a future revisit could understand why this choice was made

---

## Completion Snippet

- 能力路径：`research-decision-pack`
- 适用场景：`研究结果需要支持真实选型/决策/路线选择`
- 产出：`Decision Pack`
- 可直接衔接：`research-action-pack / capability-intake-handoff / career-prep-handoff / resume-tailoring-from-jd / operation checklist`
- 核心价值：`把多选项研究从“总结”收口为“可解释、可复核、可继续执行”的决策输入`
