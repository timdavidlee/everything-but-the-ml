# SSH

## 1. create a ssh key

```sh
ssh-keygen -t ed25519 -C "your_email@example.com"
```

## 2. will create two files:


### your private key, never share

`id_ed25519`

```
-----BEGIN OPENSSH PRIVATE KEY-----
abc1234...
...abc1234
-----END OPENSSH PRIVATE KEY-----
```

### your public key (copy everywhere)

```
ssh-ed25519 ABC1234abc1234 your_email@example.com
```

## 3. then start the ssh agent

The keys have been created, but need to be added to a service

### 3.1 starts the ssh agent service

```sh
eval "$(ssh-agent -s)"
```

### 3.2  add the key to the keychain

```sh
ssh-add ~/.ssh/id_ed25519
```