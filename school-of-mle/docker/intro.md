# What is Docker?

From the [website](https://docs.docker.com/get-started/overview/): 

>Docker is an open platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly. With Docker, you can manage your infrastructure in the same ways you manage your applications. By taking advantage of Docker’s methodologies for shipping, testing, and deploying code quickly, you can significantly reduce the delay between writing code and running it in production.

The key benefit of docker is `containers` that can wrap little:

- applications
- specific versions of applications
- different operating systems

## Why is important for data scientists?

Two fold:

1. chances are the model + algorithm that will be deployed will be wrapped in a docker + used in production
2. Makes it 100x easier to borrow research code (older) without having to update all the dependencies needed to run.
    - this could also be done with a different git clone, but many of these repos are tied to specific versions of `pytorch`, `tensorflow`, or other frameworks


### Installation

1. Visit the following website: [https://docs.docker.com/desktop/install/mac-install/](https://docs.docker.com/desktop/install/mac-install/)
2. even easier: `brew install --cask docker
`



### Some samples

We can pull various versions of applications + actually have them run at the same time!

```
docker pull alpine:latest
docker pull ubuntu:18.04  # old version
docker pull ubuntu:20.04  # newer version
docker pull python:3.8    # old version
docker pull python:3.10   # new version
```

**Benefits**:
- No longer need to install + uninstall various versions locally, (potentially messing up system tools)
- if supporting multiple versions, (want to test installations), can download the containers + install on various versions to ensure the behavior is expected

