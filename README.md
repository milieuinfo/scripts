# DIDM

## Push all changes on branch

Indien je manueel een branch hebt aangemaakt (lokaal) en deze wil pushen. Het script zoekt op de opgegeven locatie naar alle repositories die voldoen aan de regex `webcomponent-vl-ui-*`. Vervolgens word de gekozen branch uitgechecked, gecommit en gepushed. Er zal eveneens een pull request geopend worden. Je moet via de command-line de `assignee` en het `label` meegeven.

## Update all and create branch

Het script zoekt op de opgegeven locatie naar alle repositories die voldoen aan de regex `webcomponent-vl-ui-*`. Vervolgens worden de lokale changes op `master` gestashed en gebeurt er een pull van `master`. Als laatste wordt er een nieuwe branch aangemaakt met de opgegeven naam. Indien de branch al bestond, word deze weggegooid.


## Update all to latest util

Het script zoekt op de opgegeven locatie naar alle repositories die voldoen aan de regex `webcomponent-vl-ui-*`. Er word een maintenance branch aangemaakt waarop de versie van `vl-ui-util` word verhoogd naar de laatste versie. Indien de gebruiker dit heeft meegegeven, zal er geupdate worden naar de laatste major. Er word dan een `npm install` uitgevoerd en de changes worden gepushed naar de remote maintenance branch en er word een pull request geopend.
