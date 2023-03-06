#!/bin/bash
source variables_env.ini

# Check port 443
if which nc >/dev/null; then
  echo "nc is installed"

else
  echo "nc is not installed" >&2
  echo "link to install nc: https://formulae.brew.sh/formula/netcat" >&2
  exit -1
fi

nc -z "$SERVER" $PORTNUMBER
if [ $? -eq 0 ]; then
  echo "Port $PORTNUMBER is open."
  if [ -f "$FILE_PATH" ]; then
    echo " Port $PORTNUMBER is open ,the fault is correcte"
    rm $FILE_PATH
  fi
else
  echo "Port $PORTNUMBER is closed."
  email_body="Port $PORTNUMBER is down on $SERVER."

  echo $email_body >>$FILE_PATH
  if [ -f "$FILE_PATH" ]; then
    count=$(grep -c "down" "$FILE_PATH")
    if [ $count == 1 ]; then

      sendemail -f $FROM_EMAIL -t $TO_EMAIL -u $SUBJECT -m $email_body -s $SMTP_SERVER:$SMTP_PORT -o tls=yes -xu $SMTP_USERNAME -xp $SMTP_PASSWORD
    else
      echo " Port $PORTNUMBER is closed ,failure is not corrected"
    fi

  fi

fi
