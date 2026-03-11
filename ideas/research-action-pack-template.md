# Research Action Pack Template

Use this template when browser / web research is not the final deliverable.

Goal: turn a finished `Research Brief` into a small execution pack that the next workflow can directly consume.

Typical targets:

- official-site research -> operation checklist
- product / vendor comparison -> decision pack
- job-page research -> prep pack / form prep
- documentation review -> implementation checklist
- policy / FAQ review -> do / do-not action list

---

## When To Produce An Action Pack

Produce an `Action Pack` when at least one of these is true:

1. the next step is an execution task rather than a pure answer
2. the research identified fields, files, constraints, deadlines, or approvals
3. another playbook will be used next and needs clean inputs
4. the user would otherwise need to re-read the research before acting

If the next step is only a short answer, a normal `Research Brief` is enough.

---

## Core Rule

Do not stop at “what the pages say”.

End with:

`what matters -> what is required -> what is missing -> what to do next -> what artifact should be produced next`

---

## Standard Structure

```md
# Action Pack

## Goal
- The concrete action this pack supports:

## Recommended Route
- Next workflow / playbook:
- Why this route:

## Locked Facts To Reuse
- Fact 1
- Fact 2
- Fact 3

## Execution Inputs
- Required fields / materials:
- Required files:
- Required confirmations:
- Deadlines / limits:

## Missing Or Blocking Items
- Missing material:
- Human confirmation needed:
- Risk / ambiguity:

## Ordered Next Steps
1. ...
2. ...
3. ...

## Ready-To-Use Handoff
- What the next workflow can assume:
- What still must be checked before acting:

## Sources
1. ...
```

---

## Five Buckets

Keep the pack in these five buckets:

1. **Locked Facts**
   - stable facts already verified from sources
2. **Execution Inputs**
   - fields, files, credentials, approvals, constraints
3. **Gaps / Blockers**
   - what is still missing or uncertain
4. **Ordered Next Steps**
   - small action sequence for the next workflow
5. **Handoff Contract**
   - what the next workflow may trust vs what it must re-check

Do not mix verified facts and guesses.

---

## Route Mapping

### A. Research -> Browser Form / Application

Output should include:

- fields to prepare
- upload files to lock
- sensitive confirmations
- whether the correct next playbook is `career-prep-handoff.md` or `web-form-execution.md`

### B. Research -> Local Document / Resume Work

Output should include:

- source facts to preserve verbatim
- document type to produce
- evidence / emphasis points
- whether the correct next playbook is `document-task-routing.md`, `resume-tailoring-from-jd.md`, or `resume-delivery-pack.md`

### C. Research -> Operational Checklist

Output should include:

- prerequisites
- exact steps
- stop rules
- verification points

### D. Research -> Decision Support

Output should include:

- best option
- why not the alternatives
- what new information would change the decision

---

## Acceptance

Before calling the action pack done, check:

- the next workflow is named explicitly
- required inputs are separated from missing inputs
- blockers are visible instead of buried in prose
- ordered next steps are small enough to execute directly
- the user would not need to re-read the whole research set to continue

---

## Completion Snippet

- 能力路径：`research-action-pack`
- 适用场景：`研究结果需要直接进入下一执行流程`
- 产出：`Action Pack`
- 可直接衔接：`career-prep-handoff / web-form-execution / document-task-routing / resume-tailoring-from-jd / operation checklist`
- 核心价值：`把查到的信息压缩成下一流程可直接消费的输入，减少二次整理和中途返工`
