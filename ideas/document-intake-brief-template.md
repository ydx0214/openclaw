# Document Intake Brief Template

Use this template before acting on mixed or ambiguous document tasks.

Best for:
- PDF / Word / Markdown / Excel / CSV mixed requests
- resume / office / report / form-material tasks with more than one file
- tasks where the user says "先看看" / "先处理一下" / "帮我弄成可交付" but the delivery artifact is not locked yet
- cases where the main risk is wrong routing, overwriting the only source, or claiming completion without a handoff-ready file

## Goal

Lock the smallest document-task input needed to choose the correct toolchain and acceptance path.

Rule:
Do not start from the file extension alone. Start from the final delivery goal.

## Template

```md
# Document Intake Brief

## 1) Task Goal
- What does the user actually want done?
- Final deliverable:
- Is this an inspect / extract / convert / format / resume / table / delivery task?

## 2) Source Files
- Primary source of truth:
- Other related files:
- File types:
- Do all files exist locally:

## 3) Output Strategy
- Keep original file unchanged: yes / no
- New output path:
- Preferred delivery format: docx / pdf / md / xlsx / csv / mixed
- Is one explicit delivery artifact required:

## 4) Constraints
- Template / style standard:
- Target platform or usage scene:
- Must include:
- Must avoid:
- Sensitive fields / human confirmation points:

## 5) Verification
- Minimum proof of completion:
- Need render check / upload compatibility / field stability / page check:
- Next workflow after this:

## 6) Routing Decision
- Chosen path in document-task-routing:
- Why this path:
- If not ready, smallest missing input:
```

## Recommended default outputs

### Case A — Unknown office file
- inspect result
- extraction output if needed
- routing decision

### Case B — Word / report / thesis
- inspect
- style report
- lane decision: inspect only / light formatting / full paper formatting

### Case C — Resume / job materials
- candidate data status
- resume draft or missing fields questionnaire
- delivery pack requirement before upload

### Case D — Table / fill data
- inspect workbook / columns
- confirm output format
- field-stability note if used for later automation

### Case E — Markdown to delivery
- lock source markdown
- pick output docx/pdf path
- decide whether style/report/render check is required

## False-completion traps

- treating "file exists" as proof that the right deliverable exists
- overwriting the only editable source before checking the target format
- treating extracted text as proof that Word layout is correct
- starting browser upload work before one explicit delivery artifact is locked
- using file extension to route a task whose real goal is resume delivery, paper formatting, or structured fill data

## Operating rule

For complex document tasks, default to a short intake brief whenever the task has multiple files, ambiguous delivery goals, overwrite risk, or more than one plausible routing path.
