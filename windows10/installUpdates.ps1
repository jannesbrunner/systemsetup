#Requires -RunAsAdministrator
# This script will automatically install MS Windows updates
Write-Host "Installing available Windows Updates..."
if (Get-Module -ListAvailable -Name PSWindowsUpdate) {
    Install-WindowsUpdate
} else {
    Write-Host "Windows Upate Module is required. Try to install it now..."
    Install-Module PSWindowsUpdate
    Install-WindowsUpdate
}
