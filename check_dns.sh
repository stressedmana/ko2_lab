#!/bin/bash

RED="\e[1;31m"
GREEN="\e[1;32m"
ENDCOLOR="\e[0m"

echo "Checking reverse DNS entry"
echo "-----------------------------------------------------------------------------------------------------------------------------------"
for i in `cat ./check_dns | awk '{print $1}'`
do DNS=`nslookup $i`;
	if [ $? -eq 0 ] 
		then
	echo -e $DNS "${GREEN}OK${ENDCOLOR}" 
		else
	echo -e $i "${RED}KO${ENDCOLOR}" >&2
	fi
done

echo ""

echo "Checking DNS entry"
echo "----------------------------------------------------------------------------------------------------------------------------------"
for i in `cat ./check_dns | awk '{print $2}'`
do DNS=`nslookup $i`;
	if [ $? -eq 0 ] 
		then
	echo -e $DNS "${GREEN}OK${ENDCOLOR}" 
		else
	echo -e $i "${RED}KO${ENDCOLOR}" >&2
	fi
done
