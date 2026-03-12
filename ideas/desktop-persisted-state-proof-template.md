# Desktop Persisted State Proof Template

Use this template when a desktop / Office / local app task includes **editing, saving, exporting, or changing settings** and the next step depends on the change being truly persisted rather than only applied in the current window.

Typical cases:

- Word / Excel / PowerPoint 内容改完后要确认真的保存到了目标文件
- 桌面应用设置改完后，下一步要依赖新设置继续操作
- 本地 GUI 表单填完后，后续要 reopen / reload / upload / send
- 文档内容改完后要再导出、上传、发送或交给下一流程

## Why this matters

Desktop tasks often look finished too early:

- button was clicked, but the app is still dirty / unsaved
- autosave icon changed, but the target file did not actually update
- Save completed in the current session, but reopen shows the old content
- settings looked changed on screen, but did not persist after window switch / reopen

The real risk is not action failure but **non-persisted state being mistaken for saved state**.

## Goal

Turn `I changed it in the app` into a verified statement:

`the intended state was persisted to the intended file / config / app record, and the next step can rely on it`

## Standard Loop

1. Lock the intended persisted target
   - target file path, config target, or app record
   - expected changed field/content/setting
2. Capture one visible in-app change signal
   - changed text, toggled setting, updated field value, changed status
3. Perform save/apply/export action
   - Ctrl+S / Save / Apply / OK / Export / Save As
4. Verify persistence, not just interaction
   - dirty marker cleared, success toast/status, modified time changed, fresh output file exists, or reopen/reload shows the new state
5. If the next step matters, verify on the consumer side too
   - reopen file, refresh app page, reopen settings panel, or open exported file
6. Only then treat the change as complete

## Proof Shape

- Persisted target:
  - exact file / settings panel / record that must carry the new state
- Intended change:
  - what specifically should now be true
- Primary persistence proof:
  - strongest signal that the change was saved, not just displayed
- Secondary proof:
  - a second signal from local file state, reopen state, or next consumer
- False-ready trap:
  - what could look successful while still leaving the old state underneath
- Next-step-ready condition:
  - what must be true before upload / export / send / continue

## Suggested Proof Signals

### For document/file editing

Primary:

- target file modified time is fresh
- app dirty/unsaved marker disappears
- explicit save success indicator appears

Secondary:

- reopen shows edited content
- exported file reflects new content
- file size/hash changed plausibly when expected

### For settings/config changes in desktop apps

Primary:

- settings page shows saved/applied state after close/reopen
- app status reflects new mode/value

Secondary:

- related downstream behavior changes as expected
- config file timestamp/value changes when inspectable

### For Save As / Export flows

Primary:

- fresh file exists at exact output path
- source app no longer shows pending save/export state

Secondary:

- opening the new file shows the intended change
- downstream consumer accepts the new artifact

## Quick Card

- Task:
- Persisted target:
- Intended change:
- Save/apply action:
- Primary persistence proof:
- Secondary proof:
- False-ready trap:
- Next-step-ready condition:
- Current conclusion: verified / acted-but-persistence-unproven / blocked

## Routing Notes

- If a Windows Save / Save As / Export dialog appears, pair this with `playbooks/windows-file-dialog-handoff.md`.
- If the result is a document delivery artifact, pair this with `playbooks/office-output-proof.md` or `playbooks/local-file-delivery-handoff.md`.
- If this is part of a broader GUI workflow, pair this with `playbooks/desktop-operations.md`.

## Working Rule

When a desktop task changes content or settings and the next step depends on that change, do not stop at:

- button clicked
- dialog closed
- app still showing the edited view

Treat completion as:

- the new state is persisted to the intended target, and
- at least one post-save / post-reopen / post-refresh proof signal confirms it
