# Docling Windows Smoke Test Pack

## 能力目标
验证 `Docling` 是否值得作为 Windows 本机上的复杂文档增强能力，用于提升这些高价值真实任务：
- 复杂 PDF / 扫描件 / 多栏报告 / 表格文档提取
- 文档转 Markdown / JSON 后继续进入 Office、简历、研究证据、表单字段整理
- 需要更稳定阅读顺序、表格结构和 OCR 结果的文档工作流

## 为什么这次值得学
现有文档链路在一般 PDF / Office 文件上已经够用，但复杂文档仍有高频断点：
- 多栏阅读顺序错乱
- 表格抽出来但下游不可消费
- 扫描件 OCR 能看但不能直接继续做事
- 文档提取结果进入 `document-task-routing` / `research-evidence-pack` / `office-output-proof` 前还要大洗一遍

Docling 官方资料显示它正好覆盖这些痛点：
- 多格式解析：PDF、DOCX、PPTX、XLSX、HTML、图片、LaTeX、音视频等
- 强调 advanced PDF understanding：page layout、reading order、table structure、code、formulas
- 支持本地执行、Markdown / HTML / JSON / text / doctags 导出
- 支持 OCR、表格提取、MCP server、CLI
- 官方明确支持 Windows，且要求 Python 3.10+

## 官方依据
### Source 1 — 官方文档首页
- URL: `https://docling-project.github.io/docling/`
- 关键点：
  - 支持 PDF / DOCX / PPTX / XLSX / HTML / 图片 / LaTeX / 音视频
  - 强调 advanced PDF understanding（版面、阅读顺序、表格结构等）
  - 提供本地执行、OCR、MCP server、CLI、多种导出格式

### Source 2 — GitHub README
- URL: `https://github.com/docling-project/docling`
- 关键点：
  - 安装方式：`pip install docling`
  - 运行环境：Windows / macOS / Linux，x86_64 和 arm64
  - Python 要求：`3.10+`
  - README 示例：`docling https://arxiv.org/pdf/2206.01062`

### Source 3 — CLI Reference
- URL: `https://docling-project.github.io/docling/reference/cli/`
- 关键点：
  - 基本命令：`docling [OPTIONS] source`
  - 常用输出：`--to md|json|html|text|doctags|vtt`
  - OCR 开关：`--ocr` / `--force-ocr` / `--ocr-engine` / `--ocr-lang`
  - 表格开关：`--tables`、`--table-mode fast|accurate`
  - 执行设备：`--device auto|cpu|cuda|mps|xpu`
  - 输出目录：`--output`
  - 调试信息：`-v` / `-vv`

## 最小 Windows Smoke Test 路线
### Preconditions
1. 本机可用 Python 3.10+
2. 允许安装 Python 包
3. 准备 3 个真实样例：
   - Sample A：普通可复制 PDF
   - Sample B：多栏或带复杂表格 PDF
   - Sample C：扫描件 / 图片型 PDF

### Install
```powershell
python -m pip install --upgrade pip
python -m pip install docling
```

### Baseline checks
```powershell
docling --version
docling --help
```

### Test 1 — 普通 PDF 到 Markdown
```powershell
docling --to md --output .\out-normal "C:\path\sample-a.pdf"
```
目标：确认基础 Markdown、段落顺序、标题层级。

### Test 2 — 复杂表格 / 多栏 PDF
```powershell
docling --to md --tables --table-mode accurate --output .\out-table "C:\path\sample-b.pdf"
```
目标：确认多栏不串栏、表格结构仍可继续消费。

### Test 3 — 扫描件 / OCR 场景
```powershell
docling --to md --force-ocr --ocr --output .\out-ocr "C:\path\sample-c.pdf"
```
如需指定语言，再补：
```powershell
docling --to md --force-ocr --ocr --ocr-lang "chi_sim,eng" --output .\out-ocr "C:\path\sample-c.pdf"
```
目标：确认 OCR 结果是否达到“可继续做事”。

### Optional structured output
当下游更适合结构化消费时，再补一轮：
```powershell
docling --to json --output .\out-json "C:\path\sample-b.pdf"
```

## 验收卡
每个样例都按这 6 项打结论：
1. 输出是否稳定生成
2. 阅读顺序是否优于现有链路
3. 表格是否可被下游继续消费
4. OCR 是否达到可继续做事
5. 人工清洗成本是否明显下降
6. Windows 安装 / 运行 / 复现是否足够稳

可用打分：`明显提升 / 有提升但不稳 / 无明显提升 / 更差`

## Invest Gate
### Invest now
- 至少 2/3 样例明显提升
- 至少 1 个复杂样例（表格或扫描件）明显优于现有链路
- 输出能直接进入下游，不需要大洗一遍
- Windows 维护成本可接受

### Trial only
- 有提升，但只在部分样例成立
- OCR / 表格 / 中文支持还需要更多样例确认
- 适合先作为按需增强链路

### Defer
- 相比现有 `office-local` / `pdf` / 手工结构化整理没有明显收益
- 安装依赖、速度或稳定性过脆
- 结果仍需大量人工重构

## 成功后的下游接法
如果结果为 `Invest now`：
1. 补一份 `Capability Proof Pack`
2. 决定进入哪条长期路径：
   - 新增轻量 `document-intelligence` skill
   - 作为 `document-task-routing` 的增强 lane
   - 作为 `office-local` 的复杂文档增强分支
3. 明确默认触发条件：复杂 PDF / 多栏 / 表格 / 扫描件优先触发

## 失败时回退
如果 smoke test 不成立，回退到现有稳定链路：
- `playbooks/document-extraction-lane-selector.md`
- `playbooks/document-extraction-lane-validation.md`
- `playbooks/document-downstream-consumer-scorecard.md`
- `office-local` / `pdf` / 手工结构化整理

## 这次固定下来的规则
以后评估新文档解析能力，默认不要停在“README 很强 / 安装成功 / CLI 能跑”。
至少要补一轮 **真实样例 smoke test**，并同时判断：
- 结构化输出质量
- 下游可消费性
- Windows 可维护性

只有这三项都成立，才值得进入长期能力建设。