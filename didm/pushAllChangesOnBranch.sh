#!/usr/bin/env bash

source ../utils/envUtils.sh
source ../utils/gitUtils.sh

checkIfHomebrewIsInstalled
checkIfRubyIsInstalled
checkIfHubIsInstalled

WORKINGDIR="/Users/philippe/Documents/localdev/"
BRANCHNAME="UIG-218"
ASSIGNEE="cambiph"
LABELS="maintenance"

DIRS=`ls $WORKINGDIR | grep "webcomponent-vl-ui-*"`

for dir in $DIRS; do
    pushd $WORKINGDIR$dir \
    && echo "====================================================" \
    && echo " Working on $dir" \
    && echo "====================================================" \
    && git checkout $BRANCHNAME \
    && git add -A \
    && git commit -m "$BRANCHNAME" \
    && git push --set-upstream origin $BRANCHNAME \
    && hub  pull-request -o --assign $ASSIGNEE --labels $LABELS --no-edit\
    && echo "====================================================" \
    && echo " Done for $dir" \
    && echo "====================================================" \
    && popd
done
