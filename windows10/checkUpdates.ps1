#Requires -RunAsAdministrator
# This script will automatically check for MS Windows updates
Write-Host "Checking for available Windows Updates..."
if (Get-Module -ListAvailable -Name PSWindowsUpdate) {
    Get-WindowsUpdate
} else {
    Write-Host "Windows Upate Module is required. Try to install it now..."
    Install-Module PSWindowsUpdate
    Get-WindowsUpdate
}
