const git = require('simple-git/promise');
const path = require('path');

async function createNewLocalBranch(webcomponentName, branchName) {
    try {
        const cwd = path.resolve(workingDir, webcomponentName);
        
        await git(cwd).checkout('master');
        await git(cwd).stash();
        await git(cwd).pull();
        await git(cwd).checkoutLocalBranch(branchName);
    } catch (e) {
        console.error(e)
    }
}

module.exports = { createNewLocalBranch }
