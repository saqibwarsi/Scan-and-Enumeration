#!/bin/bash
rm /root/bash-scripts/txt-files/lab/http-servers.txt
for ip in $(cat /root/bash-scripts/txt-files/lab/ip-list.txt)
do

http=`nmap -p 80 $ip | grep -B3 open | grep 80 | awk '{print $1}' | tr '/' ' ' | awk '{print $1}'` 
if [ "$http" == 80 ]; then
      echo "$ip" >> /root/bash-scripts/txt-files/lab/http-servers.txt
fi

done
