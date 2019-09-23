#!/usr/bin/env bash

checkIfHomebrewIsInstalled() {
    which -s brew
    if [[ $? != 0 ]] ; then
        echo "Homebrew is not installed, please hang on while we install it for you ..."
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        echo "Homebrew successfully installed!"
    fi
}

checkIfRubyIsInstalled() {
    which -s ruby
    if [[ $? != 0 ]] ; then
        echo "Ruby is not installed, please hang on while we install it for you ..."
        git clone https://github.com/rbenv/ruby-build.git
        PREFIX=/usr/local ./ruby-build/install.sh
        ruby-build 2.6.0 ~/local/ruby-2.6.0
    fi
}

checkIfHubIsInstalled() {
    which -s hub
    if [[ $? != 0 ]] ; then
        echo "Hub is not installed, please hang on while we install it for you ..."
        brew install hub
    fi
}

# jq: https://github.com/stedolan/jq
checkIfJqIsInstalled() {
    which -s hub
    if [[ $? != 0 ]] ; then
        echo "Jq is not installed, please hang on while we install it for you ..."
        brew install jq
    fi
}
