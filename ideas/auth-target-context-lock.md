# Auth Target Context Lock

## Problem

登录态浏览器任务里，`已登录` 往往还不等于 `已锁定正确编辑对象`。

高频假就绪模式：

- 已进后台，但还没锁当前正在改哪个 workspace / profile / listing / candidate draft / report scope
- 已到 ATS 页面，但还没锁是 public role page 还是 application draft
- 已到上传页，但还没锁具体 entity / attachment slot / version slot
- 已复用 Chrome 会话，但还没锁当前 tab 的真实业务上下文

这类错位一旦带进 upload / form / careers / admin-report，返工成本很高。

## Rule

当浏览器任务同时满足下面两点时，除了 `Browser Auth Proof Card` 之外，还要额外锁一层 `Target Context`：

1. 任务依赖登录态
2. 后续动作会写入、替换、上传、继续 draft，或 scope 会影响结果

默认最小结构：

`auth proof -> target context lock -> downstream workflow`

不要把下面这些当成 target context 已锁定：

- 页面标题像后台
- 已看到上传按钮
- 已看到 Continue / Next / Edit
- URL 里像带了 id，但没核对业务对象

## Auth Target Context Lock Card

```md
# Auth Target Context Lock

## Task Goal
- ...

## Active Auth Context
- account:
- workspace / tenant:
- role:

## Target Object Type
- application draft
- candidate profile
- attachment slot
- report scope
- listing / item / record
- other: ...

## Target Context Proof
- visible object name / title:
- visible id / route / breadcrumb:
- stage / status proof:
- editability / uploadability proof:

## False-Ready Trap
- ...

## Next Workflow
- ...
```

## Task-Specific Minimum Locks

### Admin / Report
至少锁：
- 当前 workspace / tenant
- 当前 report / dashboard 名称
- 当前 scope / filter / date range（如果结果依赖它）
- 当前页面是否真可 edit / export

### Upload / Edit Form
至少锁：
- 当前 entity / record / profile
- 具体 attachment field / section
- 是否是 replace 还是 add
- 页面是否接受当前会话继续编辑

### Careers / ATS
至少锁：
- 当前 employer / ATS account（如可能混）
- 当前页面是 public role page、sign-in profile，还是 application draft
- 若是 draft，锁 draft title / step / last-saved 或继续按钮语义
- 当前 resume / attachment 上传位属于哪个申请

## Completion Rule

只有在 `auth context` 和 `target context` 都有可见 proof 时，才算真正 ready 进入下游 page actions。

如果只证明了“我已登录”，但没证明“我正在改对的对象”，默认仍视为未完成前门判断。
