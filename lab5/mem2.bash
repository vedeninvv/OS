#!/bin/bash
echo "" > report2.log
arr=()
iter=0
while true; do
	arr+=( 1 2 3 4 5 6 7 8 9 10 )
	let iter=iter+1
	if [[ $(($iter % 100000)) -eq 0 ]]
	then
		echo "${#arr[@]}" >> report2.log
	fi
done
