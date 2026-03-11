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

$branch = git branch --show-current
if (-not $branch) {
    Write-Error "GIT_BRANCH_DETECT_FAILED"
    exit 1
}

$originUrl = git remote get-url origin 2>$null
if ($LASTEXITCODE -ne 0 -or -not $originUrl) {
    Write-Error "GIT_REMOTE_ORIGIN_MISSING: commit created locally, but remote 'origin' is not configured"
    exit 1
}

git push origin $branch
if ($LASTEXITCODE -ne 0) {
    git push --set-upstream origin $branch
    if ($LASTEXITCODE -ne 0) {
        Write-Error "GIT_PUSH_FAILED"
        exit 1
    }
}

Write-Output "OK: $commitMessage -> $branch"
