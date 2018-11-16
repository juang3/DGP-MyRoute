-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 26, 2018 at 01:08 PM
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

CREATE DATABASE `my_route` CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `my_route`;

-- --------------------------------------------------------

--
-- Table structure for table `Camino`
--

CREATE TABLE `Camino` (
  `id` int(10) NOT NULL,
  `instrucciones` varchar(511) COLLATE utf8mb4_unicode_ci NOT NULL,
  `origen` int(10) NOT NULL,
  `destino` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Comentario_lugar`
--

CREATE TABLE `Comentario_lugar` (
  `id` int(10) NOT NULL,
  `contenido` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `likes` int(10) NOT NULL,
  `reportado` int(10) NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `usuario_registrado` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lugar_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Comentario_lugar`
--

INSERT INTO `Comentario_lugar` (`id`, `contenido`, `likes`, `reportado`, `visible`, `usuario_registrado`, `lugar_id`) VALUES
(1, 'No esta mal', 0, 0, 1, 'usuario@correo.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Comentario_ruta`
--

CREATE TABLE `Comentario_ruta` (
  `id` int(10) NOT NULL,
  `contenido` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `likes` int(10) NOT NULL,
  `reportado` int(10) NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `usuario_registrado` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ruta_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `imagen`
--

CREATE TABLE `imagen` (
  `id` int(10) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contenido` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lugar_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Lugar`
--

CREATE TABLE `Lugar` (
  `id` int(10) NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Lugar`
--

INSERT INTO `Lugar` (`id`, `nombre`, `descripcion`, `categoria`, `direccion`, `visible`) VALUES
(1, 'Bar de Moe', 'Hay cerveza.', 'Bares.', 'Calle falsa 123.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Ruta`
--

CREATE TABLE `Ruta` (
  `id` int(10) NOT NULL,
  `nombre` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Ruta`
--

INSERT INTO `Ruta` (`id`, `nombre`, `descripcion`, `categoria`, `visible`) VALUES
(1, 'Bares de Granada', 'Los mejores bares de granada decididos por mi.', 'Bares', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ruta_lugar`
--

CREATE TABLE `ruta_lugar` (
  `ruta_id` int(10) NOT NULL,
  `lugar_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ruta_lugar`
--

INSERT INTO `ruta_lugar` (`ruta_id`, `lugar_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Usuario_registrado`
--

CREATE TABLE `Usuario_registrado` (
  `correo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_usuario` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Usuario_registrado`
--

INSERT INTO `Usuario_registrado` (`correo`, `nombre_usuario`, `password`, `descripcion`, `tipo`) VALUES
('usuario@correo.com', 'usuario', 'usuario', 'soy un usuario', 'registrado');

-- --------------------------------------------------------

--
-- Table structure for table `Valoracion_lugar`
--

CREATE TABLE `Valoracion_lugar` (
  `id` int(10) NOT NULL,
  `valor` int(2) NOT NULL,
  `n_votos` int(10) NOT NULL,
  `usuario_registrado` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lugar_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Valoracion_ruta`
--

CREATE TABLE `Valoracion_ruta` (
  `id` int(10) NOT NULL,
  `valor` int(2) NOT NULL,
  `n_votos` int(10) NOT NULL,
  `usuario_registrado` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ruta_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Camino`
--
ALTER TABLE `Camino`
  ADD PRIMARY KEY (`id`),
  ADD KEY `origen` (`origen`),
  ADD KEY `destino` (`destino`);

--
-- Indexes for table `Comentario_lugar`
--
ALTER TABLE `Comentario_lugar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_registrado` (`usuario_registrado`),
  ADD KEY `lugar_id` (`lugar_id`);

--
-- Indexes for table `Comentario_ruta`
--
ALTER TABLE `Comentario_ruta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ruta_id` (`ruta_id`),
  ADD KEY `usuario_registrado` (`usuario_registrado`);

--
-- Indexes for table `imagen`
--
ALTER TABLE `imagen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lugar_id` (`lugar_id`);

--
-- Indexes for table `Lugar`
--
ALTER TABLE `Lugar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Ruta`
--
ALTER TABLE `Ruta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ruta_lugar`
--
ALTER TABLE `ruta_lugar`
  ADD KEY `ruta_id` (`ruta_id`),
  ADD KEY `lugar_id` (`lugar_id`);

--
-- Indexes for table `Usuario_registrado`
--
ALTER TABLE `Usuario_registrado`
  ADD PRIMARY KEY (`correo`);

--
-- Indexes for table `Valoracion_lugar`
--
ALTER TABLE `Valoracion_lugar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_registrado` (`usuario_registrado`),
  ADD KEY `lugar_id` (`lugar_id`);

--
-- Indexes for table `Valoracion_ruta`
--
ALTER TABLE `Valoracion_ruta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ruta_id` (`ruta_id`),
  ADD KEY `usuario_regstrado` (`usuario_registrado`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Camino`
--
ALTER TABLE `Camino`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Comentario_lugar`
--
ALTER TABLE `Comentario_lugar`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Comentario_ruta`
--
ALTER TABLE `Comentario_ruta`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Lugar`
--
ALTER TABLE `Lugar`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Ruta`
--
ALTER TABLE `Ruta`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Valoracion_lugar`
--
ALTER TABLE `Valoracion_lugar`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Valoracion_ruta`
--
ALTER TABLE `Valoracion_ruta`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Camino`
--
ALTER TABLE `Camino`
  ADD CONSTRAINT `Camino_ibfk_1` FOREIGN KEY (`origen`) REFERENCES `Lugar` (`id`),
  ADD CONSTRAINT `Camino_ibfk_2` FOREIGN KEY (`destino`) REFERENCES `Lugar` (`id`);

--
-- Constraints for table `Comentario_lugar`
--
ALTER TABLE `Comentario_lugar`
  ADD CONSTRAINT `Comentario_lugar_ibfk_1` FOREIGN KEY (`lugar_id`) REFERENCES `Lugar` (`id`),
  ADD CONSTRAINT `Comentario_lugar_ibfk_2` FOREIGN KEY (`usuario_registrado`) REFERENCES `Usuario_registrado` (`correo`);

--
-- Constraints for table `Comentario_ruta`
--
ALTER TABLE `Comentario_ruta`
  ADD CONSTRAINT `Comentario_ruta_ibfk_1` FOREIGN KEY (`ruta_id`) REFERENCES `Ruta` (`id`),
  ADD CONSTRAINT `Comentario_ruta_ibfk_2` FOREIGN KEY (`usuario_registrado`) REFERENCES `Usuario_registrado` (`correo`);

--
-- Constraints for table `imagen`
--
ALTER TABLE `imagen`
  ADD CONSTRAINT `imagen_ibfk_1` FOREIGN KEY (`lugar_id`) REFERENCES `Lugar` (`id`);

--
-- Constraints for table `ruta_lugar`
--
ALTER TABLE `ruta_lugar`
  ADD CONSTRAINT `ruta_lugar_ibfk_1` FOREIGN KEY (`lugar_id`) REFERENCES `Lugar` (`id`),
  ADD CONSTRAINT `ruta_lugar_ibfk_2` FOREIGN KEY (`ruta_id`) REFERENCES `Ruta` (`id`);

--
-- Constraints for table `Valoracion_lugar`
--
ALTER TABLE `Valoracion_lugar`
  ADD CONSTRAINT `Valoracion_lugar_ibfk_1` FOREIGN KEY (`usuario_registrado`) REFERENCES `Usuario_registrado` (`correo`),
  ADD CONSTRAINT `Valoracion_lugar_ibfk_2` FOREIGN KEY (`lugar_id`) REFERENCES `Lugar` (`id`);

--
-- Constraints for table `Valoracion_ruta`
--
ALTER TABLE `Valoracion_ruta`
  ADD CONSTRAINT `Valoracion_ruta_ibfk_1` FOREIGN KEY (`usuario_registrado`) REFERENCES `Usuario_registrado` (`correo`),
  ADD CONSTRAINT `Valoracion_ruta_ibfk_2` FOREIGN KEY (`ruta_id`) REFERENCES `Ruta` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
