# .config

```PowerShell
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process
Invoke-WebRequest 'https://raw.githubusercontent.com/robertschaedler3/.config/refs/heads/main/setup.ps1' -OutFile "$env:TEMP\setup.ps1"
& "$env:TEMP\setup.ps1"
```
