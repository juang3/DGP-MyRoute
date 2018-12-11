/**
 * Integración de módulos
 *
 */
var express = require('express');
var router = express.Router();
const Sequelize = require('sequelize');
var sequelize = require('../config/database');
// var bcrypt = require('bcrypt');

// var BCRYPT_SALT_ROUNDS = 12;


/**
 * Integración con la API
 */
router.post('/', function(req, res) {
  var email = req.body.correo;
  var password = req.body.pass;
  var query = 'SELECT * FROM Usuario_registrado where correo = ?';
  var tipo = sequelize.QueryTypes.SELECT;

  sequelize.query(query, {replacements: [email], type: tipo})
  .then(resultado => {
    if(resultado.length == 0) {
      console.log("No hay resultados para " + email);
      res.send({
        "code":400,
        "failed":"El correo no existe"
      });
    }
    else{
      if(resultado[0].password != password) {
        console.log("Contraseña incorrecta - " + email);
        res.send({
          "code":204,
          "success":"Contraseña incorrecta"
        });
      }
      else {
        console.log(email + " ha iniciado sesión ["+ new Date().toUTCString() +"]");
        res.send({
          "code":200,
          "success":"Incio de sesión realizado con éxito"
        });
      }
    }
  });
});

module.exports = router;
