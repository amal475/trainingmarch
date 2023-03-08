const axios = require('axios');
const fs = require('fs');
require('dotenv').config()
const apiEndpoint = 'https://api.openai.com/v1/images/edits';
const apiKey = process.env.OPENAI_API_KEY;

const formData = {
  image: fs.createReadStream('flowr.png'),
  mask: fs.createReadStream('mask.png'),
  prompt: 'A cute baby sea otter wearing a beret',
  n: 2,
  size: '1024x1024'
};

axios.post(apiEndpoint, formData, {
  headers: {
    'Content-Type': 'multipart/form-data',
    'Authorization': `Bearer ${apiKey}`
  }
}).then(response => {
  console.log(response.data);
}).catch(error => {
  console.error(error);
});
