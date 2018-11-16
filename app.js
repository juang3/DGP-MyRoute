/**
 * CÓDIGO AUTOGENERADO POR EXPRESS
 *
 * Modificado por: Alejandro Ruiz Becerra
 * Fecha de modificación: 28/10/2018
 */

var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');

// Módulo par ala gestión de la Base de Datos
var mysql = require('mysql');

var app = express();

// Setup del motor de vista
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/users', usersRouter);

// Recoge el error 404 y lo envía al manejador de errores
app.use(function(req, res, next) {
  next(createError(404, "Parece que te has perdido"));
});

// Manejador de errores
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // Muestra el error en la página
  (err.status == 404) ? res.render('404') : res.render('error');
  // res.status(err.status || 500);
});

/******************************************************************************/
// GESTIÓN DE LA BASE DE DATOS
//
/******************************************************************************/

var conexion = mysql.createConnection({
  host     : 'localhost',
  user     : 'usuario',
  password : '',
  database : 'my_route'
});

conexion.connect();

conexion.query('SELECT 1 + 1 AS solution', function (error, results, fields) {
  if (error) throw error;
  console.log('The solution is: ', results[0].solution);
});

conexion.end();

module.exports = app;

/**
 * CÓDIGO AUTOGENERADO POR EXPRESS
 *
 */
