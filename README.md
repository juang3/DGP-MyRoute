# MyRoute

Proyecto realizado en las prácticas de **Dirección y Gestión de Proyectos** cursado
durante el curso 2018/2019 en la ***Universidad de Granada***.
Grado en Ingeniería Informática.

## Descripción

Esta aplicación tiene como objetivo fomentar el turismo de la ciudad de Granada.
En ella, los usuarios pueden encontrar lugares de interés de la ciudad así como
rutas que conecten lugares similares.

Mediante el uso de la aplicación, los usuarios pueden ser guiados a estos lugares
y realizar las rutas, dejar opiniones sobre los mismos y sugerir nuevas ubicaciones
y rutas.

La aplicación está actualmente en fase de desarrollo por parte de la sociedad
ficticia ***GARVAM***.

## Dependencias

Para poder ejecutar esta aplicación en modo desarrollador en necesario instalar
y configurar los siguientes paquetes.

### NodeJS

NodeJS es un entorno en tiempo de ejecución multiplataforma, de código abierto,
para la capa del servidor basado en el lenguaje de programación ECMAScript, asíncrono,
con I/O de datos en una arquitectura orientada a eventos y basado en el motor V8
de Google.

Siga las instrucciones proporcionadas en la [página oficial][NodeJS] para descargar e
instalar NodeJS.

[NodeJS]: https://nodejs.org/es/

### Express

Express.js, o simplemente Express, es un marco de aplicación web para Node.js,
lanzado como software libre y de código abierto bajo la Licencia MIT. Está
diseñado para construir aplicaciones web y APIs. Se le ha llamado el marco de
servidor estándar de facto para Node.js

Puedes instalar este paquete ejecutando el comando : `$ npm install express --save`
Para más información consulta la [página web][Express] de Express

El servidor se ha configurado con el motor de vista [pug][PUG] para la generación
de código **CSS**.

[Express]: https://expressjs.com/es/
[PUG]: https://pugjs.org/api/getting-started.html

## Instalación

Una vez instaladas las dependencias y descargada la aplicación, abrimos una
terminal localizada en el directorio de la misma y ejecutamos la orden `npm install`
para realiza la instalación.

Ya completada la instalación, ejecutamos el servidor con la orden `npm start`
o `DEBUG=dgp-myroute:* npm start` para obtener mensajes adicionales.

El servidor debería estar listo y escuchando en el puerto 3000. Accedemos a él
desde un navegador web (*localhost:3000*).

La configuración del servidor se ha realizado siguiendo el
[manual](https://expressjs.com/es/starter/installing.html) de Express. También
se han utilizado como referencia
[manuales](https://developer.mozilla.org/es/docs/Learn/Server-side/Express_Nodejs)
de Firefox.

## Autores



## Lugares de interés

* [NodeJS][NodeJS]
* [Express][Express]
* [PUG][PUG]
* [Tutoriales de Express](https://expressjs.com/es/starter/installing.html)
* [Tutoriales de Firefox](https://developer.mozilla.org/es/docs/Learn/Server-side/Express_Nodejs)
