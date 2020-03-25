#!/usr/bin/env bash

CWD=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

source $CWD/../utils/envUtils.sh
source $CWD/../utils/gitUtils.sh
source $CWD/../utils/npmUtils.sh

checkIfRubyIsInstalled
checkIfHomebrewIsInstalled
checkIfHubIsInstalled

read -e -p 'Waar bevinden zich de webcomponenten? (vb. /Users/philippe/localdev) ' path
read -p "Mag vl-ui-core naar de laatste major worden geupdate? (Y/n) " choice

WORKINGDIR=$path
BRANCHNAME="maintenance"

DIRS=$(ls $WORKINGDIR | grep "webcomponent-vl-ui-*")

for dir in $DIRS; do
    pushd $WORKINGDIR$dir \
    && echo "====================================================" \
    && echo " Working on $dir" \
    && echo "====================================================" \
    && git checkout master \
    && git stash \
    && git pull \
    && checkIfMaintenanceBranchExists $BRANCHNAME \
    && git checkout -b $BRANCHNAME \
    && npm uninstall vl-ui-util --save-dev \
    && npm install vl-ui-util@5.0.10 --save-dev --save-exact \
    && git pull \
    && checkBreaking $choice "vl-ui-core" \
    && npm install \
    && git add -A \
    && git commit -m "Update vl-ui-core" \
    && git push --set-upstream origin $BRANCHNAME \
    && hub pull-request --assign coemans --labels chore --no-edit \
    && echo "====================================================" \
    && echo " Done for $dir" \
    && echo "====================================================" \
    && popd
done
