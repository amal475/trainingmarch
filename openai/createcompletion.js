const { Configuration, OpenAIApi } = require("openai");
require('dotenv').config()

const configuration = new Configuration({
    organization: "org-7yZVlAZwsFGooyAwa7DpFaH1",
    apiKey: process.env.OPENAI_API_KEY,
});
console.log(process.env.OPENAI_API_KEY)

const openai = new OpenAIApi(configuration);
const response = openai.listEngines();

const request = require('request');
const fs = require('fs');

const options = {
    url: 'https://api.openai.com/v1/completions',
    headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${configuration.apiKey}`
    },
    body: JSON.stringify({
        "model": "text-davinci-003",
        "prompt": "Say this is a test",
        "max_tokens": 7,
        "temperature": 0
    })
};

request.post(options, function(error, response, body) {
    if (error) {
        console.error(error);
    } else {
        // Write the output to a file
        fs.writeFile('output.txt', body, function(err) {
            if (err) {
                console.error(err);
            } else {
                console.log('Output written to output.txt');
            }
        });
    }
});

