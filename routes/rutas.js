var express = require('express');
var router = express.Router();
const Sequelize = require('sequelize');
var sequelize = require('../config/database');


/* GET users listing. */

router.get('/', async function(req, res, next) {
  let rutas = await getRutas();

  res.send(rutas);
  
});


async function getRutas(){
  let rutas = await sequelize.query('SELECT * FROM Ruta').then(rutas =>{
    return rutas[0];
  });

  let imagen;
  let imagenes= JSON.parse('{"imagenes":[]}');


  for( i=0; i < rutas.length; i++){
    let idRuta = rutas[i].idRuta;
     console.log("--idRuta:::" + idRuta);


    let idImagen = await sequelize.query('SELECT * FROM Imagen_Ruta WHERE idRuta= ' + idRuta).then(imagen_ruta=>{
      return imagen_ruta[0][0].idImagen;
    });

     console.log("--Contenido imagen:::" + idImagen);

    imagen = await sequelize.query('SELECT * FROM Imagen WHERE idImagen=' + idImagen).then(imagen =>{
      return JSON.parse(JSON.stringify(imagen[0][0]));
    });

    imagenes['imagenes'].push(imagen);
//    
  }

  rutas = JSON.stringify({'rutas':rutas});
  rutas = JSON.parse(rutas);
  rutas.imagenes = imagenes['imagenes'];

  return rutas;

}




module.exports = router;
