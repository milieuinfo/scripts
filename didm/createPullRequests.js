const ghUtils       = require('../utils/githubUtils');
const folderUtils   = require('../utils/folderUtils');

const issueNumber   = 'UIG-XXX';
const prTitle       = 'Test';

async function run() {
    const repo = await folderUtils.getDirs();
    repo.forEach(prj => {
        await ghUtils.createPullRequest(prj, prTitle, issueNumber);
    });
};

run();
