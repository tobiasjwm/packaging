#!/bin/bash

# remove-enable_mail_bundles.sh
# removes the enable_mail_bundles.sh from /usr/local/outset/login-every/
# made for use with Munki

# path variables
target="$3"
outsetLePath="${target}/usr/local/outset/login-every"
enableBundle="enable-mail-bundles-20170427.sh"

# function to check for the file and remove if it exists
removeScript() { # outsetPath scriptName
	if [ -e "$1/$2" ]; then
		/bin/rm "$1/$2"
		/usr/sbin/pkgutil --forget com.github.tobiasjwm.enable-mail-bundles
	else
		/bin/echo "The script is not installed."
	fi
}

removeScript "$outsetLePath" "$enableBundle"

exit 0