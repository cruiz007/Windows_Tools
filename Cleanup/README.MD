# Cleanup_Directory.ps1

This is a PowerShell script that scans a specified directory (and optionally its subdirectories) for files older than **3 months (90 days)** and deletes them safely.  
It supports dry-run mode, logging, and can be scheduled for automated cleanup.

---

## Features

- Finds and deletes files older than 90 days  
- Optional recursive search through subdirectories  
- Supports **dry-run mode** (`-Dryrun`) to preview deletions  
- Optional **logging** of deleted files  
- Error handling and colored console output  

---

## Parameters

| Parameter | Type | Required | Description |
|------------|------|-----------|-------------|
| `-Path` | `string` | ✅ Yes | The directory to scan for old files |
| `-IncludeSubdirectories` | `switch` | ❌ No | Recursively include subfolders |
| `-LogFile` | `string` | ❌ No | File path to log deleted files |
| `-Dryrun` | `switch` | ❌ No | Dry-run mode (shows what would be deleted) |

---

## Usage Examples

### Preview what would be deleted (Dry Run)
```
.\Cleanup_Directory.ps1 -Path "C:\Logs" -IncludeSubdirectories -Dryrun
```
### Delete files older that 90 days
```
.\Cleanup_Directory.ps1 -Path "C:\Logs" -IncludeSubdirectories
```
### Delete and output log of action
```
.\Cleanup_Directory.ps1 -Path "C:\Logs" -IncludeSubdirectories -LogFile "C:\CleanupLogs\deleted_files.log"
```
