# OmniParser + OmniTool Local Capability Proof Pack

## Capability
- Name: OmniParser + OmniTool
- Source type: external tool / external repo / local experiment lane
- Real task family it should unlock: 弱 UIA、图标密集、控件树抓不到的 Windows 桌面 GUI 截图 grounding 与目标定位

## Why this proof pack exists
现有 `omniparser-omnitool-windows-trial-pack.md` 已经把这条方向压成了 trial only 的投资判断；这份新包继续往前走一步，目标不是再重复 README，而是把“下一次本机真要验证时怎么做、看什么算成功、失败后怎么回退”锁成一份可直接执行的 proof 包。

## Best First Real Task
- The smallest high-value user task this capability should complete:
  - 对 1 张真实 Windows 桌面失败样例截图，输出一份可消费的目标候选列表：`元素框 + 标签/描述 + 候选目标选择建议`
- Why this task is representative:
  - 这正对应当前桌面自动化最脆的场景：知道大概在哪个工具栏/图标区，但 UIA/控件树不给语义、纯坐标又不稳
- Why this task is low enough risk:
  - 首轮 proof 只做截图解析和候选定位，不直接驱动点击，不产生外部副作用

## Real Task Family To Serve
优先服务这些复杂真实任务：
1. 本地桌面软件里自绘工具栏、图标按钮、画布周边操作
2. 需要在截图上先找出“可能可点区域”，再决定后续动作的电脑操作任务
3. 浏览器/桌面混合流里页面语义已知，但目标区域太密、太小或 accessibility 太弱的任务

## Local Preconditions Snapshot
### Official / doc-backed prerequisites
- OmniParser 需要 Python 3.12 环境与 `pip install -r requirements.txt`
- 需要下载 OmniParser V2 权重到 `weights/`，并保证 caption 目录名为 `icon_caption_florence`
- OmniTool 官方链路包含三部分：`omniparserserver`、`omnibox`（Docker 中的 Windows 11 VM）、`gradio`
- OmniTool README 明确要求：
  - Docker Desktop
  - 约 30GB 可用空间
  - Windows 11 Enterprise Evaluation ISO（约 6GB）
  - 官方建议 `omnibox + gradio` 跑在 CPU 机，`omniparserserver` 跑在 GPU 机

### This machine preflight
- GPU: `NVIDIA GeForce RTX 3060 Laptop GPU, 6144 MiB`
- C 盘可用空间：约 `88.99 GB`
- `docker --version`: 当前未检测到可用命令
- `conda --version`: 当前未检测到可用命令
- `huggingface-cli --help`: 当前未检测到可用命令

### Immediate blockers on this machine
1. 还没有可用的 Docker 命令，因此 OmniTool 的 `omnibox` 链路当前不可直接验证
2. 还没有可用的 `conda` 命令，官方推荐环境尚未具备
3. 还没有可用的 `huggingface-cli` 命令，权重下载链路尚未具备
4. 虽然磁盘与 GPU 粗看够用，但完整 proof 还缺安装与下载前提

## Safe Test Shape
### Preferred first proof: parser-only local proof
先不跑完整 OmniTool，不建 Windows VM，不做 agent loop。

只做：
`real screenshot -> OmniParser parse -> elements / labels / target candidates`

原因：
- 先证明它能不能补当前 OpenClaw 桌面 lane 的 screenshot grounding 盲区
- 避免一上来就把 Docker / VM / agent UI / API key / 执行器问题全部混在一起
- 先证明“解析有用”，再决定是否值得补 OmniTool 那条更重的任务化链路

### Second proof only if first proof passes
若 parser-only proof 通过，再做轻量 second proof：
- 选 1 个真实弱 UIA 场景
- 让 OmniParser 输出的元素候选参与一次 `target pick`
- 只验证“是否更容易选中目标”，仍不自动点击

## Smoke Test
### Exact input
- 2 张真实失败样例截图：
  1. Windows 本地软件的弱 UIA/图标密集界面
  2. 浏览器后台或复杂 WebApp 的图标/工具栏界面
- 推荐放在：`self-evolution-log/samples/omniparser/`

