#!/bin/bash

clr()
{
	rm norminette_log.txt
	rm test_gnl1 test_gnl2 test_gnl3 test_gnl4 test_gnl5
	rm -rf test_gnl1.dSYM test_gnl2.dSYM test_gnl3.dSYM test_gnl4.dSYM test_gnl5.dSYM
	rm -rf tests_output_test_gnl1 tests_output_test_gnl2 tests_output_test_gnl3 tests_output_test_gnl4 tests_output_test_gnl5
	rm -rf valgrind_logs
	rm -rf oui_qui_leaks_logs
}