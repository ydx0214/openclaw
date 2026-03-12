# Document Extraction Lane Selector

## 目标
在复杂文档任务真正开做前，先选对提取路径，避免把所有 PDF / 扫描件 / 多栏报告都直接塞进同一条提取链路，导致后续 Markdown、表格、Office、简历或证据包阶段反复返工。

这张卡不解决“最终怎么编辑/交付”，只解决一个高价值前置问题：
**这份文档现在最应该走哪条提取 lane，才能最快变成下游可消费输入。**

## 适用场景
当文档任务满足以下任一情况时，先用这张卡：
1. 输入是 PDF、扫描件、图片型文档、多栏报告、复杂表格或混合版式
2. 用户要的不是只看几段文字，而是后续还要继续做事
3. 提取结果还要进入 `document-task-routing`、`research-evidence-pack`、`office-output-proof`、简历/表格/Markdown 链路
4. 现有链路能读，但经常出现顺序乱、表格散、OCR 差、人工清洗重

## 先锁 4 个任务事实
- 文档类型：普通可复制 PDF / 扫描件 / 多栏 / 表格重 / 混合版式
- 主要目标：快速阅读 / 结构化提取 / 表格复用 / OCR / 下游写作或填表
- 下游消费者：Markdown / Excel/CSV / Office / Resume / Evidence Pack / 表单数据
- 可接受人工清洗量：低 / 中 / 高

## 4 条默认提取路径

### Lane A — 轻量阅读提取
适用：
- 文档结构相对正常
- 目标是快速理解内容、摘录重点、转 Markdown 初稿
- 下游主要是阅读、总结、普通文档整理

优先路径：
- `office-local inspect/extract`
- 或 `pdf` 工具直接分析

通过信号：
- 标题、段落、列表顺序基本自然
- 不需要重建大量结构
- 人工清洗量可接受

不要继续硬用该 lane 的信号：
- 多栏串行
- 表格碎裂
- OCR 明显差
- 提取结果无法直接进入下游任务

### Lane B — 表格/结构优先提取
适用：
- 文档里有关键表格、字段表、参数矩阵、对比表
- 下游要继续做 Excel/CSV/填表/结构化整理

优先路径：
- 先做一次现有链路提取
- 若表格不可消费，转入更强结构化候选能力试验（如 Docling Trial Pack）

通过信号：
- 表头稳定
- 行列关系仍可理解
- 字段可继续整理成表格或 JSON

不要继续硬用该 lane 的信号：
- 单元格粘连严重
- 行列关系丢失
- 后续仍需整张表重打

### Lane C — OCR / 扫描件优先提取
适用：
- 图片型 PDF
- 扫描件
- 截图拼接文档
- 可复制文本极少或没有

优先路径：
- 先确认是否值得进入更强 OCR/结构化试验链路
- 若只是一次性低价值阅读，可走轻量读取
- 若下游仍需继续做事，优先按 `document-intelligence-trial-pack-docling.md` 做真实样例验证

通过信号：
- 中文/英文识别达到可继续编辑或归纳的程度
- 段落切分可用
- 相比现有链路明显减少人工清洗

不要继续硬用该 lane 的信号：
- OCR 错字太多
- 段落边界混乱
- 仍需人工重打一遍

### Lane D — 先不升级提取能力，直接走现有主链路
适用：
- 文档难度不高
- 任务是一次性
- 下游可接受一定人工清洗
- 新能力投入成本高于本次任务收益

优先路径：
- 继续 `document-task-routing`
- 必要时人工结构化少量关键内容

通过信号：
- 当前工具已经够完成真实任务
- 继续加能力不会明显提速或提质

## 快速判断规则
- 如果目标主要是“看懂内容”，先选 **Lane A**。
- 如果真正价值在“保住表格/字段结构”，先看 **Lane B**。
- 如果文档本身是扫描件或图片型，先看 **Lane C**。
- 如果任务一次性、结构不复杂、现有链路已够用，走 **Lane D**。

## 何时触发新能力试验
仅在以下条件满足 2 条及以上时，才值得把文档送进新能力 trial：
1. 当前提取结果无法进入下游工作流
2. 表格或版式信息是核心价值，不是附属信息
3. 同类复杂文档开始重复出现
4. 人工清洗明显高于直接手动整理的收益阈值
5. 该能力有清晰的 Windows 本机可维护性验证路径

## 输出模板
```md
# Document Extraction Lane Selector

- Source file:
- Document type:
- Primary goal:
- Downstream consumer:
- Acceptable cleanup level:

## Chosen Lane
- Lane A / B / C / D
- Why this lane is currently narrowest viable:

## Success Signal
- What would count as “extract result is usable”:

## Failure Signal
- What would force lane switch:

## Next Move
- Continue into which workflow/playbook/tool:
```

## 复用规则
以后遇到复杂 PDF / 扫描件 / 表格文档，不要从“先抽文本再说”起手。
先判断这份文档的真实价值到底在：阅读、结构、OCR，还是仅仅一次性可用。

选对提取 lane，比多跑一次解析命令更能减少下游返工。
