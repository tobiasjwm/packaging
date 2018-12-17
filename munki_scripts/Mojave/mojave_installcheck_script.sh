#!/bin/bash
#######################
# This script checks if the current system is compatible with OS X 10.14 Mojave
#
# The checks used in this script are:
# - Machine has a specific supported board-id and model or is a virtual machine
# - At least 2 GB of memory
# - At least 18.5GB free space
# - Current System is not identified as a server by Gruntwork
# - Current System has an existing Recovery Partition
#
# Exit codes:
# 0 = Mojave is supported
# 1 = Mojave is not supported
#
# Updated for 10.14 by tobias.  Thanks to the Ben Mason who built this and had this to say:
# Kuddos to Hannes Juutilainen for the original python version of this that I converted because I hate python.
# And kuddos to Nathan Felton
#
#Check that we're not already running Mojave (as a backup the pkgsinfo logic)
minorVers=$(sw_vers -productVersion | awk -F '.' '{print $2}')
if [ $minorVers -ge 14 ]; then
  echo "OS Upgrade Failed: Already running 10.14 or newer"
  exit 1
fi

#### Board compatibility check
# Board list
declare -a boardList=(Mac-06F11F11946D27C5 Mac-031B6874CF7F642A Mac-CAD6701F7CEA0921 Mac-50619A408DB004DA Mac-7BA5B2D9E42DDD94 Mac-473D31EABEB93F9B Mac-AFD8A9D944EA4843 Mac-B809C3757DA9BB8D Mac-7DF2A3B5E5D671ED Mac-35C1E88140C3E6CF Mac-77EB7D7DAF985301 Mac-2E6FAB96566FE58C Mac-827FB448E656EC26 Mac-BE0E8AC46FE800CC Mac-00BE6ED71E35EB86 Mac-4B7AC7E43945597E Mac-5A49A77366F81C72 Mac-35C5E08120C7EEAF Mac-FFE5EF870D7BA81A Mac-C6F71043CEAA02A6 Mac-4B682C642B45593E Mac-90BE64C3CB5A9AEB Mac-66F35F19FE2A0D05 Mac-189A3D4F975D5FFC Mac-B4831CEBD52A0C4C Mac-FA842E06C61E91C5 Mac-FC02E91DDD3FA6A4 Mac-06F11FD93F0323C5 Mac-9AE82516C7C6B903 Mac-27ADBB7B4CEE8E61 Mac-6F01561E16C75D06 Mac-F60DEB81FF30ACF6 Mac-81E3E92DD6088272 Mac-7DF21CB3ED6977E5 Mac-937CB26E2E02BB01 Mac-3CBD00234E554E41 Mac-F221BEC8 Mac-9F18E312C5C2BF0B Mac-65CE76090165799A Mac-CF21D135A7D34AA6 Mac-F65AE981FFA204ED Mac-112B0A653D3AAB9C Mac-DB15BD556843C820 Mac-937A206F2EE63C01 Mac-77F17D7DA9285301 Mac-C3EC7CD22292981F Mac-BE088AF8C5EB4FA2 Mac-551B86E5744E2388 Mac-A5C67F76ED83108C Mac-031AEE4D24BFF0B1 Mac-EE2EBD4B90B839A8 Mac-42FD25EABCABB274 Mac-F305150B0C7DEEEF Mac-2BD1B31983FE1663 Mac-66E35819EE2D0D05 Mac-A369DDC4E67F1C45 Mac-E43C1C25D4880AD6)
declare -a nonSupportedModels=(MacBookPro4,1 MacPro2,1 Macmini5,2 Macmini5,1 MacBookPro5,1 MacBookPro1,1 MacBookPro5,3 MacBookPro5,2 iMac8,1 MacBookPro5,4 MacBookAir4,2 Macmini2,1 iMac5,2 iMac11,3 MacBookPro8,2 MacBookPro3,1 Macmini5,3 MacBookPro1,2 Macmini4,1 iMac9,1 iMac6,1 Macmini3,1 Macmini1,1 MacBookPro6,1 MacBookPro2,2 MacBookPro2,1 iMac12,2 MacBook3,1 MacPro3,1 MacBook5,1 MacBook5,2 iMac11,1 iMac10,1 MacBookPro7,1 MacBook2,1 MacBookAir4,1 MacPro4,1 MacBookPro6,2 iMac12,1 MacBook1,1 MacBookPro5,5 iMac11,2 iMac4,2 Xserve2,1 MacBookAir3,1 MacBookAir3,2 MacBookAir1,1 Xserve3,1 iMac4,1 MacBookAir2,1 Xserve1,1 iMac5,1 MacBookPro8,1 MacBook7,1 MacBookPro8,3 iMac7,1 MacBook6,1 MacBook4,1 MacPro1,1)
vmCheck=$(/usr/sbin/sysctl -n machdep.cpu.features | grep VMM 2>/dev/null)
if [ -z "$vmCheck" ]; then
	#check model
	hwmodel=$(sysctl -n hw.model)
	modelGood=yes
	for model in "${nonSupportedModels[@]}"; do
		if [[ "$hwmodel" == "$model" ]]; then
			modelGood=no
			break
		fi
	done
	if [ "$modelGood" != "yes" ]; then
		echo "OS Upgrade Failed: Unsupported model."
		exit 1
	fi

  #Model ok, check board list
  #check board
  boardID=$(/usr/sbin/ioreg -p IODeviceTree -r -n / -d 1 | grep board-id | awk -F '"' '{print $4}')
  boardGood=no
  for board in "${boardList[@]}"; do
    if [[ "$boardID" == "$board" ]]; then
      boardGood=yes
      break
    fi
  done
  if [ "$boardGood" != "yes" ]; then
    echo "OS Upgrade Failed: Unsupported logicboard."
    exit 1
  fi
fi
#### Required memory check
installedRAM=$(/usr/sbin/sysctl -n hw.memsize)
if [ $installedRAM -lt 2147483648 ]; then
  echo "OS Upgrade Failed: Insufficient RAM"
  exit 1
fi
#### Not a server check
gwIsServer=$(/usr/bin/defaults read /Library/Mac-MSP/Gruntwork/settings server)
if [ "$gwIsServer" == 1 ]; then
  echo "OS Upgrade Failed: This machine is tagged as a Server."
  exit 1
fi
#### Recovery partition check
if (( "$minorVers" != 6 )); then
  recoveryCheck=$(diskutil list | grep "Recovery" 2>/dev/null)
  if [ $? -ne 0 ]; then
    echo "OS Upgrade Failed: No existing Recovery Partition"
    exit 1
  fi
  if [ -z "$recoveryCheck" ]; then
    echo "OS Upgrade Failed: No existing Recovery Partition"
    exit 1
  fi
fi
#### Free space check
diskutil_plist="$(mktemp -t "diskutil").plist"
diskutil info -plist / > ${diskutil_plist}
freespace=$(defaults read "${diskutil_plist}" FreeSpace)
rm "${diskutil_plist}"
freespace=$(expr $freespace / $((1024**2)))
if (( ${freespace} < 18944 )); then
	echo "OS Upgrade Failed: Less than 18.5GB free space"
	exit 1
fi
exit 0