# Known-Path Upload Artifact Lock

Use this when:

- the next step is a browser upload
- the local file path is already known
- the main risk is not finding the file, but mistaking `looked at locally` for `upload-ready`
- the workflow crosses `local review / export / download -> upload field`

## Goal

Compress the pre-upload local handoff into one reusable lock:

`exact path -> upload role -> handoff intent(route-next) -> local proof -> upload field mapping -> page-side acceptance target`

This is stricter than generic local review.
If the real task is upload, then `open-for-review` is only an intermediate proof step.
The local handoff is complete only when the artifact is ready to be consumed by a specific upload field.

## Why this exists

A high-frequency false completion is:

- the exact file path is known
- the file was opened locally or revealed in Explorer
- the operator therefore treats it as upload-ready
- but the upload field, canonical artifact choice, stale sibling risk, and page-side acceptance signal were never locked

That causes wrong-version uploads and ambiguous browser continuation.

## Standard Card

- Exact path:
- Upload role / field meaning:
- Handoff intent: `route-next`
- Optional local review mode before upload: `reveal-only` or `open-for-review`
- Why this exact artifact and not nearby siblings:
- Local proof:
  - [ ] path exists
  - [ ] extension/type matches field
  - [ ] modified time is fresh enough
  - [ ] size is non-zero
- Upload field mapping:
- Page-side acceptance target:
- Next safe move after accept:
- False-completion trap:
  - local file opened, but upload field still not locked
  - Explorer selected a file, but canonical upload artifact still ambiguous
  - file is fresh locally, but page-side acceptance target is unnamed

## Rule to Keep

For known-path local file tasks whose real goal is browser upload, do not stop at `reveal-only` or `open-for-review`.
Default to:

`local-file-delivery-handoff(route-next) -> attachment-readiness-pack -> browser-upload-subtask-rule -> browser-upload-handoff`

Treat local opening/review only as proof, not as the end of the handoff.
