git rev-parse --git-dir
git subtree split -P "path/here" -b temp-branch
Set-Location "C:\path\to\repo"

git init
git pull "path/here" temp-branch
git remote add origin "linktorepo.git"
git push -u origin main

git branch -D temp-branch

