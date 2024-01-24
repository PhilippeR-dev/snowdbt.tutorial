# Dockerfile
#
# Adventure Works Database on SQL Server 2019
FROM mcr.microsoft.com/mssql/server:2019-CU5-ubuntu-18.04

# Note: This isn't a secure password, and please don't use this for production.
ENV SA_PASSWORD=ThisIsAReallyCoolPassword123
ENV ACCEPT_EULA=Y

# Setting the user
USER mssql

COPY AdventureWorks2019.bak /var/opt/mssql/backup/
COPY Northwind.bak /var/opt/mssql/backup/


# Launch SQL Server, confirm startup is complete, restore the database, then terminate SQL Server.
RUN ( /opt/mssql/bin/sqlservr & ) | grep -q "Service Broker manager has started" \
    && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P ${SA_PASSWORD} -Q 'RESTORE DATABASE AdventureWorks2019 FROM DISK = "/var/opt/mssql/backup/AdventureWorks2019.bak" WITH MOVE "AdventureWorks2017" to "/var/opt/mssql/data/AdventureWorks2019.mdf", MOVE "AdventureWorks2017_Log" to "/var/opt/mssql/data/AdventureWorks2019_log.ldf", NOUNLOAD, STATS = 5' \
    && pkill sqlservr

# Launch SQL Server, confirm startup is complete, restore the database, then terminate SQL Server.
# RUN ( /opt/mssql/bin/sqlservr & ) | grep -q "Service Broker manager has started" \
#    && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -Q 'RESTORE DATABASE AdventureWorks2019 FROM DISK = "/var/opt/mssql/backup/AdventureWorks2019.bak" WITH MOVE "AdventureWorks2017" to "/var/opt/mssql/data/AdventureWorks2019.mdf", MOVE "AdventureWorks2017_Log" to "/var/opt/mssql/data/AdventureWorks2019_log.ldf", NOUNLOAD, STATS = 5' \
#    && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -Q 'RESTORE DATABASE Northwind FROM DISK = "/var/opt/mssql/backup/Northwind.bak" WITH MOVE "AdventureWorks2017" to "/var/opt/mssql/data/Northwind.mdf", MOVE "AdventureWorks2017_Log" to "/var/opt/mssql/data/Northwind.ldf", NOUNLOAD, STATS = 5' \
#    && pkill sqlservr
# RUN ( /opt/mssql/bin/sqlservr & ) | grep -q "Service Broker manager has started" 
# RUN /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -Q 'RESTORE DATABASE AdventureWorks2019 FROM DISK = "/var/opt/mssql/backup/AdventureWorks2019.bak" WITH MOVE "AdventureWorks2017" to "/var/opt/mssql/data/AdventureWorks2019.mdf", MOVE "AdventureWorks2017_Log" to "/var/opt/mssql/data/AdventureWorks2019_log.ldf", NOUNLOAD, STATS = 5' 
# RUN /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -Q 'RESTORE DATABASE Northwind FROM DISK = "/var/opt/mssql/backup/Northwind.bak" WITH MOVE "AdventureWorks2017" to "/var/opt/mssql/data/Northwind.mdf", MOVE "AdventureWorks2017_Log" to "/var/opt/mssql/data/Northwind.ldf", NOUNLOAD, STATS = 5' 
# RUN pkill sqlservr

CMD ["/opt/mssql/bin/sqlservr"]

#
# https://medium.com/@newianlin/dockerize-sql-server-with-build-in-adventureworks-and-northwinds-e21d10c20a6b
#
# $ docker build -t adventureworks:2019 .
# $ docker run -p 1633:1433 --name adventureworks2019 -h adventureworks2019 -d adventureworks:2019
# $ docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=yourStrong@Password" -e MSSQL_PID="Express" -p 1633:1433 --name adventureworks2019 -h adventureworks2019 -d adventureworks:2019  
# $ docker container list
#

# exemple de commande :
# docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=yourStrong(!)Password" -e "MSSQL_PID=Express" -p 1433:1433 -d mcr.microsoft.com/mssql/server:2019-latest

#
# Documentation officielle de Microsoft
#   https://learn.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker?view=sql-server-ver16&pivots=cs1-bash
#   Installation de Microsoft SQL Server
#       > https://mcr.microsoft.com/en-us/product/mssql/server/about (https://mcr.microsoft.com/en-us/catalog?cat=Databases&alphaSort=asc&alphaSortKey=Name)
#       > https://github.com/microsoft/mssql-docker/tree/master
#       > https://github.com/microsoft/mssql-docker/tree/master/linux/preview/examples/mssql-customize 
#   AdventureWorks sample databases 
#        > https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms
#        > https://github.com/Microsoft/sql-server-samples/releases/tag/adventureworks
#        > https://github.com/Microsoft/sql-server-samples/releases/tag/adventureworks-analysis-services






#
# Autres liens :
#   https://medium.com/@newianlin/dockerize-sql-server-with-build-in-adventureworks-and-northwinds-e21d10c20a6b
#   https://r3dlin3.github.io/2020/09/21/sql-server-sur-docker/#le_dockerfile
#   https://medium.com/@zzpzaf.se/ms-sql-server-in-docker-b0397a55859c
#   https://medium.com/agilix/docker-express-running-a-local-sql-server-express-204890cff699
#
#