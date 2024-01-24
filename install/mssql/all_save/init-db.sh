#!/bin/bash

# (see https://github.com/microsoft/mssql-docker/issues/2 )
echo "Container initialization: waiting for the server to come up"
while [ ! -f /var/opt/mssql/log/errorlog ]
do
  sleep 1
done
FOUND=0
i=0
while [[ $FOUND -ne 1 ]] && [[ $i -lt 60 ]]; do
  i=$i+1
  FOUND=$(grep -cim1 "Service Broker manager has started" /var/opt/mssql/log/errorlog)
  if [[ $FOUND -ne 1 ]]; then
    sleep 1
  fi
done
if [[ $FOUND -ne 1 ]]; then
  echo "Container initialization: Error: waited for more than 60 seconds for the server to start. Trying to create the database now..."
fi
sleep 10
echo "Container initialization: creating the database if needed"
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -Q "CREATE DATABASE $DB_NAME"
echo "Container initialization: done"