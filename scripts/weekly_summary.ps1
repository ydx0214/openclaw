param(
    [string]$RepoPath = "C:\Users\19766\.openclaw\workspace\self-evolution-log"
)

Set-Location $RepoPath

$today = Get-Date
$start = $today.AddDays(-7)
$weekId = Get-Date -Format "yyyy-ww"
$rangeText = "{0:yyyy-MM-dd} ~ {1:yyyy-MM-dd}" -f $start, $today
$dailyDir = Join-Path $RepoPath "reports\daily"
$weeklyDir = Join-Path $RepoPath "reports\weekly"
$output = Join-Path $weeklyDir ("{0}.md" -f $weekId)
$categoryConfigPath = Join-Path $RepoPath "scripts\weekly_summary.categories.json"

$files = Get-ChildItem $dailyDir -Filter *.md | Where-Object {
    $_.Name -ne 'TEMPLATE.md' -and $_.LastWriteTime -ge $start
} | Sort-Object LastWriteTime

$categoryConfigs = Get-Content $categoryConfigPath -Raw | ConvertFrom-Json
$categoryStats = [ordered]@{}
foreach ($category in $categoryConfigs) {
    $categoryStats[$category.name] = 0
}

foreach ($file in $files) {
    $text = Get-Content $file.FullName -Raw
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

- 本周共纳入日报：$($files.Count) 篇

## Done

- 汇总最近 7 天日报
- 按可配置规则统计高频问题分类
- 生成周报文件

## Improved

- 让进化记录从“每天一篇”升级到“每周可回顾”
- 把问题分类从脚本硬编码升级为独立规则文件，新增类别不必改脚本

## Problems By Category

$categorySection## High Frequency Failure Patterns

- 优先关注计数最高的类别，并在下周重点修复

## Next Week

- 根据本周最高频问题继续优化
"@

Set-Content -Path $output -Value $summary -Encoding UTF8
Write-Output $output
