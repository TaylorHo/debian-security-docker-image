# Debian Security Docker Image

> You never use all the tools that Kali Linux provides. So, have this debian based Docker Image with just the tools you use the most!

## Usage
The usage is described as follows:

First of all, build or pull the container:
```
docker build -t debian-security .
```
or
```
docker pull taylorho/debian-security:latest
```
---

The you can start the container
```
docker run -it --name debian debian-security
```
<sub>It will open a shell on the container with all the tools you need.</sub>

If you need to exit the container, you can re-enter it using this command:
```
docker exec -it debian /bin/bash
```
<sub>Maybe you will need to run a `docker start debian` before.</sub>

## Contributing

If you think that another tool should be included, [open an Issue](https://github.com/TaylorHo/debian-security-docker-image/issues) or a [Pull Request](https://github.com/TaylorHo/debian-security-docker-image/pulls) adding it! Booth are welcomed!
