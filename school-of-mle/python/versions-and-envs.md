# Versions and Environments

## Different packages, same python: Virtual Environments

This is mainly used for grouping inter-dependent packages together. Consider the example:

- A legacy data analysis program requires the following `python` packages
    
    > pandas<1.0.0
    

- A newer visualization program requires the following `python` packages
    
    >plotly >= 2.0.0

    >pandas >= 1.1.0
    

How can both "setups" be commodated? With `virtual environments`! From the python [documentation](https://docs.python.org/3/library/venv.html):

> A virtual environment is created on top of an existing Python installation, known as the virtual environment’s “base” Python, and may optionally be isolated from the packages in the base environment, so only those explicitly installed in the virtual environment are available.

### So to create two different envs

```sh
python3 -m venv legacy-env
```

```sh
python3 -m venv viz-env
```

And each of these should create local folders, so to change environments, all that is needed is:

```sh
# activate the legacy environment
source /path/to/dir/legacy-env/bin/activate
pip install pandas<1.0.0

# activate the viz environment
source /path/to/dir/viz-env/bin/activate
pip install pandas>=1.1.0
```

## Different Python(s), different packages: Pyenv

Occasionally a library will not be compatible with the bleeding edge python. Say `python3.12` came out, but this legacy library was only tested on `python3.8`. And as a developer, its required to have **both versions installed on one computer**.


Github Link: [https://github.com/pyenv/pyenv](https://github.com/pyenv/pyenv)

Recommended installer: [https://github.com/pyenv/pyenv#automatic-installer](https://github.com/pyenv/pyenv#automatic-installer)

```
curl https://pyenv.run | bash
```

### How to install different versions


First see what versions are available

```
pyenv versions
```

Then install the specific version(s) that are needed

```
pyenv install 3.8.10
pyenv install 3.12.1
```

### How to switch between the different versions

```sh
pyenv global 3.8.10  # will always use this python version for this user account
pyenv local 3.12.1  # will only use this python in this particular directory + sub directories
pyenv shell 3.7.11  # just for this immediate shell, use this python
```


