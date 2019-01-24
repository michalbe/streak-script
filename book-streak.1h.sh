#!/bin/bash
source ~/.book-streak-config
today=`date +%d.%m.%Y`

all_days=()
total_minutes=0
streak=0

while read -r line
do
    field1=$(echo $line | awk -F',' '{printf "%s", $1}')
    field2=$(echo $line | awk -F',' '{printf "%s", $2}')
    let "total_minutes += field2"
    all_days+=($field1)

done < $FILE

# calculating streak
while true
do
if [[ " ${all_days[@]} " =~ " ${today} " ]];
    then
        let "streak+=1"
        today=`date -v-${streak}d +%d.%m.%Y`
    else
        break;
fi
done



hours=$(bc <<< "$total_minutes/60")
minutes=$(bc <<< "$total_minutes%60")

printf "📗 ${streak}  🕐 %02d:%02d\n" $hours $minutes
