# Form Fill Pack Template

## Why

复杂浏览器表单的主要风险，往往不是不会点页面，而是：

- 资料散在聊天、简历、PDF、截图里，填到一半才发现缺字段
- 同一事实在不同字段被写成不同版本
- 上传文件、长文本、敏感确认项混在一起，执行边界不清
- 页面上看起来填了很多，最后却既不算 draft-ready，也不该直接 submit

这个模板的目标，是把“浏览器执行前的数据准备”沉淀成一个可复用的 `Form Fill Pack`。

它不是最终提交物。
它是浏览器执行前的锁定包：

`目标 -> 字段来源 -> 上传文件 -> 敏感确认 -> 页面验收 -> 提交边界`

---

## 使用场景

适合：

- 官网申请 / Workday / Greenhouse / Lever / Taleo / iCIMS
- 商务资料提交页
- 带附件上传的报名/申报/注册页
- 多步骤、带校验、带草稿/提交边界的浏览器表单

不适合：

- 只有 1~2 个字段的极简表单
- 完全没有外部副作用、也没有资料一致性风险的临时输入框

---

## 标准结构

```md
# Form Fill Pack

## 1. Task Boundary
- Target page:
- Objective:
- Boundary: draft-only / submit-now
- Expected success signal:

## 2. Source of Truth
- Primary structured file:
- Supporting docs:
- Latest user confirmations:
- Unknowns still open:

## 3. Field Buckets
### A. Safe factual fields
- field:
  source:
  value:

### B. Derived text fields
- field:
  source:
  draft:
  max length / notes:

### C. Upload fields
- field:
  exact file path:
  expected page-side proof:

### D. Sensitive confirmation fields
- field:
  current answer:
  confirmation status:
  notes:

## 4. Page Execution Notes
- multi-step or single-step:
- dynamic sections / blockers:
- upload handoff needed:
- snapshot refresh checkpoints:

## 5. Verification Checklist
- key fields to re-read:
- uploads to verify page-side:
- validation states to inspect:
- submit-disabled reasons to inspect:

## 6. Stop Rule
- stop before final submit when:
- safe to submit only after:
```

---

## Minimal Working Version

当任务时间紧、资料不全时，至少锁这 6 项：

1. Target page
2. Boundary（draft-only / submit-now）
3. Source of truth
4. Exact upload file path
5. Sensitive fields needing confirmation
6. Expected success signal

如果连这 6 项都没锁，不要直接开始大量填表。

---

## Routing Rule

### 情况 A：资料还散
先进入文档/简历准备流程：
- `document-task-routing.md`
- `career-prep-handoff.md`
- `resume-delivery-pack.md`

### 情况 B：资料基本齐，但浏览器执行风险高
先产出 `Form Fill Pack`，再进入：
- `web-form-execution.md`
- 如有上传，再接 `browser-upload-handoff.md`
- 如弹 Windows 对话框，再接 `windows-file-dialog-handoff.md`

### 情况 C：已经进入页面但发现字段复杂
暂停直接填表，先回补一个最小 `Form Fill Pack`，再继续。

---

## Acceptance

一个合格的 `Form Fill Pack` 至少要满足：

- 关键字段有明确来源，不靠临场猜
- 上传字段已锁定唯一文件路径
- 敏感字段已单独列出，不混在普通字段里
- 页面验收点明确，不把“点过/输过”当成完成
- 提交边界明确，不把 draft 误变成 submit

---

## Rule to Keep

对复杂浏览器表单，默认先锁 `Form Fill Pack`，再执行页面操作。

优先优化“资料到页面”的转换质量，而不是只优化点击动作本身。
