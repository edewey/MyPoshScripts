# Restic Backup Script

# Set environment variables
$env:RESTIC_REPOSITORY = ""   # Change to your actual repo
$env:RESTIC_PASSWORD = ""           # Change to your actual password

# Directory to backup
$backupSource = ""

# Log file location
$logFile = ""

# Restic executable path
$resticExe = ""

# Date and time for log
$currentTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Function to log messages to a file with UTF-8 encoding
function Write-Log {
    param (
        [string]$message
    )
    $logMessage = $message
    $logMessage | Out-File -Append -FilePath $logFile -Encoding UTF8
}

# Log backup start
Write-Log "************`r`nBackup started at $currentTime"
Write-Log "Backing up $backupSource to repository $env:RESTIC_REPOSITORY"

# Perform the backup
try {
    $output = & $resticExe backup $backupSource --verbose --use-fs-snapshot --exclude-if-present resticnobackup  2>&1
    $output | Out-File -Append -FilePath $logFile -Encoding UTF8
    if ($LASTEXITCODE -eq 0) {
        Write-Log "Backup completed successfully at $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    } else {
        Write-Log "Backup failed with error code $LASTEXITCODE at $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss'). Output: $output"
        exit $LASTEXITCODE
    }
} catch {
    Write-Log "An exception occurred during the backup at $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss'): $_"
    exit 1
}

