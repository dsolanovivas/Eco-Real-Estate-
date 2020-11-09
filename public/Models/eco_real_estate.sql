-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-11-2020 a las 18:57:23
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `eco_real_estate`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eco_bracktrack`
--

CREATE TABLE `eco_bracktrack` (
  `id_backtrack` int(11) NOT NULL COMMENT 'Id principal',
  `id_usuario` int(11) NOT NULL COMMENT 'id usuario',
  `tipo` int(11) NOT NULL COMMENT '0 - creado 1 - actualizado 2 - eliminado',
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha en que se realiza la acción '
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eco_contacto`
--

CREATE TABLE `eco_contacto` (
  `id_contacto` int(11) NOT NULL COMMENT 'id pr',
  `nombres` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'nombres de quien solicita',
  `apellidos` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Apellidos de quien solicita',
  `identificacion` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Identificación de la persona que solicita información',
  `id_usuario` int(11) DEFAULT NULL COMMENT 'id del usuario del sistema',
  `mensaje` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mensaje del usuario ',
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha en que se realiza la creación '
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `eco_contacto`
--

INSERT INTO `eco_contacto` (`id_contacto`, `nombres`, `apellidos`, `identificacion`, `id_usuario`, `mensaje`, `fecha_creacion`) VALUES
(1, 'Johnnathan alexander', 'Castillo Duarte', '1072713669', NULL, 'Msj de prueba', '2020-11-07 17:15:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eco_documento`
--

CREATE TABLE `eco_documento` (
  `id_usuario` int(11) NOT NULL COMMENT 'Id de la tabla eco_usuario',
  `id_documento` int(11) NOT NULL COMMENT 'Id principal de esta tabla',
  `tipo_documento` int(11) NOT NULL COMMENT '0-imagen perfil // 1-cedula // 2-demas....',
  `route` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Ruta donde se almacena el documento en el VPS',
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de creacion del documento',
  `fecha_actualizacion` datetime DEFAULT NULL COMMENT 'Fecha actualizacion del documento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eco_inversion`
--

CREATE TABLE `eco_inversion` (
  `id_inversion` int(11) NOT NULL COMMENT 'Id principal',
  `id_proyecto` int(11) NOT NULL COMMENT 'id que relaciona con el proyecto',
  `id_usuario` int(11) NOT NULL COMMENT 'id del usuario inversor',
  `aporte` double NOT NULL COMMENT 'Aporte de inversor al proyecto ($)',
  `n_token` int(11) NOT NULL COMMENT 'numero de token´s',
  `tipo_aporte` int(11) NOT NULL COMMENT '0 PSE , 1 Credito , 2 Debito',
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de registro de la inversión'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eco_proyecto`
--

CREATE TABLE `eco_proyecto` (
  `id_proyecto` int(11) NOT NULL COMMENT 'Id principal',
  `id_usuario` int(11) NOT NULL COMMENT 'id de la tabla eco_usuario',
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre del proyecto',
  `descripcion` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Descripción del proyecto',
  `publicar` int(11) NOT NULL COMMENT '0 No publicar 1 publicar',
  `valor_proyecto` double NOT NULL COMMENT 'Valor total del proyecto',
  `tir` double NOT NULL COMMENT 'Tasa Interna de Retorno',
  `valor_token` double NOT NULL COMMENT 'Valor del token ',
  `estado` int(11) NOT NULL COMMENT '0 - Creado -- 1 - En revisión  -- 2 -En proceso financiación -- 3 - Finalizado  --- 4 - Financiado',
  `fecha_culminacion` date NOT NULL COMMENT 'Fecha en que se termina el proyecto',
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de creación del proyecto',
  `fecha_actualizacion` datetime DEFAULT NULL COMMENT 'Fecha de actualizacion'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eco_rol`
--

CREATE TABLE `eco_rol` (
  `id_rol` int(11) NOT NULL COMMENT 'Id principal',
  `rol` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '1 - Administrador // 2 - inversionista // 3 - inmobiliaria // '
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `eco_rol`
--

INSERT INTO `eco_rol` (`id_rol`, `rol`) VALUES
(1, 'Administrador'),
(2, 'Inversionista'),
(3, 'Inmobiliaria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eco_seguimiento`
--

CREATE TABLE `eco_seguimiento` (
  `id_seguimiento` int(11) NOT NULL COMMENT 'Id principal',
  `id_proyecto` int(11) NOT NULL COMMENT 'id del proyecto',
  `id_usuario` int(11) NOT NULL COMMENT 'id del usuario ',
  `tipo` int(11) NOT NULL COMMENT '0 - Visto // 1 - Favorito',
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de registro'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eco_tercero`
--

CREATE TABLE `eco_tercero` (
  `id` int(11) NOT NULL COMMENT 'Este campo es la identificación del tercero(persona, inmobiliaria, etc)',
  `tipo_identificacion` int(11) NOT NULL COMMENT '0 NIT // 1 C.C // 2 C.E // 3 RUT // 4 Pasaporte ',
  `primer_nombre` varchar(120) COLLATE utf8_unicode_ci NOT NULL COMMENT 'primer nombre del tercero',
  `segundo_nombre` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'segundo nombre del tercero',
  `primer_apellido` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'primer apellido del tercero',
  `segundo_apellido` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'segundo apellido del tercero',
  `correo` varchar(120) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Correo del tercero',
  `celular` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Celular del tercero',
  `direccion` varchar(250) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Dirección del tercero',
  `tipo_persona` int(1) NOT NULL COMMENT '0 Persona natural // 1 Persona juridica'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eco_usuario`
--

CREATE TABLE `eco_usuario` (
  `id_tercero` int(11) NOT NULL COMMENT 'id perteneciente a la tabla eco_tercero',
  `id_usuario` int(11) NOT NULL COMMENT 'Id principal de la tabla usuario',
  `usuario` varchar(80) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre del usuario',
  `password` varchar(120) COLLATE utf8_unicode_ci NOT NULL COMMENT 'contraseña del usuario',
  `id_rol` int(11) NOT NULL COMMENT 'Rol inversionista // Rol Inmobiliaria // Rol GOD',
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de creación del usuario',
  `fecha_actualizacion` datetime DEFAULT NULL COMMENT 'Fecha de actualizacion de la información'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `eco_bracktrack`
--
ALTER TABLE `eco_bracktrack`
  ADD PRIMARY KEY (`id_backtrack`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `eco_contacto`
--
ALTER TABLE `eco_contacto`
  ADD PRIMARY KEY (`id_contacto`);

--
-- Indices de la tabla `eco_documento`
--
ALTER TABLE `eco_documento`
  ADD PRIMARY KEY (`id_documento`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `eco_inversion`
--
ALTER TABLE `eco_inversion`
  ADD PRIMARY KEY (`id_inversion`),
  ADD KEY `id_proyecto` (`id_proyecto`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `eco_proyecto`
--
ALTER TABLE `eco_proyecto`
  ADD PRIMARY KEY (`id_proyecto`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `eco_rol`
--
ALTER TABLE `eco_rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `eco_seguimiento`
--
ALTER TABLE `eco_seguimiento`
  ADD PRIMARY KEY (`id_seguimiento`),
  ADD KEY `id_proyecto` (`id_proyecto`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `eco_tercero`
--
ALTER TABLE `eco_tercero`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `eco_usuario`
--
ALTER TABLE `eco_usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD KEY `id_tercero` (`id_tercero`),
  ADD KEY `eco_usuario_eco_rol_id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `eco_bracktrack`
--
ALTER TABLE `eco_bracktrack`
  MODIFY `id_backtrack` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id principal';

--
-- AUTO_INCREMENT de la tabla `eco_contacto`
--
ALTER TABLE `eco_contacto`
  MODIFY `id_contacto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id pr', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `eco_documento`
--
ALTER TABLE `eco_documento`
  MODIFY `id_documento` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id principal de esta tabla';

--
-- AUTO_INCREMENT de la tabla `eco_inversion`
--
ALTER TABLE `eco_inversion`
  MODIFY `id_inversion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id principal';

--
-- AUTO_INCREMENT de la tabla `eco_proyecto`
--
ALTER TABLE `eco_proyecto`
  MODIFY `id_proyecto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id principal';

--
-- AUTO_INCREMENT de la tabla `eco_rol`
--
ALTER TABLE `eco_rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id principal', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `eco_seguimiento`
--
ALTER TABLE `eco_seguimiento`
  MODIFY `id_seguimiento` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id principal';

--
-- AUTO_INCREMENT de la tabla `eco_usuario`
--
ALTER TABLE `eco_usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id principal de la tabla usuario';

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `eco_documento`
--
ALTER TABLE `eco_documento`
  ADD CONSTRAINT `eco_documento_eco_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `eco_usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `eco_inversion`
--
ALTER TABLE `eco_inversion`
  ADD CONSTRAINT `eco_inversion_eco_proyecto_id_proyecto` FOREIGN KEY (`id_proyecto`) REFERENCES `eco_proyecto` (`id_proyecto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `eco_inversion_eco_usaurio_id_usaurio` FOREIGN KEY (`id_usuario`) REFERENCES `eco_usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `eco_proyecto`
--
ALTER TABLE `eco_proyecto`
  ADD CONSTRAINT `eco_proyecto_eco_usuario_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `eco_usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `eco_seguimiento`
--
ALTER TABLE `eco_seguimiento`
  ADD CONSTRAINT `eco_seguimiento_eco_proyecto_id_proyecto` FOREIGN KEY (`id_proyecto`) REFERENCES `eco_proyecto` (`id_proyecto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `eco_seguimiento_eco_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `eco_usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `eco_usuario`
--
ALTER TABLE `eco_usuario`
  ADD CONSTRAINT `eco_usuario_eco_rol_id_rol` FOREIGN KEY (`id_rol`) REFERENCES `eco_rol` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `eco_usuario_eco_tercero_id_tercero` FOREIGN KEY (`id_tercero`) REFERENCES `eco_tercero` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
