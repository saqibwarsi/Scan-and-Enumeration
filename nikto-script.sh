#!/bin/bash
rm /root/bash-scripts/txt-files/lab/nikto/nikto-*.txt
for ip in $(cat /root/bash-scripts/txt-files/lab/http-servers.txt)
do
   nikto -host $ip | grep -v Target | grep -v tested  >> /root/bash-scripts/txt-files/lab/nikto/nikto-$ip.txt
   echo "=========================================================================================" >> /root/bash-scripts/txt-files/lab/nikto/nikto-$ip.txt
done
