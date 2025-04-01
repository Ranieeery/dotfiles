winget install JanDeDobbeleer.OhMyPosh -s winget

New-Item -Path $PROFILE -Type File -Force
notepad $PROFILE

winget install --id Microsoft.Powershell --source winget

winget install Microsoft.PowerToys --source winget

winget install yt-dlp
yt-dlp --update

# Node.js

winget install Schniz.fnm

fnm install --latest
fnm env --use-on-cd | Out-String | Invoke-Expression

# Choco and MPV

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco upgrade chocolatey
choco install mpvio
choco install bitwarden
choco update

# Need to install Python

pip install spotdl
pip install git-filter-repo
## spotdl --cookie-file cookies.txt https://open.spotify.com/playlist/1PuWahEBkGv7us44Anfd76?si=b5371f1301754d63

