#!/bin/sh

# Source: http://www.officeformachelp.com/office/install/remove-office/


	/usr/bin/osascript -e 'tell application "Microsoft Database Daemon" to quit'
	/usr/bin/osascript -e 'tell application "Microsoft AU Daemon" to quit'
	/usr/bin/osascript -e 'tell application "Office365Service" to quit'
	/bin/rm -R '/Applications/Microsoft Communicator.app/'
#	/bin/rm -R '/Applications/Microsoft Lync.app/'
	/bin/rm -R '/Applications/Microsoft Messenger.app/'
	/bin/rm -R '/Applications/Microsoft Office 2011/'
	/bin/rm -R '/Applications/Remote Desktop Connection.app/'
	/bin/rm -R '/Library/Application Support/Microsoft/'
	/bin/rm -R /Library/Automator/*Excel*
	/bin/rm -R /Library/Automator/*Office*
	/bin/rm -R /Library/Automator/*Outlook*
	/bin/rm -R /Library/Automator/*PowerPoint*
	/bin/rm -R /Library/Automator/*Word*
	/bin/rm -R /Library/Automator/*Workbook*
	/bin/rm -R '/Library/Automator/Get Parent Presentations of Slides.action'
	/bin/rm -R '/Library/Automator/Set Document Settings.action'
#	/bin/rm -R /Library/Fonts/Microsoft/
	/bin/mv '/Library/Fonts Disabled/Arial Bold Italic.ttf' /Library/Fonts
	/bin/mv '/Library/Fonts Disabled/Arial Bold.ttf' /Library/Fonts
	/bin/mv '/Library/Fonts Disabled/Arial Italic.ttf' /Library/Fonts
	/bin/mv '/Library/Fonts Disabled/Arial.ttf' /Library/Fonts
	/bin/mv '/Library/Fonts Disabled/Brush Script.ttf' /Library/Fonts
	/bin/mv '/Library/Fonts Disabled/Times New Roman Bold Italic.ttf' /Library/Fonts
	/bin/mv '/Library/Fonts Disabled/Times New Roman Bold.ttf' /Library/Fonts
	/bin/mv '/Library/Fonts Disabled/Times New Roman Italic.ttf' /Library/Fonts
	/bin/mv '/Library/Fonts Disabled/Times New Roman.ttf' /Library/Fonts
	/bin/mv '/Library/Fonts Disabled/Verdana Bold Italic.ttf' /Library/Fonts
	/bin/mv '/Library/Fonts Disabled/Verdana Bold.ttf' /Library/Fonts
	/bin/mv '/Library/Fonts Disabled/Verdana Italic.ttf' /Library/Fonts
	/bin/mv '/Library/Fonts Disabled/Verdana.ttf' /Library/Fonts
	/bin/mv '/Library/Fonts Disabled/Wingdings 2.ttf' /Library/Fonts
	/bin/mv '/Library/Fonts Disabled/Wingdings 3.ttf' /Library/Fonts
	/bin/mv '/Library/Fonts Disabled/Wingdings.ttf' /Library/Fonts
	/bin/rm -R /Library/Internet\ Plug-Ins/SharePoint*
	/bin/rm -R /Library/LaunchDaemons/com.microsoft.*
	/bin/rm -R /Library/Preferences/com.microsoft.*
	/bin/rm -R /Library/PrivilegedHelperTools/com.microsoft.*
	OFFICERECEIPTS=$(pkgutil --pkgs=com.microsoft.office.*)
	for ARECEIPT in $OFFICERECEIPTS
	do
		pkgutil --forget $ARECEIPT
	done
exit 0