var express = require('express');
var router = express.Router();
const Sequelize = require('sequelize');
var sequelize = require('../config/database');


/* GET ruta listing. */

router.get('/', async function(req, res, next) {

  let idRuta = req.query.idRuta;

  console.log(idRuta);
  let ruta = await getRuta(idRuta);

  res.send(ruta);
  
});


async function getRuta(idRuta){

  let rutas = await sequelize.query('SELECT * FROM Ruta WHERE idRuta=\'' + idRuta + '\'').then(rutas =>{
    return rutas[0];
  });

  let imagen;
  let imagenes= JSON.parse('{"imagenes":[]}');

  let idsImagen = await sequelize.query('SELECT * FROM Imagen_Ruta WHERE idRuta =' + idRuta).then(imagen_ruta=>{
      let aux = imagen_ruta[0];
      let idsImagen = new Array();
      for(var i=0; i < aux.length; i++){
          //console.log(aux[i].idImagen);
          idsImagen.push(aux[i].idImagen);
      }
      //console.log(imagen_lugar[0]);
      return idsImagen;
  });

  //console.log(idsImagen);

  for(var i = 0; i< idsImagen.length; i++){
    imagen = await sequelize.query('SELECT * FROM Imagen WHERE idImagen=' + idsImagen[i]).then(imagen =>{
        return JSON.parse(JSON.stringify(imagen[0][0]));
      });
      imagenes['imagenes'].push(imagen);
  }



  rutas = JSON.stringify({'ruta':rutas});
  rutas = JSON.parse(rutas);
  rutas.imagenes = imagenes['imagenes'];


  //get lugares
  let ids_lugares = await sequelize.query('SELECT * FROM ruta_lugar WHERE ruta_id=' + idRuta).then(lugares_rutas =>{
    let idsLugares = new Array();
    let aux = lugares_rutas[0];
    for(var i=0; i < aux.length; i++){
      idsLugares.push(aux[i].lugar_id);
    }

    return idsLugares;
  });

  console.log(ids_lugares);

  let lugar;
  let lugares= JSON.parse('{"lugares":[]}');

  for(var i=0; i< ids_lugares.length;i++){
    lugar = await sequelize.query('SELECT * FROM Lugar WHERE idLugar=' + ids_lugares[i]).then(lugar =>{
      return JSON.parse(JSON.stringify(lugar[0][0]));
    });
    lugares['lugares'].push(lugar);
  }

  rutas.lugares = lugares['lugares'];
  
  // get valoraciones

  let ids_valoraciones = await sequelize.query('SELECT * FROM Valoracion_ruta WHERE idruta=' + idRuta).then(valoraciones_rutas =>{
    let idsValoraciones = new Array();
    let aux = valoraciones_rutas[0];

    for(var i=0; i < aux.length; i++){
      idsValoraciones.push(aux[i].idValoracion);
    }

    return idsValoraciones;
  });

  console.log(ids_valoraciones);

  let valoracion;
  let valoraciones= JSON.parse('{"valoraciones":[]}');

  for(var i=0; i< ids_valoraciones.length;i++){
    valoracion = await sequelize.query('SELECT * FROM Valoracion WHERE idValoracion=' + ids_valoraciones[i]).then(valoracion =>{
      return JSON.parse(JSON.stringify(valoracion[0][0]));
    });
    valoraciones['valoraciones'].push(valoracion);
  }

  rutas.valoraciones = valoraciones['valoraciones'];


  return rutas;

}

async function getComentariosRutas(idRuta){
    
}




module.exports = router;
