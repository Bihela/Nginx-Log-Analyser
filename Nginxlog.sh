#!/bin/bash

Input_file="access.log"

echo "Top 5 IP addresses with the most requests:"
echo " "

TopIPcount=$(grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' ${Input_file} | sort | uniq -c | sort -rn | head -5 | awk '{print $2, $1 " - requests"}')
echo -e "${TopIPcount}"

echo " "
echo "Top 5 most requested paths"
echo " "
Toppath=$(awk '{print $7}' ${Input_file} | sort | uniq -c | sort -rn | head -5 | awk '{print $2, $1 " - requests"}')
echo -e "${Toppath}"

echo " "
echo "Top 5 response status code"
echo " "
TopR=$(awk '{print $9}' ${Input_file} | sort | uniq -c | sort -rn | head -5 | awk '{print $2, $1 " - requests"}')
echo -e "${TopR}"

exit 1
