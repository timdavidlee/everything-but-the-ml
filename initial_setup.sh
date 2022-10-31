#!/bin/bash

# assume xcode command line tools are installed
# softwareupdate --list
# softwareupdate --install 'Command Line Tools for Xcode-14.0'

# assumes you have pyenv installed on your computer
PYTHON_VERSION=3.10.8
INSTALLS_FOUND=$(pyenv versions | grep PYTHON_VERSION | wc -l)
echo installs found $INSTALLS_FOUND

if [ $INSTALLS_FOUND > 0 ]; then
    echo python $PYTHON_VERSION already installed
else
    pyenv install 3.10.8
fi

pyenv virtualenv 3.10.8 ebtm-3.10
pyenv activate ebtm-3.10

# installing mkdocs
pip install -U pip
pip install mkdocs ansible flask requests mkdocs-material