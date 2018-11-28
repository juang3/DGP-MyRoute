var express = require('express');
var router = express.Router();
const Sequelize = require('sequelize');
var sequelize = require('../config/database');


/* GET users listing. */

router.get('/', async function(req, res, next) {

  let lugares = await getLugares();

  res.send(lugares);
  
});


async function getLugares(){
  let lugares = await sequelize.query('SELECT * FROM Lugar').then(lugares =>{
    return lugares[0];
  });

  let imagen;
  let imagenes= JSON.parse('{"imagenes":[]}');

  for( i=0; i < lugares.length; i++){
    let idLugar = lugares[i].idLugar;
   
    let idImagen = await sequelize.query('SELECT * FROM Imagen_Lugar WHERE idLugar =' + idLugar).then(imagen_lugar=>{
      return imagen_lugar[0][0].idImagen;
    });

    imagen = await sequelize.query('SELECT * FROM Imagen WHERE idImagen=' + idImagen).then(imagen =>{
      return JSON.parse(JSON.stringify(imagen[0][0]));
    });
    imagenes['imagenes'].push(imagen);
    
  }

  lugares = JSON.stringify({'lugares':lugares});
  lugares = JSON.parse(lugares);
  lugares.imagenes = imagenes['imagenes'];

  //console.log(lugares);

  return lugares;

}




module.exports = router;
