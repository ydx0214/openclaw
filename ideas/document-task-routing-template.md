# Document Task Routing Template

## Why

复杂文档任务最容易失败的点，不是不会改内容，而是：

- 一上来就直接编辑，没先 inspect 文件结构
- 把 PDF / Word / Markdown / Excel 当成同一种处理对象
- 简历、论文、表格、提取文本这几类任务走错工具链
- 生成了输出文件但没有做 render / existence / sheet-level verify

这个模板的目标，是把“文档任务先分流再执行再校验”固化成一个低摩擦默认流程，提升复杂真实任务完成率。

---

## Step 0: 先判定任务类型

收到文档任务后，先按目标而不是按文件名分流：

### A. 提取 / 阅读 / 整理内容
适用：
- 从 PDF / Word 提取文本
- 把文档转成 Markdown 便于整理
- 快速看文件里写了什么

默认路径：
1. `office-local inspect`
2. `office-local extract`
3. 如需进一步整理，再进入 Markdown / 表格 / 简历后续流程

### B. Word 格式修正 / 论文排版 / 引用处理
适用：
- `.docx` 格式不对
- 论文模板套版
- `[1]` 改上角标
- 交付前要确认实际页面效果

默认路径：
1. `office-local inspect`
2. `office-local docx-style-report`
3. 必要时 `paper-citation-studio superscript-docx`
4. `office-local docx-render-check`
5. 只有 render 过后才可声称“格式正确”

### C. 简历 / 求职材料准备
适用：
- 生成简历初稿
- 为 ATS / 官网投递准备材料
- 从候选人信息生成问卷、答案库、表单包

默认路径：
1. `job-hunt-studio profile-status`
2. 缺信息时先产出 `questionnaire.md`
3. 生成 `resume-draft.md`
4. 多岗位时生成 `resume-variants`
5. 官网表单前先生成 `career-form-pack.json`
6. 上传前优先准备 PDF 简历

### D. 表格 / CSV / Excel 转换与检查
适用：
- CSV 转 Excel
- Excel 导出 CSV
- 看某个工作簿有哪些 sheet
- 给后续浏览器填表准备结构化数据

默认路径：
1. `office-local inspect`
2. `csv-to-xlsx` / `xlsx-to-csv`
3. 写出后检查输出文件存在
4. 如给表单自动化使用，补一份字段说明或映射说明

### E. Markdown 转 Office 交付件
适用：
- 把 Markdown 变成 Word
- 先写内容再交付 docx

默认路径：
1. 确认 Markdown 已定稿
2. `office-local md-to-docx`
3. 如用户关心样式，再跑 `docx-style-report`
4. 如用户关心最终版式，再跑 `docx-render-check`

---

## Step 1: 文档任务统一 preflight

复杂文档任务默认先做这 5 个检查：

1. 输入文件是否存在
2. 文件类型是否和目标一致（PDF / DOCX / XLSX / CSV / MD）
3. 是否需要单独输出文件，避免覆盖唯一源文件
4. 是否需要模板、目标平台或格式标准
5. 是否需要最终验收（render / 上传 / 表单兼容 / 页面预览）

如果这些信息不完整，先补最小缺口，不要直接硬改。

---

## Step 2: 执行时的默认路由规则

### 规则 1
涉及 office 文件，优先 `office-local`，不要先手写临时解析。

### 规则 2
涉及 Word 格式正确性，不以文本提取结果代替版式验证。

### 规则 3
涉及简历 / 求职，不要直接从浏览器填表开始；先把候选人资料、问卷、答案库、表单包准备好。

### 规则 4
涉及引用编号，不自动改参考文献顺序；只在用户明确要求时改编号体系。

### 规则 5
涉及输出文件，必须验证文件确实生成，并返回路径。

---

## Step 3: 验收标准

### 最低验收
- 输出文件存在
- 路径明确
- 任务目标已完成（提取 / 转换 / 初稿 / 表单包 / 样式处理）

### Word / 论文类强制验收
- `docx-style-report`
- `docx-render-check`
- 必要时抽查页面图像

### 简历 / 求职类强制验收
- 候选人资料缺口已显式标记
- 生成的简历/问答/表单包路径明确
- 未经确认不点击最终 submit

### 表格类强制验收
- 输出文件存在
- sheet / 列结构与目标用途匹配
- 如果用于自动填表，字段命名尽量稳定

---

## Recommended reply shape

执行完成后，优先用这 4 点回报：

1. 你这次走的是哪条文档处理路径
2. 已产出哪些文件
3. 已做了哪些校验
4. 还缺什么才能继续或最终交付

---

## New operating rule

对复杂文档任务，优先优化“分流正确率 + 验收完整度”，而不是只优化单个转换命令本身。
