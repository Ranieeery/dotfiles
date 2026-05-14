git clone --no-local E:/Projects/CloneRepo clonerepo-temp
cd clonerepo-temp

git filter-repo --to-subdirectory-filter NewDirName

cd E:/Projects/MainRepo
git remote add clonerepo ../clonerepo-temp
git fetch clonerepo
git rebase clonerepo/main --allow-unrelated-histories

git remote remove clonerepo
cd ..
rm -r -Force clonerepo-temp

# git push --set-upstream origin main --force