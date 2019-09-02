# DIDM
##  Update components

`updateAllWebComponents` looks for every directory under the working directory which globs to `webcomponent-vl-ui`. The working directory is set on the global scope at the start of the run.

A new branch is created for every webcomponent. Its name is set via `branchName`.
On this branch, `npm update vl-ui-util` is executed, followed by `npm install`.

TODO: Add automated pull request
