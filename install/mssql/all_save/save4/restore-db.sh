#!/bin/bash

# Attendre que SQL Server soit prêt à accepter des connexions
sleep 30s

# Restaurer la base de données AdventureWorks2019
#/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -d master -Q "RESTORE DATABASE AdventureWorks2019 FROM DISK='/var/opt/mssql/data/AdventureWorks2019.bak' WITH MOVE 'AdventureWorks2019' TO '/var/opt/mssql/data/AdventureWorks2019.mdf', MOVE 'AdventureWorks2019_Log' TO '/var/opt/mssql/data/AdventureWorks2019.ldf', REPLACE"
/opt/mssql-tools/bin/sqlcmd -S sqlserver-container -U sa -P $SA_PASSWORD -d master -Q "RESTORE DATABASE AdventureWorks2019 FROM DISK='/var/opt/mssql/data/AdventureWorks2019.bak' WITH MOVE 'AdventureWorks2019' TO '/var/opt/mssql/data/AdventureWorks2019.mdf', MOVE 'AdventureWorks2019_Log' TO '/var/opt/mssql/data/AdventureWorks2019.ldf', REPLACE"


# Éventuellement, exécuter d'autres commandes SQL ici

# Garder le processus en cours d'exécution
tail -f /dev/null
