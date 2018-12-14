
USE my_route;

INSERT INTO `Lugar` (`nombre`,`descripcion`,`categoria`,`direccion`,`visible`,`coordenadas`) VALUES ('Facultad de Informatica', 'Edificio de la Escuela Técnica Superior de Ingeniería Informática','Facultad','Calle Periodista Daniel Saucedo Aranda s/n',1,'(37.196689,-3.624534)'); -- id = 1

INSERT INTO `Lugar` (`nombre`,`descripcion`,`categoria`,`direccion`,`visible`,`coordenadas`) VALUES ('Facultad de Ciencias', 'Edificio de la Escuela de Ciencias de la Universidad de Granada','Facultad','Fuente Nueva s/n 18071',1,'(37.179752,-3.609726)'); -- id = 2

INSERT INTO `Lugar` (`nombre`,`descripcion`,`categoria`,`direccion`,`visible`,`coordenadas`) VALUES ('Facultad de Bellas Artes', 'Edificio de la Facultad de Bellas Artes de la Universidad de Granada' ,'Facultad','Avenida de Andalucia nº 27 18014',1,'(37.195627,-3.626910)'); -- id = 3

INSERT INTO `Ruta` (`nombre`,`descripcion`, `categoria`,`visible`) VALUES ('Ruta Facultades','Ruta que une la Facultad de Ciencias y la Escuela Técnica Superior de Ingeniería Informática y Telecomunicaciones', 'Facultades',1); -- id = 4

INSERT INTO `Ruta` (`nombre`, `descripcion`, `categoria`, `visible`) VALUES ('Ruta Facultades 2', 'Ruta que une la Facultad de Ciencias, la Escuela Técnica Superior de Ingeniería Informática y Telecomunicaciones, y la Facultad de Bellas Artes', 'Facultades', 1); -- id = 5

INSERT INTO `Camino` (`origen`, `destino`) VALUES (1,2); -- id = 6

INSERT INTO `Camino` (`origen`, `destino`) VALUES (1,3); -- id = 7

INSERT INTO `Camino` (`origen`, `destino`) VALUES (2,1); -- id = 8

INSERT INTO `Camino` (`origen`, `destino`) VALUES (3,1); -- id = 9

INSERT INTO `Camino` (`origen`, `destino`) VALUES (2,3); -- id = 10

INSERT INTO `Camino` (`origen`, `destino`) VALUES (3,2); -- id = 11

INSERT INTO `Imagen` (`descripcion`, `contenido`) VALUES ('Fotografía de la fachada interna del Edificio de la Escuela Técnica de Ingeniería Informática y Telecomunicaciones', '/imagen_edificio_ETSIIT.jpg'); -- id = 12

INSERT INTO `Imagen` (`descripcion`, `contenido`) VALUES ('Fotografía de la fachada del edificio de la Facultad de Ciencias', '/imagen_edificio_ciencias.jpg'); -- id = 13

INSERT INTO `Imagen` (`descripcion`, `contenido`) VALUES ('Fotografía de la fachada del Edificio de la Facultad de Bellas Artes', '/imagen_edificio_bellas_artes.jpg'); -- id = 14

INSERT INTO `Imagen` (`descripcion`, `contenido`) VALUES ('Fotografía de la calle Camino de Ronda de Granada', '/imagen_camino_ronda.jpg'); -- id = 15

INSERT INTO `Imagen_Lugar` (`idLugar`, `idImagen`) VALUES (1, 1);

INSERT INTO `Imagen_Lugar` (`idLugar`, `idImagen`) VALUES (2, 2);

INSERT INTO `Imagen_Lugar` (`idLugar`, `idImagen`) VALUES (3, 3);

INSERT INTO `Imagen_Ruta` (`idRuta`, `idImagen`) VALUES (1, 1);

INSERT INTO `Imagen_Ruta` (`idRuta`, `idImagen`) VALUES (2, 4);

INSERT INTO `ruta_lugar` (`ruta_id`, `lugar_id`, `num_orden`) VALUES (1, 1, 1); 

INSERT INTO `ruta_lugar` (`ruta_id`, `lugar_id`, `num_orden`) VALUES (1, 2, 2); 

INSERT INTO `ruta_lugar` (`ruta_id`, `lugar_id`, `num_orden`) VALUES (2, 1, 1); 

INSERT INTO `ruta_lugar` (`ruta_id`, `lugar_id`, `num_orden`) VALUES (2, 2, 2); 

INSERT INTO `ruta_lugar` (`ruta_id`, `lugar_id`, `num_orden`) VALUES (2, 3, 3); 