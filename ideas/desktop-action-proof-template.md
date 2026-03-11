# Desktop Action Proof Template

Use this template when a Windows desktop / Explorer / Office / local app task is easy to *act on* but hard to *prove complete*.

Typical cases:

- 在资源管理器里打开/选中文件后，还要确认真的是目标文件
- 在 Word / Excel / PowerPoint 里点击、输入、保存后，还要确认应用状态真的变化了
- 在桌面应用里切换窗口、点按钮、导入文件、触发导出后，还要确认下一步已可继续
- 本地 GUI 动作跨多个窗口，但中间任一步都可能“看起来成功、实际没生效”

## Why this matters

Desktop automation常见问题不是“不会点”，而是：

- 点到了错误窗口
- 焦点没切过去，输入去了别的地方
- 按钮点了，但应用仍在加载或还没接受变更
- 文件已打开应用，但打开的是旧文件或错误副本
- 页面/窗口看起来变了，但真实目标状态还没满足

这个模板把“动作成功”提升为“目标状态被证明达成”。

## Proof Fields

在声称桌面任务完成前，至少钉住这 5 项：

1. **Final artifact / end state**
   - 这一步真正要达成的桌面结果是什么
   - 例如：Explorer 已选中目标文件；Word 已打开目标文档；导出按钮触发后新文件已生成；某设置已在 UI 中显示为启用

2. **Primary proof signal**
   - 最强的直接证据是什么
   - 例如：窗口标题匹配目标文件名；目标控件状态变化；本地输出文件存在且时间新鲜；应用内出现附件/预览/成功状态

3. **Secondary proof signal**
   - 额外的辅助证据是什么
   - 例如：截图、控件树重读、文件大小非 0、状态栏文字、焦点窗口信息

4. **False-completion trap**
   - 这类桌面任务最容易误判完成的陷阱是什么
   - 例如：只看到窗口弹出；只看到按钮被点击；只看到应用启动；只看到对话框关闭；只看到文件存在但其实是旧文件

5. **Handoff-ready condition**
   - 什么条件成立后，下一步才真的可以继续
   - 例如：目标窗口已聚焦且内容正确；目标文件已被应用接受；导出文件已验证并可进入上传/发送/审阅

## Route Patterns

### Route A — Focus / switch / open

Use when the task is to focus a window, open a file, or switch into the correct app state.

- Final artifact / end state: 正确窗口或正确文档已打开并处于可操作状态
- Primary proof signal: 活动窗口标题或文档标题匹配目标
- Secondary proof signal: 截图 / 控件树 / recent file entry / 目标内容可见
- False-completion trap: 应用启动了，但不是目标文档；窗口在前台，但焦点仍不对
- Handoff-ready condition: 后续点击/输入将明确作用在正确对象上

### Route B — Click / type / toggle inside app

Use when the task changes UI state inside an app.

- Final artifact / end state: 目标字段/按钮/开关对应状态已变化
- Primary proof signal: 控件值、勾选状态、可见文本、页面区域变化符合预期
- Secondary proof signal: 截图 / 控件树再次读取 / 状态栏提示
- False-completion trap: 发送了点击或键盘事件，但应用未接收、被遮挡、还在加载、或作用在错误控件
- Handoff-ready condition: 该状态变化已经被应用接受，下一步依赖它时不会回退或失效

### Route C — Save / export / generate local artifact

Use when desktop action should create or update a local file.

- Final artifact / end state: 精确输出文件已在预期路径生成
- Primary proof signal: 文件存在 + 扩展名正确 + 修改时间新鲜
- Secondary proof signal: 文件大小合理 / 源应用成功提示 / 文件可被打开
- False-completion trap: 只看到 Save/Export 对话框关闭；误把旧文件当新文件；保存到了默认目录
- Handoff-ready condition: 该文件已被本地验证，可直接进入 reveal/review/upload/send

## Short Template

- Task:
- Desktop route: [focus/open | click/type/toggle | save/export/generate]
- Final artifact / end state:
- Primary proof signal:
- Secondary proof signal:
- False-completion trap:
- Handoff-ready condition:
- Current conclusion: verified / acted-but-proof-incomplete / blocked

## Rule

桌面自动化默认不要以“动作发出去了”作为完成标准。

默认以“目标窗口 / 控件 / 文件 / 应用状态已被证明达成”作为完成标准。
