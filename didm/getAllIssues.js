const ghUtils = require('../utils/githubUtils');

async function run() {
    try {
        let issues = await ghUtils.getAllRepos();
        let wcIssues = issues.data.filter(function (issue) {
            return issue.full_name.includes('webcomponent');
        });
        issues.data.forEach((data) => console.log(data.full_name));
    } catch (err) {
        console.error(err);
    }
}

run();
