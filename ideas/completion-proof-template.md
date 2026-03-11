# Completion Proof Template

Use this when a complex task can look finished before it is actually finished.

## Why

Many failures in real desktop / browser / document tasks are not action failures but **false completion**:

- clicked upload, but page did not accept the file
- saved a file, but it landed in the wrong folder or with the wrong name
- generated a document, but the wrong file was handed off
- closed a Windows dialog, but the source app did not receive the result
- ran a script, but no human-visible or app-visible outcome was confirmed

The fix is to define the **completion proof** before or during execution.

## Completion Proof Schema

For non-trivial tasks, try to pin these 5 fields early:

1. **final artifact or end state**
   - What must exist when the task is truly done?
   - Examples: uploaded attachment chip, saved PDF, updated row, visible draft, opened Word file

2. **primary proof signal**
   - The strongest signal that the task is complete
   - Examples: page shows uploaded filename, file exists at exact path, source app shows new attachment, output document opens correctly

3. **secondary proof signal**
   - A backup check in case the main signal is weak
   - Examples: modified time is fresh, size > 0, screenshot shows result, control tree changed, file count changed

4. **false-completion trap**
   - What might look successful but is not enough?
   - Examples: dialog closed, button clicked, toast flashed once, script returned 0, file downloaded somewhere unknown

5. **handoff-ready condition**
   - What must be true for the next workflow to safely start?
   - Examples: one preferred upload file chosen, local file path confirmed, draft-ready but not submitted, output opened for review

## Quick Template

- Task:
- Final artifact / end state:
- Primary proof signal:
- Secondary proof signal:
- False-completion trap:
- Handoff-ready condition:

## Domain Defaults

### Browser upload
- Final artifact / end state: target page shows the selected file as accepted
- Primary proof signal: filename chip / attachment row / success state on page
- Secondary proof signal: file chooser closed and page element changed
- False-completion trap: Windows dialog closed but page shows nothing
- Handoff-ready condition: page-side upload accepted and the next form step is unlocked

### Browser download
- Final artifact / end state: the intended local file exists at the expected path
- Primary proof signal: file exists with correct extension and fresh modified time
- Secondary proof signal: size > 0 or file can be opened / routed
- False-completion trap: browser preview opened or download button clicked only
- Handoff-ready condition: local file is verified and explicitly routed to the next workflow

### Windows file dialog
- Final artifact / end state: source app actually accepted the chosen file/path/folder
- Primary proof signal: source app shows the file/path after dialog closes
- Secondary proof signal: local file/path matches expected target
- False-completion trap: dialog disappeared but app state did not change
- Handoff-ready condition: both local side and app side are verified

### Local generated document
- Final artifact / end state: one preferred delivery file is present and reviewable
- Primary proof signal: file exists at exact path and opens successfully
- Secondary proof signal: fresh modified time / expected format / render check where needed
- False-completion trap: script said it wrote a file, but the wrong file is being used
- Handoff-ready condition: source-of-truth and preferred delivery file are both explicit

## Reusable Rule

For complex tasks, do not stop at "action executed". Stop at **"completion proof collected"**.

## Suggested Integration Points

- `playbooks/browser-upload-handoff.md`
- `playbooks/browser-download-handoff.md`
- `playbooks/windows-file-dialog-handoff.md`
- `playbooks/local-file-delivery-handoff.md`
- `playbooks/openclaw-agent-delegation.md`
