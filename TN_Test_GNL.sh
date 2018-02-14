#!/bin/bash

TESTS_ABSOLUTE_PATH="tests"
COLOR='\x1b[38;5;220m'
END='\x1b[0m'
source resources/general_tests.sh
source resources/leaks_tests.sh
source resources/valgrind.sh
source resources/oui_qui_leaks.sh
source resources/stdin_tests.sh
source resources/norme.sh
source resources/clr.sh

sh resources/animation.sh

echo "$COLOR\0TN_TEST // GET_NEXT_LINE$END"
sleep 1
clr
echo "$COLOR\0Norminette...$END"
norm
echo "$COLOR\0[DONE]$END"
read -p "Press enter to continue..."

general_tests
read -p "Press enter to continue..."
stdin_tests
read -p "Press enter to continue..."
leaks_tests

echo "$COLOR\0[ALL DONE]$END"
