# Install PS7 and Oh My Posh

## Install OhMyPosh

```ps1
winget install JanDeDobbeleer.OhMyPosh -s winget
```

## Config

```ps1
New-Item -Path $PROFILE -Type File -Force
notepad $PROFILE
```

Inside $PROFILE:

[PowerShell config](https://github.com/Ranieeery/config/blob/main/ps/Microsoft.PowerShell_profile.ps1)  

or

```ps1
oh-my-posh init pwsh | Invoke-Expression
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/pure.omp.json" | Invoke-Expression
```

In terminal:

```ps1
. $PROFILE
```

----------

If script error, open with adm perm and paste

```ps1
Set-ExecutionPolicy RemoteSigned
```

If error continues, paste

```ps1
Install-Module -Name PSReadLine -Force
```
