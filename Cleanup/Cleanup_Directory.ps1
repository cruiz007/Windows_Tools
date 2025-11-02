<#
.SYNOPSIS
    Finds and deletes files older than 3 months in a given directory.

.DESCRIPTION
    This script scans a specified directory (and optionally its subdirectories)
    for files older than 90 days and deletes them. It can also log deleted files.

.PARAMETER Path
    The root directory to scan.

.PARAMETER IncludeSubdirectories
    Whether to include files in subfolders.

.PARAMETER LogFile
    Optional path to a log file where deleted file paths are recorded.

.PARAMETER Dryrun
    If specified, performs a dry-run (shows what would be deleted).
#>

param (
    [Parameter(Mandatory = $true)]
    [string]$Path,

    [switch]$IncludeSubdirectories,

    [string]$LogFile,

    [switch]$Dryrun
)

# Calculate threshold date (3 months ≈ 90 days)
$thresholdDate = (Get-Date).AddDays(-90)

Write-Host "Scanning for files older than $thresholdDate in '$Path'..." -ForegroundColor Cyan

# Get list of files that fit the threshold timeframe
$files = Get-ChildItem -Path $Path -File -Recurse:$IncludeSubdirectories | Where-Object {
    $_.LastWriteTime -lt $thresholdDate
}

if ($files.Count -eq 0) {
    Write-Host "No files older than 3 months found." -ForegroundColor Green
    exit
}

Write-Host "`nFound $($files.Count) files older than 3 months." -ForegroundColor Yellow

foreach ($file in $files) {
    if ($Dryrun) {
        Write-Host "[DRY-RUN] Would delete: $($file.FullName)"
    } else {
        try {
            Remove-Item -Path $file.FullName -Force
            Write-Host "Deleted: $($file.FullName)" -ForegroundColor Red

            if ($LogFile) {
                Add-Content -Path $LogFile -Value "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') Deleted: $($file.FullName)"
            }
        } catch {
            Write-Host "Failed to delete: $($file.FullName). Error: $($_.Exception.Message)" -ForegroundColor DarkYellow
        }
    }
}

if ($Dryrun) {
    Write-Host "`nDry run complete. No files were deleted." -ForegroundColor Cyan
} elseif ($LogFile) {
    Write-Host "`nLog saved to: $LogFile" -ForegroundColor Green
}
