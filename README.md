# goodguide/base

This is a set of Dockerfiles to build base-images with:

- a minimum set of libraries/tools to avoid common annoyances when debugging inside containers, as well as providing baseline functionality assumed needed for any container we'll use at GoodGuide, such as `curl` and `git`.

- a default Dockerfile `RUN` command shell which echoes what's happening (`bash -x`) and automatically cleans up temp directories after running the command

- an `app` user

- a health-check script (available on `$PATH` as `gg_health_check`) for use with the `HEALTHCHECK` Dockerfile instruction:

    ```Dockerfile
    HEALTHCHECK --interval=15s CMD gg_health_check [PORT=3000] [PATH=/health/status]
    ```

- For the Ubuntu-based images(s):

    - performs some helpful configuration for `apt`, for running with no available UI, as happens when installing packages via Dockerfile.


This is built using TravisCI, which then pushes to the [quay.io/goodguide/base](https://quay.io/repository/goodguide/base) repo on Quay.io.

[![Build Status](https://travis-ci.org/GoodGuide/dockerfile-base.svg?branch=master)](https://travis-ci.org/GoodGuide/dockerfile-base)
