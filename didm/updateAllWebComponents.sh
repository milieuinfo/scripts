#! /bin/bash

source ../utils/envUtils.sh

checkIfHomebrewIsInstalled
checkIfRubyIsInstalled
checkIfHubIsInstalled

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
    && git checkout -b $BRANCHNAME \
    && npm update vl-ui-util \
    && npm install \
    && git add -A \
    && git commit -m "Automatic commit via update script" \
    && git push --set-upstream origin $BRANCHNAME \
    && hub pull-request --assign coemans --labels maintenance --no-edit \
    && echo "====================================================" \
    && echo " Done for $dir" \
    && echo "====================================================" \
    && popd
done
