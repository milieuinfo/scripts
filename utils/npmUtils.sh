#! /usr/bin/env bash

checkBreaking() {
    case $1 in
        Y)
            echo "Updating to latest $2"
            npm install $2@latest --save
            ;;
        n)
            npm update --dev $2
            ;;
        *)
            echo "Ongeldige keuze, gelieve Y of n te selecteren."
            exit 1
            ;;
    esac
}
