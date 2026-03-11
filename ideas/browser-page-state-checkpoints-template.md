# Browser Page-State Checkpoints Template

Use this template when a browser task spans multiple actions and the main risk is not finding the control, but continuing after the page state has already changed.

Goal: decide **when to refresh snapshot / re-bind refs / re-check proof** so the workflow does not keep acting on stale assumptions.

## When to Apply

Apply this template to:

- multi-step form filling
- uploads / downloads with page-side status change
- research across tabs, accordions, docs nav, or modals
- export / generate / async processing pages
- any workflow where a click can re-render the page, unlock controls, or change the active route

## Checkpoint Card

```md
# Page-State Checkpoint Card

- Task:
- Page / step:
- Action just taken:
- Expected page-state change:
- Must refresh snapshot after this? yes / no
- Strong proof signal:
- Secondary proof signal:
- False-completion trap:
- Next safe action only after:
```

## Default State-Change Buckets

### Bucket A — Route / context switch
Examples:
- tab switch
- route change
- detail page opened
- back navigation
- docs nav jump

Rule:
- always refresh snapshot before the next action
- do not reuse old refs across route/context change unless the current page is re-read and confirmed

### Bucket B — Layer change
Examples:
- modal open/close
- drawer open/close
- accordion expand/collapse
- dropdown with important options
- inline editor open/close

Rule:
- refresh snapshot after the layer change if the next action depends on the new layer state
- capture proof from the new visible layer, not from the pre-open state

### Bucket C — Validation / availability change
Examples:
- upload accepted
- inline validation appears/disappears
- Next / Submit button enabled
- required fields recalculate
- async status becomes ready / complete

Rule:
- treat the state change itself as a verification boundary
- refresh snapshot, then verify the status text / enabled state / filename / error disappearance before continuing

### Bucket D — Async generation / export / background processing
Examples:
- export requested
- report generation queued
- downloadable file becomes ready later
- background fetch finishes and populates rows

Rule:
- do not rely on the initiating click as proof
- re-check page state after the async phase and verify a stable ready signal before the next action

## Minimal Browser Micro-Loop

1. capture `snapshot(refs=aria)`
2. take one action
3. ask: did the page change context, layer, validation state, or async status?
4. if yes, refresh snapshot before the next action
5. verify one strong state-proof signal
6. only then continue

## Strong Proof Signal Examples

- a new heading or step label is visible
- target filename appears in an attachment row
- validation error disappears or success text appears
- button state changes from disabled to enabled
- export row changes to ready/download
- newly opened modal/drawer title is visible

## False-Completion Traps

Common traps to mark explicitly:

- click succeeded but page stayed unchanged
- dialog closed but upload not accepted
- preview opened but no local download exists
- Next button clicked but current step still contains hidden errors
- route changed but workflow kept using old refs
- async task started but ready state was never verified

## Handoff Rule

Before the next browser action, the workflow should be able to say:

- what changed
- what proof confirms the new state
- what action is now safe because of that proof

If any of the three is missing, refresh or inspect again instead of continuing.

## Short Example

```md
- Task: upload resume in careers form
- Page / step: Attachments
- Action just taken: selected local PDF in file chooser
- Expected page-state change: resume row appears and Next becomes enabled
- Must refresh snapshot after this? yes
- Strong proof signal: filename chip `resume-ml.pdf` visible
- Secondary proof signal: Next button enabled
- False-completion trap: file chooser closed only
- Next safe action only after: attachment row is visible in refreshed snapshot
```

## Rule to Keep

In complex browser tasks, the safe unit is not `action -> next action`.
The safe unit is `action -> state checkpoint -> proof -> next action`.
