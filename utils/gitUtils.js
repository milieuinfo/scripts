const git = require('simple-git/promise');
const path = require('path');

async function createNewLocalBranch(webcomponentName, branchName) {
    console.log('Creating new local branch for ' + webcomponentName + ' ...');
    try {
        const cwd = path.resolve(workingDir, webcomponentName);

        await git(cwd).checkout('master');
        await git(cwd).stash();
        await git(cwd).pull();
        await git(cwd).checkoutLocalBranch(branchName);
        console.log('Branch ' + branchName + ' created for ' + webcomponentName + '!');
    } catch (e) {
        console.error('Failed to create branch for ' + webcomponentName + '\n' + e)
        process.exit(1);
    }
}

async function pushChanges(webcomponentName, branchName) {
    console.log('Pushing changes ...');
    try {
        const cwd = path.resolve(workingDir, webcomponentName);

        await git(cwd).add('*');
        await git(cwd).commit('Automated commit via update script')
        await git(cwd).addRemote(branchName, 'https://github.com/milieuinfo/' + webcomponentName + '.git')
        await git(cwd).push(['-u', 'origin', branchName], () => console.log('Changes pushed!'));
    } catch (e) {
        console.error(e);
        process.exit(1);
    }
}

module.exports = { createNewLocalBranch, pushChanges }
