# Multimedia Platform Spec Card Template

适用场景：
- 小红书封面图 / 配图 / 图文首图
- 短视频平台口播 / 混剪 / 图生视频
- 同一主题需要跨平台导出（如小红书 + 抖音 + B站）
- 用户只说“做个封面 / 做个视频”，但真正会卡在平台规格、字幕安全区、交付文件和版本命名

## 核心目的

多媒体复杂任务常见返工，不是 prompt 不够长，而是 **平台规格没有先锁定**：
- 比例错了，后面得重裁
- 时长不对，后面得重做镜头节奏
- 字幕/标题安全区没预留，后面得重构图
- 不知道最终要交图片、视频、封面还是工程文件，最后很难 handoff

这张卡的目标是：在生成前先把“平台约束 -> 画面/镜头约束 -> 交付约束”压成一页，后面所有 prompt、分镜、版本比较都回到这张卡验收。

## 使用规则

1. 先确认这次内容最终发到哪里，而不是先写 prompt
2. 如果涉及封面图、短视频、图生视频或跨平台复用，先补这张卡
3. 如果 2 个以上平台并存，主平台只能有 1 个；其余写成兼容导出策略
4. Prompt、分镜、版本对比、最终交付都要回看这张卡，而不是只看审美

## Platform Spec Card Template

```md
# Multimedia Platform Spec Card

## 1) Primary Publish Target
- Main platform:
- Content type: cover / feed image / short video / image-to-video / mixed
- Usage scene:
- Primary audience:
- Main success goal:

## 2) Output Spec
- Required ratio:
- Resolution / canvas:
- Duration / max duration:
- Variant count:
- Language / subtitle language:
- Safe area / text area note:

## 3) Content Constraints
- Must show:
- Must avoid:
- Brand / identity protected elements:
- Compliance / sensitivity notes:
- CTA / title / caption dependency:

## 4) Production Constraints
- Source assets available:
- Assets still missing:
- Can crop from master?: yes / no / limited
- Cross-platform export needed?: yes / no
- Preferred master format:

## 5) Acceptance
- Pass if:
- Fails if:
- Review focus:

## 6) Handoff
- Delivery artifact(s):
- Editable source of truth:
- Version naming rule:
- Next step after generation:
```

## 常见平台锁定点

### A. 小红书封面 / 配图
- 优先锁：竖版比例、标题留白区、主体是否居中、文字是否后加
- 常见风险：图好看但标题一盖就乱；封面适合看，不适合发

### B. 短视频平台
- 优先锁：时长上限、字幕区、前 3 秒钩子镜头、封面是否要同批产出
- 常见风险：镜头节奏适合长视频，不适合短视频首屏

### C. 图生视频
- 优先锁：源图可否裁切、哪些元素必须稳定、允许的运动幅度
- 常见风险：源图构图适合静态图，但不适合做镜头推进或环绕

### D. 跨平台复用
- 优先锁：主平台优先级、母版比例、哪些平台允许二次裁切
- 常见风险：试图一次生成一个“通吃版本”，最后各平台都不够好

## 快速判定规则

- 如果平台、比例、时长、交付件这 4 项里缺 2 项以上，不进入 prompt 细化
- 如果用户想“一套内容多平台复用”，先指定一个主平台和一个母版
- 如果内容要叠字、封面标题或字幕，默认补一条安全区说明
- 如果最终还要上传/发给别人，默认写明交付件和可编辑源文件

## 一句话规则

对封面图 / 短视频 / 图生视频这类复杂多媒体任务，先锁 `Platform Spec Card`，再写 `Generation Brief` 和 prompt；优先减少错比例、错时长、错安全区和末端交付不清造成的返工。
