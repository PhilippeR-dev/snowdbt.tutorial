"# snowdbt.tutorial"

# Tips

Pour que l'extension Snowflake reconnaisse les fichiers SQL
> définir dans les Settings l'association des fichiers (files.associations) *.snowql avec le language snowflake-sql

Pour ouvir un fichier avec une reconnaissance par l'extension Snowflake
> Command Palette (Ctrl + Shift + P) et taper Snowflake SQL File

# commandes utiles

> $ dbt clean & dbt deps
> $ dbt run -s 1_staging
> $ dbt run -s 2_intermediate
> $ dbt run -s 3_marts