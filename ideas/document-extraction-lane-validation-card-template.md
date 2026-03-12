# Document Extraction Lane Validation Card

Use this card after `playbooks/document-extraction-lane-selector.md` chooses a lane and before treating that lane as stable for similar future tasks.

## When to use

Use when at least one of these is true:

1. the document is multi-column, scan-based, table-heavy, or mixed-layout
2. the extracted result must feed a downstream workflow instead of one-off reading
3. the chosen lane may become a reusable default for similar files
4. the cost of choosing the wrong lane is meaningful downstream rework

## Goal

Verify whether the chosen extraction lane is actually good enough for the real downstream consumer, instead of stopping at “the text came out.”

## Lock these fields first

- Source file:
- Source type: normal PDF / multi-column / table-heavy / scan / mixed-layout
- Downstream consumer: Markdown / Office / Excel / resume / evidence-pack / form-fill / other
- Chosen lane: A / B / C / D
- Why this lane was chosen:
- Acceptable cleanup level: low / medium / high

## Minimal validation flow

### 1) Run one narrow proof extraction
Do not process the whole workflow first.
Run one extraction pass just large enough to judge whether the lane fits.

### 2) Score 5 validation dimensions

Rate each as `pass / weak-pass / fail`.

1. **Reading order**
   - Are titles, paragraphs, bullets, and section boundaries mostly in correct order?

2. **Structure fidelity**
   - If the value is in tables, fields, columns, or layout, does extraction preserve enough structure for downstream use?

3. **Cleanup cost**
   - Is the required cleanup still within the acceptable level chosen up front?

4. **Downstream usability**
   - Can the current output directly feed the next workflow without near-manual rebuild?

5. **Proof over placebo**
   - Is this actually better than the lighter/default path, or did it just produce more output with no real downstream gain?

### 3) Decide lane status

Pick one:

- **keep**: this lane is good enough; continue downstream
- **switch**: this lane failed; change lanes before deeper work
- **trial-stronger-capability**: current lanes are not enough; only escalate if recurring value exists

## Decision heuristics

### Keep current lane when
- at least 4 of 5 dimensions are `pass` or `weak-pass`
- there is no hard failure in downstream usability
- cleanup cost stays within the allowed level

### Switch lane when
- reading order breaks the real task
- tables/fields lose meaning for the downstream consumer
- OCR noise remains too high to edit safely
- cleanup would cost more than re-routing now

### Trial stronger capability when
- lane A/B/C/D all look insufficient for repeated high-value documents
- the downstream workflow is blocked by structure/OCR quality, not by minor cleanup
- similar documents are likely to recur
- there is a believable Windows-local maintenance path

## Recommended output template

```md
# Document Extraction Lane Validation Card

- Source file:
- Source type:
- Downstream consumer:
- Chosen lane:
- Acceptable cleanup level:

## Proof Extraction
- What narrow extraction was run:
- Output path or artifact:

## Validation Score
- Reading order: pass / weak-pass / fail
- Structure fidelity: pass / weak-pass / fail
- Cleanup cost: pass / weak-pass / fail
- Downstream usability: pass / weak-pass / fail
- Proof over placebo: pass / weak-pass / fail

## Decision
- keep / switch / trial-stronger-capability
- Why:

## Next Move
- Continue into which workflow:
- If switching, which lane next:
- If escalating, what capability trial should be considered:
```

## Operating rule

Do not call a lane successful just because extraction produced text.
A lane is only successful when the result is usable enough for the real downstream consumer at an acceptable cleanup cost.
