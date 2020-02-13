# !/bin/bash

function floatCalculator(){
  echo $(bc -l <<< "scale=2; $@")
}

latestTag="$(git describe --tags --abbrev=0)"
allCommitsSinceTag=$(git rev-list --first-parent $latestTag..HEAD)
currentDate=$(date +%s)
avg=0
count=0

for commit in $allCommitsSinceTag
do
commitDate=$(git --no-pager show -s --format=%ct $commit)
delta=$(floatCalculator $(floatCalculator $currentDate-$commitDate)/60)
avg=$(floatCalculator $avg + $delta)
count=$(($count + 1))
echo $commit $delta mins ";" $avg
done

echo "avg lead time for $latestTag =" $(floatCalculator $avg/$count) "mins"
