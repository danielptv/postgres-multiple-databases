<h1 align="center">postgres-multiple-databases 👑</h1>

<p align="center">
    <img alt="Deployment status" src="https://img.shields.io/github/actions/workflow/status/danielptv/postgres-multiple-databases/deployment.yml?label=Deployment&logo=github">
    <img alt="Docker Image Version (latest semver)" src="https://img.shields.io/docker/v/danielptv/postgres-multiple-databases?logo=docker&label=Latest%20Version">
    <img alt="Docker Pulls" src="https://img.shields.io/docker/pulls/danielptv/postgres-multiple-databases?label=Docker%20Pulls&logo=docker">
    <a href="https://github.com/danielptv/postgres-multiple-databases/blob/main/LICENSE"><img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-yellow.svg?logo=github"></a>
</p>

<p align="center">Use multiple databases with the official <a href="https://hub.docker.com/_/postgres/">PostgreSQL Docker Image</a>.</p>

## How To Use 💡

### Pull from Docker Hub

***postgres-multiple-databases*** is available on [Docker Hub](https://hub.docker.com/r/danielptv/postgres-multiple-databases).
You can use it with the same tags as the official PostgreSQL Docker image.

```bash
docker pull danielptv/postgres-multiple-databases:latest
```

### Pull from GitHub Container Registry

***postgres-multiple-databases*** is available on the [GitHub Container Registry](https://github.com/danielptv/postgres-multiple-databases/pkgs/container/postgres-multiple-databases).
You can use it with the same tags as the official PostgreSQL Docker image.

```bash
docker pull ghcr.io/danielptv/postgres-multiple-databases:latest
```

### Build custom image

Alternatively, you can clone the repository and build a custom image using the provided `Dockerfile`.

```bash
git clone https://github.com/danielptv/postgres-multiple-databases.git
cd postgres-multiple-databases
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

The repository is maintained at [postgres-multiple-databases](https://github.com/danielptv/postgres-multiple-databases).
