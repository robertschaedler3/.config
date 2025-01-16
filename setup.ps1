[CmdletBinding()]
param (
    [Parameter()]
    [ValidateSet('c/c++', 'rust', 'powershell')]
    [string[]] $Features = @()
)

$Workspace = "$HOME\git"
$DataDrives = Get-PSDrive -PSProvider FileSystem | Where-Object { $_.Root -match '^D:' }

if ($DataDrives) {
    Write-Verbose "Data drive found: $($DataDrives[0].Root)"
    $Workspace = "$($DataDrives[0].Root)\git"
} else {
    Write-Verbose "No data drive found, using default workspace: $Workspace"
}

New-Item -Path $Workspace -ItemType Directory -Force | Out-Null

function Install-WingetPackage {
    [CmdletBinding()]
    param ( 
        [Parameter(Mandatory, ValueFromPipeline)]
        [string] $PackageName
    )

    Write-Verbose "$PackageName"
    
    winget install -e --id $PackageName
}

$Packages = @(
    "Docker.DockerDesktop",
    "GitHub.cli",
    "Git.Git",
    "JanDeDobbeleer.OhMyPosh",
    "Microsoft.PowerShell",
    "Microsoft.VisualStudioCode",
)

if ($Features -contains 'rust') {
    $Packages += "RustLang.Rustup"
}

$Packages | ForEach-Object { Install-WingetPackage $_ }

# GitHub
# gh auth login
# gh repo clone 'https://github.com/robertschaedler3/.config' "$Workspace/.config"

# Git
# git config --global user.name "Robert Schaedler"
# git config --global user.email ""

# PowerShell
$PwshProfile = "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"

New-Item $PwshProfile -ItemType File -Force | Out-Null
"oh-my-posh init pwsh --config $env:LOCALAPPDATA\Programs\oh-my-posh\themes\bubbles.omp.json | Invoke-Expression" | Out-File $PwshProfile -Append

if ($Features -contains 'powershell') {
    # Install-Module PSDepend 
    # Invoke-PSDepend ...
}

# Windows Terminal
# ...

# WSL
wsl --update
# wsl --install -d Ubuntu

# User Settings
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d 0 /f
