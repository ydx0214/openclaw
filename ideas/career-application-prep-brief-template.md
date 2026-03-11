# Career Application Prep Brief Template

## Why this exists

复杂求职任务的主要损耗，常发生在“打开官网职位页之后、真正开始填表之前”的这段空白区：

1. 岗位要求、材料要求、表单要求没有先收口
2. 简历、作品集、附加问答、地点/薪资/签证条件混在一起
3. 直接开始填表，做到一半才发现资料缺口
4. 研究结果没有转成后续自动化可消费的准备包

这个模板用于把 **职位官网研究 -> 材料缺口检查 -> 投递前准备包** 串成一条固定链路，优先提升复杂真实求职任务的完成率。

---

## Best-fit task types

适用于：

- 企业官网岗位研究
- 投递前材料准备
- 简历变体准备
- 浏览器填表前置检查
- 需要把官网信息转成可执行准备包的求职任务

不适用于：

- 已经准备齐全、只差机械填表的任务
- 非官方招聘聚合页的泛搜索
- 最终提交按钮点击本身（仍需单独确认）

---

## Default workflow

### 1) Capture the target role

先固定最小职位目标：

- company
- role_title
- role_url
- platform
- location
- work_mode（onsite / hybrid / remote）

### 2) Split findings into 5 buckets

强制拆成 5 类，避免研究结果和执行材料混在一起：

1. **Role facts**：岗位职责、技能要求、年限、语言、地点
2. **Application constraints**：必填字段、附件要求、字数限制、是否需账号、是否多步骤
3. **Candidate-ready materials**：现有可直接用的简历、作品集、证书、链接
4. **Material gaps**：缺的材料、需确认的敏感字段、需生成的简历变体/答案
5. **Next actions**：开始填表前必须先做的动作

### 3) Produce a fill-readiness verdict

投递前先给出一个明确状态，不直接跳进填表：

- `ready`：可直接进入表单填写
- `needs-materials`：缺材料，先补材料
- `needs-confirmation`：有敏感字段或关键条件需你确认
- `not-fit`：岗位明显不匹配，不建议继续投入

### 4) Turn research into reusable artifacts

至少产出其中 1~2 个：

- 简历变体需求清单
- 浏览器填表前检查单
- 表单包字段清单
- 缺口问题清单
- 投递动作顺序

### 5) Stop before submission

这个模板服务的是“准备完成可执行投递”，不是默认提交。
最终提交仍需明确人工确认。

---

## Reusable output schema

```md
# Career Application Prep Brief

## Target Role
- Company:
- Role:
- URL:
- Platform:
- Location:
- Work mode:

## Role Facts
- [职责/要求 1]
- [职责/要求 2]
- [职责/要求 3]

## Application Constraints
- [附件/字段/流程限制 1]
- [附件/字段/流程限制 2]

## Candidate-Ready Materials
- [已有材料 1]
- [已有材料 2]

## Material Gaps
- [缺口 1]
- [缺口 2]

## Fill Readiness
- Verdict: ready | needs-materials | needs-confirmation | not-fit
- Reason:

## Recommended Prep Actions
1. [动作 1]
2. [动作 2]
3. [动作 3]

## Safe-to-Fill Fields
- [可直接自动填的字段]

## Human-Confirm Fields
- [需要人工确认的字段]

## Reusable Outputs
- [例如：resume variant brief / form pack / answer prompts]

## Sources
1. [title]
   URL: ...
   Why it matters: ...
2. [title]
   URL: ...
   Why it matters: ...
```

---

## Acceptance checklist

交付前至少检查：

- 是否把“岗位研究”与“材料缺口”分开了
- 是否明确给出 `Fill Readiness`
- 是否点出哪些字段可以安全填，哪些必须人工确认
- 是否把研究结果转成至少一个可复用准备产物
- 是否能让后续浏览器填表从“边看边猜”变成“按包执行”

---

## High-value reuse pattern

推荐固定成以下链路：

1. 浏览器/官网研究岗位
2. 输出 `Career Application Prep Brief`
3. 生成/更新 `career-form-pack.json`、简历变体、答案素材
4. 再进入浏览器填表
5. 最终提交前停住，等人工确认

---

## Evolution note

这条能力值得继续长期投入，因为它能直接提升以下复杂任务的完成率：

- 官网求职投递
- 多岗位批量准备
- 简历定制与材料补齐
- 浏览器自动填表前的数据标准化
