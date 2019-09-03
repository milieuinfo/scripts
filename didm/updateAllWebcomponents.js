global.workingDir = '/Users/philippe/Documents/localdev';

const folderUtils = require('../utils/folderUtils');
const git = require('../utils/gitUtils');
const npm = require('../utils/npmUtils');
const gh = require('../utils/githubUtils');

const branchName = 'maintenance';

async function run() {
    let dirs = await folderUtils.getDirs();
    for (let dir of dirs) {
        await git.createNewLocalBranch(dir, branchName);
        await npm.updateUtil();
        await npm.install();
        await git.pushChanges(dir, branchName);
        await gh.createPr('milieuinfo/' + dir, 'Automated PR via update script', 'Automated PR', branchName);
    }
}

run();
