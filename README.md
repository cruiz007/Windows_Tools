# Windows_Tools
This repo holds variouse= windows scripts that aid sy administration, devops, cloud management
# Clean-OldFiles.ps1

A PowerShell script that scans a specified directory (and optionally its subdirectories) for files older than **3 months (90 days)** and deletes them safely.  
It supports dry-run mode, logging, and can be scheduled for automated cleanup.

---

## Features

- Finds and deletes files older than 90 days  
- Optional recursive search through subdirectories  
- Supports **dry-run mode** (`-WhatIf`) to preview deletions  
- Optional **logging** of deleted files  
- Error handling and colored console output  

---

## Parameters

| Parameter | Type | Required | Description |
|------------|------|-----------|-------------|
| `-Path` | `string` | ✅ Yes | The directory to scan for old files |
| `-IncludeSubdirectories` | `switch` | ❌ No | Recursively include subfolders |
| `-LogFile` | `string` | ❌ No | File path to log deleted files |
| `-WhatIf` | `switch` | ❌ No | Dry-run mode (shows what would be deleted) |

---

## Usage Examples

### Preview what would be deleted (Dry Run)
```powershell
.\Clean-OldFiles.ps1 -Path "C:\Logs" -IncludeSubdirectories -WhatIf
