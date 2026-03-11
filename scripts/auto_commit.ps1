param(
    [string]$RepoPath = "C:\Users\19766\.openclaw\workspace\self-evolution-log"
)

Set-Location $RepoPath

if (-not (Test-Path $RepoPath)) {
    Write-Error "REPO_PATH_MISSING: $RepoPath"
    exit 1
}

$statusDir = Join-Path $RepoPath "status"
$statusFile = Join-Path $statusDir "auto_commit.last-run.json"
if (-not (Test-Path $statusDir)) {
    New-Item -ItemType Directory -Path $statusDir -Force | Out-Null
}

function Write-StatusFile {
    param(
        [string]$Status,
        [string]$Path,
        [string]$Summary,
        [hashtable]$Details
    )

    $payload = [ordered]@{
        task = 'auto_commit'
        status = $Status
        path = $Path
        summary = $Summary
        timestamp = (Get-Date).ToString('o')
        details = $Details
    }
    $json = $payload | ConvertTo-Json -Depth 5
    Set-Content -Path $statusFile -Value $json -Encoding UTF8

    $written = Get-Content $statusFile -Raw -Encoding UTF8 | ConvertFrom-Json
    if ($written.task -ne 'auto_commit' -or $written.status -ne $Status) {
        Write-Error "AUTO_COMMIT_STATUS_VERIFY_FAILED: status file content mismatch"
        exit 1
    }
}

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# 保守提交：只有有变更时才提交
$changes = git status --porcelain
if (-not $changes) {
    $summary = 'no changes to commit'
    Write-StatusFile -Status 'noop' -Path $RepoPath -Summary $summary -Details ([ordered]@{
        branch = $null
        head = $null
        remote = $null
        verify = 'skipped'
        changed = $false
    })
    Write-Output "OK: AUTO_COMMIT status=noop; reason=no_changes; statusFile=$statusFile"
    exit 0
}

$branch = git branch --show-current
if (-not $branch) {
    Write-Error "GIT_BRANCH_DETECT_FAILED"
    exit 1
}

$originUrl = git remote get-url origin 2>$null
if ($LASTEXITCODE -ne 0 -or -not $originUrl) {
    Write-Error "GIT_REMOTE_ORIGIN_MISSING: skip commit because remote 'origin' is not configured"
    exit 1
}

git add .
$commitMessage = "daily self-evolution update $timestamp"
git commit -m $commitMessage
if ($LASTEXITCODE -ne 0) {
    Write-Error "GIT_COMMIT_FAILED"
    exit 1
}

$headSha = (git rev-parse HEAD 2>$null).Trim()
if (-not $headSha) {
    Write-Error "GIT_HEAD_SHA_DETECT_FAILED"
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

$upstreamRef = "origin/$branch"
$remoteSha = (git rev-parse $upstreamRef 2>$null).Trim()
if (-not $remoteSha) {
    Write-Error "GIT_PUSH_VERIFY_FAILED: upstream ref missing after push ($upstreamRef)"
    exit 1
}

if ($remoteSha -ne $headSha) {
    Write-Error "GIT_PUSH_VERIFY_FAILED: local HEAD $headSha != remote $remoteSha"
    exit 1
}

$summary = 'commit created and pushed with verified remote alignment'
Write-StatusFile -Status 'ok' -Path $RepoPath -Summary $summary -Details ([ordered]@{
    branch = $branch
    head = $headSha
    remote = $upstreamRef
    originUrl = $originUrl.Trim()
    verify = 'matched'
    changed = $true
})

Write-Output "OK: AUTO_COMMIT status=ok; branch=$branch; head=$headSha; remote=$upstreamRef; verify=matched; statusFile=$statusFile"
