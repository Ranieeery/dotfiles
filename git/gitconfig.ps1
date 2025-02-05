winget install --id Git.Git -e --source winget

git config --global user.name "Ranieeery"
git config --global user.email "raniery2003@hotmail.com"
git config --global init.defaultBranch main

ssh-keygen -t ed25519 -C "raniery2003@hotmail.com"
Get-Service -Name ssh-agent | Set-Service -StartupType Manual 
Start-Service ssh-agent
Get-Content ~/.ssh/id_ed25519.pub | clip

# Get-Service -Name ssh-agent | Select-Object StartType
