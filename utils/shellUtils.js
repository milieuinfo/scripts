const util = require('util');
const exec = util.promisify(require('child_process').exec);

async function execute(command) {
    try {
        await exec(command, { cwd: workingDir });
    } catch (err) {
        console.log(err);
    }
}

module.exports = { execute }
