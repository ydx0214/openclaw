# Browser Upload Subtask Rule

## Why this rule exists

复杂真实任务里，浏览器上传最容易被误当成一次普通点击。
但对官网投递、材料提交、多附件表单、后台资料更新这类任务来说，真正的风险点是：

- 上传字段含义没先锁定
- 本地文件虽存在，但不是这次该传的唯一版本
- Windows 文件对话框关闭了，却没有页面侧接受证明
- 页面已重绘或进入异步校验，但流程还按旧状态继续

所以，上传不应被当成一个按钮动作，而应被当成一个**独立、可证明的子任务**。

## Trigger

当任务满足以下任一条件时，默认启用本规则：

1. 浏览器里要上传本地文件
2. 上传字段有业务含义（简历 / 成绩单 / 作品集 / 证明材料 / 附件）
3. 本地有多个相近候选文件
4. 可能弹出 Windows 文件选择框
5. 上传后页面还要等待异步校验 / 进度 / 下一步解锁

## Default Rule

把上传步骤固定成这一条默认链：

`lock field+artifact -> local proof -> choose route -> page-side acceptance proof -> next safe move`

不要从“点 Upload”开始思考。
要从“这个字段本次到底要接收哪个文件，并且页面如何证明它已接受”开始思考。

## 4 Mandatory Checkpoints

### 1. Upload intent checkpoint
先锁定：
- 上传字段 / 用途
- 本次唯一目标文件
- 是否允许替换现有附件

### 2. Local artifact checkpoint
上传前至少验证：
- 绝对路径存在
- 扩展名符合要求
- modified time 足够新
- 不是旧版本或相邻误选文件

### 3. Route checkpoint
按最窄路线执行：
- 能 browser-native 就先 browser-native
- 需要系统对话框时，再进入 `browser-upload-handoff -> windows-file-dialog-handoff`

### 4. Page acceptance checkpoint
上传成功必须以页面侧证明为准，而不是以下信号：
- 对话框关闭
- 路径被输入框接受
- 上传按钮点成功

优先页面侧证明：
- 文件名 chip / attachment row 出现
- uploaded / ready / complete 状态出现
- 校验错误消失
- Next / Continue 解锁

## Recommended Playbook Chain

### 如果文件刚生成 / 刚导出 / 刚下载 / 刚清洗
默认执行：

`local-file-delivery-handoff.md -> attachment-readiness-pack.md -> browser-upload-handoff.md -> windows-file-dialog-handoff.md (if needed)`

### 如果上传嵌在复杂表单中
在上链外再叠：

`web-form-execution.md`

### 如果页面是动态多步骤 / 异步上传
在上传动作前后叠：

`browser-stable-execution.md`

## False-Completion Traps

- 只看到文件对话框关闭，就以为上传完成
- 目录里有多个近似文件，但没先锁定唯一目标
- 页面发生重绘后仍沿用旧 ref 或旧判断
- 一个字段已接受，另一个字段仍未锁定，却继续下一步
- 只验证本地文件存在，没有验证页面已接受

## Reusable Mini Card

- Upload field:
- Intended file:
- Local proof:
- Route: browser-native / browser->windows-dialog
- Page acceptance proof:
- Next safe move:
- Current status: ready / verified / blocked

## Rule to Keep

以后凡是“浏览器里带附件上传”的复杂任务，默认把上传视为独立子任务，而不是普通点击。
结束标准不是“按钮点了 / 对话框关了 / 路径填进去了”，而是“页面已可见地接受目标文件，且下一步可安全继续”。
