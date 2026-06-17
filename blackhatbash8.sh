#!/bin/bash/

awk '{print $1}' log.txt

awk '{print $1,$2,$3}' log.txt # We tested each one, 1, 2 and 3

awk '{print $1,$NF}' log.txt # We tested just $NF

awk -F',' '{print $1}' example_csv.txt # We added $2

awk 'NR < 10' log.txt

grep "42.236.10.117" log.txt | awk '{print $7}'

sed 's/Mozilla/Godzilla/g' log.txt 

sed 's/Mozilla/Godzilla/g' log.txt > newlog.txt

#Testing
#Extract the word "Mozilla" from the old file, "Godzilla" from the new file, and merge the columns
paste <(grep -o "Mozilla" log.txt) <(grep -o "Godzilla" newlog.txt)

sed 's/ //g' log.txt > newlog1.txt

cat newlog1.txt




