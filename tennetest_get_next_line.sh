#!/bin/bash

COLOR='\x1b[38;5;220m'
END='\x1b[0m'

echo "$COLOR\0Norminette...$END"
norminette | grep Error
echo "$COLOR\0[DONE]$END"

make

counter=1
while [ $counter -le 16 ]
do
	cat /tests/ex$counter > /tests/test$counter
	./test_gnl tests/ex$counter
	diff -u /tests/test$counter /tests/ex$counter > tests/diff_output$counter
	cat tests/diff_output$counter
	let "counter++"
done

echo "$COLOR\0[DONE]$END"

read -p "Press enter to continue..."

echo "$COLOR\0[ALL DONE]$END"
