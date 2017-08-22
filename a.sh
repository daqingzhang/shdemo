#!/bin/bash

#shell scripts

echo "hello world"
echo "shell name: $0"

cnt=$#
argv1=$1
argv2=$2
argv3=$3

#echo "argv1: $argv1"
#echo "argv2: $argv2"
#echo "argv3: $argv3"

get_param_num()
{
	if [ $cnt -eq 0 ]
	then
		echo "no param"
	else
		echo "$cnt params"
	fi
}

print_param()
{
	local a1=$1
	local a2=$2
	local a3=$3

	if [ $cnt -gt 0 ]
	then
		echo "param 1: $a1"
	fi
	
	if [ $cnt -gt 1 ]
	then
		echo "param 2: $a2"
	fi
	
	if [ $cnt -gt 2 ]
	then
		echo "param 3: $a3"
	fi
}

file_name=""
input_string()
{
	local title=$1

	echo "$title"
	read file_name
	echo "$file_name"
}

create_file()
{
	local fname=$1

	if [ 0 -eq $# ]
	then
		echo "file name is null"
		return 1
	fi

	if [ -f $fname ]
	then
		echo "file exists"
		return 0
	else
#		$(mkdir -p "$fname")
		$(touch "$fname")
		echo "create file $fname"
	fi
}

##### check number of parameters #####
num=$(get_param_num)
echo "param num is: $num"

##### show all paramters #####
print_param $argv1 $argv2 $argv3

##### create a new directory #####
input_string "input file name:"
create_file $file_name

echo "done"
exit 0
