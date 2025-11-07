-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-11-2025 a las 04:37:56
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `parcial`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

CREATE TABLE `administradores` (
  `IDa` varchar(100) NOT NULL,
  `CIa` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administradores`
--

INSERT INTO `administradores` (`IDa`, `CIa`) VALUES
('1234', '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `Turno` varchar(100) NOT NULL,
  `Grupo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes`
--

CREATE TABLE `docentes` (
  `CId` varchar(8) NOT NULL,
  `Materia` varchar(100) NOT NULL,
  `Grupo` varchar(100) NOT NULL,
  `Turno` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enseña`
--

CREATE TABLE `enseña` (
  `CIE` varchar(8) NOT NULL,
  `CursoE` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inasistencias`
--

CREATE TABLE `inasistencias` (
  `Nombrex` varchar(100) NOT NULL,
  `Apellidox` varchar(100) NOT NULL,
  `CIx` varchar(8) NOT NULL,
  `Turnox` varchar(100) NOT NULL,
  `FechaInix` date NOT NULL,
  `FechaFinx` date NOT NULL,
  `Motivox` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licencias`
--

CREATE TABLE `licencias` (
  `IDL` int(100) NOT NULL,
  `Motivo` varchar(300) NOT NULL,
  `FechaINI` date NOT NULL,
  `FechaFIN` date NOT NULL,
  `CIL` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `CI` varchar(8) NOT NULL,
  `NombreA` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`CI`, `NombreA`, `Apellido`) VALUES
('123', 'Admin', 'Varchar\r\n');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`IDa`),
  ADD KEY `CIa` (`CIa`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`Grupo`);

--
-- Indices de la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD KEY `CId` (`CId`),
  ADD KEY `Grupo` (`Grupo`);

--
-- Indices de la tabla `enseña`
--
ALTER TABLE `enseña`
  ADD KEY `CIt` (`CIE`),
  ADD KEY `CursoE` (`CursoE`);

--
-- Indices de la tabla `inasistencias`
--
ALTER TABLE `inasistencias`
  ADD PRIMARY KEY (`CIx`);

--
-- Indices de la tabla `licencias`
--
ALTER TABLE `licencias`
  ADD PRIMARY KEY (`IDL`),
  ADD KEY `CIL` (`CIL`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`CI`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `licencias`
--
ALTER TABLE `licencias`
  MODIFY `IDL` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD CONSTRAINT `administradores_ibfk_1` FOREIGN KEY (`CIa`) REFERENCES `usuarios` (`CI`);

--
-- Filtros para la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD CONSTRAINT `docentes_ibfk_1` FOREIGN KEY (`CId`) REFERENCES `usuarios` (`CI`),
  ADD CONSTRAINT `docentes_ibfk_2` FOREIGN KEY (`Grupo`) REFERENCES `cursos` (`Grupo`);

--
-- Filtros para la tabla `enseña`
--
ALTER TABLE `enseña`
  ADD CONSTRAINT `enseña_ibfk_1` FOREIGN KEY (`CIE`) REFERENCES `usuarios` (`CI`),
  ADD CONSTRAINT `enseña_ibfk_2` FOREIGN KEY (`CursoE`) REFERENCES `cursos` (`Grupo`);

--
-- Filtros para la tabla `licencias`
--
ALTER TABLE `licencias`
  ADD CONSTRAINT `licencias_ibfk_1` FOREIGN KEY (`CIL`) REFERENCES `usuarios` (`CI`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
