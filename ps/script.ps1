winget install JanDeDobbeleer.OhMyPosh -s winget

New-Item -Path $PROFILE -Type File -Force
notepad $PROFILE

winget install --id Microsoft.Powershell --source winget
winget install --id Microsoft.Powershell.Preview --source winget

winget install Microsoft.PowerToys --source winget

winget install yt-dlp
yt-dlp --update

# Need to install Node.js (Contains choco)
# installs fnm (Fast Node Manager)
winget install Schniz.fnm

# configure fnm environment
fnm env --use-on-cd | Out-String | Invoke-Expression

# download and install Node.js
fnm use --install-if-missing 22

# verifies the right Node.js version is in the environment
node -v # should print `v22.11.0`

# verifies the right npm version is in the environment
npm -v # should print `10.9.0`

choco upgrade chocolatey
choco install mpv
choco update

# Need to install Python

pip install spotdl
## spotdl --cookie-file cookies.txt https://open.spotify.com/playlist/1PuWahEBkGv7us44Anfd76?si=b5371f1301754d63

