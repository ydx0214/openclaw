# Batch Rename / Move Apply Guard Template

Use this template when a local file task has **wide blast radius**:

- 批量重命名很多文件
- 批量移动/整理下载目录
- 按规则清洗文件名后准备上传
- 素材目录统一加前后缀、编号、替换关键词
- 任何“命令一跑就会同时影响很多文件”的本地文件任务

## Why this matters

这类任务的常见失败，不是命令不会写，而是：

- 起手没先锁定作用范围
- 预期命名规则只在脑子里，没有落成可核对的 preview
- apply 后只看“脚本成功”而没核对实际 touched files
- 混进了不该处理的文件家族
- 改完名后没有明确一个可继续上传/审阅/归档的结果

所以默认不应是“直接改”，而应是：

`preview -> human/agent sanity check -> apply -> verify -> handoff`

## Guard Fields

在执行高风险批量改名/移动前，至少锁定这 7 项：

1. **Scope**
   - 本次会影响哪些文件
   - 一句话写清：哪一个目录、哪一类文件、是否递归、是否排除隐藏/系统文件

2. **Selection rule**
   - 如何选中文件
   - 例如：`*.png`、文件名包含 `draft`、仅第一层、仅最近导入目录

3. **Transform rule**
   - 会把文件名/路径改成什么
   - 例如：加前缀、替换空格、连号、移动到按扩展名分类的子目录

4. **Preview sample**
   - 至少列出 3–10 个 before -> after 样例
   - 如果样例不对，禁止 apply

5. **Collision / overwrite risk**
   - 是否可能重名、覆盖、移动到已有文件
   - 如有风险，必须先显式处理策略：skip / fail / suffix / ask

6. **Verification target**
   - apply 完后要核对什么
   - 例如：touch count、目标目录、最终命名模式、是否残留旧命名、是否误触其他文件族

7. **Next-step artifact**
   - 这次整理完之后，下一步真正依赖的是什么
   - 例如：一个上传目录、一个干净素材包、一个可审阅文件夹

## Default Flow

### Step 1 — Preview

先做最小可核对预览，而不是先执行。

至少输出：
- target root
- selection rule
- estimated touched count
- before -> after sample
- collision / overwrite warning

如果以下任一项不清楚，停在 preview：
- 作用范围不清
- 命名规则存在歧义
- 目标目录可能混入不该动的文件
- apply 后没有明确交付目标

### Step 2 — Apply

只有当 preview 已经足够清晰时才 apply。

Apply 时默认要求：
- 只处理 preview 锁定的范围
- 记录实际 touched-file count
- 如果出现 collision / overwrite，按预先约定策略处理，不临场猜

### Step 3 — Verify

完成后至少验证：
- 实际 touched-file count 与 preview 预期大体一致
- 抽样核对 before -> after 结果正确
- 未误触其他文件家族
- 若涉及移动/整理，目标目录结构与预期一致
- 若后续需要上传/审阅/归档，已明确一个 exact artifact 或目录

## False-completion traps

以下都不能单独算完成：

- “命令跑完了”
- “终端没报错”
- “看起来文件名差不多变了”
- “目标目录里有文件”
- “只抽到一个样例没问题”

真正完成 = 作用范围正确 + 改动规则正确 + 没误触 + 下一步可直接依赖。

## Short Template

- Task:
- Scope:
- Selection rule:
- Transform rule:
- Preview sample:
- Collision / overwrite risk:
- Verification target:
- Next-step artifact:
- Current phase: preview / apply / verify / blocked

## Operating rule

对于高风险本地批量改名/移动任务，默认先产出 preview，再决定是否 apply；
不要把“脚本执行成功”当作批处理任务的完成证明。
