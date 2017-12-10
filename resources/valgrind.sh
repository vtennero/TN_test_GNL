#!/bin/bash

VALGRIND_LOGS_DIR="valgrind_logs"
VALGRIND_LOGS_FILENAME="vlg_"

check_one_valgrind()
{
	local STORAGE_PATH=$VALGRIND_LOGS_DIR"/"$VALGRIND_LOGS_FILENAME"_buf"$2"_ex"$1
	local TESTS_PATH=$TESTS_ABSOLUTE_PATH/ex$1

	$HOME/.brew/Cellar/valgrind/3.13.0/bin/valgrind --leak-check=full --log-file="$STORAGE_PATH" ./test_gnl$2 $TESTS_PATH > /dev/null
	local definitely_lb=$(cat $STORAGE_PATH | grep "definitely lost: " | cut -d " " -f7)
	local indirectly_lb=$(cat $STORAGE_PATH | grep "indirectly lost: " | cut -d " " -f7)
	if [ "$definitely_lb" != "0" ] || [ "$indirectly_lb" != "0" ]
	then
		printf "\ntest_gnl$2, ex$1: \t$definitely_lb bytes definitely lost, $indirectly_lb bytes indirectly lost"
		say boom
	else
		printf "$COLOR.$END"
	fi
}

compile_valgrind()
{
	echo "$COLOR\0Compiling with  BUFF_SIZE = 1...$END"
	set_buff_and_compile 1 1 unitest $1
	echo "$COLOR\0Compiling with  BUFF_SIZE = 2...$END"
	set_buff_and_compile 2 2 unitest $1
	echo "$COLOR\0Compiling with  BUFF_SIZE = 5...$END"
	set_buff_and_compile 5 3 unitest $1
	echo "$COLOR\0Compiling with  BUFF_SIZE = 1,000...$END"
	set_buff_and_compile 1000 4 unitest $1
	echo "$COLOR\0Compiling with  BUFF_SIZE = 1,000,000...$END"
	set_buff_and_compile 1000000 5 unitest $1
}

check_valgrind()
{
	local VERSION=$(ls $HOME/.brew/Cellar | grep valgrind)
	local c=1
	local i=1

	echo "$COLOR\0Valgrind - '$3' output$END"
	if [ $VERSION ]
	then
		rm -rf $VALGRIND_LOGS_DIR
		mkdir -p $VALGRIND_LOGS_DIR
		compile_valgrind $3

		while [ $i -le $1 ]
		do
			while [ $c -le $2 ]
			do
				check_one_valgrind $c $i
				let "c++"
			done
			c=1
			let "i++"
		done
	fi
	rm -rf test_gnl$i.dSYM
	echo "$COLOR\n[DONE]$END"
}