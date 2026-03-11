param(
    [string]$RepoPath = "C:\Users\19766\.openclaw\workspace\self-evolution-log"
)

Set-Location $RepoPath

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# 保守提交：只有有变更时才提交
$changes = git status --porcelain
if (-not $changes) {
    Write-Output "NO_CHANGES"
    exit 0
}

git add .
$commitMessage = "daily self-evolution update $timestamp"
git commit -m $commitMessage
if ($LASTEXITCODE -ne 0) {
    Write-Error "GIT_COMMIT_FAILED"
    exit 1
}

git push origin main
if ($LASTEXITCODE -ne 0) {
    Write-Error "GIT_PUSH_FAILED"
    exit 1
}

Write-Output "OK: $commitMessage"
