#!/bin/bash

DIR="/Users/philippe/Documents/localdev"

function checkDirectory {
    if [[ $(pwd) != $DIR ]]; then
        echo "Not in localdev folder, switching to it ..." && cd $DIR
    fi
}

function performActions {
    git master && git pull && git fetch --prune && cd ..
}

function iterate {
    for f in *; do
        if [[ -d ${f} && ${f} == webcomponent* ]]; then
            cd ${f} && echo "In directory ${f}" && performActions
        fi
    done
}

function run {
    checkDirectory
    iterate
}

run

