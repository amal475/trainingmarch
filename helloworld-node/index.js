const express = require('express');
const app = express();

// set up environment variable for message
const message = process.env.MESSAGE || 'Hello, World!';

// set up environment variable for port
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send(message);
});

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
