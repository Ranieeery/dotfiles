function gitcmain() {
  local branch=$(git rev-parse --abbrev-ref HEAD)

  if [[ "$branch" == "main" ]]; then
    echo "Already in 'main'"
    return 1
  fi

  git checkout main && git pull && git branch -d $branch
}
