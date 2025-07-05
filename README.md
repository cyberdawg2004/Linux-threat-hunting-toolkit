# Linux Threat Hunting Toolkit

This cybersecurity project simulates a full Linux threat hunting mission - from detection to analysis.
Built for showcasing cybersecurity awareness, log analysis, and incident response on Linux systems

---

## What's Inside?

Components:                         |  Description:
                                    |
- 'detect_suspicious_users.sh'      |  Flags user with UID 0 (not root) & odd login times
- 'failed_login_monitor.sh'         |  Monitors auth.log for brute-force SSH attempts
- 'file_integrity_check.sh'         |  Check sensitive file hashes & alerts on tampering
- 'clamav_malware_scan.sh'          |  Runs ClamAV scan and saves results to 'clamav_scan.log'
- 'malware_sample_analysis.pdf'     |  Simulated macro-based malware report with screenshot and analysis
- 'case_report.sh'                  |  Final threat report summarizing findings and mitigation

---

## Purpose

Created as a mission under Child Protection Program Org. & Public Awareness Simulations, this project demonstrates:

- Real-world Linux log parsing 
- Shell scripting for detection 
- Malware behavior simulation

## Tools Used

- 'Bash' - Scripting the entire detection pipeline
- 'ClamAV' - Scanning for malware
- 'Google Docs' - Creating PDF report
- 'Git & GitHub' - Version Control + project sharing

## Project Structure

'''bash
Linux-Threat-Hunting-Toolkit
	detect_suspicious_users.sh
	failed_login_monitor.sh
	file_integrity_check.sh
	clamav_malware_scan.sh
	malware_sample_analysis.pdf
	case_report.sh
	clamav_scan.log
	known_hashes.txt
	README.md

