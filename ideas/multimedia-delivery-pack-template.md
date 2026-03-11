# Multimedia Delivery Pack Template

适用场景：
- 生图 / 视频 / 图生视频任务已经产出候选结果，需要收口成可交付内容
- 需要把最终采用版本、素材来源、平台规格、可复用 prompt 和下一步 handoff 固化下来
- 任务会进入发布前审阅、二次剪辑、封面替换、上传或归档

## 核心目的

不要把多媒体任务停在“生成过几个版本”。
要把它收口成一个可继续执行的交付包：

`accepted assets -> final selection -> reusable prompts/guardrails -> handoff-ready next step`

这样后续做发布、改封面、重生一版、给剪辑师/运营接手时，不需要重新猜哪个版本该用、哪些 prompt 稳、哪些素材受保护。

## 使用规则

1. 先有 `Generation Brief`
2. 如果做过多版本比较，优先先补 `Multimedia Iteration Log`
3. 当任务已经出现“候选成品 / 候选镜头 / 候选封面 / 候选动画”时，默认补一份 Delivery Pack
4. Delivery Pack 关注的是“最后交什么、为什么交、下一步谁能直接接”，不是重新写 prompt

## Multimedia Delivery Pack Template

```md
# Multimedia Delivery Pack

## 1) Task Snapshot
- Project / task name:
- Deliverable type: image / video / image-to-video / mixed
- Usage scene / platform:
- Linked Generation Brief:
- Linked Prompt Pack:
- Linked Iteration Log:

## 2) Final Selection
- Primary delivery asset:
- Backup candidate(s):
- Why this version was selected:
- Human review status:

## 3) Output Spec Check
- Ratio / resolution / duration:
- Platform fit:
- Text / title safe area:
- Format / codec / file type:
- Naming rule:

## 4) Accepted Assets
- Final file(s):
- Source asset(s) kept:
- Reference asset(s) worth keeping:
- Protected elements:
- Files/folders to archive:

## 5) Reusable Prompt Assets
- Best base prompt:
- Best negative / guardrail block:
- Winning style / motion notes:
- Failed directions not to reuse:

## 6) Handoff Notes
- Next action: publish / upload / edit / subtitle / review / archive
- What the next operator should not change:
- What can still be adjusted safely:
- Blocking questions / pending approvals:

## 7) Acceptance Proof
- Final artifact:
- Primary proof:
- Secondary proof:
- False-completion trap:
- Handoff-ready if:
```

## 最小收口规则

至少锁定这 5 件事：
- 一个主交付版本
- 一个备选版本（如果存在）
- 一组最稳的 prompt / guardrail
- 一条明确的下一步动作
- 一条 handoff-ready 判断

## 常见失败模式

### 只记得“某个版本不错”，但找不到最终采用文件
结果：下一步上传/发布时又重新挑版本。

### 只保留最终文件，不保留稳定 prompt 和 guardrail
结果：后续要重生同风格版本时从零开始。

### 知道要继续剪辑/发布，但没写 handoff 说明
结果：后续接手人不敢改，或改坏关键元素。

### 只看审美，不看平台规格
结果：看起来不错，但封面留字区、视频时长、平台比例不合规。

## 一句话规则

复杂多媒体任务不要停在“产出了几个图/视频版本”；默认继续收口成 `Multimedia Delivery Pack`，把最终采用结果、可复用 prompt 资产和下一步交接一起固定下来。
