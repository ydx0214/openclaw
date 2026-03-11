param(
    [string]$RepoPath = "C:\Users\19766\.openclaw\workspace\self-evolution-log"
)

$weeklyFile = Join-Path $RepoPath "reports\weekly\2026-11.md"
$dashboardFile = Join-Path $RepoPath "DASHBOARD.md"

if (-not (Test-Path $weeklyFile)) {
    Write-Error "WEEKLY_FILE_NOT_FOUND"
    exit 1
}

$text = Get-Content $weeklyFile -Raw

function Get-Count($name) {
    $pattern = "### " + [regex]::Escape($name) + "\r?\n-\s*(\d+)"
    if ($text -match $pattern) { return $matches[1] }
    return "0"
}

$model = Get-Count "Model"
$browser = Get-Count "Browser"
$automation = Get-Count "Automation"
$config = Get-Count "Config"
$workflow = Get-Count "Workflow"

$content = "# Evolution Dashboard`r`n`r`n" +
"Homepage for self-evolution progress.`r`n`r`n" +
"---`r`n`r`n" +
"## Current Status`r`n`r`n" +
"| Item | Status |`r`n" +
"|---|---|`r`n" +
"| Daily reports | READY |`r`n" +
"| Weekly reports | READY |`r`n" +
"| Category stats | READY |`r`n" +
"| Auto commit | READY |`r`n" +
"| GitHub sync | READY |`r`n" +
"| Dashboard | READY |`r`n`r`n" +
"---`r`n`r`n" +
"## Weekly Overview`r`n`r`n" +
"| Metric | Count |`r`n" +
"|---|---:|`r`n" +
"| Model | $model |`r`n" +
"| Browser | $browser |`r`n" +
"| Automation | $automation |`r`n" +
"| Config | $config |`r`n" +
"| Workflow | $workflow |`r`n`r`n" +
"---`r`n`r`n" +
"## Repo`r`n`r`n" +
"- GitHub: https://github.com/ydx0214/openclaw.git`r`n" +
"- Daily: reports/daily/`r`n" +
"- Weekly: reports/weekly/`r`n" +
"- Fixes: fixes/`r`n" +
"- Ideas: ideas/`r`n"

Set-Content -Path $dashboardFile -Value $content -Encoding UTF8
Write-Output $dashboardFile
