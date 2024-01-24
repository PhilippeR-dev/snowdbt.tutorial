# Utiliser l'image de base SQL Server 2019 pour Windows
FROM mcr.microsoft.com/mssql/server:2019-latest

# Copier le fichier de sauvegarde dans le conteneur
USER root
COPY ./AdventureWorks2019.bak /var/local/AdventureWorks2019.bak
USER mssql

# Définir des variables d'environnement pour la base de données
ENV MSSQL_SA_PASSWORD=yourStrong@Password \
    MSSQL_PID=Express \
    ACCEPT_EULA=Y

RUN ( /opt/mssql/bin/sqlservr & ) | grep -q "Service Broker manager has started" \
    && /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $MSSQL_SA_PASSWORD -Q "RESTORE DATABASE AdventureWorks2019 FROM DISK='/var/local/AdventureWorks2019.bak' WITH MOVE 'AdventureWorks2019' TO '/var/opt/mssql/data/AdventureWorks2019.mdf', MOVE 'AdventureWorks2019_Log' TO '/var/opt/mssql/data/AdventureWorks2019.ldf', REPLACE" \
    && pkill sqlservr

CMD ["/opt/mssql/bin/sqlservr"]

# docker build -t sqlserver-container:latest .
# docker run -p 1633:1433 --name sqlserver_by_container sqlserver-container:latest

# Doc de référence :
#   > https://thwack.solarwinds.com/groups/data-driven/b/blog/posts/restoring-an-adventureworks-database-on-a-sql-server-on-linux-container

# exemple
# docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=yourStrong(!)Password" -e "MSSQL_PID=Express" -p 1433:1433 -d mcr.microsoft.com/mssql/server:2019-latest

# adaptations :
# docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=yourStrong(!)Password" -e "MSSQL_PID=Express" -v "/c/Repos/snowdbt.tutorial/install/mssql:/var/local" -p 1444:1433 --name sqlserver -d mcr.microsoft.com/mssql/server:2019-latest 
# puis exécuter dans le container la ligne de commande
# /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $MSSQL_SA_PASSWORD -Q "RESTORE DATABASE AdventureWorks2019 FROM DISK='/var/local/AdventureWorks2019.bak' WITH MOVE 'AdventureWorks2019' TO '/var/opt/mssql/data/AdventureWorks2019.mdf', MOVE 'AdventureWorks2019_Log' TO '/var/opt/mssql/data/AdventureWorks2019.ldf', REPLACE"


#
# Documentation officielle de Microsoft
#   https://learn.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker?view=sql-server-ver16&pivots=cs1-bash
#   Installation de Microsoft SQL Server
#       > https://mcr.microsoft.com/en-us/product/mssql/server/about (https://mcr.microsoft.com/en-us/catalog?cat=Databases&alphaSort=asc&alphaSortKey=Name) >> IMPORTANT <<
#       > https://github.com/microsoft/mssql-docker/tree/master
#       > https://github.com/microsoft/mssql-docker/tree/master/linux/preview/examples/mssql-customize
#       > https://learn.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker?view=sql-server-ver16&pivots=cs1-bash
# 
#   AdventureWorks sample databases 
#        > https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms
#        > https://github.com/Microsoft/sql-server-samples/releases/tag/adventureworks
#        > https://github.com/Microsoft/sql-server-samples/releases/tag/adventureworks-analysis-services
#        > https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms
#



#
# Autres liens :
#   https://medium.com/@newianlin/dockerize-sql-server-with-build-in-adventureworks-and-northwinds-e21d10c20a6b
#   https://r3dlin3.github.io/2020/09/21/sql-server-sur-docker/#le_dockerfile
#   https://medium.com/@zzpzaf.se/ms-sql-server-in-docker-b0397a55859c
#   https://medium.com/agilix/docker-express-running-a-local-sql-server-express-204890cff699
#   https://hub.docker.com/r/chriseaton/adventureworks
#   https://github.com/lorint/AdventureWorks-for-Postgres/blob/master/install.sql
#   https://en.wikiversity.org/wiki/Database_Examples/Northwind/PostgreSQL
#   https://github.com/lorint/AdventureWorks-for-Postgres?source=post_page-----28e335be5f7e--------------------------------
#
#