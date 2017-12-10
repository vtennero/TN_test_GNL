#!/bin/bash

OUI_QUI_LEAKS_LOGS_DIR="oui_qui_leaks_logs"

oui_qui_leaks()
{
	local x=1
	local y=1

clear
echo "$COLOR\0TN_TEST // GET_NEXT_LINE$END"
sleep 1
echo "$COLOR\0Oui qui leaks$END"
echo "$COLOR\0ID = exam ; password = exam$END"

mkdir -p $OUI_QUI_LEAKS_LOGS_DIR

echo "$COLOR\0Compiling with  BUFF_SIZE = 1...$END"
set_buff_and_compile 1 1 leaks file
echo "$COLOR\0Compiling with  BUFF_SIZE = 2...$END"
set_buff_and_compile 2 2 leaks file
echo "$COLOR\0Compiling with  BUFF_SIZE = 5...$END"
set_buff_and_compile 5 3 leaks file
echo "$COLOR\0Compiling with  BUFF_SIZE = 1,000...$END"
set_buff_and_compile 1000 4 leaks file
echo "$COLOR\0Compiling with  BUFF_SIZE = 1,000,000...$END"
set_buff_and_compile 1000000 5 leaks file

while [ $x -le 5 ]
do
	while [ $y -le 15 ]
	do
		kill_all_process $x
		./test_gnl$x tests/ex$y 2>&1 >/dev/null &
		sleep 0.1
		leaks test_gnl$x > $OUI_QUI_LEAKS_LOGS_DIR/test_gnl_$x\_ex$y.txt
		local wiki=$(cat $OUI_QUI_LEAKS_LOGS_DIR/test_gnl_$x\_ex$y.txt | grep "total leaked bytes" | cut -c 15-)
		local nb_leaks=$(echo $wiki | cut -d " " -f1)
		if [ "$nb_leaks" = "0" ]
		then
			printf "$COLOR.$END"
			rm $OUI_QUI_LEAKS_LOGS_DIR/test_gnl_$x\_ex$y.txt
		else
			printf "\ntest_gnl$x, ex$y: \t$wiki"
			say boom
		fi
		sleep 0.1
		let "y++"
	done
	kill_all_process $x
	let "y=1"
	let "x++"
done
echo "$COLOR\n[DONE]$END"
}