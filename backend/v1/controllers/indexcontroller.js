const indexmodel = require('../model/indexmodel')
const indexcontroller = {}

indexcontroller.test = function(req, res, next) {
    indexmodel.test(req, res, next);
};

module.exports = indexcontroller;