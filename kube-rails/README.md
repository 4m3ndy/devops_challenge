# DevOps Challenge

## Deploying Sample Rails 5 application with Unicorn, PostgreSQL, Redis using Minikube and Kubernetes

#### Starting Kubernetes Cluster: ####

```
minikube start
```

#### Get Kubernetes Cluster Information: ####

```
kubectl cluster-info
```

#### Change the Environmental Variables Passed to the Pods in app-config.yml ConfigMap: #### 

```
data:
  PRODUCTION_DB_NAME: "dummy_db"
  PRODUCTION_DB_HOST: "postgres"
  PRODUCTION_DB_USERNAME: "dummy_user"
  PRODUCTION_DB_PASSWORD: "secretpassword"
  PRODUCTION_DB_PORT: "5432"
  SECRET_KEY_BASE: asecuretokenwouldnormallygohere
  LISTEN_ON: 0.0.0.0:8000
  WORKER_PROCESSES: "1"
  JOB_WORKER_URL: redis://redis:6379/0
```

#### Creating ConfigMaps for Cluster Pods ####
```
kubectl apply -f app-config.yml
```

#### Applying Configuration for PostgreSQL Pods and Exposing Them using Service ####
```
kubectl apply -f db-deployment.yml
kubectl apply -f db-service.yml
```

#### Applying Configuration for Redis Pods and Exposing Them using Service ####
```
kubectl apply -f redis-deployment.yml
kubectl apply -f redis-service.yml
```

#### Applying Configuration for Rails application Pods and Exposing Them using Service ####
```
kubectl apply -f app-deployment.yml
kubectl apply -f app-service.yml
```

#### To view Kubernetes Cluster dashboard ####
```
minikube dashboard
```

#### To get running Kubernetes Cluster Pods ####
```
kubectl get pods
```

#### To get Kubernetes Cluster Services ####
```
kubectl get services
```

#### To view Rails application service ####
```
minikube service devops
```
