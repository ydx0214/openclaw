# OmniParser + OmniTool Windows Trial Pack

## Why this pack exists

目标不是研究一个“看起来很强”的新模型，而是判断它是否值得作为 OpenClaw 的桌面自动化增强方向，优先服务这类复杂真实任务：

- 本地桌面应用 UIA / 控件树不完整，现有桌面自动化难以稳定定位控件
- 需要靠截图理解图标、工具栏、画布、复杂后台界面
- 浏览器/桌面混合流程里，语义理解强但坐标 grounding 弱，导致“知道要点什么，但点不准”
- 后续可能要把“截图解析 -> 可交互元素列表 -> 动作规划/执行”接入现有 Windows/浏览器工作流

## Capability Evidence Pack

### Task Family
- Recurring task family: Windows 桌面自动化 / 图形化软件操作 / 复杂 GUI screenshot grounding
- User-visible bottleneck: 现有桌面链路更偏 UIA/控件树/窗口语义；一旦遇到自绘界面、图标型按钮、弱可访问性应用，定位与证明都会变脆
- Why this capability is being considered: OmniParser 试图把 screenshot 转成结构化、可 grounding 的交互元素，理论上能补强这类“看得见但控件树抓不到”的界面

### Capability Claims
1. Claim: OmniParser 将 UI 截图解析成结构化元素，提升视觉模型对界面的动作 grounding 能力
   - Trust label: doc-claim
   - Source title: OmniParser README
   - URL or path: https://raw.githubusercontent.com/microsoft/OmniParser/master/README.md
   - Anchor / section: opening summary
   - Quote / snippet: "parsing user interface screenshots into structured and easy-to-understand elements" / "enhances the ability of GPT-4V to generate actions that can be accurately grounded"
   - Why it matters: 直接对应桌面/浏览器复杂界面里“会看不会准点”的高频问题

2. Claim: OmniParser V2 提升了小型可交互元素检测准确率，并把延迟相对前代降低 60%
   - Trust label: doc-claim
   - Source title: Microsoft Research blog
   - URL or path: https://www.microsoft.com/en-us/research/articles/omniparser-v2-turning-any-llm-into-a-computer-use-agent/
   - Anchor / section: main article body
   - Quote / snippet: "higher accuracy in detecting smaller interactable elements and faster inference" / "reduces the latency by 60%"
   - Why it matters: 小图标/工具栏按钮正是桌面自动化最容易失手的区域

3. Claim: OmniParser + GPT-4o 在 ScreenSpot Pro grounding benchmark 上达到 39.6，显著高于 GPT-4o 原始 0.8
   - Trust label: doc-claim
   - Source title: Microsoft Research blog
   - URL or path: https://www.microsoft.com/en-us/research/articles/omniparser-v2-turning-any-llm-into-a-computer-use-agent/
   - Anchor / section: benchmark paragraph
   - Quote / snippet: "39.6 ... substantially improvement on GPT-4o’s original score of 0.8"
   - Why it matters: 说明它不是普通 caption，而是面向 screen grounding 的能力增强

4. Claim: Microsoft 提供 OmniTool，可在 dockerized Windows system 中把 OmniParser 与多种视觉模型串起来做 computer-use experimentation
   - Trust label: doc-claim
   - Source title: OmniParser README / Microsoft Research blog
   - URL or path: https://raw.githubusercontent.com/microsoft/OmniParser/master/README.md ; https://www.microsoft.com/en-us/research/articles/omniparser-v2-turning-any-llm-into-a-computer-use-agent/
   - Anchor / section: News / OmniTool paragraph
   - Quote / snippet: "Control a Windows 11 VM with OmniParser + your vision model of choice" / "a dockerized Windows system"
   - Why it matters: 如果后续要接成 OpenClaw 新能力，OmniTool 可能是比“只拉模型”更接近任务化的入口

### Prerequisites / Constraints
- Install/runtime:
  - Python 3.12 + pip install -r requirements.txt
  - 需要下载 HuggingFace V2 权重到 `weights/`
  - 若走 OmniTool，还涉及 Docker / Windows VM / 额外环境准备
- Login/account:
  - HuggingFace 模型下载链路可能需要 CLI / 网络可达性
- Platform/OS/browser:
  - 方向上适合 Windows GUI，但官方现成实验链更偏独立环境/容器，而不是直接并入现有 OpenClaw Windows 桌面 skill
- Cost/rate limit:
  - 本地推理与截图解析会占用显著 CPU/GPU/显存；若再串视觉大模型，整体成本进一步上升
