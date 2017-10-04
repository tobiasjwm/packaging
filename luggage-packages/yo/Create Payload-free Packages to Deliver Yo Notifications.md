# Create Payload-free Packages to Deliver Yo Notifications

## Purpose

Create a simple way to generate a package that can be deployed via Munki to send an instruction to Yo! to prompt an employee.

## Scope

Creating a payload-free package is simple enough and I often do this with The Luggage but in the case of delivering messages to Yo! 2.0's new yo_scheduler, I needed something that would not persistently send the command. Rich Trouton's [Payload-Free Package Creator.app](https://derflounder.wordpress.com/2015/05/21/payload-free-package-creator-app-revisited/#more-6806) does exactly this.

If you did not notice above, you need Yo! 2.0 for this.

## Process

1. Write your script. Here is an example script with variables that can be replaced for your specific messaging:

	#!/bin/bash
	
	# send a message to end-points to prompt employees.
	#! requires Yo! > 2.0 https://github.com/sheagcraig/yo
	
	# Messaging variables. Change the items in quotes to suit your needs.
	TITLE="Box Drive Now Available"
	SUBTITLE="A Better Way to Access Your Box Files"
	INFO="Click to find out more."
	BUTTON="More Info…"
	ACTION="https://globalmac-it.itglue.com/DOC-1673628-1147218"
	
	# function to run our commands
	yo_action {
		/usr/local/bin/yo_scheduler \
		--title "$TITLE" \
		--subtitle "$SUBTITLE" \
		--info "$INFO" \
		--action-btn "$BUTTON" \
		--action-path "$ACTION"
	
	# execute
	yo_action

2. Launch Payload-Free Package Creator.app
3. When prompted, choose your script from the Finder
4. Give your package a name. Try to make it a string without spaces.
4. Give your package a unique identifier. be sure to reverence your developer identity, the Yo application and a name for the specific script. eg: com.github.tobiasjwm.yo.boxdrivenotifier
5. Give your package a version number
7. Authenticate with your user account credentials to allow pkgbuild to do its thing.
8. Click OK on the success dialog to reveal the created package in your /tmp folder.
9. Move your package (or move the entire build folder) out of the /tmp folder to a permanent location.