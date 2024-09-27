currentBranch=$(git rev-parse --abbrev-ref HEAD)
num=$(echo "$currentBranch" | grep -o -E '[0-9]+')
branchName=${currentBranch/$num/pr}
git checkout -b $branchName
git rebase HEAD~50 --autosquash
git fetch vlot
git rebase vlot/master
git push