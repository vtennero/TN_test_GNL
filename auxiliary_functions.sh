#!/bin/bash

COLOR='\x1b[38;5;220m'
END='\x1b[0m'

kill_all_process()
{
	c=1
	allPid=$(pgrep test_gnl)
	lines=$(pgrep test_gnl | wc -l)

	while [ $c -le $lines ]
	do
		tmpPid=$(echo $allPid | cut -d " " -f$c)
		kill -PIPE $tmpPid #2>&1 >/dev/null
		let "c++"
	done
}

check_one_valgrind()
{
	#valgrind --leak-check=full --log-file="valgrind_log_$1" ./test_gnl $1
	$HOME/.brew/Cellar/valgrind/3.13.0/bin/valgrind --leak-check=full --log-file="valgrind_log_$2" ./test_gnl $1$2 > /dev/null
	definitely_lb=$(cat valgrind_log_$2 | grep "definitely lost: " | cut -d " " -f7)
	indirectly_lb=$(cat valgrind_log_$2 | grep "indirectly lost: " | cut -d " " -f7)
	if [ "$definitely_lb" = "0" ] && [ "$indirectly_lb" = "0" ]
	then
		echo "OK"
	else
		echo "You lost $definitely_lb bytes definitely and $indirectly_lb bytes indirectly on test $2"
	fi
}

check_valgrind()
{
	version=$(ls $HOME/.brew/Cellar | grep valgrind)
	EXMAX=15
	c=1

	echo $version
	if [ $version ]
	then
		while [ $c -le $EXMAX ]
		do
			check_one_valgrind tests/ ex$c			
			let "c++"
		done
	fi
}
