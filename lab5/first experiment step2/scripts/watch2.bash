#!/bin/bash
echo "" > first_five2.txt
echo "" > proc_membash2.txt
echo "Time" > mem2.txt
echo "Time" > swap2.txt

while true; do
	proc_exist=$(top -b -n 1 | grep "mem2.bash")
	st=$(echo "$proc_exist" | awk '{print $8}')
	if [[ -z proc_exist || "$st" != "R" ]]; then 
		exit 0
	fi
	mem_and_swap=$(top -b -n1 | head -n5 | tail -n2)
	mem=$(echo "$mem_and_swap" | head -n1)
	swap=$(echo "$mem_and_swap" | tail -n1)
	first_five=$(top -b -n 1 | head -n12 | tail -n5)
	echo -e "\n" >> first_five2.txt
	echo "$first_five" >> first_five2.txt
	proc_exist=$(top -b -n 1 | grep "mem2.bash")
	cur_time=$(echo "$proc_exist" | awk '{print $11}')
	echo "$cur_time $proc_exist" >> proc_membash2.txt
	echo "$cur_time $mem" >> mem2.txt
	echo "$cur_time $swap" >> swap2.txt
	sleep 1
done
