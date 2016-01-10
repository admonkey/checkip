#!/bin/bash

# email notification
emailFrom="Name<username.from@example.com>"
emailTo="username.to@example.com"

# optionally store these variables in a separate file
cd $(dirname "${BASH_SOURCE[0]}")
if [ -f "creds.bash" ]; then
  source "creds.bash"
fi

oldip=$(<ip.txt)
wget http://ipecho.net/plain -O ip.txt > /dev/null 2>&1
if [ "$oldip" != "$(<ip.txt)" ]; then
  echo "new ip $(<ip.txt) changed from $oldip" | mail -s "CHANGED IP ADDRESS" -aFrom:$emailFrom $emailTo
fi
