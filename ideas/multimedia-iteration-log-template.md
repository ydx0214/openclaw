# Multimedia Iteration Log Template

适用场景：
- 生图任务做了 2 轮及以上变体
- 视频 prompt / 镜头稿进入多轮修改
- 图生视频需要比较不同运动方向、镜头、风格、稳定性
- 需要把“这次为什么更好/更差”沉淀成下次可复用规则

## 核心目的

不要只保存 prompt。
要同时保存：版本差异、采用原因、失败原因、可复用素材、下一轮只改哪一轴。

这样多媒体任务才能从“反复重写”变成“可迭代交付”。

## 使用规则

1. 先有 `Generation Brief`
2. 首轮产出后，如果出现多个可比较版本，就开始记录 iteration log
3. 每轮只明确 1 个主改动轴，避免把风格 / 构图 / 运动 / 文案一起改乱
4. 每轮都写结论：保留 / 淘汰 / 待混合
5. 复杂任务结束时，至少沉淀一份 `Reusable Assets` 清单

## Iteration Log Template

```md
# Multimedia Iteration Log

## 1) Task Context
- Project / task name:
- Deliverable type: image / video / image-to-video / mixed
- Platform / usage scene:
- Linked Generation Brief:
- Acceptance focus:

## 2) Reusable Assets
- Locked assets:
- Candidate assets:
- Missing assets:
- Protected elements:

## 3) Iteration Table
| Version | Based on | Main change axis | What changed | What improved | What got worse | Decision |
|---|---|---|---|---|---|---|
| V1 | brief | baseline | first pass | - | - | keep / drop / revise |
| V2 | V1 | composition | tighter framing | stronger subject focus | less background story | keep |
| V3 | V2 | lighting | warmer highlights | better mood | text area less clean | revise |

## 4) Per-Version Notes
### V1
- Prompt / shot summary:
- Asset inputs:
- Risk / failure:
- Best use case:

### V2
- Prompt / shot summary:
- Asset inputs:
- Risk / failure:
- Best use case:

## 5) Comparison Verdict
- Current best version:
- Why it wins:
- Why other versions lost:
- Can any elements be merged:

## 6) Next Iteration Plan
- Keep fixed:
- Next single change axis:
- Human confirmation needed:
- Stop condition:

## 7) Delivery Pack
- Final selected version(s):
- Final prompt pack / shot pack:
- Reusable negative / guardrail block:
- Files or folders to keep:
```

## 默认主改动轴

每轮优先只改一类：
- 风格（写实 / 插画 / 高级感 / 科技感）
- 构图（远景 / 中景 / 特写 / 留白 / 文字区）
- 运动（镜头推进 / 平移 / 环绕 / 节奏）
- 灯光颜色（冷暖 / 对比 / 氛围）
- 信息表达（产品更清楚 / 情绪更强 / 卖点更直）
- 稳定性（人脸 / 产品边缘 / 文本 / 品牌元素）

## 快速判定规则

- 如果多个版本都不满足 brief，先回 brief，不继续盲改 prompt
- 如果版本差异说不清，说明主改动轴不够单一
- 如果一个版本局部更好但整体不稳定，标记为 `待混合`，不要直接淘汰
- 如果任务结束后无法说清“下次先复用什么”，说明还缺 `Reusable Assets` 总结

## Reusable Assets 清单建议

至少记录这些：
- 最稳的基础 prompt
- 最稳的负向约束
- 可复用参考图 / 素材路径
- 成功的镜头结构或分镜节奏
- 容易出错的禁区说明
- 最适合的平台规格

## 一句话规则

对复杂多媒体任务，不要只保留“最后一个 prompt”；默认保留“brief + 版本对比结论 + 可复用素材清单”。
