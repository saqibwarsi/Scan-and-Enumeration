#!/bin/bash
rm /root/bash-scripts/txt-files/lab/fullscan/10*.txt
for ip in $(cat /root/bash-scripts/txt-files/lab/ip-list.txt)
do
   echo "Working on $ip" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "-----------------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt

   echo "Standard Results with OS" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "----------------"  >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   nmap -sTU -A $ip | grep -v "7.25BETA2" | grep -v "Nmap done:" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------------------------------"  >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
  
   echo "Software Versions" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "----------------"  >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   nmap $ip -p- -sV  | grep -v "7.25BETA2" | grep -v "Nmap done:" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------------------------------"  >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt

   echo "SMB Enumeration" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   nmap -sT --script=smb-vuln* $ip | grep -v "7.25BETA2" | grep -v "Nmap done:" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   nmap -sT --script=smb-system-info.nse $ip | grep -v "7.25BETA2" | grep -v "Nmap done:" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------------------------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt

   echo "HTTP Enumeration" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "----------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   nmap -sT --script=http-vuln* $ip | grep -v "7.25BETA2" | grep -v "Nmap done:" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------------------------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   
   echo "Curl Ouput" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "--------------"  >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   curl -i -L $ip | grep "title\|href" | sed -e 's/^[[:space:]]*//'
   echo "-----------------------------------------"  >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt

   echo "Gobuster Results" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "----------------"  >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "Web Contents" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "-------------"  >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   gobuster -u http://$ip/ -w /usr/share/seclists/Discovery/Web_Content/common.txt -s '200,204,301,302,307,403,500' -e | grep -v "Gobuster" | grep -v "[+]" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------------------------------"  >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "CGI Results" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "-----------"  >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   gobuster -u http://$ip/ -w /usr/share/seclists/Discovery/Web_Content/cgis.txt -s '200,204,403,500' -e | grep -v "Gobuster" | grep -v "[+]" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------------------------------"  >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt

   echo "RDP Enumeration" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   nmap -sT --script=rdp* $ip | grep -v "7.25BETA2" | grep -v "Nmap done:" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------------------------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
  
   echo "FTP Enumeration" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   nmap -sT --script=ftp-anon.nse $ip | grep -v "7.25BETA2" | grep -v "Nmap done:" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   nmap -sT --script=ftp-vuln* $ip | grep -v "7.25BETA2" | grep -v "Nmap done:" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------------------------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   
   echo "POP3 Enumeration" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "----------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   nmap -sT --script=pop3-* $ip | grep -v "7.25BETA2" | grep -v "Nmap done:" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------------------------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
  
   echo "mysql Enumeration" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "-----------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   nmap -sT --script=mysql* $ip | grep -v "7.25BETA2" | grep -v "Nmap done:" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------------------------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
 
   echo "ms-sql Enumeration" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "------------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   nmap -sT --script=ms-sql* $ip | grep -v "7.25BETA2" | grep -v "Nmap done:" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------------------------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
 
   echo "RPC Enumeration" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   nmap -sT --script=rpcinfo.nse $ip | grep -v "7.25BETA2" | grep -v "Nmap done:" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   nmap -sT --script=rpc* $ip | grep -v "7.25BETA2" | grep -v "Nmap done:" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------------------------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt

   echo "Oracle Enumeration" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "-----------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   nmap -sT --script=oracle* $ip | grep -v "7.25BETA2" | grep -v "Nmap done:" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------------------------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt

   echo "DNS Enumeration" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   nmap -sT --script=dns* $ip | grep -v "7.25BETA2" | grep -v "Nmap done:" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------------------------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt

   echo "NFS Enumeration" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   nmap -sT --script=nfs* $ip | grep -v "7.25BETA2" | grep -v "Nmap done:" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------------------------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt

   echo "SMTP Enumeration" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "-----------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   nmap -sT --script=smtp-enum-users.nse $ip | grep -v "7.25BETA2" | grep -v "Nmap done:" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   nmap -sT --script=smtp-vuln* $ip | grep -v "7.25BETA2" | grep -v "Nmap done:" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------------------------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt

   echo "SSH Enumeration" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   nmap -sT --script=ssh* $ip | grep -v "7.25BETA2" | grep -v "Nmap done:" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------------------------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt

   echo "IRC Enumeration" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   nmap -sT --script=irc* $ip | grep -v "7.25BETA2" | grep -v "Nmap done:" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------------------------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt

   echo "LDAP Enumeration" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   nmap -sT --script=ldap* $ip | grep -v "7.25BETA2" | grep -v "Nmap done:" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------------------------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt

   echo "McAfee Enumeration" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   nmap -sT --script=mcaf* $ip | grep -v "7.25BETA2" | grep -v "Nmap done:" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------------------------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt

   echo "MongoDB Enumeration" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   nmap -sT --script=mongo* $ip | grep -v "7.25BETA2" | grep -v "Nmap done:" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------------------------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt

   echo "MS RPC Enumeration" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   nmap -sT --script=msrpc* $ip | grep -v "7.25BETA2" | grep -v "Nmap done:" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------------------------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
  
   echo "NTP Enumeration" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   nmap -sT --script=ntp* $ip | grep -v "7.25BETA2" | grep -v "Nmap done:" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------------------------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt

   echo "SSL Enumeration" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   nmap -sT --script=ssl* $ip | grep -v "7.25BETA2" | grep -v "Nmap done:" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------------------------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
  
   echo "XMAP Enumeration" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   nmap -sT --script=xmap* $ip | grep -v "7.25BETA2" | grep -v "Nmap done:" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------------------------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt

   echo "SNMP Enumeration" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   nmap -sT --script=snmp* $ip | grep -v "7.25BETA2" | grep -v "Nmap done:" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------------------------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt

   echo "VNC Enumeration" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "---------------" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   nmap -sT --script=vnc* $ip | grep -v "7.25BETA2" | grep -v "Nmap done:" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt
   echo "=================================================================================================================" >> /root/bash-scripts/txt-files/lab/fullscan/$ip-full.txt

done

