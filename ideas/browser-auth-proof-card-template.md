# Browser Auth Proof Card Template

Use this card when a browser task depends on login state and the main risk is not the click itself, but choosing the wrong browser lane or mistaking a loaded page for a usable authenticated session.

## When to use

- 登录后研究
- 官网后台 / 管理台 / 报表中心
- 需要复用本机 Chrome 会话的页面
- 登录后表单 / 上传 / 下载 / careers 流程
- 任何后续动作依赖 account / workspace / role 的浏览器任务

## Goal

Before deeper page actions, compress the auth decision into one small reusable proof packet:

`task goal -> auth class -> preferred lane -> proof signals -> active account/workspace -> downstream workflow`

## Browser Auth Proof Card

```md
# Browser Auth Proof Card

## Task Goal
- ...

## Auth Class
- public
- login-gated-read
- login-gated-edit
- high-risk-account-action

## Preferred Lane
- openclaw-browser
- chrome-relay
- ask-user-to-login
- ask-user-to-attach-tab

## Why This Lane
- ...

## Proof Status
- proved
- blocked
- unknown

## Visible Proof Signals
- account/avatar/email:
- sign-out / profile / dashboard evidence:
- workspace / tenant / region evidence:
- role / permission evidence:

## Active Context Locked
- account:
- workspace / tenant:
- role:
- critical scope note:

## False-Ready Trap To Avoid
- ...

## Next Workflow
- browser-research-briefing.md
- browser-admin-report-execution-pack.md
- web-form-execution.md
- browser-upload-handoff.md
- browser-download-handoff.md
- careers-site-application.md
```

## Lane Decision Heuristics

### Prefer `openclaw-browser`

Use when:
- fresh isolated session is acceptable
- site is public or can be safely logged into there
- no dependency on the user's current Chrome cookies/session

### Prefer `chrome-relay`

Use when:
- task clearly depends on your current Chrome login
- local signed-in state would be expensive to rebuild
- site/account is already open in Chrome
- the user said to continue from Chrome / current tab / Browser Relay

### Prefer `ask-user-to-login`

Use when:
- auth is definitely required
- no usable authenticated session is available yet
- next step depends on human MFA / captcha / account choice

### Prefer `ask-user-to-attach-tab`

Use when:
- Chrome Relay is the correct lane
- but no attached tab is available yet

## Strong Proof Examples

Prefer visible, task-relevant proof instead of weak hints.

### Strong proof
- visible account email / username / avatar
- sign out / log out / account menu
- dashboard-only navigation items
- workspace / tenant selector showing the intended org
- role-specific controls needed for the requested task
- page data only visible after successful login

### Weak proof
- URL looks like a dashboard
- page loaded without redirect
- login form is absent
- cookies probably exist
- page title contains "dashboard"

## Proof by task type

### Logged-in research
Must lock:
- account or user identity if multiple are possible
- workspace if content varies by workspace
- one visible sign of authenticated access

### Admin / report / dashboard
Must lock:
- account
- workspace / tenant
- scope/filter starting point
- whether current role appears sufficient for export/edit/report access

### Upload / form tasks
Must lock:
- account
- target workspace/profile/entity
- whether current session has permission to edit/upload
- the exact page or form route where the upload/edit will occur

### Careers / ATS tasks
Must lock:
- candidate account or signed-in job profile
- target employer/site if multiple tabs/accounts exist
- whether current page is application draft vs public role page

## False-ready patterns

- 页面打开了，就当成已登录
- 看见后台 UI，就当成账号/工作区对了
- 只证明已登录，没有证明 role / workspace 足够
- Chrome relay 该用时却在 isolated browser 里重走登录
- 需要 Chrome relay 时忘了先让用户 attach tab

## Recommended micro-rule

For login-dependent browser tasks, do not start with page clicks.
Start with one compact auth proof card first.

## Completion line

- 能力点：登录态浏览器任务的 lane selection + auth proof
- 复用产物：`browser-auth-proof-card-template.md`
- 默认链路：`browser-auth-state-handoff -> downstream workflow`
