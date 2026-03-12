# Document Downstream Consumer Scorecard

Use this after `playbooks/document-extraction-lane-validation.md` reaches `keep` or `weak-pass`, but before treating the extracted result as ready for a specific downstream workflow.

## Purpose

Many document extraction failures do not show up at the extraction stage itself.
They show up when the output is consumed by a real downstream workflow.

This scorecard adds one more narrow check:
not just “did the lane work,” but “is this output actually good enough for the specific consumer?”

## Use this for

- PDF / scan / table-heavy extraction that will feed a real next task
- cases where the downstream consumer is stricter than generic reading
- tasks where rework becomes expensive only after entering the next workflow

Typical consumers:
- Markdown drafting
- Office / Word editing
- Excel / CSV / table cleanup
- Resume tailoring
- Research evidence pack
- Form fill pack / field extraction

## Lock these fields first

- **Source file**
- **Extraction artifact**
- **Consumer type**
- **Consumer goal**
- **Must-preserve elements**
- **Allowed cleanup level**
- **Failure cost if wrong**: low / medium / high

## Consumer-specific checks

Rate each as `pass / weak-pass / fail`.

### 1) Markdown drafting fit

Use when the next step is Markdown notes, report drafting, or readable structured text.

Check:
- heading hierarchy still usable
- paragraph order is stable
- bullets/lists stay grouped
- quotes/code/inline emphasis are not badly mangled
- manual cleanup is lighter than rewriting from source

### 2) Office / Word editing fit

Use when the next step is Word editing, report revision, or office delivery.

Check:
- section boundaries are clear enough to re-structure in Word
- tables/figures/captions are recoverable where needed
- copied text will not require near-manual reorder
- names, numbers, dates, and headings survive accurately
- cleanup cost is lower than manual re-entry from the source PDF

### 3) Excel / CSV / table fit

Use when the next step is table cleanup, spreadsheet import, or structured data extraction.

Check:
- row/column meaning is preserved
- merged-header meaning is still recoverable
- numeric cells are not badly broken by OCR noise
- delimiter structure can be normalized without rebuilding table semantics
- the result is good enough for spreadsheet cleanup instead of manual table retyping

### 4) Resume tailoring fit

Use when the next step is extracting JD signals or resume evidence.

Check:
- role title, level, location, and team context are intact
- must-have requirements are distinguishable from nice-to-have items
- responsibilities vs qualifications are not mixed together
- repeated boilerplate does not hide the real signal
- the output is safe enough to derive `strong / partial / gap` evidence without reopening the source for every bullet

### 5) Research evidence pack fit

Use when the next step is source-backed writing or evidence reuse.

Check:
- claim boundaries are clear enough to quote or paraphrase safely
- source section anchors are still identifiable
- wording important to policy/compliance meaning survives intact
- extraction did not blur separate conditions/exceptions into one statement
- the output supports `verbatim / paraphrase / re-check-live` decisions without major ambiguity

### 6) Form fill / field extraction fit

Use when the next step is turning the document into fields, answers, or uploads for a browser workflow.

Check:
- field-like items are separable
- labels and values are not mixed
- dates, IDs, names, and contact info survive accurately
- optional vs required-looking fields are distinguishable
- the result is structured enough to support a fill pack instead of ad-hoc manual rereading

## Decision rule

- **consumer-ready**: downstream work can begin safely
- **consumer-ready-with-guardrails**: usable, but must note exact weak spots
- **not-consumer-ready**: stop and switch lane / upgrade capability / narrow the target

## Output template

```md
# Document Downstream Consumer Scorecard

- Source file:
- Extraction artifact:
- Consumer type:
- Consumer goal:
- Must-preserve elements:
- Allowed cleanup level:
- Failure cost if wrong:

## Consumer Checks
- Check 1:
- Check 2:
- Check 3:
- Check 4:
- Check 5:

## Decision
- consumer-ready / consumer-ready-with-guardrails / not-consumer-ready
- Why:

## Guardrails / Weak Spots
- 

## Next Move
- Continue into:
- Or switch to:
- Or escalate to:
```

## Rule

Do not treat extraction as ready for downstream work just because the lane passed generically.
If the next workflow is high-cost or claim-sensitive, run a consumer-specific scorecard first.
