# docker build -t sqlserver-container:latest .
docker run -p 1633:1433 --name sqlserver_by_container sqlserver-container:latest

# Ajouter le network bridge à Kestra
# docker network connect bridge kestra-kestra-1
# docker network connect bridge kestra-postgres-1

# Lister les networks disponibles
# docker network ls 

# Préalablement vérifier les networks utilisés par les containers docker
#   docker inspect --type=container 2279a9564887da8f373699bf1e698c107145d03440fe9f20e9da24aa7c783eca
# !!! plus facile !!! avec le docker desktop
