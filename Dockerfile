ARG POSTGRES_TAG=latest
FROM postgres:${POSTGRES_TAG}

COPY create-multiple-databases.sh /docker-entrypoint-initdb.d/
