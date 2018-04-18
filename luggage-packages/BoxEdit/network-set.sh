#!/bin/bash

### Detects all network hardware & creates services for all installed network hardware
/usr/sbin/networksetup -detectnewhardware

IFS=$'\n'

    ### Loop through the list of network services
    for i in $(networksetup -listallnetworkservices | tail +2 );
    do
    
        ### Get a list of all services
        autoProxyURLLocal=`/usr/sbin/networksetup -getautoproxyurl "$i" | head -1 | cut -c 6-`
        
        ### Echo the name of any matching services & the autoproxyURLs set
        echo "$i Proxy set to $autoProxyURLLocal"
    
        ### If the value returned of $autoProxyURLLocal does not match the value of $autoProxyURL for the interface $i, change it.
        if [[ $autoProxyURLLocal != $autoProxyURL ]]; then
            /usr/sbin/networksetup -setautoproxyurl $i $autoProxyURL
            echo "Set auto proxy for $i to $autoProxyURL"
        fi
        
        ### Echo the name of any matching services & the bypass proxy Hosts & Domains set
        echo "$i Proxy set to $autoProxyURLLocal"
        
        ### Add bypass proxy Hosts & Domains
        /usr/sbin/networksetup -setproxybypassdomains "$i" *.local 169.254/16 *.domain.com 17/8
        
        ### Enable auto proxy once set
        /usr/sbin/networksetup -setautoproxystate "$i" on
        echo "Turned on auto proxy for $i" 
    
    done

unset IFS