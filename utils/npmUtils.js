const sh = require('../utils/shellUtils');

async function updateUtil() {
    sh.exec('npm update vl-ui-util', (stdout) => {
        console.log(stdout);
    });
}

async function install() {
    sh.exec('npm install', (stdout) => {
        console.log(stdout);
    });
}

module.exports = { updateUtil, install }
