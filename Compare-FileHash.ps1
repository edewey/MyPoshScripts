[CmdletBinding()]
param (
    [parameter(mandatory = $true, position = 1)]
    [string]$file,

    [parameter(mandatory = $true, position = 2)]
    [string]$providedHash,

    [parameter(mandatory = $false, position = 3)]
    [string]$algorithm = "sha256"
)

Write-Host "Hashing $file with $algorithm..."

$fileHash = Get-FileHash $file -algorithm $algorithm | Select-Object -ExpandProperty Hash

if ($fileHash -eq $providedHash) {
    Write-Host 'Match' -ForegroundColor black -BackgroundColor green
    Write-Host "The locally computed $algorithm hash of $file matches the provided hash: $providedHash" -ForegroundColor black -BackgroundColor green
}

else {
    Write-Host 'Mismatch' -ForegroundColor white -BackgroundColor red
    Write-Host "the locally computed $algorithm hash of $file did not match the provided hash: $providedHash" -ForegroundColor white -BackgroundColor red
}