#!/bin/bash

echo "Scanning Open Ports..."
LOGFILE="../port_scan_report.txt"
echo "Port Scan Log - $(date)" > "$LOGFILE"

#Known suspicious ports
SUS_PORTS=("31337" "6666" "4444" "1337" "12345")

#Get all open ports and services
ss -tuln | awk 'NR>1 {print $1, $5}' >> "$LOGFILE"

#Highlight suspicious ports
echo -e "\nSuspicious Ports Found:" >> "$LOGFILE"

for port in "${SUS_PORTS[@]}"
do
	if ss -tuln | grep -q ":$port"; then
		echo "Port $port is OPEN - Possible backdoor" >> "$LOGFILE"
	fi
done

echo -e "\nScan Complete. Report saved to $LOGFILE"
