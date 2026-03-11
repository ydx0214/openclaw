param(
    [string]$RepoPath = "C:\Users\19766\.openclaw\workspace\self-evolution-log"
)

Set-Location $RepoPath

$today = Get-Date
$start = $today.AddDays(-7)
$calendar = [System.Globalization.CultureInfo]::InvariantCulture.Calendar
$weekRule = [System.Globalization.CalendarWeekRule]::FirstFourDayWeek
$firstDayOfWeek = [System.DayOfWeek]::Monday
$isoWeek = $calendar.GetWeekOfYear($today, $weekRule, $firstDayOfWeek)
$weekId = "{0}-{1:D2}" -f $today.Year, $isoWeek
$rangeText = "{0:yyyy-MM-dd} ~ {1:yyyy-MM-dd}" -f $start, $today
$dailyDir = Join-Path $RepoPath "reports\daily"
$weeklyDir = Join-Path $RepoPath "reports\weekly"
$statusDir = Join-Path $RepoPath "status"
$output = Join-Path $weeklyDir ("{0}.md" -f $weekId)
$statusOutput = Join-Path $statusDir "weekly_summary.last-run.json"
$categoryConfigPath = Join-Path $RepoPath "scripts\weekly_summary.categories.json"

if (-not (Test-Path $dailyDir)) {
    Write-Error "DAILY_REPORT_DIR_MISSING: $dailyDir"
    exit 1
}

if (-not (Test-Path $weeklyDir)) {
    New-Item -ItemType Directory -Path $weeklyDir -Force | Out-Null
}

if (-not (Test-Path $statusDir)) {
    New-Item -ItemType Directory -Path $statusDir -Force | Out-Null
}

$files = Get-ChildItem $dailyDir -Filter *.md | Where-Object {
    $_.Name -ne 'TEMPLATE.md' -and $_.LastWriteTime -ge $start
} | Sort-Object LastWriteTime

$defaultCategoryConfigs = @(
    [pscustomobject]@{ name = 'Model'; patterns = @('model', 'server_error', 'provider') }
    [pscustomobject]@{ name = 'Browser'; patterns = @('browser', 'snapshot', 'page', 'element') }
    [pscustomobject]@{ name = 'Automation'; patterns = @('automation', 'script', 'task', 'click') }
    [pscustomobject]@{ name = 'Config'; patterns = @('config', 'gateway', 'credential', 'restart') }
    [pscustomobject]@{ name = 'Workflow'; patterns = @('workflow', 'report', 'record', 'repeat') }
)

$categoryConfigs = $null
if (Test-Path $categoryConfigPath) {
    try {
        $categoryConfigs = Get-Content $categoryConfigPath -Raw -Encoding UTF8 | ConvertFrom-Json
    }
    catch {
        Write-Warning "CATEGORY_CONFIG_INVALID; fallback to built-in defaults"
    }
}
else {
    Write-Warning "CATEGORY_CONFIG_MISSING; fallback to built-in defaults"
}

if (-not $categoryConfigs -or $categoryConfigs.Count -eq 0) {
    $categoryConfigs = $defaultCategoryConfigs
}

$categoryStats = [ordered]@{}
foreach ($category in $categoryConfigs) {
    $categoryStats[$category.name] = 0
}

foreach ($file in $files) {
    $text = Get-Content $file.FullName -Raw -Encoding UTF8
    foreach ($category in $categoryConfigs) {
        $pattern = ($category.patterns | ForEach-Object { [regex]::Escape($_) }) -join '|'
        if ($text -match $pattern) {
            $categoryStats[$category.name]++
        }
    }
}

$categorySection = ""
foreach ($entry in $categoryStats.GetEnumerator()) {
    $categorySection += "### {0}`r`n- {1}`r`n`r`n" -f $entry.Key, $entry.Value
}

$summary = @"
# Weekly Evolution Summary

- Week: $weekId
- Range: $rangeText

## Overview

- Daily reports included: $($files.Count)

## Done

- Aggregated daily reports from the last 7 days
- Counted frequent issue categories using configurable rules
- Generated the weekly summary file

## Improved

- Upgraded evolution tracking from daily-only notes to weekly review
- Moved category rules out of script code so new categories only need config changes

## Problems By Category

$categorySection## High Frequency Failure Patterns

- Prioritize the highest-count category for next week's fixes

## Next Week

- Continue improving the highest-frequency problem area
"@

Set-Content -Path $output -Value $summary -Encoding UTF8

if (-not (Test-Path $output)) {
    Write-Error "WEEKLY_SUMMARY_WRITE_FAILED: $output"
    exit 1
}

$writtenText = Get-Content $output -Raw -Encoding UTF8
if ($writtenText -notmatch '## Problems By Category' -or $writtenText -notmatch '## High Frequency Failure Patterns') {
    Write-Error "WEEKLY_SUMMARY_VERIFY_FAILED: missing expected sections"
    exit 1
}

$statusPayload = [ordered]@{
    task = 'weekly_summary'
    status = 'ok'
    path = $output
    summary = "Weekly summary generated successfully."
    timestamp = (Get-Date).ToString('o')
    details = [ordered]@{
        reports = $files.Count
        categories = $categoryStats.Count
        week = $weekId
    }
}

$statusPayload | ConvertTo-Json -Depth 5 | Set-Content -Path $statusOutput -Encoding UTF8

if (-not (Test-Path $statusOutput)) {
    Write-Error "WEEKLY_SUMMARY_STATUS_WRITE_FAILED: $statusOutput"
    exit 1
}

$statusText = Get-Content $statusOutput -Raw -Encoding UTF8 | ConvertFrom-Json
if ($statusText.task -ne 'weekly_summary' -or $statusText.status -ne 'ok') {
    Write-Error "WEEKLY_SUMMARY_STATUS_VERIFY_FAILED: invalid status payload"
    exit 1
}

Write-Output "OK: WEEKLY_SUMMARY status=ok; path=$output; reports=$($files.Count); categories=$($categoryStats.Count); status_json=$statusOutput"
