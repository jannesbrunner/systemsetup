#Requires -RunAsAdministrator
# IMPORTANT! You need to 'Set-ExecutionPolicy Bypass' in Order to run this script
# IMPORTANT! You should run this script in administrator powershell enviroment
param(
[string]$paramVerbose
)


$verbose = Read-Host -Prompt "Would you like to run the verbose Mode?`nYou will be asked before any installation will executed.`nYes / No (default) "
$vb = 0
if ($verbose -eq 'yes' -or $verbose -eq 'y') {
    $vb = 1
}

# At first, let's install chocolatey, if not installed
if ( !(Get-Command choco -errorAction SilentlyContinue) ) {
    Write-Host "Installing Chocolatey" -ForegroundColor red -BackgroundColor white
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
} else {
    Write-Host "Found Chocolatey. Skip.." -ForegroundColor red -BackgroundColor white
}

function askInstallation {
    
    param([string]$progName = "unknown",
        [int]$isVerbose = 0)
       
    if($isVerbose -eq 1) {
        "$($assoc.Id) - $($assoc.Name) - $($assoc.Owner)"
        $wants = Read-Host -Prompt "Install $($progName) ? (y/n) default = y"
        if(-not ($wants -eq "" -or $wants -eq "y" -or $wants -eq "yes")) {
            return 0;
        } else {
            return 1;
        } 
    } else {
        return 1;
    }
}

## Installing using chocolatey

# chocolatey gui
if( (askInstallation -progName "Chocolatey Gui" -isVerbose $vb) -eq 1) {
    Invoke-Expression ("choco install chocolateygui -y")
} else {
    Write-Host "Skipped.."
} 
# Mozilla Firefox
if( (askInstallation -progName "Mozilla Firefox" -isVerbose $vb) -eq 1) {
    Invoke-Expression ("choco install firefox -y")
} else {
    Write-Host "Skipped.."
} 

# The End
Write-Host -NoNewLine 'Press any key to exit...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
