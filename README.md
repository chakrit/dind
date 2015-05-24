# Simpler DOCKER-in-DOCKER

This repository contains a Dockerfile that will builds a Docker-in-Docker container. In
other words, a container that has the `docker` binary inside. This is similar to
`jpetazzo/dind` but goes to simpler route, by mounting the host's docker socket instead of
trying to stupidly jump through cgroup hoops to run a fully-featured daemon.

This repository is based on instruction in this post:
http://www.livewyer.com/blog/2015/03/23/building-docker-containers-within-docker-container

* Uses Alpine Linux for minimal base image.
* Uses the host's docker daemon instead of trying to run one inside the container to avoid
  a ton of runtime complications and life-shortening exercises.

# USAGE

As per above you need to mount the docker socket inside the container to access the host's
docker daemon. A basic way to test that everything works is by running `docker ps`. If you
see the container itself listed, then everything works:

```
$ docker run --rm -v /var/run/docker.sock:/var/run/docker.sock chakrit/dind docker ps
```

Isn't that amazing : ) You just ran `docker` from inside a docker container and the result
printed is the status of the container itself running.

