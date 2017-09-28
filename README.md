# DevOps Challenge

## Deploying Sample Rails 5 application with PostgreSQL, Redis, and Sidekiq using Docker and Docker Compose

Change the Environmental Variables Passed to the Docker Containers in docker-compose.yml:

- Rails Web Application Container
```
environment:
      RAILS_ENV: production
      SECRET_KEY_BASE: asecuretokenwouldnormallygohere
      PRODUCTION_DB_HOST: "postgres"
      PRODUCTION_DB_PORT: 5432
      PRODUCTION_DB_NAME: dummy_db 
      PRODUCTION_DB_USERNAME: dummy_user
      PRODUCTION_DB_PASSWORD: secretpassword
      WORKER_PROCESSES: 1  
      LISTEN_ON: 0.0.0.0:8000
      JOB_WORKER_URL: redis://redis:6379/0
      CACHE_URL: redis://redis:6379/0
```

- PostgreSQL DB Container
```
environment:
      POSTGRES_DB: "dummy_db"
      POSTGRES_HOST: "postgres"
      POSTGRES_USER: "dummy_user"
      POSTGRES_PASSWORD: "secretpassword"
```

- Sidekiq Container
```
environment:
      JOB_WORKER_URL: redis://redis:6379/0
      CACHE_URL: redis://redis:6379/0
```
_Horizontal line :_

Buidling the Docker Images and Starting the Containers from docker-compose.yml:

To run in interactive mode:
```
docker-compose up
```

To run in daemon mode:
```
docker-compose up -d
```

Test the Running Rails Container:
```
curl -v localhost:8000
```