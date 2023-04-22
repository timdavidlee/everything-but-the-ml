# Getting started with Linux on Windows

## A. Installing WSL on Windows

[https://learn.microsoft.com/en-us/windows/wsl/install](https://learn.microsoft.com/en-us/windows/wsl/install)

### A.1 What version of WSL?

Open `powershell`

```sh
# powershell
wsl -l -v
```

Should see something like the following

```
  NAME      STATE           VERSION
* Ubuntu    Running         1
```

How to install other variants of linux. Go to micro

```sh
# powershell
wsl --set-default-option 2
```

## B Installing Windows Terminal

https://learn.microsoft.com/en-us/windows/terminal/install

