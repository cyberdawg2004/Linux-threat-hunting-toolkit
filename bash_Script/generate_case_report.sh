#!/bin/bash

REPORT="../case_report.txt"
DATE=$(date)

echo "Linux Threat Hunting Case Report" > "$REPORT"
echo "Generated: $DATE" >> "$REPORT"

#Section1 (USB
echo -e "\nUSB Autorun Log: " >> "$REPORT"
cat ../usb_autorun_log.txt >> "$REPORT"

#Section2 Malware
echo -e "\nClamAV Scan: " >> "$REPORT"
cat ../clamav_scan_report.txt >> "$REPORT"

#section3 Sus Ports
echo -e "\nPort Scan Logs: " >> "$REPORT"
cat ../port_scan_report.txt >> "$REPORT"

#Section4 Sus Procs
echo -e "\nSuspicious Processes: " >>"$REPORT"
cat ../suspicious_process_log.txt >> "$REPORT"

#section 5 File Integrity
echo -e "\nFile Integrity Check: " >> "$REPORT"
cat ../file_integrity_report.txt >> "$REPORT"

echo -e "\nCase report complete. Saved to: $REPORT"
