# How to answer common Linux system Questions


### What's running on this machine?

A great tool to use
```sh
# MacOSx
brew install htop

# RHEL | Centos | red-hat | amazon
sudo yum install -y htop

# ubuntu | debian | mint
sudo yum apt-get install -y htop
```

### how much space is left on the drive?

```sh
df -h
```

`-h`: means human-readable
`df`: free disk space

Sample output

```
ubuntu@ip-172-31-24-128:~$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/root       7.7G  5.1G  2.7G  66% /
devtmpfs        2.0G     0  2.0G   0% /dev
tmpfs           2.0G     0  2.0G   0% /dev/shm
tmpfs           393M  832K  392M   1% /run
tmpfs           5.0M     0  5.0M   0% /run/lock
tmpfs           2.0G     0  2.0G   0% /sys/fs/cgroup
/dev/loop1       27M   27M     0 100% /snap/amazon-ssm-agent/5163
/dev/loop3       56M   56M     0 100% /snap/core18/2284
/dev/loop5       68M   68M     0 100% /snap/lxd/21835
/dev/loop6       44M   44M     0 100% /snap/snapd/14978
/dev/loop7       62M   62M     0 100% /snap/core20/1328
/dev/loop8       48M   48M     0 100% /snap/snapd/17336
/dev/loop9       64M   64M     0 100% /snap/core20/1634
/dev/loop10      56M   56M     0 100% /snap/core18/2620
/dev/loop2       25M   25M     0 100% /snap/amazon-ssm-agent/6312
/dev/loop4       68M   68M     0 100% /snap/lxd/22753
tmpfs           393M     0  393M   0% /run/user/1000
```


### How much space does this one folder use?

```sh
du -h --max-depth=2
```

The output will look something like the following:

```
du -h --max-depth=2 myrepos/
332K	myrepos/newsgiraffe3/.git
92K	    myrepos/newsgiraffe3/rss
28K	    myrepos/newsgiraffe3/scripts
28K	    myrepos/newsgiraffe3/parse
52K	    myrepos/newsgiraffe3/aws
32K	    myrepos/newsgiraffe3/util
8.0K	myrepos/newsgiraffe3/sample_formats
28K	    myrepos/newsgiraffe3/migration
12K	    myrepos/newsgiraffe3/__pycache__
640K	myrepos/newsgiraffe3
644K	myrepos/
```

### What's my IP?

```
hostname -I

>>> 172.31.24.123
```

### No really what's my possible IPs?

```
$ ifconfig


    eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 9001
            inet 172.31.24.128  netmask 255.255.240.0  broadcast 172.31.31.255
            inet6 fe80::6e:58ff:fef6:dcdd  prefixlen 64  scopeid 0x20<link>
            ether 02:6e:58:f6:dc:dd  txqueuelen 1000  (Ethernet)
            RX packets 140046  bytes 204482450 (204.4 MB)
            RX errors 0  dropped 0  overruns 0  frame 0
            TX packets 10039  bytes 857658 (857.6 KB)
            TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

    lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
            inet 127.0.0.1  netmask 255.0.0.0
            inet6 ::1  prefixlen 128  scopeid 0x10<host>
            loop  txqueuelen 1000  (Local Loopback)
            RX packets 434  bytes 49044 (49.0 KB)
            RX errors 0  dropped 0  overruns 0  frame 0
            TX packets 434  bytes 49044 (49.0 KB)
            TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

### Do i have internet connectivity?

```
ping www.google.com

    PING www.google.com (142.250.217.100) 56(84) bytes of data.
    64 bytes from sea09s30-in-f4.1e100.net (142.250.217.100): icmp_seq=1 ttl=104 time=7.66 ms
    64 bytes from sea09s30-in-f4.1e100.net (142.250.217.100): icmp_seq=2 ttl=104 time=7.65 ms
    64 bytes from sea09s30-in-f4.1e100.net (142.250.217.100): icmp_seq=3 ttl=104 time=7.70 ms
```