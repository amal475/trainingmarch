#!/bin/bash




# Check port 80
source variables_env.ini



# Check port 443
if which nc >/dev/null; then
    echo "nc est installé"
else
    echo "nc n'est pas installé"
fi
nc -z "$server" $PORTNUMBER

if [ $? -eq 0 ]; then
  echo "Port 443 is open."
else
  echo "Port 443 is closed."
  email_body="Port 443 is down on $server."
 sendemail -f $FROM_EMAIL -t $TO_EMAIL -u $SUBJECT -m $email_body -s smtp.gmail.com:587 -o tls=yes -xu $SMTP_USERNAME -xp $SMTP_PASSWORD 
fi

