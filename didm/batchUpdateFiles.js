const replace = require('replace-in-file');
const options = {
    files: '/Users/philippe/Documents/localdev/webcomponent-vl-ui-*/package.json',
    from: /"prepare": "npm run prepare:util"/g,
    to: '"prepare": "npm update --dev vl-ui-util && npm run prepare:util"',
    countMatches: true,
    dry: false
};

(async () => {
    try {
        const results = await replace(options);
        console.log('Replacement results: ', results);
    } catch (error) {
        console.error('Error occured: ', error);
    }
});
