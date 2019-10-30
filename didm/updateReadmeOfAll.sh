#!/usr/bin/env bash

CWD=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

source $CWD/../utils/envUtils.sh
source $CWD/../utils/gitUtils.sh
source $CWD/../utils/npmUtils.sh

checkIfRubyIsInstalled
checkIfHomebrewIsInstalled
checkIfHubIsInstalled

read -e -p 'Waar bevinden zich de webcomponenten? (vb. /Users/philippe/localdev) ' path

WORKINGDIR=$path
BRANCHNAME="maintenance"

DIRS=$(ls $WORKINGDIR | grep "webcomponent-vl-ui-*")

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
    && npm install \
    && npm explore vl-ui-util -- npm run update:readme \
    && git add -A \
    && git commit -m "Update Readme" \
    && git push --set-upstream origin $BRANCHNAME \
    && hub pull-request --assign coemans --labels maintenance --no-edit \
    && echo "====================================================" \
    && echo " Done for $dir" \
    && echo "====================================================" \
    && popd
done
