#!/bin/bash

COLOR='\x1b[38;5;220m'
END='\x1b[0m'
counter=1
RUN='sh auxiliary_commands.sh'
source auxiliary_functions.sh

echo "$COLOR\0TN_TEST // GET_NEXT_LINE$END"
sleep 1
echo "$COLOR\0Norminette...$END"
#norminette | grep Error > norminette_log.txt
echo "$COLOR\0[DONE]$END"
#read -p "Press enter to continue..."

echo "$COLOR\0Beginning General Tests$END"
echo "$COLOR\tSetting BUFF_SIZE to 1...$END"
sed -i -e 's/BUFF_SIZE .*/BUFF_SIZE '1'/g' get_next_line.h
$RUN

echo "$COLOR\tSetting BUFF_SIZE to 2...$END"
sed -i -e 's/BUFF_SIZE .*/BUFF_SIZE '2'/g' get_next_line.h
$RUN

echo "$COLOR\tSetting BUFF_SIZE to 5...$END"
sed -i -e 's/BUFF_SIZE .*/BUFF_SIZE '5'/g' get_next_line.h
$RUN

echo "$COLOR\tSetting BUFF_SIZE to 1,000...$END"
sed -i -e 's/BUFF_SIZE .*/BUFF_SIZE '1000'/g' get_next_line.h
$RUN

echo "$COLOR\tSetting BUFF_SIZE to 1,000,000...$END"
sed -i -e 's/BUFF_SIZE .*/BUFF_SIZE '1000000'/g' get_next_line.h
$RUN

echo "$COLOR\0General Tests [ALL DONE]$END"

echo "$COLOR\0Beginning Memory Leaks Tests$END"
echo "$COLOR\0Valgrind$END"
check_valgrind

echo "$COLOR\0Oui qui leaks$END"
sed -i -- 's/main.c/main_leaks.c/g' Makefile
sed -i -- 's/main.o/main_leaks.o/g' Makefile
make re
rm Makefile--
mkdir leaks_tests

while [ $counter -le 15 ]
do
	kill_all_process
	./test_gnl tests/ex$counter 2>&1 >/dev/null &
	sleep 1
	leaks test_gnl > leaks_tests/ex$counter.txt
	cat leaks_tests/ex$counter.txt | grep total\ leaked\ bytes | cut -d " " -f3
	sleep 1
	#kill | pgrep test_gnl
	#kill $! 2>/dev/null && echo "$COLOR\0[DONE]$END"
	let "counter++"
done
sed -i -- 's/main_leaks.c/main.c/g' Makefile
sed -i -- 's/main_leaks.o/main.o/g' Makefile
rm Makefile--
echo "$COLOR\0Memory Leaks [ALL DONE]$END"
echo "$COLOR\0[ALL DONE]$END"
