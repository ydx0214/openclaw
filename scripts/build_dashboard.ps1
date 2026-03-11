param(
    [string]$RepoPath = "C:\Users\19766\.openclaw\workspace\self-evolution-log"
)

$weeklyDir = Join-Path $RepoPath "reports\weekly"
$dashboardFile = Join-Path $RepoPath "DASHBOARD.md"
$statusDir = Join-Path $RepoPath "status"
$statusFile = Join-Path $statusDir "build_dashboard.last-run.json"

if (-not (Test-Path $RepoPath)) {
    Write-Error "REPO_PATH_MISSING: $RepoPath"
    exit 1
}

if (-not (Test-Path $statusDir)) {
    New-Item -ItemType Directory -Path $statusDir -Force | Out-Null
}

$repoUrl = "(not configured)"
$remoteUrl = git -C $RepoPath remote get-url origin 2>$null
if ($LASTEXITCODE -eq 0 -and $remoteUrl) {
    $repoUrl = $remoteUrl.Trim()
}

$weeklyFile = $null
if (Test-Path $weeklyDir) {
    $weeklyFile = Get-ChildItem $weeklyDir -Filter "*.md" |
        Where-Object { $_.Name -ne "TEMPLATE.md" } |
        Sort-Object LastWriteTime -Descending |
        Select-Object -First 1 -ExpandProperty FullName
}

$weeklyRows = @()
$weeklySourceLabel = "(fallback: no weekly report yet)"
$categoryCount = 0
$fallback = $true
if ($weeklyFile) {
    $text = Get-Content $weeklyFile -Raw -Encoding UTF8
    $weeklySourceLabel = [System.IO.Path]::GetFileName($weeklyFile)

    $categoryMatches = [regex]::Matches($text, '(?ms)^###\s+(.+?)\r?\n-\s*(\d+)')
    foreach ($match in $categoryMatches) {
        $name = $match.Groups[1].Value.Trim()
        $count = $match.Groups[2].Value.Trim()
        $weeklyRows += "| $name | $count |`r`n"
    }
    $categoryCount = $categoryMatches.Count
    $fallback = $false
}
if (-not $weeklyRows) {
    $weeklyRows += "| (none) | 0 |`r`n"
}
$weeklyOverview = ($weeklyRows -join '') + "`r`n"

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
"- Source: $weeklySourceLabel`r`n`r`n" +
"| Metric | Count |`r`n" +
"|---|---:|`r`n" +
$weeklyOverview +
"---`r`n`r`n" +
"## Repo`r`n`r`n" +
"- GitHub: $repoUrl`r`n" +
"- Daily: reports/daily/`r`n" +
"- Weekly: reports/weekly/`r`n" +
"- Fixes: fixes/`r`n" +
"- Ideas: ideas/`r`n" +
"- Status: status/`r`n"

Set-Content -Path $dashboardFile -Value $content -Encoding UTF8

$written = Get-Content $dashboardFile -Raw -Encoding UTF8
if ($written -notmatch '(?m)^# Evolution Dashboard' -or $written -notmatch '(?m)^## Weekly Overview' -or $written -notmatch '(?m)^## Repo') {
    Write-Error "DASHBOARD_VERIFY_FAILED: missing required sections"
    exit 1
}

$status = if ($fallback) { 'fallback' } else { 'ok' }
$summary = if ($fallback) { 'dashboard rebuilt without weekly report; fallback mode' } else { 'dashboard rebuilt from latest weekly report' }
$statusPayload = [ordered]@{
    task = 'build_dashboard'
    status = $status
    path = $dashboardFile
    summary = $summary
    timestamp = (Get-Date).ToString('o')
    details = [ordered]@{
        fallback = $fallback
        weeklySource = $weeklySourceLabel
        categories = $categoryCount
        repoUrl = $repoUrl
    }
}
$statusJson = $statusPayload | ConvertTo-Json -Depth 5
Set-Content -Path $statusFile -Value $statusJson -Encoding UTF8

$statusWritten = Get-Content $statusFile -Raw -Encoding UTF8 | ConvertFrom-Json
if ($statusWritten.task -ne 'build_dashboard' -or $statusWritten.status -ne $status) {
    Write-Error "DASHBOARD_STATUS_VERIFY_FAILED: status file content mismatch"
    exit 1
}

Write-Output "OK: BUILD_DASHBOARD task=build_dashboard; status=$status; path=$dashboardFile; summary=$summary; statusFile=$statusFile; weeklySource=$weeklySourceLabel; categories=$categoryCount"
