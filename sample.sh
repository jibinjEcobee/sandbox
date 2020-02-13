# !/bin/bash

function get_delta_seconds(){
  start_time=$1
  now=$(date +%s)
  delta=$(($now - $start_time))
  return $delta
}

function get_avg(){
lst=$1
for i in "${lst[@]}"
do
  echo $i
done
}

get_avg (1, 1, 2, 3, 4, 4)
get_delta_seconds 0
