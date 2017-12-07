#!/bin/bash

kill_all_process()
{
	local c=1
	local allPid=$(pgrep test_gnl$1)
	local lines=$(pgrep test_gnl$1 | wc -l)

	while [ $c -le $lines ]
	do
		local tmpPid=$(echo $allPid | cut -d " " -f$c)
		kill -PIPE $tmpPid #2>&1 >/dev/null
		let "c++"
	done
}

leaks_tests()
{
local x=1
local y=1

clear
echo "$COLOR\0TN_TEST // GET_NEXT_LINE$END"
sleep 1
echo "$COLOR\0Checking Memory leaks...$END"

#check_valgrind 5 15
oui_qui_leaks

echo "$COLOR\0Memory Leaks [ALL DONE]$END"
}