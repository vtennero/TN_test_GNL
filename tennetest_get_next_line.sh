#!/bin/bash

COLOR='\x1b[38;5;220m'
END='\x1b[0m'
counter=1

echo "$COLOR\0Norminette...$END"
norminette | grep Error
echo "$COLOR\0[DONE]$END"

make clean
make fclean
make

read -p "Press enter to continue..."

echo "$COLOR\0Setting BUFF_SIZE to 1...$END"
sed -i -e 's/BUFF_SIZE .*/BUFF_SIZE '1'/g' get_next_line.h
counter=1
while [ $counter -le 15 ]
do
	./test_gnl tests/ex$counter > tests/test$counter
	if     [ -n "$(tail -c1 tests/ex$counter)" ]
	then
		perl -pi -e 'chomp if eof' tests/test$counter
	fi
	diff -u tests/test$counter tests/ex$counter > tests/diff_output$counter
	cat -e tests/diff_output$counter
	let "counter++"
done
echo "$COLOR\0[DONE]$END"
read -p "Press enter to continue..."

echo "$COLOR\0Setting BUFF_SIZE to 2...$END"
sed -i -e 's/BUFF_SIZE .*/BUFF_SIZE '2'/g' get_next_line.h
counter=1
while [ $counter -le 15 ]
do
	./test_gnl tests/ex$counter > tests/test$counter
	if     [ -n "$(tail -c1 tests/ex$counter)" ]
	then
		perl -pi -e 'chomp if eof' tests/test$counter
	fi
	diff -u tests/test$counter tests/ex$counter > tests/diff_output$counter
	cat -e tests/diff_output$counter
	let "counter++"
done
echo "$COLOR\0[DONE]$END"
read -p "Press enter to continue..."

echo "$COLOR\0Setting BUFF_SIZE to 5...$END"
sed -i -e 's/BUFF_SIZE .*/BUFF_SIZE '5'/g' get_next_line.h
counter=1
while [ $counter -le 15 ]
do
	./test_gnl tests/ex$counter > tests/test$counter
	if     [ -n "$(tail -c1 tests/ex$counter)" ]
	then
		perl -pi -e 'chomp if eof' tests/test$counter
	fi
	diff -u tests/test$counter tests/ex$counter > tests/diff_output$counter
	cat -e tests/diff_output$counter
	let "counter++"
done
echo "$COLOR\0[DONE]$END"
read -p "Press enter to continue..."

echo "$COLOR\0Setting BUFF_SIZE to 1,000...$END"
sed -i -e 's/BUFF_SIZE .*/BUFF_SIZE '1000'/g' get_next_line.h
counter=1
while [ $counter -le 15 ]
do
	./test_gnl tests/ex$counter > tests/test$counter
	if     [ -n "$(tail -c1 tests/ex$counter)" ]
	then
		perl -pi -e 'chomp if eof' tests/test$counter
	fi
	diff -u tests/test$counter tests/ex$counter > tests/diff_output$counter
	cat -e tests/diff_output$counter
	let "counter++"
done
echo "$COLOR\0[DONE]$END"
read -p "Press enter to continue..."

echo "$COLOR\0Setting BUFF_SIZE to 1,000,000...$END"
sed -i -e 's/BUFF_SIZE .*/BUFF_SIZE '1000000'/g' get_next_line.h
counter=1
while [ $counter -le 15 ]
do
	./test_gnl tests/ex$counter > tests/test$counter
	if     [ -n "$(tail -c1 tests/ex$counter)" ]
	then
		perl -pi -e 'chomp if eof' tests/test$counter
	fi
	diff -u tests/test$counter tests/ex$counter > tests/diff_output$counter
	cat -e tests/diff_output$counter
	let "counter++"
done
echo "$COLOR\0[DONE]$END"
read -p "Press enter to continue..."

echo "$COLOR\0[ALL DONE]$END"
