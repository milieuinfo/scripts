#! /bin/bash

function checkIfHomebrewIsInstalled() {
    echo "Checking if Homebrew is installed ..."
    which -s brew
    if [[ $? != 0 ]] ; then
        echo "Homebrew is not installed, please hang on while we install it for you ..."
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        echo "Homebrew successfully installed!"
    else
        echo "Homebrew successfully detected on your system!"
    fi
}

function checkIfRubyIsInstalled() {
    which -s rbenv
    if [[ $? != 0 ]] ; then
        echo "Ruby is not installed, please hang on while we install it for you ..."
        git clone https://github.com/rbenv/ruby-build.git
        PREFIX=/usr/local ./ruby-build/install.sh
        ruby-build 2.6.0 ~/local/ruby-2.6.0
    else
        echo "Ruby successfully detected on your system!"
    fi
}

function checkIfHubIsInstalled() {
    which -s hub
    if [[ $? != 0 ]] ; then
        echo "Hub is not installed, please hang on while we install it for you ..."
        brew install hub
    else
        echo "Hub successfully detected on your system!"
    fi
}
