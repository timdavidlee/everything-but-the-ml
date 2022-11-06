# Essential Docker Operations

- `docker build`
- `docker exec`
- `docker run`
- `docker inspect`
- `docker logs`
- `docker ps`

### Installation of the docker managment software on a macOS

```sh
brew install docker docker-machine
```

```sh
brew install --cask virtualbox
```

### Lifecycle of a docker process:

**Vocab**

- **image** think of this as the starting "template". It contains a collection of instructions + packages. So a `python:3.8` image will have all the necessary libraries to run `python` commands
- **container** this is an **INSTANCE** of a **image**. So even though there is a `python:3.8` image, many containers can be started from this image. Will show an example below

#### 1. Define a docker file (if not using a public one)

```docker
FROM python:3.8
RUN python -m print("hello world")
```


#### 2. Download or create a docker container

```sh
# pull an image
docker pull python:3.8

    3.8: Pulling from library/python
    17c9e6141fdb: Downloading [=================>  ]   18.8MB/55.05MB
    de4a4c6caea8: Download complete
    ...
```

```sh
# build the image we defined before
docker build \
    -t my-first-image:latest \
    -f school-of-mle/docker/Dockerfile .
```

Check to see if the images are available:

```sh
$ docker image ls -a
REPOSITORY       TAG       IMAGE ID       CREATED              SIZE
my-first-image   latest    91c2f3f015e7   About a minute ago   913MB
python           3.8       900972ffeecd   10 days ago          913MB
```


#### 3. Start or Run a docker container

```sh
docker run --rm -d --name my_first_container python:3.8 
docker run --rm -d --name my_second_container python:3.8 
```

#### 4. Check the status of the container while it runs

```sh
docker ps
```

#### 5. Stop the running docker when complete

```sh
docker stop
```

#### 6. Delete the containers if not needed

```sh
docker container -rm
```

#### 7. Remove the image if not needed


```sh
docker image -rm
```
