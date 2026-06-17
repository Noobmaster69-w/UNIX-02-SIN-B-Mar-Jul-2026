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

sed '1d' log.txt

sed '$d' log.txt > newlog1.txt

sed '5,7d' log.txt

sed -n '2,15 p' log.txt

sed -i '1d' log.txt

# Delete the first line of the file permanently 
sed -i '1d' log.txt


sleep 100 &
ps -ef | grep sleep
# RESULT:
# Container Entrypoint (PID 1): The master process keeping your environment alive using an infinite loop
# root           1       0  0 12:00 ?        00:00:01 /bin/sh -c echo Container started trap "exit 0" 15  exec "$@" while sleep 1 & wait $!; do :; done -

# First Background Execution: Your first manual 'sleep 100' instance running on terminal pts/1
# root       29671     528  0 13:10 pts/1    00:00:00 sleep 100

# Second Background Execution: Your second manual 'sleep 100' instance, also spawned by terminal shell 528
# root       30144     528  0 13:11 pts/1    00:00:00 sleep 100

# Container Heartbeat Loop: The internal transient sleep instruction triggered automatically by PID 1
# root       30310       1  0 13:11 ?        00:00:00 sleep 1

# Volatile Filter Runtime: The temporary process generated explicitly to execute your grep search string
# root       30326     528  0 13:11 pts/1    00:00:00 grep sleep
jobs
#RESULT:

# Job [1]: The first background job has completed its execution successfully (Done)
# [1]-  Done                        sleep 100

# Job [2]: The second background job has also finished its execution cycle (Done)
# [2]+  Done                        sleep 100

fg %1
#RESULT:
# Terminal Output: Shows that 'sleep 100' is now actively running in the foreground, hijacking your terminal prompt
# sleep 100

# User Input (Ctrl + Z): You pressed Ctrl + Z to send a SIGTSTP (Terminal Stop) signal to the running process
# ^Z

# Terminal Output: The shell catches the signal, pauses the execution of job [1], and returns control of the prompt to you
# [1]+  Stopped                     sleep 100

bg %1
#RESULT:
# Terminal Notification 1: Confirms the job has been resumed and sent to the background (&)
# [1]+ sleep 100 &

# Terminal Notification 2: Asynchronous report stating that job number 1 has finished executing (Done)
# [1]+  Done                        sleep 100

nohup ./exercise2.sh &
chmod +x exercise2.sh
#RESULT:
# Shell Tracking Info: [1] is the background job ID, and 36679 is the actual system Process ID (PID)
# [1] 36679
# Standard Nohup Broadcast: Informational message confirming stdout/stderr redirection
# nohup: ignoring input and appending output to 'nohup.out'