- Safety or approval notes:
  - 官方明确建议 human-in-the-loop，并提供 sandbox/threat-model guidance；不适合直接默认接入高权限无监督动作
- Maintenance concerns:
  - 依赖重、模型权重大、Windows 本机直连路径未证明；从“能跑 demo”到“稳定服务 OpenClaw 复杂任务”之间还有明显工程距离
- License:
  - README 提到 icon_detect 模型权重包含 AGPL 继承许可，接入前要单独评估 license 边界

### Proof Status
- Already proved locally:
  - 尚无。本机还未完成 clone / install / weight download / sample screenshot run
- Still needs smoke test:
  1. 最小只读 proof：在 Windows 本机对 1 张真实桌面截图跑一次解析，确认能输出可交互元素框/描述
  2. 任务型 proof：对 1 个现有弱 UIA 场景（如自绘工具栏/图标按钮界面）验证其是否比现有桌面 lane 更容易定位目标
  3. 接力 proof：验证输出是否能被 OpenClaw 后续 workflow 消费，例如 `screenshot -> element candidates -> target pick -> next action proposal`
- False-ready traps:
  - 只看到 benchmark / README 就把它当成可直接接入 OpenClaw
  - 只跑通 gradio demo 就误判成适合真实桌面任务
  - 只证明“能识别元素”，却没证明“对现有失败场景比 UIA lane 更有帮助”
  - 忽略模型下载、推理速度、显存与 license 约束

## Capability Intake Pack

- 目标任务：补强 OpenClaw 在弱可访问性 Windows GUI / 图标密集界面上的 screenshot grounding 能力
- 最佳能力路径：先做 capability proof，再决定是做本地实验脚本、独立 skill，还是仅保留 trial lane
- 当前状态：待接入 / 待验证
- 最小验证：`真实 Windows screenshot -> OmniParser V2 parse -> 输出可交互元素 -> 对比现有桌面 lane 的定位收益`
- 下一执行链路：`capability-proof-pack -> 决定 invest now / trial only / defer`
- 缺口 / 阻塞：本机尚未证明环境可装、模型可下、推理可接受、输出可被现有桌面工作流消费

## Investment Gate

### Verdict
- trial only

### Why not invest now
- 价值方向对复杂桌面任务很强，但当前证据仍停留在官方声明 + benchmark + demo 层
- 对 OpenClaw 来说，真正关键的是“能否稳定补现有 Windows 桌面 lane 的盲区”，这还没有本机 proof
- 接入成本较高：模型权重、环境、潜在 Docker/VM、性能与 license 都需要额外评估

### What would upgrade this to invest now
1. 本机完成 1 次真实 screenshot parse proof
2. 在 1 个弱 UIA / 图标密集真实任务上证明优于现有 desktop lane
3. 能明确产出可复用 IO 契约，例如 `image -> elements(json) -> candidate target -> next action hint`
4. 能把它放进安全边界明确的试验链，而不是直接放大动作权限

## Recommended Next Route
- Next playbook/workflow: `playbooks/capability-proof-pack.md`
- Why this route now: 当前主要风险不是“有没有这条能力”，而是“会不会停在文档可用、任务不可用”的假就绪
- What can be trusted already:
  - 这条能力确实面向 GUI screenshot grounding
  - V2 官方声称在小图标检测、延迟和 benchmark 上都有提升
  - 有 OmniTool 作为更任务化的实验入口
- What must still be verified:
  - 本机安装可行性
  - Windows 真实截图样例效果
  - 对 OpenClaw 现有复杂任务的实际增益
  - 性能 / 维护 / license 是否可接受

## Reusable Smoke Test Plan
1. 选 2 张真实失败样例截图
   - 1 张来自弱 UIA Windows 桌面软件
   - 1 张来自图标密集浏览器/后台页面
2. 跑最小解析
   - 输入：PNG/JPG screenshot
   - 输出：bounding boxes + labels/captions + interactable hints
3. 做任务导向验收
   - 是否能锁定目标图标/按钮
   - 是否比现有 lane 更少歧义
   - 是否能形成可被下一步动作消费的结构化结果
4. 做投资判断
   - invest now / trial only / defer

## Rule to Keep
当新能力声称能补“桌面 screenshot grounding / 电脑操作”这类高价值复杂任务时，不要因为 benchmark 和 demo 很强就直接接入主链路。

先用真实失败样例做 `task-shaped proof`，证明它确实补到了现有桌面 lane 的盲区，再决定是否升级为长期能力。