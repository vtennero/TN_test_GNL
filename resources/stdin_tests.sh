#!/bin/bash

stdin_tests()
{
	local test_counter=1

clear
echo "$COLOR\0TN_TEST // GET_NEXT_LINE$END"
sleep 1
echo "$COLOR\0Beginning Stdin Tests$END"
echo "$COLOR\0Compiling with  BUFF_SIZE = 1...$END"
set_buff_and_compile 1 1 unitest stdin
echo "$COLOR\0Compiling with  BUFF_SIZE = 2...$END"
set_buff_and_compile 2 2 unitest stdin
echo "$COLOR\0Compiling with  BUFF_SIZE = 5...$END"
set_buff_and_compile 5 3 unitest stdin
echo "$COLOR\0Compiling with  BUFF_SIZE = 1,000...$END"
set_buff_and_compile 1000 4 unitest stdin
echo "$COLOR\0Compiling with  BUFF_SIZE = 1,000,000...$END"
set_buff_and_compile 1000000 5 unitest stdin

while [ $test_counter -le 5 ]
do
	run_stdin_tests $test_counter
	let "test_counter++"
done
let "test_counter=1"
echo "$COLOR\0General Tests [ALL DONE]$END"
}

run_stdin_tests()
{
	local b=1

	mkdir -p tests_output_test_gnl$1
	while [ $b -le 15 ]
	do
		./test_gnl$1 < tests/ex$b > tests_output_test_gnl$1/output_ex$b
		if [ -n "$(tail -c1 tests/ex$b)" ]
		then
			perl -pi -e 'chomp if eof' tests_output_test_gnl$1/output_ex$b
		fi
		diff -u tests_output_test_gnl$1/output_ex$b tests/ex$b > tests_output_test_gnl$1/diff_output_ex$b
		if [ -s tests_output_test_gnl$1/diff_output_ex$b ]
		then
			printf "\ntest_gnl$1, ex$b: BOOM"
			say boom
		else
			printf "$COLOR.$END"
			rm tests_output_test_gnl$1/diff_output_ex$b
			rm tests_output_test_gnl$1/output_ex$b
		fi
		let "b++"
	done
	echo "$COLOR\n[DONE]$END"
}
