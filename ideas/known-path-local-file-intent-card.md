# Known-Path Local File Intent Card

Use this card when a local Windows task already has an exact file/folder path, but the next move is still ambiguous.

Typical triggers:

- 打开这个文件
- 打开这个文件夹
- 在资源管理器里选中这个文件
- 本地看一下刚导出的文件
- 这个文件下一步帮我上传/审阅/继续处理

## Why this matters

已知路径任务的高频返工，不只是不该进 GUI 重新找文件；还在于：

- 明明只需要 reveal，却直接 open 了错误应用
- 明明只是要本地审阅，却被当成“已可上传/可发送”
- 明明要继续进入浏览器上传，却停在 Explorer 选中
- 明明要交付一个精确 artifact，却只证明了“某个同名文件存在”

所以这类任务除了先走 file/system lane，还要先锁清楚 **intent**：

`exact path -> handoff intent -> proof -> next route`

## Intent types

### Intent A — reveal-only
Use when the user mainly needs the file/folder shown locally.

Success shape:

- exact path verified
- Explorer opened to the correct folder
- target file/folder is selected or visible

False-ready trap:

- Explorer opened, but wrong file/folder
- folder opened, but target not actually selected

### Intent B — open-for-review
Use when the user needs the file opened in its app for review.

Success shape:

- exact path verified
- target app opened the intended file
- title/content signal matches expectation when needed

False-ready trap:

- app launched, but target file was not the one opened
- old copy / recent file entry was opened instead

### Intent C — route-next
Use when local verification is only a handoff step for another workflow.

Typical downstream routes:

- browser upload
- office follow-up edit/export
- document routing
- archive / cleanup / batch flow

Success shape:

- exact local artifact verified
- next workflow and exact consumed path are both explicit

False-ready trap:

- file exists, but no canonical next-step artifact is named
- stopped at Explorer/app open when the real task was upload/send/continue-processing

### Intent D — delivery-pack
Use when multiple nearby files exist and one preferred file must be declared.

Success shape:

- editable source explicit when relevant
- preferred delivery artifact explicit
- optional support files explicit

False-ready trap:

- several similar files exist, but no single canonical file is named

## Known-Path Intent Card

```md
# Known-Path Local File Intent Card

## Task Goal
- Real end state:

## Exact Path
- Target path:
- Expected type:

## Chosen Intent
- reveal-only | open-for-review | route-next | delivery-pack
- Why:

## Primary Proof Signal
- What proves the exact artifact / folder is the right one:

## Secondary Proof Signal
- What adds confidence if needed:

## False-Completion Trap
- What may look done but is not:

## Next Route
- Stop here / human review / browser upload / office follow-up / document routing / archive-cleanup / other:
```

## Rule to keep

For known-path local file tasks, do not stop at:

- “Explorer opened”
- “App launched”
- “file exists”

Stop only at:

`exact path verified + correct intent completed + next route explicit when needed`
