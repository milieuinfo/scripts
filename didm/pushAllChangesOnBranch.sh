#!/usr/bin/env bash

CWD=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

source ../utils/envUtils.sh
source ../utils/gitUtils.sh

checkIfHomebrewIsInstalled
checkIfRubyIsInstalled
checkIfHubIsInstalled

read -e -p 'Waar bevinden zich de webcomponenten? (vb. /Users/philippe/localdev) ' path
read -p "Wat is de naam van de branch? " branchName
read -p "Aan wie moet de pull request toegewezen worden? " assignee
read -p "Wat is het label van de pull request? " label

WORKINGDIR=$path
BRANCHNAME=$branchName
ASSIGNEE=$assignee
LABELS=$label

DIRS=$(ls $WORKINGDIR | grep "webcomponent-vl-ui-*")

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
