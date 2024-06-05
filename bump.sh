currentBranch=$(git rev-parse --abbrev-ref HEAD)
num=$(echo "$currentBranch" | grep -o -E '[0-9]+')
newNum=$(($num + 1))
branchName=${currentBranch/$num/$newNum}
git checkout -b $branchName