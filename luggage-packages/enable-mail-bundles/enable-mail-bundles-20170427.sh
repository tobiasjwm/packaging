#!/bin/bash

mailPlugin=`defaults read com.apple.mail EnableBundles`
enablePlugin=`defaults write com.apple.mail EnableBundles YES`

if [ "$mailPlugin" != "YES" ]; then
	$enablePlugin; echo "Main Bundles have been enabled."
else
	echo "Main Bundles already enabled."
fi