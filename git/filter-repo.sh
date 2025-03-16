git rev-parse --git-dir
git subtree split -P "path/here" -b temp-branch

mkdir -p "/path/to/repo"
cd "/path/to/repo"

git init
git pull "path/here" temp-branch
git remote add origin "linktorepo.git"
git push -u origin main

cd "original/path"
git branch -D temp-branch

git filter-repo --invert-paths --path "path/here"
git push origin --force