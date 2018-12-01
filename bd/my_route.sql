-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 23, 2018 at 11:45 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_route`
--

-- --------------------------------------------------------

--
-- Table structure for table `Camino`
--

CREATE TABLE `Camino` (
  `idCamino` int(10) NOT NULL,
  `origen` int(10) NOT NULL,
  `destino` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Imagen`
--

CREATE TABLE `Imagen` (
  `idImagen` int(10) NOT NULL,
  `descripcion` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contenido` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Imagen_Lugar`
--

CREATE TABLE `Imagen_Lugar` (
  `idLugar` int(10) NOT NULL,
  `idImagen` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Imagen_Ruta`
--

CREATE TABLE `Imagen_Ruta` (
  `idRuta` int(10) NOT NULL,
  `idImagen` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Imagen_Usuario`
--

CREATE TABLE `Imagen_Usuario` (
  `idUsuario` int(10) NOT NULL,
  `idImagen` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Lugar`
--

CREATE TABLE `Lugar` (
  `idLugar` int(10) NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `coordenadas` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Lugar`
--

INSERT INTO `Lugar` (`idLugar`, `nombre`, `descripcion`, `categoria`, `direccion`, `visible`, `coordenadas`) VALUES
(1, 'Bar de Moe', 'Hay cerveza.', 'Bares.', 'Calle falsa 123.', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `Ruta`
--

CREATE TABLE `Ruta` (
  `idRuta` int(10) NOT NULL,
  `nombre` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Ruta`
--

INSERT INTO `Ruta` (`idRuta`, `nombre`, `descripcion`, `categoria`, `visible`) VALUES
(1, 'Bares de Granada', 'Los mejores bares de granada decididos por mi.', 'Bares', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ruta_lugar`
--

CREATE TABLE `ruta_lugar` (
  `ruta_id` int(10) NOT NULL,
  `lugar_id` int(10) NOT NULL,
  `num_orden` int(10) NOT NULL,
  `idRuta_lugar` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ruta_lugar`
--

INSERT INTO `ruta_lugar` (`ruta_id`, `lugar_id`, `num_orden`, `idRuta_lugar`) VALUES
(1, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Usuario_registrado`
--

CREATE TABLE `Usuario_registrado` (
  `idUsuario` int(10) NOT NULL,
  `correo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_usuario` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `año_nacimiento` int(5) NOT NULL,
  `lugar_nacimiento` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Usuario_registrado`
--

INSERT INTO `Usuario_registrado` (`idUsuario`, `correo`, `nombre_usuario`, `password`, `descripcion`, `tipo`, `año_nacimiento`, `lugar_nacimiento`) VALUES
(0, 'usuario@correo.com', 'usuario', 'usuario', 'soy un usuario', 'registrado', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `Usuario_sigue`
--

CREATE TABLE `Usuario_sigue` (
  `idSigue` int(10) NOT NULL,
  `idUsuario` int(10) NOT NULL,
  `idRuta` int(10) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Usuario_visita`
--

CREATE TABLE `Usuario_visita` (
  `idVisita` int(10) NOT NULL,
  `idUsuario` int(10) NOT NULL,
  `idLugar` int(10) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Valoracion`
--

CREATE TABLE `Valoracion` (
  `idValoracion` int(10) NOT NULL,
  `Valoracion` int(2) NOT NULL,
  `Comentario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LIkes_comentario` int(10) NOT NULL,
  `Visible` tinyint(1) NOT NULL,
  `Num_reportes` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Valoracion_lugar`
--

CREATE TABLE `Valoracion_lugar` (
  `idUsuario` int(10) NOT NULL,
  `idLugar` int(10) NOT NULL,
  `idValoracion` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Valoracion_ruta`
--

CREATE TABLE `Valoracion_ruta` (
  `idUsuario` int(10) NOT NULL,
  `idRuta` int(10) NOT NULL,
  `idValoracion` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Camino`
--
ALTER TABLE `Camino`
  ADD PRIMARY KEY (`idCamino`),
  ADD KEY `origen` (`origen`),
  ADD KEY `destino` (`destino`);

--
-- Indexes for table `Imagen`
--
ALTER TABLE `Imagen`
  ADD PRIMARY KEY (`idImagen`);

--
-- Indexes for table `Imagen_Lugar`
--
ALTER TABLE `Imagen_Lugar`
  ADD PRIMARY KEY (`idImagen`) USING BTREE,
  ADD KEY `idLugar` (`idLugar`);

--
-- Indexes for table `Imagen_Ruta`
--
ALTER TABLE `Imagen_Ruta`
  ADD PRIMARY KEY (`idImagen`),
  ADD KEY `idRuta` (`idRuta`);

--
-- Indexes for table `Imagen_Usuario`
--
ALTER TABLE `Imagen_Usuario`
  ADD PRIMARY KEY (`idImagen`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indexes for table `Lugar`
--
ALTER TABLE `Lugar`
  ADD PRIMARY KEY (`idLugar`);

--
-- Indexes for table `Ruta`
--
ALTER TABLE `Ruta`
  ADD PRIMARY KEY (`idRuta`);

--
-- Indexes for table `ruta_lugar`
--
ALTER TABLE `ruta_lugar`
  ADD PRIMARY KEY (`idRuta_lugar`),
  ADD KEY `ruta_id` (`ruta_id`),
  ADD KEY `lugar_id` (`lugar_id`);

--
-- Indexes for table `Usuario_registrado`
--
ALTER TABLE `Usuario_registrado`
  ADD PRIMARY KEY (`idUsuario`);

--
-- Indexes for table `Usuario_sigue`
--
ALTER TABLE `Usuario_sigue`
  ADD PRIMARY KEY (`idSigue`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idRuta` (`idRuta`);

--
-- Indexes for table `Usuario_visita`
--
ALTER TABLE `Usuario_visita`
  ADD PRIMARY KEY (`idVisita`),
  ADD KEY `idLugar` (`idLugar`),
  ADD KEY `idUsuario` (`idUsuario`) USING BTREE;

--
-- Indexes for table `Valoracion`
--
ALTER TABLE `Valoracion`
  ADD PRIMARY KEY (`idValoracion`);

--
-- Indexes for table `Valoracion_lugar`
--
ALTER TABLE `Valoracion_lugar`
  ADD PRIMARY KEY (`idValoracion`),
  ADD KEY `idLugar` (`idLugar`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indexes for table `Valoracion_ruta`
--
ALTER TABLE `Valoracion_ruta`
  ADD PRIMARY KEY (`idValoracion`),
  ADD KEY `idRuta` (`idRuta`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Usuario_registrado`
--
ALTER TABLE `Usuario_registrado`
  MODIFY `idUsuario` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Camino`
--
ALTER TABLE `Camino`
  MODIFY `idCamino` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Imagen`
--
ALTER TABLE `Imagen`
  MODIFY `idImagen` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Lugar`
--
ALTER TABLE `Lugar`
  MODIFY `idLugar` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Ruta`
--
ALTER TABLE `Ruta`
  MODIFY `idRuta` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ruta_lugar`
--
ALTER TABLE `ruta_lugar`
  MODIFY `idRuta_lugar` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Usuario_sigue`
--
ALTER TABLE `Usuario_sigue`
  MODIFY `idSigue` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Valoracion`
--
ALTER TABLE `Valoracion`
  MODIFY `idValoracion` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Camino`
--
ALTER TABLE `Camino`
  ADD CONSTRAINT `Camino_ibfk_1` FOREIGN KEY (`origen`) REFERENCES `Lugar` (`idLugar`),
  ADD CONSTRAINT `Camino_ibfk_2` FOREIGN KEY (`destino`) REFERENCES `Lugar` (`idLugar`);

--
-- Constraints for table `Imagen_Lugar`
--
ALTER TABLE `Imagen_Lugar`
  ADD CONSTRAINT `Imagen_Lugar_ibfk_1` FOREIGN KEY (`idImagen`) REFERENCES `Imagen` (`idImagen`),
  ADD CONSTRAINT `Imagen_Lugar_ibfk_2` FOREIGN KEY (`idLugar`) REFERENCES `Lugar` (`idLugar`);

--
-- Constraints for table `Imagen_Ruta`
--
ALTER TABLE `Imagen_Ruta`
  ADD CONSTRAINT `Imagen_Ruta_ibfk_1` FOREIGN KEY (`idImagen`) REFERENCES `Imagen` (`idImagen`),
  ADD CONSTRAINT `Imagen_Ruta_ibfk_2` FOREIGN KEY (`idRuta`) REFERENCES `Ruta` (`idRuta`);

--
-- Constraints for table `Imagen_Usuario`
--
ALTER TABLE `Imagen_Usuario`
  ADD CONSTRAINT `Imagen_Usuario_ibfk_1` FOREIGN KEY (`idImagen`) REFERENCES `Imagen` (`idImagen`),
  ADD CONSTRAINT `Imagen_Usuario_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario_registrado` (`idUsuario`);

--
-- Constraints for table `ruta_lugar`
--
ALTER TABLE `ruta_lugar`
  ADD CONSTRAINT `ruta_lugar_ibfk_1` FOREIGN KEY (`lugar_id`) REFERENCES `Lugar` (`idLugar`),
  ADD CONSTRAINT `ruta_lugar_ibfk_2` FOREIGN KEY (`ruta_id`) REFERENCES `Ruta` (`idRuta`);

--
-- Constraints for table `Usuario_sigue`
--
ALTER TABLE `Usuario_sigue`
  ADD CONSTRAINT `Usuario_sigue_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario_registrado` (`idUsuario`),
  ADD CONSTRAINT `Usuario_sigue_ibfk_2` FOREIGN KEY (`idRuta`) REFERENCES `Ruta` (`idRuta`);

--
-- Constraints for table `Usuario_visita`
--
ALTER TABLE `Usuario_visita`
  ADD CONSTRAINT `Usuario_visita_ibfk_1` FOREIGN KEY (`idLugar`) REFERENCES `Lugar` (`idLugar`),
  ADD CONSTRAINT `Usuario_visita_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario_registrado` (`idUsuario`);

--
-- Constraints for table `Valoracion_lugar`
--
ALTER TABLE `Valoracion_lugar`
  ADD CONSTRAINT `Valoracion_lugar_ibfk_1` FOREIGN KEY (`idValoracion`) REFERENCES `Valoracion` (`idValoracion`),
  ADD CONSTRAINT `Valoracion_lugar_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario_visita` (`idUsuario`),
  ADD CONSTRAINT `Valoracion_lugar_ibfk_3` FOREIGN KEY (`idLugar`) REFERENCES `Usuario_visita` (`idLugar`);

--
-- Constraints for table `Valoracion_ruta`
--
ALTER TABLE `Valoracion_ruta`
  ADD CONSTRAINT `Valoracion_ruta_ibfk_1` FOREIGN KEY (`idValoracion`) REFERENCES `Valoracion` (`idValoracion`),
  ADD CONSTRAINT `Valoracion_ruta_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario_sigue` (`idUsuario`),
  ADD CONSTRAINT `Valoracion_ruta_ibfk_3` FOREIGN KEY (`idRuta`) REFERENCES `Usuario_sigue` (`idRuta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
