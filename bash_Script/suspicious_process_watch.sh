#!/bin/bash

echo "Watching suspicious processes..."
LOGFILE="../suspicious_process_log.txt"
echo "Suspicious Process Log -$(date)" > $LOGFILE

#List of suspicious names
SUS_PROCS=("nc" "netcat" "bash" "sh" "ncat" "python" "perl" "nmap" "reverse")

#loop thriugh all running processes
for procs in "${SUS_PROCS[@]}"
do
	echo -e "\nChecking for: $procs" >> "$LOGFILE"
	pgrep -laf "$procs" >> "$LOGFILE"
done

echo -e "\nScan Complete. Check $LOGFILE for anything sketchy." | tee -a "$LOGFILE"
