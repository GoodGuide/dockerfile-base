# goodguide/base

This is a Dockerfile to build a base-image with a minimum set of libraries/tools to avoid common annoyances when debugging inside containers, as well as providing baseline functionality assumed needed for any container we'll use at GoodGuide, such as `curl` and `git`.

It also performs some helpful configuration for `apt`, for running with no available UI, as happens when installing packages via Dockerfile.

This is tied to the [goodguide/base](//registry.hub.docker.com/u/goodguide/base) automated build on the Docker Hub, as well as the [quay.io/goodguide/base](https://quay.io/repository/goodguide/base) build on Quay.io.
