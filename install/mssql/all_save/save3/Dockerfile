# Utiliser l'image de base SQL Server 2019
FROM mcr.microsoft.com/mssql/server:2019-latest

# Définir des variables d'environnement pour la base de données
ENV SA_PASSWORD=YourPassword123 \
    ACCEPT_EULA=Y

# Copier le script d'initialisation et le fichier de données
COPY ./AdventureWorks2019.bak /var/opt/mssql/data/AdventureWorks2019.bak
COPY ./restore-db.sh /var/opt/mssql/restore-db.sh

# Assurer les autorisations nécessaires
USER root
RUN chmod +x /var/opt/mssql/restore-db.sh
USER mssql

# Exécuter le script d'initialisation au démarrage
CMD /bin/bash /var/opt/mssql/restore-db.sh