#!/bin/bash
if [[ $# -eq 0 ]]
then 
	echo "Missing options!"
	echo "(run $0 -h for help)"
	echo " "
	exit 0
fi

while getopts c:w:th OPTION; do
	case $OPTION in

		c)
			torsocks curl -s -4 $OPTARG
			;;

		w)
			torsocks wget $OPTARG 
			;;

		t)
			ip=$(torsocks curl -s icanhazip.com)
			ip2=$(curl -4 -s icanhazip.com)
			echo "Your ip before torsocks is: $ip2 and after torsocks is: $ip" 
			;;

		h)
			echo "Usage:"
			echo "BenTor.sh -c to run with the curl command"
			echo "BenTor.sh -w to run with the wget command"
			echo "BenTor.sh -t to display your ip address before an after activating torsocks"
			;;
	esac
done
