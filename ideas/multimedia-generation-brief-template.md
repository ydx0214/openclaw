# Multimedia Generation Brief Template

## Why this exists

生图 / 视频生成类复杂任务，常见失败不是模型不会生成，而是任务一开始没有把“目标平台、素材约束、镜头语言、交付格式、可接受修改方向”收口清楚，导致后续只能反复重写提示词、重做素材、重剪版本。

这份模板的目标是：把一句模糊需求，先整理成可执行的 `Generation Brief`，再进入具体生成或外包执行。

适用任务：

- 小红书封面图 / 配图生成
- 短视频脚本转分镜 / 镜头提示词
- 图生视频 / 文生视频前的镜头规划
- 社媒视觉风格统一
- 多轮提示词迭代前的需求收口

不适用：

- 只需一句简单 prompt 的一次性随手生成
- 纯技术性模型参数排障

---

## Default workflow

1. **Clarify outcome**：先确认要交付什么，不先写 prompt
2. **Lock constraints**：锁定平台、比例、时长、语言、素材来源、禁区
3. **Choose generation path**：静态图 / 分镜图 / 视频脚本 / 镜头提示词 / 混合包
4. **Draft Generation Brief**：输出统一结构的任务简报
5. **Only then generate prompts**：按 Brief 生成首版提示词或执行方案
6. **Verify against brief**：验收时回到 Brief，而不是只看“像不像”

---

## Preflight checklist

在生成前，至少补齐以下字段：

- 目标任务类型：`image` / `video` / `image-to-video` / `mixed`
- 使用场景：例如小红书、B 站、商品展示、简历作品集、封面图
- 目标受众：给谁看
- 核心目标：想让对方看到后做什么
- 交付规格：比例、分辨率、时长、数量、语言
- 素材来源：纯生成 / 用户已有图片 / 本地视频 / 文案脚本
- 风格边界：允许什么，不允许什么
- 成功标准：什么叫这次结果能用

如果以上信息缺 3 项以上，不要直接进入长 prompt 生成，先补 Brief。

---

## Generation Brief schema

```md
# Generation Brief

## 1) Task
- Type:
- Deliverable:
- Usage scene:

## 2) Audience + Goal
- Audience:
- Desired reaction:
- Core message:

## 3) Input Assets
- Existing assets:
- Missing assets:
- Reusable references:

## 4) Constraints
- Platform:
- Aspect ratio / duration:
- Language:
- Must include:
- Must avoid:

## 5) Style Direction
- Visual style:
- Tone / mood:
- Camera / composition notes:
- Color / lighting notes:

## 6) Output Plan
- Variant count:
- Recommended path:
- First-pass prompt pack:
- Human confirmation points:

## 7) Acceptance
- Pass if:
- Needs revision if:
```
```

---

## Recommended routing

### Route A: Static image task
适合：封面图、插图、海报、缩略图

产出：
- 1 份 brief
- 3 条不同风格方向 prompt
- 1 条负向约束清单

### Route B: Video prompt task
适合：文生视频、短片概念验证、广告感镜头生成

产出：
- 1 份 brief
- 3~6 个镜头卡
- 每个镜头 1 条 prompt + 运动/时长说明

### Route C: Image-to-video task
适合：已有封面图/人物图，想做动态化

产出：
- 1 份 brief
- 源图验收点
- 动态方向说明：镜头推进 / 头发风动 / 光影变化 / 背景运动
- 稳定性限制：避免脸崩、文字漂移、结构变形

### Route D: Mixed campaign pack
适合：一条内容同时需要封面、配图、视频脚本、标题方向

产出：
- 1 份统一 brief
- 静态视觉方向
- 视频分镜方向
- 文案钩子方向
- 可复用素材清单

---

## Reusable prompt scaffolds

### 1) Image prompt scaffold

```text
Create a [image type] for [usage scene].
Audience: [target audience].
Goal: [desired reaction or conversion goal].
Style: [visual style].
Composition: [subject + framing].
Lighting/color: [notes].
Must include: [elements].
Avoid: [forbidden elements].
Output: [aspect ratio / resolution].
```

### 2) Video shot prompt scaffold

```text
Shot [n]: [shot purpose].
Subject: [who/what].
Action: [movement].
Camera: [angle / lens / motion].
Scene: [environment].
Mood: [tone].
Lighting: [notes].
Keep stable: [identity / structure / text].
Duration: [x seconds].
Avoid: [artifacts / undesired motion].
```

### 3) Negative / guardrail scaffold

```text
Avoid low-detail faces, broken hands, inconsistent identity, drifting text,
warped product edges, muddy lighting, cluttered background, awkward anatomy,
unmotivated camera shake, and style mismatch with the target platform.
```

---

## Acceptance checklist

生成结果至少要检查：

- 是否真的符合目标平台比例/时长
- 是否保住主体身份与结构稳定
- 是否和 brief 里的“核心目标”一致，而不是只好看
- 是否适合后续复用到封面/详情页/脚本/剪辑
- 是否明确知道下一轮该改“风格 / 构图 / 文案 / 镜头 / 素材”中的哪一类

---

## Operator rule

对生图 / 视频生成类复杂任务，默认先产出 **Generation Brief**，再产出 prompt；
优先优化“需求收口 + 验收标准 + 可复用素材结构”，而不是直接堆更长提示词。
