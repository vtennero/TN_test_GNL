#!/bin/bash

general_tests()
{
	local test_counter=1

clear
echo "$COLOR\0TN_TEST // GET_NEXT_LINE$END"
sleep 1
echo "$COLOR\0Beginning General Tests$END"
echo "$COLOR\0Compiling with  BUFF_SIZE = 1...$END"
set_buff_and_compile 1 1 0
echo "$COLOR\0Compiling with  BUFF_SIZE = 2...$END"
set_buff_and_compile 2 2 0
echo "$COLOR\0Compiling with  BUFF_SIZE = 5...$END"
set_buff_and_compile 5 3 0
echo "$COLOR\0Compiling with  BUFF_SIZE = 1,000...$END"
set_buff_and_compile 1000 4 0
echo "$COLOR\0Compiling with  BUFF_SIZE = 1,000,000...$END"
set_buff_and_compile 1000000 5 0

while [ $test_counter -le 5 ]
do
	run_tests $test_counter
	let "test_counter++"
done
let "test_counter=1"
echo "$COLOR\0General Tests [ALL DONE]$END"
}

set_buff_and_compile()
{
	sed -i -e 's/BUFF_SIZE .*/BUFF_SIZE '$1'/g' get_next_line.h
	if [ $3 = "leaks" ]
	then
		cp makefiles/Makefile_leaks ./Makefile
	else
		cp makefiles/Makefile_unitests ./Makefile
	fi
	sed -i -e 's/test_gnl.*/test_gnl'$2'/g' Makefile
	make re
}

run_tests()
{
	local b=1
	
	mkdir -p tests$1
	#echo Running test_gnl$1...
	while [ $b -le 15 ]
	do
		#echo ex$b
		./test_gnl$1 tests/ex$b > tests$1/test$b
		if [ -n "$(tail -c1 tests/ex$b)" ]
		then
			perl -pi -e 'chomp if eof' tests$1/test$b
		fi
		diff -u tests$1/test$b tests/ex$b > tests$1/diff_output$b
		cat -e tests$1/diff_output$b
		let "b++"
	done
	echo "$COLOR\0[DONE]$END"
}