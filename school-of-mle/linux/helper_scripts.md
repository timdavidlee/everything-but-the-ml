# Bash Scripts to save your life

### Why you should bother

Empower the lazy part of you, write a decent shell script once, and never have to memorize commands again. Here's some examples of easy automation

```sh
#!/bin/bash
echo "New computer setup, creating data directory"
mkdir -p /home/joebob/data

echo "install favorite packages"
sudo apt-get install -y \
    htop \
    curl \
    wget \
    bash-completion

echo "reboot the machine"
sudo reboot
```

#### Another example for starting tunnels

```sh
ssh -i /my/pem/key -L 8888:localhost:8888 -L 8889:localhost:8889
```


#### Some helpful shell hints

```
```