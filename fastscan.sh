#!/bin/bash
rm /root/bash-scripts/txt-files/lab/fastscan/10*.txt
for ip in $(cat /root/bash-scripts/txt-files/lab/ip-list.txt)
do
   echo "Working on $ip" >> /root/bash-scripts/txt-files/lab/fastscan/$ip.txt
   echo "-----------------------" >> /root/bash-scripts/txt-files/lab/fastscan/$ip.txt

   echo "Standard Results with OS" >> /root/bash-scripts/txt-files/lab/fastscan/$ip.txt
   echo "----------------"  >> /root/bash-scripts/txt-files/lab/fastscan/$ip.txt
   nmap -sT -A $ip | grep -v "7.25BETA2" | grep -v "Nmap done:" >> /root/bash-scripts/txt-files/lab/fastscan/$ip.txt
   echo "---------------------------------------"  >> /root/bash-scripts/txt-files/lab/fastscan/$ip.txt
  
   echo "Software Versions" >> /root/bash-scripts/txt-files/lab/fastscan/$ip.txt
   echo "----------------"  >> /root/bash-scripts/txt-files/lab/fastscan/$ip.txt
   nmap $ip -sV  | grep -v "7.25BETA2" | grep -v "Nmap done:" >> /root/bash-scripts/txt-files/lab/fastscan/$ip.txt
   echo "---------------------------------------"  >> /root/bash-scripts/txt-files/lab/fastscan/$ip.txt
   
echo "=================================================================================================================" >> /root/bash-scripts/txt-files/lab/fastscan/$ip.txt

done

