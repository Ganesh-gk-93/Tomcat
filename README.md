# Jenkins + Docker + Tomcat Sample

This repository provides a minimal example of launching an Apache Tomcat
container from a Jenkins pipeline using Docker.

## Repository structure

- `Dockerfile` – builds a Docker image based on the official Tomcat image
  and copies a small web application.
- `Jenkinsfile` – declarative pipeline that builds the image, runs a
  container and verifies the web page with `curl`.
- `webapps/ROOT/index.html` – simple HTML page served by Tomcat.

## Run locally

```bash
docker build -t sample-tomcat .
docker run -d -p 8080:8080 --name tomcat-demo sample-tomcat
```

Open <http://localhost:8080/> to view the sample page. When finished, stop
and remove the container:

```bash
docker rm -f tomcat-demo
```

## Jenkins pipeline

The provided `Jenkinsfile` performs the following stages:

1. **Build Docker image** – `docker.build('sample-tomcat')`
2. **Run container** – `docker run -d -p 8080:8080 --name tomcat-demo sample-tomcat`
3. **Test** – uses `curl` to confirm the page contains "Hello from Tomcat".

Ensure that the Jenkins agent executing the job has Docker available and the
Docker Pipeline plugin installed.
