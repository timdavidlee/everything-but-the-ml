# Common Types of Linux

[Reference - W3Schools](https://www.w3schools.blog/flavors-of-linux)

#### 1. MacOSX - Not Unix

The macOS kernel is officially known as XNU. The acronymn stands for `XNU is Not Unix`. It was created with components of FreeBSD and C++ API for writing drivers.


> macOS Kernel combines the feature of a microkernel(Mach) and monolithic kernel(BSD). Linux is solely a monolithic kernel.
#### 2. Ubuntu / Mint (Debian family)

By far one of the most popular distributions.

- generally targetted towards the general individual user base 

#### 3. Redhat / Centos / Amazon

Red Hat Enterprise Linux (RHEL) is generally designed for business use. It is generally more stable than other flavors of linux.

- This will typically be the distro found at work

#### 4. Amazon Linux (AWS)

This version of linux will only be found in AWS powered virtual machines. [Link](https://linuxhint.com/what_is_amazon_linux_2/)

>  Based on Red Hat Enterprise Linux (RHEL), Amazon Linux stands out thanks to its tight integration with many Amazon Web Services (AWS) services, long-term support, and a compiler, build toolchain, and LTS Kernel tuned for better performance on Amazon EC2

## Q: What distro is running on this machine?

```sh
$ cat /etc/os-release
```

```
NAME="Ubuntu"
VERSION="20.04.3 LTS (Focal Fossa)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 20.04.3 LTS"
VERSION_ID="20.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=focal
UBUNTU_CODENAME=focal
```

## Q: Where this matters the most: Installing packages!

Reasons why you may be forced into one flavor vs. another:

- Companies may let users choose the version of linux they would like to use
- Companies often have prebuilt "base" images/machines with security + settings built in and developers can extend these machines
- A legacy package needs to sustained, but it runs on a very particular configuration


The following commands are all equivalent for installing generic software compiling packages 

```sh
# ubuntu
sudo apt-get install -y build-essential
```

```sh
# RHEL
sudo yum install -y gcc gcc-c++ kernel-devel make
sudo yum groupinstall "Development Tools"
```

Another example, there's a compression algo called `SNAPPY` that is used for parquet related files. 

```sh
# macOS
brew install snappy
```

```sh
# ubuntu
sudo apt-get install -y libsnappy1 libsnappy-dev
```

```sh
# RHEL
sudo yum install -y snappy snappy-devel
```

- So ensure the distro is confirmed before searching stackoverflow for instructions to install
- ensure the version + library matches the library distribution