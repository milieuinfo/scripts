const exe = require('child_process').exec;

function exec(cmd, cb) {
    exe(cmd, (err, stdout) => {
        if(err) {
            console.error(err);
            return;
        }
        cb(stdout);
    });
}

module.exports = { exec }
