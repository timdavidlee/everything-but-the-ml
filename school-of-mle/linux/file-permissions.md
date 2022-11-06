# File Permissions
#### People, groups, read, write + files

Consider the following files:

```
ls -lha
drwxr-xr-x  4 joebob  staff   128B Nov  5 17:44 .
drwxr-xr-x  9 joebob  staff   288B Nov  5 17:51 ..
-rw-r--r--  1 joebob  staff    22B Nov  5 17:46 run.sh
-rw-r--r--  1 joebob  admin    39B Nov  5 17:44 text1.txt
-rw-r--r--  1 joebob  joebob   39B Nov  5 17:44 text2.txt
-rw-r--r--  1 root    root     39B Nov  5 17:44 text3.txt
```

#### Observations

- `run.sh` doesn't have execution permission `-rw-r--r--`, can only read or write.
- `text1.txt` is owned by a our current user, `joebob` but can be accessed by any user in the group `admin`
- `text2.txt` is owned by a our current user, `joebob` and via the group only `joebob`, no other user can access
- `text3.txt` is owned by `root`, and cannot be accessed by `joebob`


## Typical issues


#### Accidentally saving data as `root`

```sh
sudo sh ./download-data-and-save.sh
```

What happens above is:
1. `sudo` kicks in, and the command is run as `root`
2. which means any file saved by this command will probably be saved with the owner as `root: root`


#### Trying to manage everything by individual users instead of groups

If a file is owned by `joebob`, and `samantha` wants to access the file too, the answer isn't to keep changing ownership, but to add the users to the same group, and give group access to the file.

So starting with `text2.txt` file.

```
-rw-r--r--  1 joebob  joebob   39B Nov  5 17:44 text2.txt
```

First, create a group

```sh
sudo groupadd engteam
```

Then add the existing users to the group

```sh
sudo usermod -a -G engteam joebob
sudo usermod -a -G engteam samantha
```

Check that the group change was successful, the following command will list all possible groups

```sh
groups joebob

>>> staff everyone localaccounts engteam
```

Then change the permissions on the file

```sh
chown engteam:engteam text2.txt
```

```
ls -lha

-rw-r--r--  1 engteam  engteam   39B Nov  5 17:44 text2.txt
```

Now anyone on the `engteam` can successfully access the files