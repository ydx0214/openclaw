# Browser Stable Automation Rule

## Problem

复杂浏览器任务（多步表单、资料整理、上传前后切页、站点内多轮点击）里，常见失败不是“不会点”，而是：

- 复用旧 snapshot ref，导致 stale element
- 跨 tab / 跨 step 后 targetId 漂移
- 填完一个字段后页面局部重绘，后续动作仍沿用旧引用
- 只看到点击成功，却没有重新确认页面当前状态

这会直接拖累官网投递、后台录入、资料抓取、文档下载、复杂站内操作等真实任务的完成率。

## Rule

对多步浏览器任务，默认采用这组稳定化策略：

1. 起手 snapshot 时优先 `refs=aria`
2. 后续动作尽量固定同一个 `targetId`
3. 每个关键动作后，如果页面有切步、重绘、弹层变化、附件状态变化、按钮启停变化，先刷新 snapshot 再继续
4. 不连续重试同一个失效 ref；先确认页面当前状态，再决定下一步
5. 把“动作成功”与“页面状态已更新”分开验证

## Recommended Micro-Loop

1. `snapshot(refs=aria)` 锁当前页面结构
2. 记录关键 `targetId`
3. 执行单个动作（click / fill / select / upload）
4. 观察是否出现以下任一变化：
   - step 切换
   - modal 打开/关闭
   - validation 文案出现/消失
   - upload chip / attachment row 出现
   - Next / Submit 按钮状态改变
   - 页面局部重绘
5. 若出现变化，立即重新 `snapshot(refs=aria)`
6. 只基于新 snapshot 继续下一步

## When This Matters Most

- 官网求职表单
- 多步骤后台录入
- 带上传的表单
- 站内检索 + 详情页往返
- 动态前端页面（React/Vue）

## Acceptance Upgrade

对浏览器复杂任务，完成证明默认至少包含两层：

- 动作层：目标动作已发出
- 状态层：新页面状态已被重新读取并符合预期

如果只有动作层，没有状态层，不应宣称该步稳定完成。

## Reusable Short Rule

> 多步浏览器自动化默认用 `snapshot(refs=aria) + 固定 targetId + 每步后按状态变化刷新 snapshot`；不要连续复用旧 ref，更不要把点击成功当成页面状态已成功更新。
