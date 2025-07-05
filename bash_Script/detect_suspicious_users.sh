#!/bin/bash

echo "Detecting Suspicious Users (non-root UID 0) and Odd Login Times..."

# 1. Check for users with UID 0 but username not 'root'
echo -e "\n[!] Users with UID 0 but NOT named 'root': "
awk -F: '($3 == 0 && $1 != "root") {print $1 " (UID: 0)"}' /etc/passwd

# 2. Extract login records from auth.log
echo -e "\n Login Attempts (from /var/log/auth.log): "
grep "session opened for user" /var/log/auth/log | awk '{print $1, $2, $3, $11}' | sort

# 3. Flag logins outside work hours (e.g., between 00:00 and 06:00)
echo -e "\n Suspicious Late-Night Logins (00:00-06:00): "
grep "session opened for user" /var/log/auth.log | awk '{print $3, $11}' | while read time user; do
	HOUR=$(echo $time | cut -d: -f1)
	if [[ "$HOUR" =~ ^[0-9]+$ ]]; then
		if [ "$HOUR" -lt 6 ]; then
			echo "[$time] - $user"
		fi
	fi
done

echo -e "\n Done scanning. Review results above."

