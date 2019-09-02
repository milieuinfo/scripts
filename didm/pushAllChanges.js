const folderUtils   = require('../utils/folderUtils');

const branchName            = 'UIG-xxx';
const commitMessage         = 'Perform npm update --dev vl-ui-util on prepare';
const pushChanges           = 'git add . && git commit -m \"' + commitMessage + '\" && git push --set-upstream origin ' + branchName;

async function run() {
    await folderUtils.executeInEachDir(pushChanges);
};

run();
