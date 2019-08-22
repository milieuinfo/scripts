const fg = require('fast-glob');

async function getDirs() {
    try {
        return await fg(['webcomponent-vl-ui-*'], { onlyDirectories: true, cwd: '/Users/philippe/Documents/localdev' });
    } catch (err) {
        console.log(err);
    }
}

module.exports = { getDirs }
