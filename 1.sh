#!/bin/bash

# Define color codes
success='\033[1;32m'
none='\033[0m'
fail='\033[0;31m'
banner='\033[0;34m'
msg='\033[0;93m'

# Check for exactly one argument
if [ "$#" -ne 1 ]; then
    echo -e "${fail}"
    cat <<EOF
  Please enter a valid domain: 
  Example: dns_enum.sh google.com
  Please enter file txt like this ==> bash cname.sh file.txt
EOF
    echo -e "${none}"
    exit 1
else
    echo -e "${success}"
    clear
    echo -e "${success}"
    cat <<'EOF'

                  _          _                 _                       _         
                 | |        | |               | |                     | |        
   __ _ _ __ __ _| |__   ___| |__  _   _  __ _| |__   ___  _   _ _ __ | |_ _   _ 
  / _` | '__/ _` | '_ \ / _ \ '_ \| | | |/ _` | '_ \ / _ \| | | | '_ \| __| | | |
 | (_| | | | (_| | |_) |  __/ |_) | |_| | (_| | |_) | (_) | |_| | | | | |_| |_| |
  \__,_|_|  \__,_|_.__/ \___|_.__/ \__,_|\__, |_.__/ \___/ \__,_|_| |_|\__|\__, |
                                          __/ |                             __/ |
                                         |___/                             |___/ 
										 
----------------------------------(my telegram:)------------------------------------------------------------
----------------------------------(https://t.me/arabebugbounty)------------------------------------------------------------
----------------------------------(https://t.me/arabebugbounty)------------------------------------------------------------
EOF

fi

# Loop through each domain in the file and fetch IP addresses
number=1
for domain in $(cat "$1"); do
	number=$((number + 1))
    ipv4=$(dig "$domain" A +short)
    if [ -z "$ipv4" ]; then
        echo "Error: No IPv4 address found for domain $domain"
        continue
    fi
	echo "${number}=>${domain}"
    echo "${domain}|||${ipv4}" >> output.txt
done
