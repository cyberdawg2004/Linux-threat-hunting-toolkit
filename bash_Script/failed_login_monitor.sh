#!/bin/bash

echo "Monitoring Failed SSH Login Attempts..."

#Define output log file
LOGFILE="../failed_login_report.txt"

#Create header
echo "Failed SSH Login Report - $(date)" > $LOGFILE

#Parse /var/log/auth.log for failed logins 
grep "Failed password" /var/log/auth.log | awk '{print $(NF)}' | sort | uniq -c | sort -nr >> $LOGFILE

#Show suspicious IPs with number of attempts
echo -e "\nTop offenders: "
awk '{print $2 " - " $1 " attempts"}' $LOGFILE | head

echo -e "\nLog saved to $LOGFILE"
