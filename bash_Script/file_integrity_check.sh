#!/bin/bash

echo "File Integrity Checker"

#Log file 
LOGFILE="../file_integrity_report.txt"

#Declare files to check
FILES=(
	"/etc/passwd"
	"/etc/shadow"
	"/bin/bash"
)

#Known good hashes (create once, store safely)
declare -A known_hashes
known_hashes["/etc/passwd"]="375946863fab152029496047c594fbde20ab597eb9972b90d327e09728b6ed5e"
known_hashes["/etc/shadow"]="97f03b4a856f5f5ae3d169a545f3a6927cb25824262f9f93bbef126a7ab75eef"
known_hashes["/bin/bash"]="bc5945feb8bd26203ebfafea5ce1878bb2e32cb8fb50ab7ae395cfb1e1aaaef1"

#Start report
echo "File Integrity Check - $(date)" > "LOGFILE"

#Loop through files
for file in "${FILES[@]}"
do
	if [ -f "$file" ]; then 
		current_hash=$(sha256sum "$file" |awk '{print $1}')
		saved_hash="${known_hashes[$file]}"

		echo -e "\nChecking: $file" >> "$LOGFILE"
		echo "Current Hash: $current_hash" >> "$LOGFILE"
		echo "Expected Hash: $saved_hash" >> "$LOGFILE"

		if [[ "$current_hash" == "$saved_hash" ]]; then
			echo "File is clean" >>"$LOGFILE"
		else
			echo "File TAMPERED" >> "$LOGFILE"
		fi
	else
		echo -e "\nFile not Found: $file" >> "$LOGFILE"
	fi 
done

echo -e "\nReport saved to $LOGFILE"
