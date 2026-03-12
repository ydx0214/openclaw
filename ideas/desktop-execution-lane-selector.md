# Desktop Execution Lane Selector

## Why this exists

复杂本地任务里，返工常常不是因为不会点，而是起手没先判断该走哪条执行 lane：

- 明明可以用文件系统 / PowerShell 直接完成，却先开 GUI
- 明明可以用语义控件树稳定完成，却过早退化到坐标点击
- 明明是浏览器任务，却误走本地桌面自动化
- 明明当前 lane 证据不够，却还继续做后续动作

这张卡的目标不是“描述所有可能性”，而是把复杂桌面任务先压成一个**最窄可行执行路线**，减少错 lane、假完成和不必要的重型能力投入。

---

## Use when

适用于这类真实任务起手判断：

- 打开 / 选择 / 移动 / 整理本地文件或文件夹
- Explorer / Word / Excel / PDF 阅读器 / 本地 GUI 软件操作
- 桌面截图、窗口切换、按钮点击、输入文本
- 浏览器弹出 Windows 文件对话框后的交接
- 用户说“帮我操作电脑 / 帮我点一下 / 帮我打开 / 帮我保存 / 帮我导出”

不适用于：

- 明显是浏览器内可完成的普通网页任务
- 纯编码 / repo 实现任务
- 只需一句命令即可完成且没有 GUI 依赖的纯本地脚本任务

---

## Core rule

默认先问：**这件事的最小可验证 end state 是什么？**

然后只选一条最窄 lane：

1. **File/System lane**
   - 文件存在、重命名、移动、压缩、校验、打开路径、创建目录
   - 优先本地命令/脚本，不先开 GUI
2. **Browser lane**
   - 本质是网页任务，只是中途碰到下载/上传/文件对话框
   - 优先 browser playbook；仅在 Windows 对话框出现时借桌面链路接一下
3. **Semantic desktop lane**
   - 可通过窗口名、控件树、按钮名、输入框名稳定定位
   - 优先语义控件，不先走坐标点击
4. **Visual/coordinate lane**
   - 语义控件不可用、自绘界面、弱 UIA、图标密集、游戏化界面
   - 先要求更强 proof，再允许截图/坐标型动作
5. **Capability-gap lane**
   - 以上 lane 都不够，且任务有复用价值
   - 才进入 capability proof / trial only / 新能力投资判断

---

## Lane selection card

```md
# Desktop Lane Selector

## Task Goal
- 这次真正要达成的 end state：

## Primary Artifact / State To Prove
- 任务完成后，哪一个文件 / 窗口 / 设置 / 页面状态必须成立：

## Candidate Lanes
- File/System lane:
- Browser lane:
- Semantic desktop lane:
- Visual/coordinate lane:

## Chosen Lane
- 选中的最窄执行路线：
- 为什么不是其他 lane：

## Preconditions
- 需要先确认的窗口 / 路径 / 登录态 / 文件 / 权限：

## Primary Proof Signal
- 什么信号能证明 end state 已成立：

## False-Completion Trap
- 哪种“看起来成功”其实不算完成：

## Next Handoff
- 完成后下一条链路是什么：
```

---

## Quick heuristics

### Pick File/System lane first when

- 目标是“得到某个文件状态”而不是“看到某个窗口动作”
- 能直接用脚本稳定完成
- GUI 只是可选手段，不是任务本体

典型例子：
- 批量重命名
- ZIP/解压
- 创建目录
- reveal/open 某个本地文件
- 计算 hash

### Pick Browser lane first when

- 任务主语还是网页
- 本地动作只是上传/下载/对话框交接
- 页面侧 proof 比桌面侧 proof 更重要

典型例子：
- 官网上传简历
- 后台下载报表
- 表单提交时选择本地文件

### Pick Semantic desktop lane first when

- 目标软件有稳定窗口标题/控件名
- 可以靠控件树而不是像素定位
- 后面还需要 Save / Apply / Export 等强状态证明

典型例子：
- Word/Excel/PPT 编辑与保存
- 设置窗口里点命名按钮/输入框
- Explorer 中按名称选文件

### Only pick Visual/coordinate lane when

- 控件树不可用或明显不稳定
- 当前界面是自绘 / 图标密集 / 文字少
- 已经知道需要 screenshot proof 才能继续

典型例子：
- 弱 UIA 桌面客户端
- 图标工具栏
- 自定义渲染面板
- 模型/桌面视觉定位试验场景

---

## Stop rules

遇到这些信号要暂停，不要继续点：

- 还没锁定唯一 end state
- 只知道“要点哪里”，但不知道完成后怎么 proof
- 语义控件失败后直接跳坐标，但没先判断是否该改 lane
- 页面/窗口 context 已变，但还沿用旧判断
- 文件已生成，但无法证明就是本次最新交付件

---

## Long-term capability direction

值得长期投入的一条方向：

**把桌面任务的前门判断固定为 `end state -> lane choice -> proof plan -> action`，而不是 `看到界面 -> 直接操作`。**

这样更能提升复杂真实任务完成率，尤其是：

- 桌面与浏览器混合链路
- Office 保存/导出后继续上传
- Explorer/本地文件清洗后继续交付
- 弱 UIA / 图标密集界面的能力补强判断

---

## Rule to keep

以后遇到本地电脑/桌面/Explorer/Office/文件对话框类复杂任务，默认先选最窄 lane，再执行动作；不要把“能点”当成“该点”。
