const fg = require('fast-glob');
const shell = require('../utils/shellUtils');

async function getDirs() {
    try {
        return await fg(['webcomponent-vl-ui-*'], { onlyDirectories: true, cwd: workingDir });
    } catch (err) {
        console.log(err);
    }
}

async function executeInEachDir(commands) {
    try {
        const dirs = await getDirs();
        dirs.forEach(dir => {
            shell.execute('cd ' + dir + ' && ' + commands)
        });
    } catch (err) {
        console.error(err);
    }
}

module.exports = { getDirs, executeInEachDir }
