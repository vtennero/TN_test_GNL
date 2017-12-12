#!/bin/bash

norm()
{
	norminette get_next_line.c get_next_line.h libft/ > norminette_log.txt
	local currentErrorLine
	local previousErrorLine=-100
	local TOTAL_ERR=$(cat norminette_log.txt | grep 'Warning\|Error' | grep -v 'Not a valid file' | wc -l)
	local i=1

	while [ $i -le "$TOTAL_ERR" ]
	do
		currentErrorLine=$(cat -n norminette_log.txt | grep 'Warning\|Error' | grep -v 'Not a valid file' | head -n $i | cut -d $'\t' -f1)
		currentErrorLine=$(echo $currentErrorLine | cut -d " " -f$i)
		if [ $(($previousErrorLine + 1)) != $currentErrorLine ]
		then
			sed "$((${currentErrorLine} - 1))q;d" norminette_log.txt
		fi
		sed "${currentErrorLine}q;d" norminette_log.txt
		previousErrorLine=$currentErrorLine
		let "i++"
	done
}