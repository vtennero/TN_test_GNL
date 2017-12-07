#!/bin/bash

COLOR='\x1b[38;5;220m'
END='\x1b[0m'
counter=1

make re
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
echo "$COLOR\t[DONE]$END"
#read -p "Press enter to continue..."
