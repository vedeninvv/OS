#!/bin/bash
echo "" > report.log
arr=()
iter=0
while true; do
	arr+=( 1 2 3 4 5 6 7 8 9 10 )
	let iter=iter+1
	if [[ "${#arr[@]}" -ge "$1" ]]; then
		exit 0
	fi
done
