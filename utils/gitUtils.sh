#!/usr/bin/env bash

checkIfMaintenanceBranchExists() {
    # List branches, filter on branchname and trim whitespace
    BRANCHES=$(git branch | grep $1 | tr -d '[:space:]')

    if [[ $BRANCHES == $1 ]] ; then
        echo "Branch detected"
        git checkout $1 \
        && git stash \
        && git master \
        && git branch --delete $1
    else
        echo "Branch not detected"
    fi
}
