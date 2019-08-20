#!/bin/bash

if [ -e "/Applications/OpenDNS Roaming Client/Umbrella Diagnostic.app" ] ; then
	exit 0
else
	exit 1
fi