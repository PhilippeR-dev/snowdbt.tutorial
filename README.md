## Tips

Pour que l'extension Snowflake reconnaisse les fichiers SQL
> définir dans les Settings l'association des fichiers (files.associations) *.snowql avec le language snowflake-sql

Pour ouvir un fichier avec une reconnaissance par l'extension Snowflake
> Command Palette (Ctrl + Shift + P) et taper Snowflake SQL File

## Commandes utiles

Pour exécuter des modèles :

> $ dbt clean & dbt deps

> $ dbt run -s 1_staging # by sub folders

> $ dbt run -s 2_intermediate

> $ dbt run -s 3_marts

Pour exécuter des tests :

> $ dbt test --select "source:*"  # all sources

> $ dbt test --select source:raw_data  # all sources

> $ dbt test --select source:raw_data.address # one source table only

> $ dbt test -s 1_staging # by sub folders

> $ dbt test -s 2_intermediate

> $ dbt test -s 3_marts

## Modèle AdventureWorks Sales < Source >

[AdventureWorks_2019-modules-Sales](https://dataedo.com/samples/html/AdventureWorks/doc/AdventureWorks_2/modules/Sales_12/module.html)


![1720114784731](image/README/1720114784731.png)

## Modèle Datamart Sales < Cible >

![1720108019504](image/README/1720108019504.png)
