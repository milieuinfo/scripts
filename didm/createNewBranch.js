const folderUtils   = require('../utils/folderUtils');

const branchName            = 'UIG-xxx';
const deleteLocalBranches   = 'git branch | grep -v \"master\" | xargs git branch -D';
const createNewBranch       = 'git stash && git master && ' + deleteLocalBranches + ' && git pull && git checkout -b' + branchName;

async function run() {
    await folderUtils.executeInEachDir(createNewBranch);
};

run();
