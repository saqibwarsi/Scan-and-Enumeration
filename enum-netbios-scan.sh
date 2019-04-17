#!/bin/bash
rm /root/bash-scripts/txt-files/lab/enum4linux-*.txt
count=`cat /root/bash-scripts/txt-files/lab/nmap-win-servers.txt | grep -v "host down" | grep -B8 "Windows " | grep 'scan report' | awk '{print $5}' | wc -l`
for ((i=1; i<=count; i++))
do
ip=`cat /root/bash-scripts/txt-files/lab/nmap-win-servers.txt | grep -v "host down" | grep -B8 "Windows " | grep 'scan report' | awk '{print $5}' | head -$i | tail -1`
echo "ENUM4Linux Output" >> /root/bash-scripts/txt-files/enum4linux-$ip.txt
echo "==========================================================================" >> /root/bash-scripts/txt-files/enum4linux-$ip.txt
echo "Working on $ip" >> /root/bash-scripts/txt-files/enum4linux-$ip.txt
echo "========================" >> /root/bash-scripts/txt-files/enum4linux-$ip.txt
enum4linux4linux -a $ip >> /root/bash-scripts/txt-files/enum-$ip.txt
echo "======================================================================================================" >> /root/bash-scripts/txt-files/enum4linux-$ip.txt
echo "NetBIOS Output" >> /root/bash-scripts/txt-files/enum4linux-$ip.txt
echo "==============" >> /root/bash-scripts/txt-files/enum4linux-$ip.txt
nbtscan -r $ip >> /root/bash-scripts/txt-files/enum4linux-$ip.txt
echo "======================================================================================================" >> /root/bash-scripts/txt-files/enum4linux-$ip.txt
done
