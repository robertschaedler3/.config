
$Workspace = "$HOME\git"
$DataDrives = Get-PSDrive -PSProvider FileSystem | Where-Object { $_.Root -match '^D:' }

if ($DataDrives) {
    Write-Verbose "Data drive found: $($DataDrives[0].Root)"
    $Workspace = "$($DataDrives[0].Root)\git"
} else {
    Write-Verbose "No data drive found, using default workspace: $Workspace"
}

New-Item -Path $Workspace -ItemType Directory -Force | Out-Null

winget install -e --id Docker.DockerDesktop
winget install -e --id GitHub.cli
winget install -e --id Git.Git
winget install -e --id JanDeDobbeleer.OhMyPosh
winget install -e --id Microsoft.PowerShell
winget install -e --id Microsoft.VisualStudioCode
# winget install -e --id Rustlang.Rustup

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

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
