#!/usr/bin/python

from pwd import getpwnam
import datetime
import platform
import subprocess
import time
import sys
import os.path
from SystemConfiguration import SCDynamicStoreCopyConsoleUser

from Foundation import *

BUNDLE_ID = 'com.github.tobiasjwm.boxdrivenotifier'

def run_yo(title, subtitle, text, url):
	cmd = [
		'/Applications/Utilities/yo.app/Contents/MacOS/yo',
		'--title',
		title,
		'--subtitle',
		subtitle,
		'--info',
		text,
		'--action-btn',
		'More Info',
		'--action-path',
		url
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

def run_count():
	times_run = pref('times_run')
	if times_run == None:
		return False
	# we want to run this a max of 4 times
	if times_run >= 4:
		print 'Notice has run 4 times'
		return True
	else:
		print 'Notice has run less than 4 times'
		return False

def set_run_count():
	# check if run_count exists and set if it does not
	run_count = pref('times_run')
	if run_count == None:
		run_count = 1
		set_pref('times_run', run_count)
	else:
	# increment run_count by 1
		run_count = int(run_count)
		run_count += 1
		set_pref('times_run', run_count)

def box_drive_check():
	# check if 'Box Drive.app' is already installed.
	os.path.exists('/Applications/Box Drive.app')

def remove_launch_agent():
	# From Graham https://grahamgilbert.com/blog/2017/03/26/loading-launchagents-as-root/
	username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]
	if username is None:
		# Exit if there isn't anyone logged in
		sys.exit()
    # Get uid for user
	uid = getpwnam(username).pw_uid
 	# Unload the LaunchAgent
	subprocess.call(['/bin/launchctl', 'bootout', 'gui/{}'.format(uid), '/Library/LaunchAgents/com.github.tobiasjwm.boxdrivenotifier.plist'])
	# Remove the LaunchAgent
	subprocess.call(['/bin/rm', '-f', '/Library/LaunchAgents/com.github.tobiasjwm.boxdrivenotifier.plist'])

def main():

	if run_today() == False and run_count() == False:
		# set the preference with the current unix timestamp and a times displayed count
		set_run_today()
		set_run_count()
		# and call Yo with our options
		run_yo(url='munki://detail-BoxDrive',
				title='Box Drive Now Available',
				subtitle='A Better Way to Access Your Box Files',
				text='Click to find out more.')

	
	# Check if Box Drive.app is already installed and remove the launch agent
	# to prevent nagging user to do something that is already done.
	if box_drive_check() == True or run_count() == True:
		remove_launch_agent()

if __name__ == '__main__':
	main()