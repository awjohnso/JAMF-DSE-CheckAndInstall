#!/bin/zsh

# Author: Andrew W. Johnson
# Date: Sometime in 2020
# Version: 1.00
# Organization: Stony Brook University/DoIT

# This Jamf script will check to see if a file is installed. If it is not it will then try 
# to run the Jamf install policy using a trigger/custom event or policy ID. It relies on
# the path to the file to be passed in the fourth parameter/argument, and the policy trigger/
# ID passed in the fifth parameter/argument.

	# Debug echo.
# /bin/echo ${4}
# /bin/echo ${5}
myTrigger=${5}
	# Setup a digit check variable.
re='^[0-9]+$'

	# If the file exists passed in the (Jamf) fourth parameter exists, then do nothing,
	# if not run the software install policy with the provided custom / trigger passed 
	# in the (Jamf) fifth parameter.
	
if [[ -e ${4} ]]; then
        /bin/echo "${4} is already installed!"
        /bin/echo "$( /bin/date | /usr/bin/awk '{print $1, $2, $3, $4}' ) $( /usr/sbin/scutil --get LocalHostName ) $( /usr/bin/basename ${0} )[$$]: ${4} is already installed!" >> /var/log/jamf.log
else
        /bin/echo "${4} is not installed. Attempting to install it now..."
        /bin/echo "$( /bin/date | /usr/bin/awk '{print $1, $2, $3, $4}' ) $( /usr/sbin/scutil --get LocalHostName ) $( /usr/bin/basename ${0} )[$$]: ${4} is not installed. Attempting to install it now..." >> /var/log/jamf.log
       	if [[ ${myTrigger} =~ ${re} ]]; then
			/usr/local/bin/jamf policy -id ${myTrigger}
		else
			/usr/local/bin/jamf policy -trigger ${myTrigger}
		fi
fi

exit 0

