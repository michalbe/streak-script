#!/bin/bash
source ~/.book-streak-config

total_minutes=0

while read -r line
do
    field1=$(echo $line | awk -F',' '{printf "%s", $1}')
    field2=$(echo $line | awk -F',' '{printf "%s", $2}')
    let "total_minutes += field2"

done < $FILE

hours=$(bc <<< "$total_minutes/60")
minutes=$(bc <<< "$total_minutes%60")

printf "📗 2  🕐 %02dm%02dm\n" $hours $minutes
