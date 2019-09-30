#!/usr/bin/env bash

CWD=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) 

source ../utils/gitUtils.sh

read -e -p 'Waar bevinden zich de webcomponenten? (vb. /Users/philippe/localdev) ' path
read -e "Wat is de naam van de branch die moet aangemaakt worden? " branch

WORKINGDIR=$path
BRANCHNAME=$branch

DIRS=`ls $WORKINGDIR | grep "webcomponent-vl-ui-*"`

for dir in $DIRS; do
    pushd $WORKINGDIR$dir \
    && echo "====================================================" \
    && echo " Working on $dir" \
    && echo "====================================================" \
    && git master \
    && git stash \
    && git pull \
    && checkIfMaintenanceBranchExists $BRANCHNAME \
    && git checkout -b $BRANCHNAME \
    && echo "====================================================" \
    && echo " Done for $dir" \
    && echo "====================================================" \
    && popd
done
