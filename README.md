# .config

## Windows

```PowerShell
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process
$Setup = "$env:TEMP\setup.ps1"
Invoke-WebRequest 'https://raw.githubusercontent.com/robertschaedler3/.config/refs/heads/main/setup.ps1' -OutFile $Setup
& $Setup
Remove-Item $Setup
```

## Linux

```bash
curl -sS https://raw.githubusercontent.com/robertschaedler3/.config/refs/heads/main/setup.sh | bash
```