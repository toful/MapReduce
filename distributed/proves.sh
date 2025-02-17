#!/bin/bash

#This script will run automatically 3 server, a registry for this servers and a client in three diferent gnome-terminals with different combinatios of
# wc/cw, number of mappers, and files

nummappers="1 2 4 8"
operation="wc cw"
filename="big.txt pg10.txt pg2000.txt"

for i in $nummappers;
do
	for j in $operation;
	do
		for k in $filename;
		do 
			echo $i $j $k
			echo -e "\nType of execution: Distributed\nFunction Runned: $j\nNumber of mappers: $i\nProcessed File: $k\nTime taken: " >> results.txt

			./run.sh 2000 127.0.0.1 $j $k 127.0.0.1 127.0.0.1 $i
			sleep 20
			process=$(ps au | grep "python" | tr -s ' ' | cut -d ' ' -f2 | tr '\n' ' ')
			for p in $process;
			do
				kill -9 $p
			done
		done
	done
done

exit 0
