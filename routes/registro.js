var express = require('express');
var router = express.Router();
const Sequelize = require('sequelize');
var sequelize = require('../config/database');
var bcrypt = require('bcrypt');

var BCRYPT_SALT_ROUNDS = 12;


router.post('/', async function(req, res, next) {

    //let idLugar = req.query.idLugar;
  
    //console.log(idLugar);
    //let lugar = await getLugar(idLugar);
    let nombre_usuario = req.body.nombre_usuario;
    let correo_usuario = req.body.correo_usuario;
    let password_usuario = req.body.password_usuario;

    let existeNombre = await nombreUsuarioExiste(nombre_usuario);
    let existeCorreo = await correoUsuarioExiste(correo_usuario);
    
    if(existeCorreo){
        res.send("Ya existe una cuenta con ese correo");
    }else
    if(existeNombre){
        res.send("Ya existe una cuenta con ese nombre de usuario");
    }else{
        registrarUsuario(nombre_usuario,correo_usuario,password_usuario);
        res.send("Registrado correctamente");
    }
    
    
  });

  async function nombreUsuarioExiste(nombre_usuario){


    let existen_usuarios_mismo_nombre = await sequelize.query('SELECT * FROM Usuario_registrado WHERE nombre_usuario=\'' + nombre_usuario + '\'').then(usuarios =>{
        if(usuarios[0].length != 0){
            return true;
        }else return false;
        
      });

    return existen_usuarios_mismo_nombre;
  }

  async function correoUsuarioExiste(correo_usuario){

    let existen_usuarios_mismo_correo = await sequelize.query('SELECT * FROM Usuario_registrado WHERE correo=\'' + correo_usuario + '\'').then(usuarios =>{
        //console.log(usuarios[0].length);
        if(usuarios[0].length != 0){
            return true;
        }else return false;
        
      });
    //console.log(existen_usuarios_mismo_correo);
    return existen_usuarios_mismo_correo;
  }
  async function registrarUsuario(nombre_usuario,correo_usuario,password_usuario){

    let hashedPassword = await bcrypt.hash(password_usuario, BCRYPT_SALT_ROUNDS)
    .then(function(hashedPassword) {
        return hashedPassword;
    });

    await sequelize.query('INSERT INTO Usuario_registrado (nombre_usuario,correo,password,tipo) VALUES (\''+ nombre_usuario+'\',\''+correo_usuario+'\',\''+hashedPassword+'\',\'registrado\')').then(aux =>{
        return true;
    }).catch(error =>{
        console.log(error);
    });

    //console.log(hashedPassword);
  }

  module.exports = router;