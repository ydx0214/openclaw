# Career Form Fill Pack Handoff Template

## Why

官网投递类复杂任务里，`Career Prep Handoff` 解决的是“是否准备好开始填”，但真正进入浏览器前，仍然常有一个高频断点：

- `career-form-pack.json`、`fill-data.json`、简历文件、答案素材分散存在
- 上传文件虽已准备，但没有锁成唯一上传目标
- 可直接填的字段、需人工确认的字段、可复用的长文本没有被压成一个执行包
- 结果是进入页面后还要边翻资料边填，复杂站点上很容易返工

这个模板的目标，是把求职准备阶段的多个产物，进一步收口成浏览器执行前的一个最小 `Career Form Fill Pack`。

它是：

`Career Prep Handoff -> Career Form Fill Pack -> web-form-execution`

---

## When to Use

适合：

- 官方公司 careers 页面
- Workday / Greenhouse / Lever / Taleo / iCIMS 等多步骤申请页
- 需要附件上传、长文本回答、敏感确认字段的岗位申请
- 已经有职位研究 / 材料准备结果，但还没进入浏览器执行

不适合：

- 只剩机械 1-2 个字段补录的极简申请页
- 材料仍明显缺失、还没达到 `Fill Readiness=ready` 或至少 `needs-confirmation`

---

## Input Stack

优先从这些来源组包：

1. `Career Prep Handoff`
2. `jobs/career-form-pack.json`
3. `jobs/fill-data.json`
4. `jobs/answer-bank.json`
5. 当前目标岗位对应的 resume variant / upload-ready resume
6. 已确认的作品集、证书、附件路径
7. 用户刚给出的补充确认

---

## Standard Structure

```md
# Career Form Fill Pack

## 1. Target Role
- Company:
- Role:
- Platform:
- URL:
- Boundary: draft-only / submit-now

## 2. Source Stack
- Career Prep Handoff:
- career-form-pack.json:
- fill-data.json:
- answer-bank.json:
- resume file:
- supporting attachments:

## 3. Fill Buckets
### A. Safe factual fields
- field:
  value:
  source:

### B. Derived text fields
- field:
  draft:
  source:
  notes:

### C. Upload fields
- field:
  exact file path:
  page-side proof to verify:

### D. Human-confirm fields
- field:
  current answer:
  confirmation status:
  stop rule:

## 4. Page Notes
- single-step / multi-step:
- likely blockers:
- upload handoff needed:
- snapshot refresh checkpoints:

## 5. Draft-Ready Checklist
- fields to re-read:
- uploads to verify:
- validation to inspect:
- submit boundary:

## 6. Next Action
- enter web-form-execution
- wait for user confirmation
- go back to prep
```

---

## Routing Rule

### If materials are still incomplete
回到：
- `career-prep-handoff.md`
- `resume-delivery-pack.md`
- `document-task-routing.md`

### If prep artifacts already exist and browser execution is next
先组一个 `Career Form Fill Pack`，再进入：
- `web-form-execution.md`
- 如有上传：`browser-upload-handoff.md`
- 如弹 Windows 对话框：`windows-file-dialog-handoff.md`

### If already inside a career site form but data is still scattered
暂停页面动作，先回补最小 `Career Form Fill Pack` 再继续。

---

## Acceptance

一个合格的 `Career Form Fill Pack` 至少满足：

- 当前岗位、当前页面、当前边界明确
- resume/附件路径是唯一且可直接上传的
- factual / long-text / upload / sensitive 四类字段已分桶
- 需要人工确认的字段已单独列出
- 页面侧 draft-ready 验收点明确
- 下一步是继续执行、等待确认，还是回补材料，已明确

---

## Rule to Keep

对官网投递类复杂表单，不要直接从 `Career Prep Handoff` 跳到页面填表。

当页面存在多步骤、上传、长文本或敏感确认字段时，默认先压成一个 `Career Form Fill Pack`，再进入浏览器执行。