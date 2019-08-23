const folderUtils = require('../utils/folderUtils');
const shell = require('../utils/shellUtils');

async function run() {
    const result = await folderUtils.getDirs();
    result.forEach((entry) => {
        shell.execute('cd ' + entry + ' && git master && git pull && git checkout -b UIG-212');
    });
}

run();
