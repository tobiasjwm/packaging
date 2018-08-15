#!/bin/bash

#	rename-computer.sh
#	created: 06 Nov 2014
#	author:	Tobias Morrison
#
#	Sets Computer Name, Local Host Name, and Host Name 
#	on a standard OS X client system.
#
#	This saves a log file in /Library/Management/Logs.
#	
#	This script assumes Watchman Monitoring 
#	(https://www.watchmanmonitoring.com)
#	is installed and has a Group assigned.
#
#	Changes: 
#
#	0.5.3	//	Moar characters
#   0.5.2   //  Added fifth character to client abbreviaton.
#	0.5.1	//	Added check for root. Added forth character to client abbreviaton.
#	0.5 	//	Re-wrote to compact code.
#	0.3 	//	Added interactive controls for user name input.
#	0.2		//	Added a log file at /Library/Management/Logs

## Make sure script is run by root
if [[ $EUID -ne 0 ]]; then
    echo "Script must be run as root" 1>&2
    exit 1
fi

#### Set global variables ####
#	Serial Number 
serialnumber=$(system_profiler SPHardwareDataType | grep "Serial Number" | tr -d "Serial Number (system): ")
#	Temp file name
tempfile="renameLog-$serialnumber.txt"
#	File output path
fileoutput="/Library/Management/Logs/$tempfile"

#### Give the user some instructions
echo "-----------------------------------------------------------------------"
echo "|                                                                     |"
echo "|  This script will change the display and network names of this Mac. |"
echo "|  It requires root privledges to run. It also requires that          |"
echo "|  Watchman (https://www.watchmanmonitoring.com) is installed and     |"
echo "|  the Watchman Client Group name set. You will be asked for the      |"
echo "|  First and Last Name of the new user. If you make a mistake         |"
echo "|  entering the names, cancel the script by using the key combo       |"
echo "|  control + C.                                                       |"
echo "|                                                                     |"
echo "-----------------------------------------------------------------------"


#### Begin the log file ####
echo "########## GLOBALMAC IT RENAME COMPUTER ##########" >> "$fileoutput"
echo "" >> "$fileoutput"
echo "This log was created by the rename-computer.sh script loacted at /Library/Management/bin" >> "$fileoutput"
echo "" >> "$fileoutput"
echo Date: `date "+%Y-%m-%d %l:%M:%S %p"`>> "$fileoutput"

#### Get the current names
computerName=`/usr/sbin/scutil --get ComputerName`
localHostName=`/usr/sbin/scutil --get LocalHostName`
hostName=`/usr/sbin/scutil --get HostName`

# Log and display the current settings
echo "The current Computer Name is $computerName."
echo "The current Local Host Name is $localHostName."
echo "The current Host Name is $hostName."
echo "" >> "$fileoutput"
echo "The current Computer Name is $computerName." >> "$fileoutput"
echo "The current Local Host Name is $localHostName." >> "$fileoutput"
echo "The current Host Name is $hostName." >> "$fileoutput"

#	Ask the admin to enter the user's name
echo -n "Enter the first name of the new user: "
read firstname
echo -n "Enter the last name of the new user: "
read lastname
echo "" >> "$fileoutput"
echo "The new user's name is $firstname $lastname" >> "$fileoutput"
newuser="$firstname$lastname"

#### Company Info ####
# Get the company name from Watchman
watchmanName="/Library/MonitoringClient/ClientSettings"

#	Use sed to remove all spaces and lowercase letters
noSpace() {
	echo $1$2$3$4$5$6$7$8 | sed 's/[a-z][ ]*//g'
}

#	Provide the company abbreviated name
company=`defaults read $watchmanName ClientGroup`
companyAbbr=`noSpace $company`
echo "" >> "$fileoutput"
echo "This system belongs to $company." >> "$fileoutput"
echo "The abbreviated company name is $companyAbbr." >> "$fileoutput"

#### Hardware Info ####
#	Get the hardware name from the system and abreviate it.
systemName=`system_profiler SPHardwareDataType | grep "Model Identifier:" | awk '{print $3;}' | sed 's/[0-9][,]*//g'`
echo "" >> "$fileoutput"
echo "This system is a $systemName." >> "$fileoutput"

#	Use sed to replace the systems name with our simple abbreviation.
abbrSys() {
	echo $1 | sed 's/Macmini/MM/g' | sed 's/MacBookPro/MBP/g' | sed 's/MacBookAir/MBA/g' | sed 's/MacBook/MB/g'
}

system=`abbrSys $systemName`
echo "The abbreviated computer identifier is $system." >> "$fileoutput"

#	Use sed to adjust the case of the variable outputs and replace spaces with hyphens.
makelower() {
	echo $1$2$3 | tr '[:upper:]' '[:lower:]' | sed -e 's/ //g'
}

newComputerName="$newuser-$system-$companyAbbr"
newHostName=`makelower $newComputerName`

sudo /usr/sbin/scutil --set ComputerName $newComputerName
sudo /usr/sbin/scutil --set LocalHostName $newHostName
sudo /usr/sbin/scutil --set HostName $newHostName.local

# Get the new names to check for success
changeComputerName=`/usr/sbin/scutil --get ComputerName`
changeLocalHostName=`/usr/sbin/scutil --get LocalHostName`
changeHostName=`/usr/sbin/scutil --get HostName`

#	Tell me the results.
STATUS=$?

if [ $STATUS == 0 ]; then
	echo "Computer identity was changed successfully."
	echo "" >> "$fileoutput"
	echo "The new Computer Name is $changeComputerName"
	echo "The new Local Host Name is $changeLocalHostName"
	echo "The new Host Name is $changeHostName"
	echo "" >> "$fileoutput"
	echo "The new Computer Name is $changeComputerName" >> "$fileoutput"
	echo "The new Local Host Name is $changeLocalHostName" >> "$fileoutput"
	echo "The new Host Name is $changeHostName" >> "$fileoutput"
elif [ $STATUS != 0 ]; then
	echo "An error was encountered while attempting to change the computer identity. scutil exited $status."
	echo "" >> "$fileoutput"
	echo "An error was encountered while attempting to change the computer identity. scutil exited $status." >> "$fileoutput"
	echo "" >> "$fileoutput"
fi