#! /usr/bin/env bash

checkBreaking() {
    case $1 in
        Y)
            echo "Updating to latest vl-ui-util ..."
            npm install vl-ui-util@latest
            ;;
        n)
            npm update --dev vl-ui-util
            ;;
        *)
            echo "Ongeldige keuze, gelieve Y of n te selecteren."
            exit 1
            ;;
    esac
}
