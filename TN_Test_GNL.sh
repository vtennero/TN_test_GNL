#!/bin/bash

TESTS_ABSOLUTE_PATH="tests"
COLOR='\x1b[38;5;220m'
END='\x1b[0m'
source resources/general_tests.sh
source resources/leaks_tests.sh
source resources/valgrind.sh
source resources/oui_qui_leaks.sh

sh animation.sh

echo "$COLOR\0TN_TEST // GET_NEXT_LINE$END"
sleep 1
echo "$COLOR\0Norminette...$END"
#norminette | grep Error > norminette_log.txt
echo "$COLOR\0[DONE]$END"
#read -p "Press enter to continue..."

#general_tests
leaks_tests

echo "$COLOR\0[ALL DONE]$END"