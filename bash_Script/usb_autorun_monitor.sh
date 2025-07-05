#!/bin/bash

echo "USB Autorun Monitor Started..."
#Log file
LOGFILE="../usb_autorun_log.txt"
echo "USB Autorun Log - $(date)" > "$LOGFILE"

#Monitor /media and /run/media for new mounts
inotifywait -m -e create -e moved_to /media /run/media 2>/dev/null |
while read path action device; do+
	echo -e "\nUSB DEVICE DETECTED: $device was $action at $path" | tee -a "$LOGFILE"

	if [[ -d "$path$device" ]]; then
		if find "$path$device" -type f -iname "autorun.inf" | grep -q "."; then
			echo "Autorun.inf FOUND in $path$device" | tee -a "$LOGFILE"
		else
			echo "No autorun.inf file found. USB appears clean." | tee -a "$LOGFILE"
		fi
	fi
done
