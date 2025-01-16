
$Workspace = "$HOME\git"
$DataDrives = Get-PSDrive -PSProvider FileSystem | Where-Object { $_.Root -match '^D:' }

if ($DataDrives) {
    Write-Verbose "Data drive found: $($DataDrives[0].Root)"
    $Workspace = "$($DataDrives[0].Root)\git"
}

New-Item -Path $Workspace -ItemType Directory -Force | Out-Null

winget install -e --id Docker.DockerDesktop
winget install -e --id GitHub.cli
winget install -e --id Git.Git
winget install -e --id Microsoft.PowerShell
winget install -e --id Microsoft.VisualStudioCode
winget install -e --id JanDeDobbeleer.OhMyPosh

# gh auth login
# gh repo clone 'https://github.com/robertschaedler3/.config' "$Workspace/.config"

# TODO: git username and email

# TODO: windows terminal config

# TODO: PowerShell config (ohmyposh)

wsl --update
