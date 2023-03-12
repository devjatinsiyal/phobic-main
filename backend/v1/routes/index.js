var express = require('express');
var app = express();
const indexpagecontroller = require('../controller/indexcontroller');

app.get('/', indexpagecontroller.test);

module.exports = app;