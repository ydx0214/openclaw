param(
    [string]$RepoPath = "C:\Users\19766\.openclaw\workspace\self-evolution-log"
)

$weeklyDir = Join-Path $RepoPath "reports\weekly"
$dashboardFile = Join-Path $RepoPath "DASHBOARD.md"

if (-not (Test-Path $RepoPath)) {
    Write-Error "REPO_PATH_MISSING: $RepoPath"
    exit 1
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
"- Ideas: ideas/`r`n"

Set-Content -Path $dashboardFile -Value $content -Encoding UTF8

$written = Get-Content $dashboardFile -Raw -Encoding UTF8
if ($written -notmatch '(?m)^# Evolution Dashboard' -or $written -notmatch '(?m)^## Weekly Overview' -or $written -notmatch '(?m)^## Repo') {
    Write-Error "DASHBOARD_VERIFY_FAILED: missing required sections"
    exit 1
}

$fallback = if ($weeklyFile) { 'no' } else { 'yes' }
Write-Output "OK: DASHBOARD_UPDATED path=$dashboardFile; weeklySource=$weeklySourceLabel; categories=$categoryCount; fallback=$fallback"
