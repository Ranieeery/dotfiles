git rev-parse --git-dir
git subtree split -P "path/here" -b temp-branch
New-Item "C:\path\to\repo"
Set-Location "C:\path\to\repo"

git init
git pull "path/here" temp-branch
git remote add origin "linktorepo.git"
git push -u origin main

Set-Location "firstpath"
git branch -D temp-branch

git filter-repo --invert-paths --path "path/here"
git push origin --force

# git push --set-upstream origin main --force