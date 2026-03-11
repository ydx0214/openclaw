param(
    [string]$RepoPath = "C:\Users\19766\.openclaw\workspace\self-evolution-log",
    [string]$RegistryPath = ""
)

if (-not (Test-Path $RepoPath)) {
    Write-Error "REPO_PATH_MISSING: $RepoPath"
    exit 1
}

if (-not $RegistryPath) {
    $RegistryPath = Join-Path $RepoPath "scripts\task_health.registry.json"
}

if (-not (Test-Path $RegistryPath)) {
    Write-Error "TASK_HEALTH_REGISTRY_MISSING: $RegistryPath"
    exit 1
}

$statusDir = Join-Path $RepoPath "status"
if (-not (Test-Path $statusDir)) {
    New-Item -ItemType Directory -Path $statusDir -Force | Out-Null
}

$outJson = Join-Path $statusDir "task_health.last-run.json"
$outMd = Join-Path $statusDir "task_health.summary.md"

function Get-HealthPriority {
    param([string]$Status)
    switch ($Status) {
        'error' { return 5 }
        'missing' { return 4 }
        'stale' { return 3 }
        'fallback' { return 2 }
        'noop' { return 1 }
        'ok' { return 0 }
        default { return 6 }
    }
}

function Resolve-HealthStatus {
    param(
        [object]$Task,
        [object]$Payload,
        [datetimeoffset]$Now
    )

    $baseStatus = [string]$Payload.status
    if (-not $baseStatus) {
        return 'error'
    }

    if ($baseStatus -eq 'error') {
        return 'error'
    }

    if ($baseStatus -eq 'noop' -and -not [bool]$Task.allowNoop) {
        return 'error'
    }

    $timestampText = [string]$Payload.timestamp
    if (-not $timestampText) {
        return 'error'
    }

    try {
        $timestamp = [datetimeoffset]::Parse($timestampText)
    }
    catch {
        return 'error'
    }

    $ageHours = ($Now - $timestamp).TotalHours
    if ($ageHours -gt [double]$Task.freshnessHours) {
        return 'stale'
    }

    return $baseStatus
}

$registry = Get-Content $RegistryPath -Raw -Encoding UTF8 | ConvertFrom-Json
if (-not $registry.tasks -or $registry.tasks.Count -eq 0) {
    Write-Error "TASK_HEALTH_REGISTRY_EMPTY: $RegistryPath"
    exit 1
}

$now = [datetimeoffset]::Now
$rows = @()
$worstStatus = 'ok'
$worstPriority = Get-HealthPriority -Status $worstStatus

foreach ($task in $registry.tasks) {
    $statusPath = Join-Path $RepoPath $task.statusFile
    $effectiveStatus = $null
    $summary = ''
    $timestampText = ''
    $ageHoursRounded = $null

    if (-not (Test-Path $statusPath)) {
        $effectiveStatus = if ([bool]$task.required) { 'missing' } else { 'noop' }
        $summary = 'status file missing'
    }
    else {
        try {
            $payload = Get-Content $statusPath -Raw -Encoding UTF8 | ConvertFrom-Json
            $effectiveStatus = Resolve-HealthStatus -Task $task -Payload $payload -Now $now
            $summary = [string]$payload.summary
            $timestampText = [string]$payload.timestamp
            if ($timestampText) {
                try {
                    $ageHoursRounded = [math]::Round(($now - [datetimeoffset]::Parse($timestampText)).TotalHours, 2)
                }
                catch {
                    $ageHoursRounded = $null
                }
            }
        }
        catch {
            $effectiveStatus = 'error'
            $summary = 'status file unreadable or invalid JSON'
        }
    }

    $priority = Get-HealthPriority -Status $effectiveStatus
    if ($priority -gt $worstPriority) {
        $worstPriority = $priority
        $worstStatus = $effectiveStatus
    }

    $rows += [pscustomobject][ordered]@{
        task = [string]$task.task
        status = $effectiveStatus
        freshnessHours = [double]$task.freshnessHours
        required = [bool]$task.required
        allowNoop = [bool]$task.allowNoop
        statusFile = [string]$task.statusFile
        timestamp = $timestampText
        ageHours = $ageHoursRounded
        summary = $summary
    }
}

$summaryText = "task health rolled up from registry"
$payloadOut = [ordered]@{
    task = 'task_health'
    status = $worstStatus
    path = $outMd
    summary = $summaryText
    timestamp = (Get-Date).ToString('o')
    details = [ordered]@{
        registry = $RegistryPath
        tasks = $rows.Count
        worstStatus = $worstStatus
        items = $rows
    }
}

$payloadOut | ConvertTo-Json -Depth 8 | Set-Content -Path $outJson -Encoding UTF8

$md = @()
$md += '# Task Health Summary'
$md += ''
$md += "- Generated: $((Get-Date).ToString('yyyy-MM-dd HH:mm:ss zzz'))"
$md += "- Registry: $RegistryPath"
$md += "- Overall: $worstStatus"
$md += ''
$md += '| Task | Status | Age(h) | Freshness(h) | Summary |'
$md += '|---|---|---:|---:|---|'
foreach ($row in $rows) {
    $ageText = if ($null -eq $row.ageHours) { '-' } else { [string]$row.ageHours }
    $summaryCell = if ($row.summary) { ($row.summary -replace '[\r\n]+', ' ') } else { '-' }
    $md += "| $($row.task) | $($row.status) | $ageText | $($row.freshnessHours) | $summaryCell |"
}
$mdText = ($md -join "`r`n") + "`r`n"
Set-Content -Path $outMd -Value $mdText -Encoding UTF8

$written = Get-Content $outJson -Raw -Encoding UTF8 | ConvertFrom-Json
if ($written.task -ne 'task_health' -or $written.status -ne $worstStatus) {
    Write-Error 'TASK_HEALTH_VERIFY_FAILED: status file content mismatch'
    exit 1
}

$summaryInline = ($rows | ForEach-Object { "$($_.task)=$($_.status)" }) -join ', '
Write-Output "OK: TASK_HEALTH task=task_health; status=$worstStatus; path=$outMd; summary=$summaryText; registry=$RegistryPath; items=$summaryInline"
