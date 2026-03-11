# Office Output Proof Template

Use this template when a Word / Excel / PDF / Markdown-to-Office task already produced files, but the real risk is false completion: the file exists, yet nobody has proved it is the right artifact, fresh enough for this run, and actually safe for the next real step.

## Why this exists

Complex document tasks often fail at the last 10%:
- 文件导出了，但不是这次刚生成的版本
- `.docx` 能打开，但版式还没做 render proof
- `PDF` 存在，但并不是用户下一步真正要上传/发送的文件
- 有多个近似文件，但没有一个被明确锁定为唯一交付件
- 说“已经好了”，但没有把 source of truth、delivery artifact 和 next-step proof 绑在一起

This template adds a small proof layer between `document work done` and `handoff-ready`.

## Reusable Card

```md
# Office Output Proof Card

## Task
- Goal:
- Next real step: review / upload / send / archive / continue editing
- Required output type: DOCX / PDF / XLSX / CSV / other

## Artifact Lock
- Editable source of truth:
- Candidate delivery artifact:
- Why this file is the preferred delivery artifact:
- Alternate/nearby files that must NOT be used:

## Freshness Proof
- [ ] Claimed output path exists
- [ ] Modified time is fresh for this run
- [ ] File size is non-zero
- [ ] Extension matches the next real step

## Format / Render Proof
- [ ] Structural check completed (inspect / style-report / sheet check / parse check)
- [ ] If Word layout matters, `docx-render-check` completed
- [ ] If PDF is the delivery file, export path verified against source and timestamp
- [ ] If spreadsheet delivery matters, target sheet/file opens or parses cleanly

## Handoff Proof
- [ ] Exactly one preferred next-step file is named
- [ ] Source of truth remains explicit
- [ ] Next workflow is named
- [ ] Any remaining human review item is explicit

## False-Completion Traps
- Existing older export reused by mistake
- File type matches but next workflow does not
- Render/layout never checked
- Multiple similarly named files but no explicit preferred artifact
- Output exists locally, but upload/send/review path is still ambiguous

## Ready State
- Preferred next-step file:
- Proof summary:
- Next workflow:
```

## Default Trigger Rules

Use this proof card when at least one is true:
1. there are multiple similar files around the output
2. the task is Word / PDF / Office heavy and the next step is upload, send, review, or archive
3. the user asked for a deliverable rather than only an edit
4. layout/format matters enough that file existence alone is weak proof
5. the task crosses `editable source -> exported artifact -> next-step handoff`

## Minimal Operating Rule

For Office-class document tasks, do not stop at `file generated successfully`.
Default to: `lock artifact -> prove freshness -> prove format/render if needed -> name next-step file`.

## Good Pairings

- `playbooks/document-delivery-pack.md`
- `playbooks/word-paper-fast-path.md`
- `playbooks/paper-formatting.md`
- `playbooks/local-file-delivery-handoff.md`
- `playbooks/browser-upload-handoff.md`
