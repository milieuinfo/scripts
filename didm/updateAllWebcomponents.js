global.workingDir = '/Users/philippe/Documents/localdev';

const folderUtils = require('../utils/folderUtils');
const git = require('../utils/gitUtils');
const npm = require('../utils/npmUtils');

const branchName = 'gezever';

async function run() {
    let dirs = await folderUtils.getDirs();
    for (let dir of dirs) {
        await git.createNewLocalBranch(dir, branchName);
        await npm.updateUtil();
        await npm.install();
    }
}

run();
