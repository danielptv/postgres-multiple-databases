<h1 align="center">docker-postgres-multiple-databases 👑</h1>

**Use multiple databases with the official [PostgreSQL Docker Image](https://hub.docker.com/_/postgres/).**

## How To Use 💡

This repository extends the official PostgreSQL Docker Image by adding an additional environment variable `POSTGRES_MULTIPLE_DATABASES`.

Additional databases can be passed as a ***comma-separated list*** in different formats:

### Database, username and password (`database:username:password`):

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