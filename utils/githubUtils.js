const github = require('octonode');
const conf = require('../config.json');

async function createPr(repo, title, body, branch) {
    console.log('Creating PR ...');
    const client = github.client(conf.githubAccessToken);
    const repository = client.repo(repo);

    repository.pr({
        "title": title,
        "body": body,
        "head": branch,
        "base": "master"
    }, function (err, body) {
        if (err) {
            console.error(err.body.errors);
            process.exit(1);
        } else {
            console.log(body);
        }
    });
    console.log('PR created!');
}

module.exports = { createPr }
