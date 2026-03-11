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

$lines = @(
    "# Evolution Dashboard",
    "",
    "> 首页可视化进化看板",
    "",
    "---",
    "",
    "## 当前状态",
    "",
    "| 项目 | 状态 |",
    "|---|---|",
    "| 日报系统 | ✅ 已接入 |",
    "| 周报系统 | ✅ 已接入 |",
    "| 分类统计 | ✅ 已接入 |",
    "| 自动提交 | ✅ 已接入 |",
    "| GitHub 同步 | ✅ 已接入 |",
    "| 可视化看板 | ✅ 已建立 |",
    "",
    "---",
    "",
    "## 本周概览",
    "",
    "| 维度 | 数值 |",
    "|---|---:|",
    "| Model 问题 | $model |",
    "| Browser 问题 | $browser |",
    "| Automation 问题 | $automation |",
    "| Config 问题 | $config |",
    "| Workflow 问题 | $workflow |",
    "",
    "---",
    "",
    "## 仓库入口",
    "",
    "- GitHub: https://github.com/ydx0214/openclaw.git",
    "- 日报: reports/daily/",
    "- 周报: reports/weekly/",
    "- 修复记录: fixes/",
    "- 想法记录: ideas/"
)

Set-Content -Path $dashboardFile -Value ($lines -join "`r`n") -Encoding UTF8
Write-Output $dashboardFile
