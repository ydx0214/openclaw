# Multimedia Prompt Pack Template

Use this template after `Generation Brief` is already locked.

Goal:
Turn a vague "give me some prompts" request into a reusable, execution-ready prompt pack for image, video, or image-to-video tasks.

---

## When To Use

Use this template when:

- the user wants image prompts, video prompts, storyboard prompts, or image-to-video prompts
- the main uncertainty is no longer the task goal, but which prompt direction to try first
- the task needs 2+ comparable variants instead of one oversized prompt blob

Do not use this template as a substitute for a missing brief.
If platform, ratio, duration, audience, or must-avoid constraints are still unclear, fill the brief first.

---

## Core Rule

Default structure:

`locked brief -> shared guardrails -> variant prompts -> acceptance checklist -> next revision axis`

The point is not longer prompts.
The point is to make first-pass generation comparable, reviewable, and reusable.

---

## Prompt Pack Output Template

```md
# Multimedia Prompt Pack

## 1) Task Snapshot
- Task type:
- Deliverable:
- Usage scene:
- Platform:
- Output spec:

## 2) Locked Subject + Goal
- Core subject:
- Core message:
- Desired reaction:
- Non-negotiables:

## 3) Shared Guardrails
- Must include:
- Must avoid:
- Identity / object stability rules:
- Text / logo handling rules:
- Composition safety rules:

## 4) Variant Strategy
- Variant A focus:
- Variant B focus:
- Variant C focus:
- Comparison axis:

## 5) Prompt Variants

### Variant A
- Intent:
- Prompt:
- Negative prompt / avoid list:
- Best for:

### Variant B
- Intent:
- Prompt:
- Negative prompt / avoid list:
- Best for:

### Variant C
- Intent:
- Prompt:
- Negative prompt / avoid list:
- Best for:

## 6) Acceptance Checklist
- Pass if:
- Reject if:
- Human review points:

## 7) Next Revision Axis
- If subject is wrong:
- If style is wrong:
- If composition is wrong:
- If message is weak:
- If motion is unstable:
```

---

## Route A: Static Image Prompt Pack

Recommended first pass:

- 3 prompt variants max
- 1 shared negative block
- variant axes should differ on only 1 or 2 dimensions
  - style
  - composition
  - lighting
  - background complexity

Good default comparison pattern:

- Variant A = safest usable cover / thumbnail route
- Variant B = stronger emotional or cinematic route
- Variant C = cleaner commercial / conversion-oriented route

### Static Image Mini Example

```md
### Variant A
- Intent: safe Xiaohongshu cover with strong subject focus
- Prompt: clean portrait close-up, soft natural lighting, warm neutral palette, centered composition with reserved title area, premium lifestyle photography
- Negative prompt / avoid list: extra fingers, distorted face, cluttered text, messy background, over-sharpening
- Best for: first-pass usable cover
```

---

## Route B: Video / Shot Prompt Pack

Recommended first pass:

- 3 to 6 shot cards
- each shot changes one main thing only
- define continuity guardrails once, not inside every shot unless needed

### Video Shot Card Template

```md
### Shot 1
- Purpose:
- Duration:
- Camera / motion:
- Scene:
- Prompt:
- Must keep stable:
```

Suggested axes:

- camera motion
- pacing
- environment detail
- emotional tone
- product emphasis

Do not mix all axes in one revision round.

---

## Route C: Image-to-Video Prompt Pack

Use when a source image already exists.

Add these fields before prompt writing:

- source image accepted: yes / no
- protected elements: face / product / text / logo / silhouette
- allowed motion: camera push / head turn / fabric motion / atmosphere only
- forbidden drift: identity change / extra limbs / logo mutation / object melting

### Image-to-Video Mini Template

```md
### Motion Variant A
- Intent: subtle premium motion
- Prompt: gentle camera push-in, soft breathing motion, light hair movement, realistic lighting continuity, preserve facial identity and outfit details
- Avoid: facial drift, eye distortion, extra accessories, unstable edges
- Best for: safe first-pass animation
```

---

## Reuse Rules

1. Keep one shared guardrail block for all variants.
2. Keep variant differences explicit.
3. Do not produce more than 3 first-pass image variants unless the user asks.
4. For video, prefer fewer stable shots over many noisy shots.
5. Every prompt pack must end with a next revision axis.

---

## Failure Patterns To Avoid

### One giant prompt, no comparison structure
Result: hard to review, hard to improve, easy to lose the best direction.

### Variants differ on too many dimensions
Result: human cannot tell what caused improvement or failure.

### No shared guardrails
Result: each prompt drifts and comparison becomes unfair.

### No acceptance checklist
Result: output looks impressive but cannot be judged against the task.

---

## Recommended Storage / Handoff

When the task is non-trivial, save alongside:

- Generation Brief
- Prompt Pack
- lightweight iteration log when round 2 starts
- accepted asset list if files are generated later

Suggested follow-up direction:
This template is a strong next-layer companion to `playbooks/multimedia-generation-workflow.md` and can later be promoted into a formal playbook or be embedded into a future multimedia task pack.
