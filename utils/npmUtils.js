const sh = require('../utils/shellUtils');

async function updateUtil() {
    sh.execute('npm update vl-ui-util');
}

async function install() {
    sh.execute('npm install');
}

module.exports = { updateUtil, install }
