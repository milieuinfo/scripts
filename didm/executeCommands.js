const folderUtils = require('../utils/folderUtils');
const shell = require('../utils/shellUtils');

const branchName            = 'UIG-167';
const deleteLocalBranches   = 'git branch | grep -v \"master\" | xargs git branch -D';
const createNewBranch       = 'git stash && git master && ' + deleteLocalBranches + ' && git pull && git checkout -b' + branchName;

const commitMessage         = 'Perform npm update --dev vl-ui-util on prepare';
const pushChanges           = 'git add . && git commit -m \"' + commitMessage + '\" && git push --set-upstream origin ' + branchName;

async function run() {
    const result = await folderUtils.getDirs();
    result.forEach((entry) => {
        shell.execute('cd ' + entry + ' && ' + pushChanges);
    });
}

run();
