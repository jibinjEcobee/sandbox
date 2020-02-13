# !/bin/bash

latestTag="$(git describe --tags --abbrev=0)"

for commit in $(git rev-list --first-parent $latestTag..HEAD)
do
commitDate=$(git --no-pager show -s --format=%ct $commit)
currentDate=$(date +%s)
echo "$commit $((($currentDate - $commitDate)/60))"
done