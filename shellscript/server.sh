#!/bin/bash
source variables_env.ini
# Check port 443
if which nc >/dev/null; then
  echo "nc is installed"
else
  echo "nc is not installed"
  echo "link to install nc: https://formulae.brew.sh/formula/netcat"
  exit
fi
while true; do
  nc -z "$SERVER" $PORTNUMBER
  if [ $? -eq 0 ]; then
    echo "Port $PORTNUMBER is open."
  else
    echo "Port $PORTNUMBER is closed."
    email_body="Port $PORTNUMBER is down on $server."
    sendemail -f $FROM_EMAIL -t $TO_EMAIL -u $SUBJECT -m $email_body -s $SMTP_SERVER:$SMTP_PORT -o tls=yes -xu $SMTP_USERNAME -xp $SMTP_PASSWORD
    exit 1
  fi
  sleep 10
done
