<h1 align="center">docker-postgres-multiple-databases 👑</h1>

<p align="center">
    <img alt="Deployment status" src="https://img.shields.io/github/actions/workflow/status/danielptv/docker-postgres-multiple-databases/dockerhub-deployment.yml?label=Deployment">
    <img alt="Docker Image Version (latest semver)" src="https://img.shields.io/docker/v/danielptv/postgres-multiple-databases">
    <a href="https://github.com/danielptv/docker-postgres-multiple-databases/blob/main/LICENSE"><img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-yellow.svg"></a>
</p>

<p align="center">Use multiple databases with the official <a href="https://hub.docker.com/_/postgres/">PostgreSQL Docker Image</a>.</p>

## How To Use 💡

### Pull from Docker Hub

***postgres-multiple-databases*** is available on [Docker Hub](https://hub.docker.com/r/danielptv/postgres-multiple-databases).
You can use it with the same tags as the official PostgreSQL Docker image.

```bash
docker pull danielptv/postgres-multiple-databases
```

### Build custom image

Alternatively, you can clone the repository and build a custom image using the provided `Dockerfile`.

```bash
git clone https://github.com/danielptv/docker-postgres-multiple-databases.git
cd docker-postgres-multiple-databases
docker build --tag <CUSTOM_TAG> --build-args="POSTGRES_TAG=<POSTGRES_TAG>"
```

Replace `<CUSTOM_TAG>` with your desired image tag and `<POSTGRES_TAG>` with the tag you want to use for the PostgreSQL base image.
If omitted, `<POSTGRES_TAG>` will default to `latest`.

## How To Configure ⚙️

This repository extends the official PostgreSQL Docker Image by adding an additional environment variable `POSTGRES_MULTIPLE_DATABASES`.

Additional databases can be passed as a ***comma-separated list*** in different formats:

### Database, username and password (`database:username:password`)

```yaml
postgres:
    image: eu.gcr.io/your-project/postgres-multi-db
    environment:
        - POSTGRES_MULTIPLE_DATABASES=database1:username1:password1,database2:username2,password2
        - POSTGRES_USER=username
        - POSTGRES_PASSWORD=password
        - POSTGRES_DB=database
```

### Database and username (`database:username`)

```yaml
postgres:
    image: eu.gcr.io/your-project/postgres-multi-db
    environment:
        - POSTGRES_MULTIPLE_DATABASES=database1:username1,database2:username2
        - POSTGRES_USER=username
        - POSTGRES_PASSWORD=password
        - POSTGRES_DB=database
```

Passwords will default to the value of `POSTGRES_PASSWORD`.

### Database (`database`)

```yaml
postgres:
    image: eu.gcr.io/your-project/postgres-multi-db
    environment:
        - POSTGRES_MULTIPLE_DATABASES=database1,database2
        - POSTGRES_USER=username
        - POSTGRES_PASSWORD=password
        - POSTGRES_DB=database
```

Usernames and passwords will default to the values of `POSTGRES_USER` and `POSTGRES_PASSWORD`.

### Mixed

```yaml
postgres:
    image: eu.gcr.io/your-project/postgres-multi-db
    environment:
        - POSTGRES_MULTIPLE_DATABASES=database1:username1:password1,database2:username2,database3
        - POSTGRES_USER=username
        - POSTGRES_PASSWORD=password
        - POSTGRES_DB=database
```

Missing usernames and passwords will default to the values of `POSTGRES_USER` and `POSTGRES_PASSWORD`.

---

The repository is maintained at [docker-postgres-multiple-databases](https://github.com/danielptv/docker-postgres-multiple-databases).
