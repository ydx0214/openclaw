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

$files = Get-ChildItem $dailyDir -Filter *.md | Where-Object {
    $_.Name -ne 'TEMPLATE.md' -and $_.LastWriteTime -ge $start
} | Sort-Object LastWriteTime

$model = 0
$browser = 0
$automation = 0
$config = 0
$workflow = 0

foreach ($file in $files) {
    $text = Get-Content $file.FullName -Raw
    if ($text -match '模型|model|server_error|provider') { $model++ }
    if ($text -match '浏览器|browser|snapshot|元素|页面') { $browser++ }
    if ($text -match '自动化|automation|脚本|点击|任务') { $automation++ }
    if ($text -match '配置|config|gateway|凭证|重启') { $config++ }
    if ($text -match '流程|workflow|日报|记录|重复') { $workflow++ }
}

$summary = @"
# Weekly Evolution Summary

- Week: $weekId
- Range: $rangeText

## Overview

- 本周共纳入日报：$($files.Count) 篇

## Done

- 汇总最近 7 天日报
- 统计高频问题分类
- 生成周报文件

## Improved

- 让进化记录从“每天一篇”升级到“每周可回顾”
- 增加基础问题分类统计

## Problems By Category

### Model
- $model

### Browser
- $browser

### Automation
- $automation

### Config
- $config

### Workflow
- $workflow

## High Frequency Failure Patterns

- 优先关注计数最高的类别，并在下周重点修复

## Next Week

- 根据本周最高频问题继续优化
"@

Set-Content -Path $output -Value $summary -Encoding UTF8
Write-Output $output
