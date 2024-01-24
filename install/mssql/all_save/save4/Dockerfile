# Utiliser l'image de base SQL Server 2019 pour Windows
FROM mcr.microsoft.com/mssql/server:2019-latest

# Définir des variables d'environnement pour la base de données
ENV SA_PASSWORD=YourPassword123 \
    ACCEPT_EULA=Y

# Copier le fichier de sauvegarde dans le conteneur
COPY ./AdventureWorks2019.bak /var/opt/mssql/data/AdventureWorks2019.bak

# Exécuter la commande de restauration
RUN /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -Q "RESTORE DATABASE AdventureWorks2019 FROM DISK='/var/opt/mssql/data/AdventureWorks2019.bak' WITH MOVE 'AdventureWorks2019' TO '/var/opt/mssql/data/AdventureWorks2019.mdf', MOVE 'AdventureWorks2019_Log' TO '/var/opt/mssql/data/AdventureWorks2019.ldf', REPLACE"

# Exposer le port SQL Server
EXPOSE 1433
