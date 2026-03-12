# Capability Investment Gate — 本地文档智能解析（Docling）

## Target Task Family
- Complex task family improved:
  - 本地 PDF / DOCX / PPTX / XLSX / HTML / 图片文档的结构化读取、转 Markdown、表格抽取、版面理解
  - 下游会进入：简历/Office 处理、PDF 提取、表格整理、研究证据包、浏览器上传前文档准备
- User-visible bottleneck removed:
  - 现在复杂文档任务虽然已有 `office-local`、`pdf` 和基础提取链路，但遇到表格、阅读顺序、扫描 PDF、混合版式时，常会出现“能读到一点，但还不够稳定拿来继续做事”的断层

## Candidate Lane
- Lane: **trial only -> local tool integration candidate**
- Narrowest viable lane:
  - 先不直接做长期 MCP/大封装
  - 先以本地 CLI / Python 工具试点 Docling，在真实样例上验证，再决定是否升级为正式 skill 或接入到 `office-local` / `document-task-routing`
- Why this is the narrowest viable one:
  - 用户价值主要在“复杂文档能不能更稳定变成下游可消费输入”，不是先追求一个很重的长期集成
  - Docling 已具备多格式解析、表格导出、OCR、Markdown/JSON 输出、MCP server 等能力；先做最小本地 proof 成本更低

## Current Evidence
- Docling 官方文档显示：
  - 支持 PDF、DOCX、PPTX、XLSX、HTML、图片等多格式
  - 强调 advanced PDF understanding：page layout、reading order、table structure、code、formulas
  - 支持 OCR、本地执行、Markdown/HTML/JSON 导出、MCP server
- Marker 项目可作为对照：
  - 也支持 PDF / 图片 / Office / HTML / EPUB 到 Markdown/JSON/HTML
  - 强项是高质量 Markdown 转换、可选 LLM 增强、表格/公式/表单处理
  - 但其商业许可与代码许可更复杂，长期纳入主工作流的合规/维护判断要更谨慎

## Cost Side
- Setup cost:
  - 中等；需要本机 Python 依赖、模型/推理依赖验证，可能还要 OCR 相关组件
- Ongoing maintenance cost:
  - 中等；后续要维护安装、版本、样例回归和 Windows 兼容性
- External dependency or login risk:
  - 低；Docling 可本地执行，适合敏感文档和离线/低联网场景
- Safety / approval surface:
  - 低；主要是本地只读文档处理，外部副作用小
- Brittleness risk:
  - 中等；扫描件、超大文件、复杂表格、中文 OCR、Windows 环境可能仍有波动

## Value Side
- Expected reuse frequency:
  - 高；文档/简历/Office/PDF/表格类任务是高频主线
- Time saved on each successful task:
  - 中高；可减少手工二次整理、重复抽取、版式误读和“先导出再重洗”的返工
- Quality / reliability gain:
  - 高；若版面、表格和阅读顺序更稳定，下游 `document-task-routing -> research-evidence-pack -> office-output-proof` 这类链路会更顺
- Unlocks tasks currently hard or impossible?:
  - 部分解锁；尤其是扫描 PDF、复杂表格、混排文档、研究材料转结构化 Markdown/JSON 的场景
- Downstream workflow fit:
  - 很强；可直接服务 `document-task-routing.md`、`resume-evidence-pack.md`、`research-evidence-pack.md`、`office-output-proof.md`

## Decision Gate
- Verdict: **Trial only**
- Why:
  - 这是高价值方向，但还不该直接重投入做长期集成
  - 真实收益是否成立，取决于 Windows 本机样例上的最小 proof，而不是官网功能表
  - 现有链路已能覆盖一般文档任务，Docling 的价值主要在“更难的复杂文档是否显著提升成功率”

## Minimum Proof Before Investing More
- Smallest realistic task to prove:
  1. 选 2-3 个真实样例：
     - 一个普通 PDF
     - 一个含表格或多栏布局 PDF
     - 一个扫描件或图片型文档
  2. 用 Docling 跑出 Markdown/JSON 或表格导出
  3. 检查这些输出能否直接喂给后续文档/研究/表格工作流
- Proof signals:
  - 输出文件真实生成且可读
  - 阅读顺序明显优于现有轻量提取链路
  - 表格结构在至少一个真实样例上可直接复用
  - 至少一个复杂样例减少明显手工清洗
- Stop condition if it fails:
  - Windows 安装/依赖过脆
  - 样例质量并未明显优于现有 `office-local` + `pdf` + 手工路由
  - 对中文/扫描件/表格的提升不稳定
- Downstream workflow if it succeeds:
  - 先产出正式 `Capability Proof Pack`
  - 再决定进入：
    - 新增轻量 `document-intelligence` skill
    - 或把其作为 `office-local` / `document-task-routing` 的增强分支

## If Deferred
- One-off fallback lane:
  - 继续用现有 `office-local`、`pdf`、`document-task-routing.md`、必要时 `browser-research-briefing.md` + 人工结构化整理
- Trigger that would justify revisiting later:
  - 连续出现复杂 PDF/表格/扫描件任务，且现有链路频繁需要大量手工清洗
  - 用户开始高频要求“从复杂 PDF / 多表格报告 / 扫描件里稳定提取可继续处理的数据/证据”

## Reusable Rule
- 对新文档能力，不以“支持很多格式”作为投资理由
- 只有当它能在真实复杂样例上，显著提升 `结构化输出质量 + 下游可消费性 + Windows 可维护性`，才值得升级为长期能力
