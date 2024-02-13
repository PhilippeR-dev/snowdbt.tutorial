FROM python:3.8.16

# Install Java
RUN apt update && \
    apt install -y sudo && \
    sudo apt install default-jdk -y

# Add non-root user
ARG USERNAME=nonroot
RUN groupadd --gid 1000 $USERNAME && \
    useradd --uid 1000 --gid 1000 -m $USERNAME
## Make sure to reflect new user in PATH
ENV PATH="/home/${USERNAME}/.local/bin:${PATH}"
USER $USERNAME

## Pip dependencies
# Upgrade pip
RUN pip install --upgrade pip
# Install production dependencies
COPY --chown=nonroot:1000 requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt && \
    rm /tmp/requirements.txt
# Install production dependencies
# https://godatadriven.com/blog/how-to-create-a-devcontainer-for-your-python-project-%F0%9F%90%B3/

WORKDIR /usr/local/src/
# Get the wole project repository
COPY --chown=nonroot:1000 . .

#  Install the dependencies specified in the packages.yml file and 
#  build seeds, models, and snapshots, and run tests wherever applicable
# RUN deps

# Get the wole project repository
CMD ["bash"]

# https://medium.com/@aparna_satheesh/containerizing-dbt-code-with-docker-for-streamlined-data-transformation-ce98b7880a10
# https://medium.com/swlh/dockerize-your-python-command-line-program-6a273f5c5544

# docker login -u synergyheppner (enter manuel password)
# docker build -t synergyheppner/datahub_transformation .
# docker push synergyheppner/datahub_transformation:latest
# docker run -it --name my_data_transform -v c:\configs\.dbt:/usr/local/src/.dbt  synergyheppner/datahub_transformation
# dbt clean --profiles-dir /usr/local/src/.dbt/
# dbt deps --profiles-dir /usr/local/src/.dbt/
# dbt run -m +int_wrk_dbt__shipments_upsert --profiles-dir /usr/local/src/.dbt/
# docker start my_data_transform
# docker exec -it my_data_transform bash

