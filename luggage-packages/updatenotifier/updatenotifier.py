#!/usr/bin/python

import datetime
import platform
import subprocess
import time

from Foundation import *

BUNDLE_ID = 'com.github.tobiasjwm.updatenotifier'

def run_yo(title, text, url, icon):
	cmd = [
		'/Applications/Utilities/yo.app/Contents/MacOS/yo',
		'--title',
		title,
		'--info',
		text,
		'--action-btn',
		'More Info',
		'--action-path',
		url,
		'--icon',
		icon
	]
	subprocess.call(cmd)

# create a plist to track the last time  
# the script ran from the LaunchAgent
def set_pref(pref_name, pref_value):
	CFPreferencesSetAppValue(pref_name, pref_value, BUNDLE_ID)
	CFPreferencesAppSynchronize(BUNDLE_ID)

def pref(pref_name):
	default_prefs = {
	}
	pref_value = CFPreferencesCopyAppValue(pref_name, BUNDLE_ID)
	if pref_value == None:
		pref_value = default_prefs.get(pref_name)
		set_pref(pref_name, pref_value)
	if isinstance(pref_value, NSDate):
		# convert NSDate to string
		pref_value = str(pref_value)
	return pref_value

def run_today():
	# check if the preference has been set. If not, then this
	# is the first run and the employee has not seen it today.
	last_shown = pref('last_shown')
	if last_shown == None:
		return False
	
	# convert the last shown timestamp to a usable date
	last_shown = datetime.datetime.fromtimestamp(int(last_shown))
	# today's date
	now = datetime.datetime.now()
	# get the time delta between now and 23 hours ago
	day_ago = now - datetime.timedelta(hours=23)
	# which is bigger?
	if last_shown > day_ago:
		print 'Last shown within last 23 hours'
		return True
	else:
		print 'Not shown within last 23 hours'
		return False

def set_run_today():
	now = int(time.time())
	set_pref('last_shown', now)

def main():

	# platform.mac_ver() gives us ('10.12.5', ('', '', ''), 'x86_64')
	# the first part is useful, so we will pull it out with '[0]'
	mac_version = platform.mac_ver()[0]
	
	if run_today() == False and (mac_version.startswith('10.11') \
						or mac_version.startswith('10.10') \
						or mac_version.startswith('10.9')):
		# set the preference with the current unix timestamp
		set_run_today()
		# and call Yo with our options
		run_yo(url='munki://detail-installOSX1012',
				title='Operating System Update',
                icon='/Library/Management/Utilities/gmit.png',
				text='Your Mac is out of date, '\
				'please upgrade ASAP.')
if __name__ == '__main__':
	main()