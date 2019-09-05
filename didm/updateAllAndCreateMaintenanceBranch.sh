#! /bin/bash

source ../utils/gitUtils.sh

WORKINGDIR="/Users/philippe/Documents/localdev/"
BRANCHNAME="maintenance"

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
