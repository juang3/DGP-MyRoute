var express = require('express');
var router = express.Router();
const Sequelize = require('sequelize');
var sequelize = require('../config/database');


/* GET lugar listing. */

router.get('/', async function(req, res, next) {

  let idLugar = req.query.idLugar;

  console.log(idLugar);
  let lugar = await getLugar(idLugar);

  res.send(lugar);
  
});


async function getLugar(idLugar){

  let lugares = await sequelize.query('SELECT * FROM Lugar WHERE idLugar=\'' + idLugar + '\'').then(lugares =>{
    return lugares[0];
  });

  let imagen;
  let imagenes= JSON.parse('{"imagenes":[]}');

  let idsImagen = await sequelize.query('SELECT * FROM Imagen_Lugar WHERE idLugar =' + idLugar).then(imagen_lugar=>{
      let aux = imagen_lugar[0];
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

  lugares = JSON.stringify({'lugar':lugares});
  lugares = JSON.parse(lugares);
  lugares.imagenes = imagenes['imagenes'];

  /*LUGAR CON SUS IMAGENES*/
  
  // get valoraciones

  let ids_valoraciones = await sequelize.query('SELECT * FROM Valoracion_lugar WHERE idlugar=' + idLugar).then(valoraciones_lugares =>{
    let idsValoraciones = new Array();
    let aux = valoraciones_lugares[0];

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

  lugares.valoraciones = valoraciones['valoraciones'];

  //lugares = JSON.stringify({'lugar':lugares});
  //lugares = JSON.parse(lugares);
  //lugares.valoraciones_lugares = imagenes['imagenes'];


  return lugares;

}

async function getComentariosLugar(idLUgar){
    
}




module.exports = router;
