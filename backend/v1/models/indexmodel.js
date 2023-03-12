const date = require('date-and-time');
var moment = require('moment');
var session = require('express-session');
const { base64encode, base64decode } = require('nodejs-base64');
const bcrypt = require('bcrypt');
const saltRounds = 10;
var jwt = require('jsonwebtoken');
const db = require('../utils/database');
var axios = require('axios');
var md5 = require('md5');
const {v4: uuidV4} = require('uuid');
const modalMethod = {}

modalMethod.test = function(req, res, next) {
    res.send("API Working");
};

module.exports = modalMethod;