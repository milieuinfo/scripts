const config = require('../config.json');
const Octokit = require('@octokit/rest');

const octokit = new Octokit({
    auth: config.githubAccessToken,
    log: console
});

async function createPullRequest(repo, title, head) {
    try {
        await octokit.pulls.create({
            owner: 'milieuinfo',
            repo: repo,
            title: title,
            head: head,
            base: 'master'
        });
    } catch (err) {
        console.error('Pull request failed! ' + err);
    }
}

async function getAllRepos() {
    try {
        return await octokit.repos.listForOrg({ org: 'milieuinfo' });
    } catch (err) {
        console.error(err);
    }
}

module.exports = { createPullRequest, getAllRepos }
