const util = require('util');
const exec = util.promisify(require('child_process').exec);

async function execute(command) {
    try {
        const { stdout, stderr } = await exec(command, { cwd: '/Users/philippe/Documents/localdev/'});
        console.log(stdout);
    } catch (err) {
        console.log(err);
    }
}

module.exports = { execute }
