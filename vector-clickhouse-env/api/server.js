'use strict';

const express = require('express');

const PORT = 3000;
const HOST = '0.0.0.0';

const app = express();

app.get('*', function (req, res) {
  const message = 'Route requested (Node API route Return).';
  console.log('INFO: ', message);
  const queryString = req.query;
  const originalUrl = req.originalUrl;

  res.send({message, queryString, originalUrl});
});

app.listen(PORT, HOST);

console.log(`Running on http://${HOST}:${PORT}`);