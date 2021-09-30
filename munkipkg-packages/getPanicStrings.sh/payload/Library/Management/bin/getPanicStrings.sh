#!/bin/bash

PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin export PATH

strings=$(/usr/bin/find /Library/Logs/DiagnosticReports -Btime -30 -name '*panic-full*' -exec grep macOSPanicString "{}" \;)

if [[ -z $strings ]]; then
	echo "No Panics"
	exit
fi

echo "$(echo "${strings//'\n'/$'\n'}")"