### Exact command / tool call / flow
1. Clone `microsoft/OmniParser`
2. 准备 Python 3.12 环境并安装 `requirements.txt`
3. 下载 V2 权重到 `weights/`
4. 用最小本地脚本或 notebook 跑单张截图解析
5. 导出一份结构化结果，至少包含：
   - 元素位置框
   - 标签 / 描述
   - 若有 interactable 提示则一并保留
6. 对照人工目标，判断是否能稳定缩小 target pick 范围

### Expected artifact or observable result
- 每张截图至少产出一份解析结果文件，例如：
  - `sample-name.elements.json`
  - `sample-name.annotated.png`
- 并能回答两个问题：
  1. 目标控件/图标是否进入候选列表
  2. 候选列表是否比现有桌面 lane 更少歧义

### Failure signals to watch
- 环境装不起来或依赖冲突（尤其是 Paddle / Windows 依赖）
- 权重下载卡住
- 能跑但输出只有大块区域、没有可用元素语义
- 能识别很多元素，但对真实目标没有缩小歧义
- 输出无法稳定转成 OpenClaw 后续可消费的结构

## Proof Signals
- Primary proof:
  - 对真实失败样例截图，输出包含目标控件/图标的结构化候选列表，并显著缩小 target pick 范围
- Secondary proof:
  - 产出 `annotated screenshot + elements json`，且人可复核目标是否真的在候选里
- False-ready trap:
  - 只跑通 demo / gradio / repo 安装，或者只看到 benchmark 很强，就误判这条能力已能服务 OpenClaw 桌面任务

## Reusable IO Contract
### Inputs the capability expects
- 单张 PNG/JPG screenshot
- 可选：目标描述（例如“右上角导出按钮”）

### Outputs / artifacts it should produce
- `elements.json`
  - 每个候选元素至少包含 `bbox + label/caption + optional interactable hint`
- `annotated.png`
  - 用于人工复核 grounding 质量
- `target-pick-notes.md`
  - 记录目标是否进入候选、歧义是否下降、是否优于当前 lane

### What downstream workflow can consume those outputs
- `playbooks/desktop-operations.md`
  - 当 UIA 路线失灵时，作为 screenshot grounding 辅助层
- `playbooks/completion-proof.md`
  - 用于区分“解析跑了”和“目标真的更容易被锁定”
- 后续若证明稳定，可再进入 capability-intake / investment / ACP 封装

## Recommended Minimal Acceptance Bar
只有同时满足以下 4 条，才算通过首轮 proof：
1. 至少 1 张真实失败样例成功输出结构化结果
2. 目标控件或其等价区域进入候选列表
3. 候选歧义比当前桌面 lane 明显更低
4. 输出能被压成可复用 `image -> elements -> target pick` IO 契约

## Fallback Lane If Proof Fails
如果首轮 proof 不通过：
- 不进入 OmniTool 重链路
- 维持 `trial only`
- 继续优先用现有 `desktop-operations + desktop-action-proof + completion-proof`
- 只在再次遇到真实弱 UIA 截图任务时，才考虑补第二次试验

## Worth Continuing?
- Later
- Reason:
  - 这条能力方向确实直指高价值桌面盲区，但当前本机还缺 Docker / conda / huggingface-cli 前提；最合理的下一步不是直接接入，而是先做一次 parser-only、无副作用、样例驱动的最小 proof

## Recommended Next Handoff
- Preferred next playbook / workflow:
  - `playbooks/capability-proof-pack.md`（已用本包具体化）
  - proof 通过后再进入 `playbooks/capability-investment-gate.md`
- If smoke test fails, fallback lane:
  - defer to existing desktop workflow

## Task-Shaped Proof Checklist
- [ ] 选 2 张真实失败样例截图
- [ ] 准备 Python 3.12 环境
- [ ] 安装依赖并完成权重下载
- [ ] 跑 parser-only proof
- [ ] 保留 `elements.json + annotated.png + target-pick-notes.md`
- [ ] 做 `pass / partial / fail` 判断
- [ ] 再决定是否值得补 OmniTool / VM / agent loop

## Rule to Keep
以后评估“桌面截图 grounding 增强”类能力，不要从完整 agent demo 起手；默认先做 `parser-only -> real screenshot -> candidate target pick` 的最小 proof，先证明它真能补当前桌面 lane 的盲区，再决定是否值得投入更重的 VM / Docker / agent orchestration 链路。
