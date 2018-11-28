var express = require('express');
var fs = require('fs');
var router = express.Router();
const Sequelize = require('sequelize');
var sequelize = require('../config/database');


/* GET users listing. */

router.get('/*.png', function(req, res, next) {

  let image_name = req.url;

  let img = fs.readFileSync('./images'+image_name);
  res.writeHead(200, {'Content-Type': 'image/gif' });
  res.end(img, 'binary');

});

module.exports = router;