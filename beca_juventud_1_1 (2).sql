-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-11-2018 a las 01:05:22
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `beca_juventud_1.1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

CREATE TABLE `actividades` (
  `id_actividades` int(11) NOT NULL,
  `nombre` varchar(90) DEFAULT NULL,
  `logistica` varchar(95) DEFAULT NULL,
  `objetivo` varchar(200) DEFAULT NULL,
  `alcance` varchar(150) DEFAULT NULL,
  `horas` int(11) DEFAULT NULL,
  `inicio` date DEFAULT NULL,
  `final` date DEFAULT NULL,
  `estado` enum('Activo','Desactivo') DEFAULT 'Activo',
  `usuario_LaCreo` varchar(45) DEFAULT NULL,
  `casa` varchar(100) DEFAULT NULL,
  `tipo_poblacio` varchar(200) DEFAULT NULL,
  `zonas_intervencion` varchar(200) DEFAULT NULL,
  `tematica_desarrollo` varchar(200) DEFAULT NULL,
  `objetivos_especificos` varchar(800) DEFAULT NULL,
  `resultados_product` varchar(800) DEFAULT NULL,
  `actividades` varchar(800) DEFAULT NULL,
  `lugar` varchar(200) DEFAULT NULL,
  `responsable` varchar(200) DEFAULT NULL,
  `fech_implementa` date DEFAULT NULL,
  `tareas` varchar(800) DEFAULT NULL,
  `asignaciones` varchar(400) DEFAULT NULL,
  `metodologia` varchar(800) DEFAULT NULL,
  `recursos_nece` varchar(800) DEFAULT NULL,
  `presupuesto` bigint(20) DEFAULT NULL,
  `observaciones` varchar(1000) DEFAULT NULL,
  `id_poa` int(11) DEFAULT NULL,
  `latitud` varchar(500) DEFAULT NULL,
  `longitu` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades_has_users`
--

CREATE TABLE `actividades_has_users` (
  `actividades_id_actividades` int(11) NOT NULL,
  `users_id_users` int(11) NOT NULL,
  `tipo_accion_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actualizacion_periodo`
--

CREATE TABLE `actualizacion_periodo` (
  `id` int(11) NOT NULL,
  `id_datos_personales` int(11) NOT NULL,
  `calendario_universidad_id` int(11) NOT NULL,
  `promedio_global` int(11) DEFAULT NULL,
  `promedio_periodo` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `actualizacion` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `actualizacion_periodo`
--

INSERT INTO `actualizacion_periodo` (`id`, `id_datos_personales`, `calendario_universidad_id`, `promedio_global`, `promedio_periodo`, `created_at`, `updated_at`, `actualizacion`) VALUES
(45, 41, 1, 67, 89, '2018-11-20 17:10:30', '2018-11-20 17:10:30', NULL),
(46, 41, 13, 85, 85, '2018-11-20 17:11:34', '2018-11-20 17:11:34', NULL),
(47, 30, 1, 86, 98, '2018-11-20 17:22:33', '2018-11-20 17:22:33', NULL),
(48, 45, 14, 85, 78, '2018-11-21 23:59:55', '2018-11-21 23:59:55', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actulizacion_documentos_has_users`
--

CREATE TABLE `actulizacion_documentos_has_users` (
  `actulizacion_documentos_id` int(11) NOT NULL,
  `users_id_users` int(11) NOT NULL,
  `tipo_accion_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco`
--

CREATE TABLE `banco` (
  `id_banco` int(11) NOT NULL,
  `cuenta_bancaria` varchar(100) DEFAULT NULL,
  `nombre_banco` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco_has_users`
--

CREATE TABLE `banco_has_users` (
  `banco_id_banco` int(11) NOT NULL,
  `users_id_users` int(11) NOT NULL,
  `tipo_accion_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `becas`
--

CREATE TABLE `becas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `monto` double NOT NULL,
  `descripcion` varchar(225) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `becas`
--

INSERT INTO `becas` (`id`, `nombre`, `monto`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Beca juventud', 3000, 'Beca nueva de 20/20', '2018-10-24', '2018-10-31'),
(14, 'Beca Internacional', 4000, 'becas 20/20', '2018-11-01', '2018-11-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calendario_universidad`
--

CREATE TABLE `calendario_universidad` (
  `id` int(11) NOT NULL,
  `universidad_id` int(11) NOT NULL,
  `inicio` date NOT NULL,
  `final` date DEFAULT NULL,
  `solicitud_convenio` date DEFAULT NULL,
  `periodo` varchar(45) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `calendario_universidad`
--

INSERT INTO `calendario_universidad` (`id`, `universidad_id`, `inicio`, `final`, `solicitud_convenio`, `periodo`, `updated_at`, `created_at`, `descripcion`) VALUES
(1, 1, '2018-02-05', '2018-05-20', '2018-01-29', 'I Periodo', '2018-11-15 20:46:43', '2018-10-29 15:31:44', 'nuevo milenio'),
(2, 2, '2018-05-30', '2018-08-26', '2018-05-23', 'II Periodo', '2018-11-15 20:49:41', '2018-10-29 16:26:05', NULL),
(3, 1, '2018-09-12', '2018-12-16', '2018-09-05', 'III Periodo', '2018-11-15 20:55:55', '2018-10-29 19:33:20', 'pruebas'),
(5, 1, '2020-03-19', '2020-03-18', '2020-03-18', 'I Periodo', '2020-03-02 15:29:22', '2020-03-02 15:29:22', NULL),
(6, 4, '2018-11-16', '2018-12-21', '2018-11-21', 'IV Periodo', '2018-11-08 19:24:30', '2018-11-08 19:24:30', 'pruebas'),
(7, 1, '2017-01-01', '2017-03-31', '2018-11-01', 'I Periodo', '2018-11-15 17:52:58', '2018-11-15 17:01:32', 'Prueba'),
(8, 4, '2018-11-12', '2018-11-27', '2018-11-20', 'I Periodo', '2018-11-15 17:34:06', '2018-11-15 17:34:06', 'pruebas'),
(9, 8, '2018-11-12', '2018-11-27', '2018-11-20', 'II Periodo', '2018-11-15 17:35:56', '2018-11-15 17:35:56', 'pruebas'),
(10, 10, '2018-11-06', '2018-11-15', '2018-11-20', 'II Periodo', '2018-11-15 17:47:06', '2018-11-15 17:47:06', 'pruebas'),
(11, 3, '2018-04-02', '2018-05-08', '2018-02-04', 'I Periodo', '2018-11-15 17:49:09', '2018-11-15 17:49:09', 'Prueba'),
(12, 4, '2018-05-15', '2018-08-06', '2018-05-16', 'I Periodo', '2018-11-15 19:05:06', '2018-11-15 19:05:06', 'Prueba'),
(13, 1, '2018-05-30', '2018-08-26', '2018-05-23', 'II Periodo', '2018-11-15 20:56:56', '2018-11-15 20:56:56', 'Segundo'),
(14, 6, '2018-01-08', '2018-03-25', '2018-01-05', 'I Periodo', '2018-11-21 23:56:54', '2018-11-21 23:56:54', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cambio_universidad_has_users`
--

CREATE TABLE `cambio_universidad_has_users` (
  `id` int(11) NOT NULL,
  `datos_personales_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `tipo_accion_id` int(11) NOT NULL,
  `universidad` varchar(185) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cambio_universidad_has_users`
--

INSERT INTO `cambio_universidad_has_users` (`id`, `datos_personales_id`, `users_id`, `tipo_accion_id`, `universidad`, `created_at`, `updated_at`) VALUES
(1, 30, 4, 14, 'UNAH', '2018-11-21 21:03:54', '2018-11-21 21:03:54'),
(2, 41, 4, 14, 'UNAH', '2018-11-21 21:08:23', '2018-11-21 21:08:23'),
(3, 41, 4, 14, 'UNAH', '2018-11-21 21:44:50', '2018-11-21 21:44:50'),
(4, 30, 4, 14, 'UPH', '2018-11-21 23:02:13', '2018-11-21 23:02:13'),
(5, 30, 4, 14, 'UNAH', '2018-11-21 23:58:05', '2018-11-21 23:58:05'),
(6, 45, 4, 14, 'UPH', '2018-11-21 23:58:27', '2018-11-21 23:58:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campus`
--

CREATE TABLE `campus` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `universidad_id` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `campus`
--

INSERT INTO `campus` (`id`, `nombre`, `universidad_id`, `id_municipio`) VALUES
(1, 'UNAH-TEC DANLÍ', 1, 94),
(2, 'UNAH-VS', 1, 80),
(3, 'UNAH-TEC AGUÁN', 1, 0),
(4, 'CIUDAD UNIVERSITARIA', 1, 111),
(5, 'UNAH-CURLA', 1, 0),
(6, 'UNAH-CURLP', 1, 0),
(7, 'UNAH-CUROC', 1, 0),
(8, 'UNAH-CURNO', 1, 0),
(9, 'UNICAH-Tegucigalpa', 10, 0),
(10, 'UNICAH-Danlí', 10, 0),
(11, 'UNICAH-San Pedro Sula', 10, 0),
(12, 'UNICAH-Choluteca', 10, 0),
(13, 'UNICAH-Santa Rosa de Copán', 10, 0),
(14, 'UNICAH-Juticalpa', 10, 0),
(15, 'UNICAH-La Ceiba', 10, 0),
(16, 'UNICAH-Siguatepeque', 10, 0),
(17, 'UNICAH-Olanchito', 10, 0),
(18, 'UNITEC-Tegucigalpa', 4, 0),
(19, 'UNITEC-San Pedro Sula', 4, 0),
(20, 'CEUTEC-Tegucigalpa', 4, 0),
(21, 'CEUTEC-San Pedro Sula', 4, 0),
(22, 'CEUTEC-La Ceiba', 4, 0),
(23, 'UPNFM-Tegucigalpa', 13, 0),
(24, 'UPNFM-Danlí', 13, 0),
(25, 'UPNFM-San Pedro Sula', 13, 0),
(26, 'UPNFM-Choluteca', 13, 0),
(27, 'UPNFM-Santa Rosa de Copán', 13, 0),
(28, 'UPNFM-Juticalpa', 13, 0),
(29, 'UPNFM-La Ceiba', 13, 0),
(30, 'UPNFM-Santa Bárbara', 13, 0),
(31, 'UPNFM-Comayagua', 13, 0),
(32, 'UTH-Tegucigalpa', 4, 0),
(33, 'UTH-Puerto Cortes', 4, 0),
(34, 'UTH-San Pedro Sula', 4, 0),
(35, 'UTH-Choluteca', 4, 0),
(36, 'UTH-El progreso', 4, 0),
(37, 'UTH-ROATÁN', 4, 0),
(38, 'UTH-La Ceiba', 4, 0),
(39, 'UTH-Santa Bárbara', 4, 0),
(40, 'UTH-Siguatepeque', 4, 0),
(41, 'UMH-Tegucigalpa', 2, 0),
(42, 'UMH-Juticalpa', 2, 0),
(43, 'UMH-Santa Rosa de Copán', 2, 0),
(44, 'UMH-Choluteca', 2, 0),
(45, 'UMH-Yoro', 2, 0),
(46, 'UMH-Olanchito', 2, 0),
(47, 'UMH-Tela', 2, 0),
(48, 'UMH-La Esperanza', 2, 0),
(49, 'UMH-Siguatepeque', 2, 0),
(50, 'UMH-Gracias', 2, 0),
(51, 'UMH-Tocoa', 2, 34),
(52, 'UJCV-Tegucigalpa', 14, 111),
(53, 'UJCV-Comayagua', 14, 35),
(54, 'Universidad Zamorano', 18, 127),
(55, 'UCENM-Tegucigalpa', 8, 111),
(56, 'UCENM-La Esperanza', 8, 145),
(57, 'UCENM-Tocoa', 8, 34),
(58, 'UCENM-Catacamas', 8, 231),
(59, 'UCENM-Peña Blanca', 8, 90),
(60, 'UCENM-San Pedro Sula', 8, 80),
(61, 'UCENM-San Lorenzo', 8, 288),
(62, 'UNAG-Catacamas', 5, 231),
(74, 'UPI-Tegucigalpa', 6, 111),
(75, 'CEDAC-Tegucigalpa', 9, 111),
(76, 'CEDAC-San Pedro Sula', 9, 80),
(77, 'ESNACIFOR-Siguatepeque', 17, 53),
(78, 'USAP-San Pedro Sula', 16, 80),
(86, 'UCRISH-Tegucigalpa', 3, 111),
(87, 'UTH-Tegucigalpa', 7, 111),
(88, 'UTH-San pedro sula', 7, 80),
(89, 'UTH-Progreso', 7, 292),
(90, 'UJN-San pedro', 11, 80),
(91, 'USAP-San pedro', 12, 80),
(92, 'UNAH-CURC', 1, 35),
(96, 'CRAED CHOLUTECA', 1, 9),
(97, 'CRAED JUTICALPA', 1, 229),
(98, 'CRAED LA ENTRADA COPAN', 1, 69),
(99, 'CRAED EL PARAÍSO', 1, 95),
(100, 'CRAED EL PROGRESO', 1, 292),
(101, 'CRAED SIGUATEPEQUE', 1, 53),
(102, 'CRAED TEGUCIGALPA', 1, 111),
(103, 'CRAED TOCOA', 1, 34),
(104, 'I.T.S. TELA', 1, 8),
(105, 'TELECENTRO CHOLOMA', 1, 81),
(106, 'TELECENTO PUERTO CORTÉS', 1, 86),
(107, 'TELECENTRO GRACIAS', 1, 185),
(108, 'TELECENTRO OCOTEPEQUE', 1, 213),
(109, 'TELECENTRO ROATÁN', 1, 162),
(110, 'UPH-Tegucigalpa', 6, 111),
(111, 'UPH-Comayagua', 6, 35),
(112, 'UPH-La paz', 6, 166),
(113, 'UPH-El Progreso', 6, 292),
(114, 'UPH-La LIma', 6, 82),
(115, 'UPH-Choluteca', 6, 9),
(116, 'UPH-Danli', 6, 94);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE `carreras` (
  `id` int(11) NOT NULL,
  `nombre` varchar(175) NOT NULL,
  `facultad_id` int(11) NOT NULL,
  `codigo_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `carreras`
--

INSERT INTO `carreras` (`id`, `nombre`, `facultad_id`, `codigo_id`) VALUES
(1, 'INGENIERIA INDUSTRIAL\r\n', 1, 1),
(2, 'INGENIERIA EN SISTEMAS\r\n', 1, 2),
(3, 'INGENIERÍA CIVIL', 1, NULL),
(4, 'INGENIERÍA ELECTRICA', 1, NULL),
(5, 'INGENIERÍA MECANICA', 1, NULL),
(6, 'INGENIERÍA QUIMÍCA INDUSTRIAL', 1, NULL),
(7, 'ENFERMERÍA', 2, NULL),
(8, 'FONOAUDIOLOGÍA', 2, NULL),
(9, 'MEDICINA Y CIRUGÍA', 2, NULL),
(10, 'NUTRICIÓN', 2, NULL),
(11, 'TERAPIA FUNCIONAL', 2, NULL),
(12, 'TÉCNICO EN RADIOTECNOLOGÍAS', 2, NULL),
(13, 'ADMINISTRACIÓN ADUANERA', 3, NULL),
(14, 'ADMINISTRACIÓN DE EMPRESAS', 3, NULL),
(15, 'ADMINISTRACIÓN PÚBLICA', 3, NULL),
(16, 'BANCA Y FINANZAS', 3, NULL),
(17, 'COMERCIO INTERNACIONAL', 3, NULL),
(18, 'CONTADURÍA PÚBLICA', 3, NULL),
(19, 'ECONOMÍA', 3, NULL),
(20, 'INFORMÁTICA ADMINISTRATIVA', 3, NULL),
(21, 'MERCADOTECNIA', 3, NULL),
(22, 'TÉCNICO EN ALIMENTOS Y BEBIDAS', 3, NULL),
(23, 'TÉCNICO EN MICROFINANZAS', 3, NULL),
(24, 'ARQUITECTURA', 4, NULL),
(25, 'EDUCACIÓN FÍSICA', 4, NULL),
(26, 'FILOSOFÍA', 4, NULL),
(27, 'LENGUAS EXTRANJERAS', 4, NULL),
(28, 'LETRAS', 4, NULL),
(29, 'MÚSICA', 4, NULL),
(30, 'PEDAGOGÍA Y CIENCIAS DE LA EDUCACIÓN', 4, NULL),
(31, 'BIOLOGÍA', 5, NULL),
(32, 'FÍSICA', 5, NULL),
(33, 'MATEMÁTICA', 5, NULL),
(34, 'MICROBIOLOGÍA', 5, NULL),
(35, 'TÉCNICO EN METALÚRGIA', 5, NULL),
(36, 'CIENCIA Y TECNOLOGÍAS DE LA INFORMACIÓN GEOGRÁFICA', 6, NULL),
(37, 'LICENCIATURA EN ASTRONOMÍA Y ASTROFÍSICA', 6, NULL),
(38, 'TÉCNICO UNIVERSITARIO EN SISTEMAS DE INFORMACIÓN GEOGRÁFICA CON ÉNFASIS EN CATASTRO', 6, NULL),
(39, 'DERECHO', 7, NULL),
(40, 'QUÍMICA Y FARMACIA', 8, NULL),
(41, 'ANTROPOLOGÍA', 9, NULL),
(42, 'DESARROLLO LOCAL', 9, NULL),
(43, 'HISTORIA', 9, NULL),
(44, 'PERIODISMO', 9, NULL),
(45, 'PSICOLOGÍA', 9, NULL),
(46, 'SOCIOLOGÍA', 9, NULL),
(47, 'TRABAJO SOCIAL', 9, NULL),
(48, 'ODONTOLOGÍA', 10, NULL),
(49, 'ADMINISTRACION DE EMPRESAS', 11, NULL),
(50, 'ADMINISTRACION ADUANERA', 11, NULL),
(51, 'ADMINISTRACION PUBLICA', 11, NULL),
(52, 'BANCA Y FINANZAS', 11, NULL),
(53, 'BIOLOGIA', 11, NULL),
(54, 'CARRERA TECNICA CORTA EN RADIOTECNOLOGIAS', 11, NULL),
(55, 'COMERCIO INTERNACIONAL', 11, NULL),
(56, 'COMERCIO INTERNACIONAL CON ORIENTACION EN AGROINDUSTRIA.', 11, NULL),
(57, 'CONTADURIA PUBLICA Y FINANZAS', 11, NULL),
(58, 'DERECHO', 11, NULL),
(59, 'FILOSOFIA', 11, NULL),
(60, 'HISTORIA', 11, NULL),
(61, 'INFORMATICA ADMINISTRATIVA', 11, NULL),
(62, 'INGENIERIA AGROINDUSTRIAL(94)', 11, NULL),
(63, 'INGENIERIA CIVIL', 11, NULL),
(64, 'INGENIERIA ELECTRICA INDUSTRIAL', 11, NULL),
(65, 'INGENIERIA EN SISTEMAS', 11, NULL),
(66, 'INGENIERIA INDUSTRIAL', 11, NULL),
(67, 'INGENIERIA MECANICA INDUSTRIAL', 11, NULL),
(68, 'INGENIERIA QUIMICA', 11, NULL),
(69, 'LENGUAS  EXTRANJERAS CON ORIENTACIÓN EN LA ENSEÑANZA DEL INGLÉS O FRANCÉS', 11, NULL),
(70, 'LICENCIATURA ECOTURISMO', 11, NULL),
(71, 'MATEMATICA', 11, NULL),
(72, 'MEDICINA', 11, NULL),
(73, 'MERCADOTECNIA', 11, NULL),
(74, 'MICROBIOLOGIA', 11, NULL),
(75, 'MUSICA', 11, NULL),
(76, 'NUTRICION', 11, NULL),
(77, 'ODONTOLOGIA', 11, NULL),
(78, 'PEDAGOGIA Y CIENCIAS DE LA EDUCACION', 11, NULL),
(79, 'PERIODISMO', 11, NULL),
(80, 'QUIMICA INDUSTRIAL', 11, NULL),
(81, 'QUIMICA Y FARMACIA', 11, NULL),
(82, 'SOCIOLOGIA', 11, NULL),
(83, 'TECN.UNIVERSITARIO EN ALIMENTOS Y BEBIDAS', 11, NULL),
(84, 'TECNICO EN ALIMENTOS', 11, NULL),
(85, 'TECNICO EN PROD. AGRICOLA', 11, NULL),
(86, 'TECNICO UNIVERSITARIO ADMINISTRACION DE EMPRESAS CAFETALERAS', 11, NULL),
(87, 'TRABAJO SOCIAL', 11, NULL),
(88, 'ADMINISTRACION DE EMPRESAS', 12, NULL),
(89, 'ARQUITECTURA', 12, NULL),
(90, 'BANCA Y FINANZAS', 12, NULL),
(91, 'CONTADURIA PUBLICA Y FINANZAS', 12, NULL),
(92, 'DERECHO', 12, NULL),
(93, 'ECONOMIA', 12, NULL),
(94, 'ECONOMIA AGRICOLA', 12, NULL),
(95, 'ENFERMERIA', 12, NULL),
(96, 'INGENIERIA AGRONOMICA', 12, NULL),
(97, 'INGENIERIA CIVIL', 12, NULL),
(98, 'INGENIERIA ELECTRICA INDUSTRIAL', 12, NULL),
(99, 'INGENIERIA FORESTAL', 12, NULL),
(100, 'INGENIERIA MECANICA INDUSTRIAL', 12, NULL),
(101, 'LENGUAS  EXTRANJERAS CON ORIENTACIÓN EN LA ENSEÑANZA DEL INGLÉS O FRANCÉS', 12, NULL),
(102, 'LICENCIATURA ECOTURISMO', 12, NULL),
(103, 'MATEMATICA', 12, NULL),
(104, 'MERCADOTECNIA', 12, NULL),
(105, 'ODONTOLOGIA', 12, NULL),
(106, 'QUIMICA INDUSTRIAL', 12, NULL),
(107, 'ADMINISTRACION DE EMPRESAS', 13, NULL),
(108, 'ADMINISTRACION DE EMPRESAS AGROPECUARIAS', 13, NULL),
(109, 'BIOLOGIA', 13, NULL),
(110, 'COMERCIO INTERNACIONAL', 13, NULL),
(111, 'COMERCIO INTERNACIONAL CON ORIENTACION EN AGROINDUSTRIA.', 13, NULL),
(112, 'CONTADURIA PUBLICA Y FINANZAS', 13, NULL),
(113, 'FISICA', 13, NULL),
(114, 'INFORMATICA ADMINISTRATIVA', 13, NULL),
(115, 'ING. EN CIENCIAS ACUICOLAS Y RECURSOS MARINO COSTERO', 13, NULL),
(116, 'INGENIERIA AGROINDUSTRIAL(94)', 13, NULL),
(117, 'INGENIERIA ELECTRICA INDUSTRIAL', 13, NULL),
(118, 'INGENIERIA EN SISTEMAS', 13, NULL),
(119, 'INGENIERIA INDUSTRIAL', 13, NULL),
(120, 'INGENIERIA QUIMICA', 13, NULL),
(121, 'LENGUAS  EXTRANJERAS CON ORIENTACIÓN EN LA ENSEÑANZA DEL INGLÉS O FRANCÉS', 13, NULL),
(122, 'PEDAGOGIA Y CIENCIAS DE LA EDUCACION', 13, NULL),
(123, 'ADMINISTRACION DE EMPRESAS', 14, NULL),
(124, 'ADMINISTRACION DE EMPRESAS AGROPECUARIAS', 14, NULL),
(125, 'COMERCIO INTERNACIONAL', 14, NULL),
(126, 'COMERCIO INTERNACIONAL CON ORIENTACION EN AGROINDUSTRIA.', 14, NULL),
(127, 'ECONOMIA', 14, NULL),
(128, 'EDUCACION FISICA', 14, NULL),
(129, 'ENFERMERIA', 14, NULL),
(130, 'INFORMATICA ADMINISTRATIVA', 14, NULL),
(131, 'INGENIERIA AGROINDUSTRIAL(94)', 14, NULL),
(132, 'INGENIERIA QUIMICA', 14, NULL),
(133, 'LENGUAS  EXTRANJERAS CON ORIENTACIÓN EN LA ENSEÑANZA DEL INGLÉS O FRANCÉS', 14, NULL),
(134, 'MATEMATICA', 14, NULL),
(135, 'MERCADOTECNIA', 14, NULL),
(136, 'MICROBIOLOGIA', 14, NULL),
(137, 'NUTRICION', 14, NULL),
(138, 'ODONTOLOGIA', 14, NULL),
(139, 'PEDAGOGIA Y CIENCIAS DE LA EDUCACION', 14, NULL),
(140, 'QUIMICA INDUSTRIAL', 14, NULL),
(141, 'QUIMICA Y FARMACIA', 14, NULL),
(142, 'SOCIOLOGIA', 14, NULL),
(143, 'ADMINISTRACION DE EMPRESAS', 15, NULL),
(144, 'BANCA Y FINANZAS', 15, NULL),
(145, 'BIOLOGIA', 15, NULL),
(146, 'CARRERA TECNICA CORTA EN RADIOTECNOLOGIAS', 15, NULL),
(147, 'COMERCIO INTERNACIONAL', 15, NULL),
(148, 'COMERCIO INTERNACIONAL CON ORIENTACION EN AGROINDUSTRIA.', 15, NULL),
(149, 'CONTADURIA PUBLICA Y FINANZAS', 15, NULL),
(150, 'DERECHO', 15, NULL),
(151, 'DESARROLLO LOCAL', 15, NULL),
(152, 'ECONOMIA', 15, NULL),
(153, 'FISICA', 15, NULL),
(154, 'INFORMATICA ADMINISTRATIVA', 15, NULL),
(155, 'INGENIERIA AGROINDUSTRIAL(94)', 15, NULL),
(156, 'INGENIERIA ELECTRICA INDUSTRIAL', 15, NULL),
(157, 'INGENIERIA EN SISTEMAS', 15, NULL),
(158, 'INGENIERIA INDUSTRIAL', 15, NULL),
(159, 'INGENIERIA MECANICA INDUSTRIAL', 15, NULL),
(160, 'INGENIERIA QUIMICA', 15, NULL),
(161, 'LENGUAS  EXTRANJERAS CON ORIENTACIÓN EN LA ENSEÑANZA DEL INGLÉS O FRANCÉS', 15, NULL),
(162, 'MATEMATICA', 15, NULL),
(163, 'MEDICINA', 15, NULL),
(164, 'MICROBIOLOGIA', 15, NULL),
(165, 'NUTRICION', 15, NULL),
(166, 'PEDAGOGIA Y CIENCIAS DE LA EDUCACION', 15, NULL),
(167, 'PSICOLOGIA', 15, NULL),
(168, 'QUIMICA Y FARMACIA', 15, NULL),
(169, 'QUIMICA INDUSTRIAL', 15, NULL),
(170, 'TECNICO EN PROD. AGRICOLA', 15, NULL),
(171, 'TECNICO UNIVERSITARIO ADMINISTRACION DE EMPRESAS CAFETALERAS', 15, NULL),
(172, 'TERAPIA FUNCIONAL', 15, NULL),
(173, 'ADMINISTRACION ADUANERA', 16, NULL),
(174, 'CARRERA TECNICA CORTA EN RADIOTECNOLOGIAS', 16, NULL),
(175, 'COMERCIO INTERNACIONAL', 16, NULL),
(176, 'DERECHO', 16, NULL),
(177, 'DESARROLLO LOCAL', 16, NULL),
(178, 'ECONOMIA', 16, NULL),
(179, 'ECONOMIA AGRICOLA', 16, NULL),
(180, 'ENFERMERIA', 16, NULL),
(181, 'FILOSOFIA', 16, NULL),
(182, 'INFORMATICA ADMINISTRATIVA', 16, NULL),
(183, 'INGENIERIA AGROINDUSTRIAL(94)', 16, NULL),
(184, 'INGENIERIA ELECTRICA INDUSTRIAL', 16, NULL),
(185, 'INGENIERIA EN SISTEMAS', 16, NULL),
(186, 'INGENIERIA INDUSTRIAL', 16, NULL),
(187, 'INGENIERIA QUIMICA', 16, NULL),
(188, 'LENGUAS  EXTRANJERAS CON ORIENTACIÓN EN LA ENSEÑANZA DEL INGLÉS O FRANCÉS', 16, NULL),
(189, 'LICENCIATURA ECOTURISMO', 16, NULL),
(190, 'MEDICINA', 16, NULL),
(191, 'MUSICA', 16, NULL),
(192, 'NUTRICION', 16, NULL),
(193, 'ODONTOLOGIA', 16, NULL),
(194, 'QUIMICA Y FARMACIA', 16, NULL),
(195, 'TECN.UNIVERSITARIO EN ALIMENTOS Y BEBIDAS', 16, NULL),
(196, 'TECNICO EN MICROFINANZAS', 16, NULL),
(197, 'ADMINISTRACION DE EMPRESAS', 17, NULL),
(198, 'ECONOMIA', 17, NULL),
(199, 'ENFERMERIA', 17, NULL),
(200, 'FILOSOFIA', 17, NULL),
(201, 'INFORMATICA ADMINISTRATIVA', 17, NULL),
(202, 'INGENIERIA AGROINDUSTRIAL(94)', 17, NULL),
(203, 'INGENIERIA ELECTRICA INDUSTRIAL', 17, NULL),
(204, 'INGENIERIA INDUSTRIAL', 17, NULL),
(205, 'INGENIERIA QUIMICA', 17, NULL),
(206, 'LENGUAS  EXTRANJERAS CON ORIENTACIÓN EN LA ENSEÑANZA DEL INGLÉS O FRANCÉS', 17, NULL),
(207, 'MATEMATICA', 17, NULL),
(208, 'MEDICINA', 17, NULL),
(209, 'MERCADOTECNIA', 17, NULL),
(210, 'NUTRICION', 17, NULL),
(211, 'ODONTOLOGIA', 17, NULL),
(212, 'PSICOLOGIA', 17, NULL),
(213, 'TECNICO EN METALURGIA', 17, NULL),
(214, 'TECNICO UNIVERSITARIO ADMINISTRACION DE EMPRESAS CAFETALERAS', 17, NULL),
(215, 'ADMINISTRACION ADUANERA', 18, NULL),
(216, 'ADMINISTRACION DE EMPRESAS', 18, NULL),
(217, 'BIOLOGIA', 18, NULL),
(218, 'CONTADURIA PUBLICA Y FINANZAS', 18, NULL),
(219, 'DERECHO', 18, NULL),
(220, 'ECONOMIA', 18, NULL),
(221, 'ENFERMERIA', 18, NULL),
(222, 'FISICA', 18, NULL),
(223, 'INFORMATICA ADMINISTRATIVA', 18, NULL),
(224, 'INGENIERIA AGROINDUSTRIAL(94)', 18, NULL),
(225, 'INGENIERIA CIVIL', 18, NULL),
(226, 'INGENIERIA ELECTRICA INDUSTRIAL', 18, NULL),
(227, 'INGENIERIA EN SISTEMAS', 18, NULL),
(228, 'INGENIERIA INDUSTRIAL', 18, NULL),
(229, 'INGENIERIA MECANICA INDUSTRIAL', 18, NULL),
(230, 'INGENIERIA QUIMICA', 18, NULL),
(231, 'LENGUAS EXTRANJERAS CON ORIENTACIÓN EN LA ENSEÑANZA DEL INGLÉS O FRANCÉS', 18, NULL),
(232, 'LETRAS', 18, NULL),
(233, 'MATEMATICA', 18, NULL),
(234, 'MEDICINA', 18, NULL),
(235, 'MERCADOTECNIA', 18, NULL),
(236, 'MICROBIOLOGIA', 18, NULL),
(237, 'NUTRICION', 18, NULL),
(238, 'ODONTOLOGIA', 18, NULL),
(239, 'PEDAGOGIA Y CIENCIAS DE LA EDUCACION', 18, NULL),
(240, 'PERIODISMO', 18, NULL),
(241, 'PSICOLOGIA', 18, NULL),
(242, 'QUIMICA INDUSTRIAL', 18, NULL),
(243, 'TECNICO EN METALURGIA', 18, NULL),
(244, 'SOCIOLOGIA', 18, NULL),
(245, 'TRABAJO SOCIAL', 18, NULL),
(246, 'ADMINISTRACION DE EMPRESAS AGROPECUARIAS', 19, NULL),
(247, 'PEDAGOGIA Y CIENCIAS DE LA EDUCACION', 19, NULL),
(248, 'ADMINISTRACION DE EMPRESAS AGROPECUARIAS', 20, NULL),
(249, 'PEDAGOGIA Y CIENCIAS DE LA EDUCACION', 20, NULL),
(250, 'ADMINISTRACION DE EMPRESAS AGROPECUARIAS', 21, NULL),
(251, 'PEDAGOGIA Y CIENCIAS DE LA EDUCACION', 21, NULL),
(252, 'ADMINISTRACION DE EMPRESAS AGROPECUARIAS', 22, NULL),
(253, 'PEDAGOGIA Y CIENCIAS DE LA EDUCACION', 22, NULL),
(254, 'ADMINISTRACION DE EMPRESAS AGROPECUARIAS', 23, NULL),
(255, 'PEDAGOGIA Y CIENCIAS DE LA EDUCACION', 23, NULL),
(256, 'ADMINISTRACION DE EMPRESAS AGROPECUARIAS', 24, NULL),
(257, 'PEDAGOGIA Y CIENCIAS DE LA EDUCACION', 24, NULL),
(258, 'ADMINISTRACION DE EMPRESAS AGROPECUARIAS', 25, NULL),
(259, 'PEDAGOGIA Y CIENCIAS DE LA EDUCACION', 25, NULL),
(260, 'ADMINISTRACION DE EMPRESAS AGROPECUARIAS', 26, NULL),
(261, 'PEDAGOGIA Y CIENCIAS DE LA EDUCACION', 26, NULL),
(262, 'DESARROLLO LOCAL', 27, NULL),
(263, 'TECN.UNIVERSITARIO EN ALIMENTOS Y BEBIDAS', 27, NULL),
(264, 'TECNICO EN MICROFINANZAS', 27, NULL),
(265, 'TECNICO UNIVERSITARIO EN EDUCACION SOCIAL', 27, NULL),
(266, 'PEDAGOGIA Y CIENCIAS DE LA EDUCACION', 28, NULL),
(267, 'PEDAGOGIA Y CIENCIAS DE LA EDUCACION', 29, NULL),
(268, 'TECNICO EN MICROFINANZAS', 29, NULL),
(269, 'PEDAGOGIA Y CIENCIAS DE LA EDUCACION', 30, NULL),
(270, 'PEDAGOGIA Y CIENCIAS DE LA EDUCACION', 31, NULL),
(271, 'TECNICO EN MICROFINANZAS', 31, NULL),
(272, 'TECNICO EN MICROFINANZAS', 32, NULL),
(273, 'DERECHO', 34, NULL),
(274, 'GERENCIA DE NEGOCIOS', 34, NULL),
(275, 'GERENCIA EN TURISMO', 34, NULL),
(276, 'DERECHO', 35, NULL),
(277, 'GERENCIA DE NEGOCIOS', 35, NULL),
(278, 'GERENCIA EN TURISMO', 35, NULL),
(279, 'DERECHO', 36, NULL),
(280, 'GERENCIA DE NEGOCIOS', 36, NULL),
(281, 'GERENCIA EN TURISMO', 36, NULL),
(282, 'DERECHO', 37, NULL),
(283, 'GERENCIA DE NEGOCIOS', 37, NULL),
(284, 'GERENCIA EN TURISMO', 37, NULL),
(285, 'DERECHO', 38, NULL),
(286, 'GERENCIA DE NEGOCIOS', 38, NULL),
(287, 'GERENCIA EN TURISMO', 38, NULL),
(288, 'DERECHO', 39, NULL),
(289, 'GERENCIA DE NEGOCIOS', 39, NULL),
(290, 'GERENCIA EN TURISMO', 39, NULL),
(291, 'DERECHO', 40, NULL),
(292, 'GERENCIA DE NEGOCIOS', 40, NULL),
(293, 'GERENCIA EN TURISMO', 40, NULL),
(294, 'INGENIERIA ELECTRONICA', 34, NULL),
(295, 'INGENIERIA DE LA PRODUCCION INDUSTRIAL', 34, NULL),
(296, 'INGENIERIA EN SISTEMAS COMPUTACIONALES', 34, NULL),
(297, 'INGENIERIA ELECTRONICA', 35, NULL),
(298, 'INGENIERIA DE LA PRODUCCION INDUSTRIAL', 35, NULL),
(299, 'INGENIERIA EN SISTEMAS COMPUTACIONALES', 35, NULL),
(300, 'INGENIERIA ELECTRONICA', 36, NULL),
(301, 'INGENIERIA DE LA PRODUCCION INDUSTRIAL', 36, NULL),
(302, 'INGENIERIA EN SISTEMAS COMPUTACIONALES', 36, NULL),
(303, 'INGENIERIA ELECTRONICA', 37, NULL),
(304, 'INGENIERIA DE LA PRODUCCION INDUSTRIAL', 37, NULL),
(305, 'INGENIERIA EN SISTEMAS COMPUTACIONALES', 37, NULL),
(306, 'INGENIERIA ELECTRONICA', 38, NULL),
(307, 'INGENIERIA DE LA PRODUCCION INDUSTRIAL', 38, NULL),
(308, 'INGENIERIA EN SISTEMAS COMPUTACIONALES', 38, NULL),
(309, 'INGENIERIA ELECTRONICA', 39, NULL),
(310, 'INGENIERIA DE LA PRODUCCION INDUSTRIAL', 39, NULL),
(311, 'INGENIERIA EN SISTEMAS COMPUTACIONALES', 39, NULL),
(312, 'INGENIERIA ELECTRONICA', 40, NULL),
(313, 'INGENIERIA DE LA PRODUCCION INDUSTRIAL', 40, NULL),
(314, 'INGENIERIA EN SISTEMAS COMPUTACIONALES', 40, NULL),
(315, 'MAESTRIA EN RECURSOS HUMANOS Y GESTION EMPRESARIAL', 48, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera_has_users`
--

CREATE TABLE `carrera_has_users` (
  `users_id_users` int(11) NOT NULL,
  `tipo_accion_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigo_carrera`
--

CREATE TABLE `codigo_carrera` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `codigo_carrera`
--

INSERT INTO `codigo_carrera` (`id`, `nombre`) VALUES
(1, 'INGENIERIA INDUSTRIAL'),
(2, 'INGENIERIA EN SISTEMAS'),
(3, 'INGENIERIA CIVIL'),
(4, 'INGENIER?A EL?CTRICA INDUSTRIAL'),
(5, 'ARQUITECTURA'),
(6, 'INGENIER?A QU?MICA INDUSTRIAL'),
(7, 'INGENIER?A MEC?NICA INDUSTRIAL'),
(8, 'INGENIER?A DE NEGOCIOS'),
(9, 'INGENIER?A EN INFORM?TICA'),
(10, 'INGENIER?A EN CIENCIAS DE LA COMPUTACI?N'),
(11, 'LICENCIATURA EN ASTRONOM?A Y ASTROF?SICA'),
(12, 'INGENIER?A EN GESTI?N LOG?STICA'),
(13, 'INGENIER?A MECATR?NICA'),
(14, 'INGENIER?A EN ENERG?A RENOVABLES SOSTENIBLES'),
(15, 'INGENIER?A PRODUCCI?N INDUSTRIAL'),
(16, 'INGENIER?A ELECTR?NICA'),
(17, 'INGENIER?A EN ENERG?A'),
(18, 'INGENIER?A INDUSTRIAL Y DE SISTEMAS'),
(19, 'RELACIONES INDUSTRIALES'),
(20, 'INGENIER?A EN PRODUCCI?N INDUSTRIAL'),
(21, 'INGENIER?A EN DISE?O INDUSTRIAL'),
(22, 'INGENIER?A EN INDUCCI?N INDUSTRIAL'),
(23, 'INGENIER?A BIOMEC?NICA'),
(24, 'INGENIER?A EN BIOM?DICA'),
(25, 'LICENCIATURA EN PEDAGOG?A'),
(26, 'LICENCIATURA EN LENGUNAS EXTRANJERAS CON ORIE'),
(27, 'LICENCIATURA EN MATEM?TICAS'),
(28, 'LICENCIATURA EN EDUCACI?N B?SICA'),
(29, 'LICENCIATURA EN EDUCACI?N F?SICA'),
(30, 'LENGUAS EXTRANJERAS'),
(31, 'LICENCIATURA EN M?SICA'),
(32, 'LICENCIATURA EN LETRAS'),
(33, 'PEDAGOG?A Y CIENCIAS DE LA EDUCACI?N'),
(34, 'LICENCIATURA EN INGL?S'),
(35, 'LICENCIATURA EN CIENCIAS SOCIALES'),
(36, 'LICENCIATURA EN CIENCIAS NATURALES'),
(37, 'LICENCIATURA EN EDUCACI?N ESPECIAL'),
(38, 'ORIENTACI?N Y CONSEJER?A'),
(39, 'ADMINISTRACI?N Y GESTI?N'),
(40, 'PROFESORADO DE EDUCACI?N PREESCOLAR'),
(41, 'LICENCIATURA EN F?SICA'),
(42, 'ESPA?OL'),
(43, 'CIENCIAS COMERCIALES'),
(44, 'EDUCACI?N ART?STICA'),
(45, 'EDUCACI?N T?CNICA INDUSTRIAL'),
(46, 'GESTI?N Y ADMINISTRACI?N DE LA EDUCACI?N'),
(47, 'PEDAGOG?A ADMINISTRATIVA'),
(48, 'PEDAGOG?A EN CONSEJER?A'),
(49, 'T?CNICO UNIVERSITARIO EN ALIMENTOS Y BEBIDAS'),
(50, 'DISE?O GR?FICO'),
(51, 'T?CNICO UNIVERSITARIO EN MICROFINANZAS'),
(52, 'SEGURIDAD ALIMENTARIA'),
(53, 'T?CNICO BILING?E EN CALL CENTER'),
(54, 'DISE?O DE INTERIORES'),
(55, 'T?CNICO INDUSTRIAL'),
(56, 'LICENCIATURA DISE?O DE MODAS'),
(57, 'T?CNICO EN INSTALACI?N DE REDES'),
(58, 'INGENIER?A AGROINDUSTRIAL'),
(59, 'INGENIER?A AGRON?MICA'),
(60, 'LICENCIATURA EN ECOTURISMO'),
(61, 'INGENIER?A EN CIENCIAS ACUICOLAS Y? RECURSOS '),
(62, 'LICENCIATURA EN ADMINISTRACI?N DE EMPRESAS AG'),
(63, 'INGENIER?A AMBIENTAL'),
(64, 'INGENIER?A FORESTAL'),
(65, 'INGENIER?A EN GEOLOG?A'),
(66, 'T?CNICO EN AGROEXPORTACIONES'),
(67, 'T?CNICO UNIVERSITARIO EN PRODUCCI?N AGR?COLA'),
(68, 'DASONOM?A'),
(69, 'LICENCIATURA EN PSICOLOG?A'),
(70, 'LICENCIATURA EN PERIODISMO'),
(71, 'LICENCIATURA EN SOCIOLOG?A'),
(72, 'TRABAJO SOCIAL'),
(73, 'CIENCIAS DE LA COMUNICACI?N'),
(74, 'LICENCIATURA EN RECURSOS HUMANOS'),
(75, 'TURISMO'),
(76, 'COMUNICACI?N Y PUBLICIDAD'),
(77, 'COMUNICACI?N SOCIAL'),
(78, 'COMUNICACI?N AUDIOVISUAL Y P?BLICA'),
(79, 'DIRECCI?N DE LA COMUNICACI?N COOPERATIVA'),
(80, 'ESTADO Y POL?TICAS P?BLICAS'),
(81, 'INGENIER?A EN CINE Y TELEVISI?N'),
(82, 'LICENCIATURA EN TEOLOG?A'),
(83, 'LICENCIATURA EN MERCADOTECNIA'),
(84, 'LICENCIATURA EN DERECHO'),
(85, 'GERENCIA Y DESARROLLO SOCIAL'),
(86, 'LICENCIATURA EN HISTORIA'),
(87, 'LICENCIATURA EN ANTROPOLOG?A'),
(88, 'INGENIER?A EN TELECOMUNICACIONES'),
(89, 'LICENCIATURA EN FILOSOF?A'),
(90, 'MAESTR?A DE LA DIRECCI?N DE LA COMUNICACI?N C'),
(91, 'LICENCIATURA EN ADMINISTRACI?N DE EMPRESAS'),
(92, 'LICENCIATURA EN CONTADUR?A P?BLICA Y FINANZAS'),
(93, 'LICENTURA EN COMERCIO INTERNACIONAL'),
(94, 'LICENCIATURA EN ECONOM?A'),
(95, 'LICENCIATURA EN ADMINISTRACI?N DE BANCA Y FIN'),
(96, 'LICENCIATURA EN ADMINISTRACI?N ADUANERA'),
(97, 'INFORM?TICA ADMINISTRATIVA'),
(98, 'LICENCIATURA EN ADMINISTRACI?N P?BLICA'),
(99, 'LICENCIATURA EN COMERCIO INTERNACIONAL CON OR'),
(100, 'LICENCIATURA EN DESARROLLO LOCAL'),
(101, 'RELACIONES INTERNACIONALES'),
(102, 'GERENCIA DE NEGOCIOS'),
(103, 'FINANZAS'),
(104, 'DIRECCI?N EMPRESARIAL'),
(105, 'GESTI?N ESTRAT?GICA DE EMPRESAS'),
(106, 'GESTI?N Y CONTADUR?A EMPRESARIAL'),
(107, 'ADMISTRACI?N INDUSTRIAL Y DE NEGOCIOS'),
(108, 'LICENCIATURA EN CONTADUR?A P?BLICA'),
(109, 'NEGOCIOS INTERNACIONALES'),
(110, 'ADMINISTRACI?N DE PROYECTOS'),
(111, 'ADMINISTRACI?N INDUSTRIAL'),
(112, 'GASTRONOM?A'),
(113, 'GESTI?N DE CALIDAD TOTAL'),
(114, 'MEDICINA'),
(115, 'ODONTOLOG?A'),
(116, 'ENFERMER?A'),
(117, 'LICENCIATURA EN NUTRICI?N'),
(118, 'MICROBIOLOG?A'),
(119, 'QU?MICA Y FARMACIA'),
(120, 'LICENCIATURA EN BIOLOG?A'),
(121, 'T?CNICO UNIVERSITARIO EN? RADIOTECNOLOG?A'),
(122, 'T?CNICO UNIVERSITARIO EN TERAPIA FUNCIONAL'),
(123, 'LICENCIATURA EN FONOAUDIOLOG?A'),
(124, 'CIRUG?A DENTAL'),
(125, 'CIENCIAS PARA LA SALUD'),
(126, 'MEDICINA VETERINARIA'),
(127, 'LABORATORIO CL?NICO'),
(128, 'REDIOTECNOLOG?A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigo_facultad`
--

CREATE TABLE `codigo_facultad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `codigo_facultad`
--

INSERT INTO `codigo_facultad` (`id`, `nombre`) VALUES
(1, 'Ciencias Fisico-Matematicas'),
(2, 'Ciencias de la educacion'),
(3, 'Tecnicos'),
(4, 'Ciencias agroforestales'),
(5, 'Areas de las ciencias sociales'),
(6, 'Ciencias Economicas administrativas'),
(7, 'Ciencias biologicas y de la salud'),
(8, 'OTRO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `color`
--

CREATE TABLE `color` (
  `id` int(11) NOT NULL,
  `color` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `color`
--

INSERT INTO `color` (`id`, `color`) VALUES
(1, '#04B404'),
(2, '	#FFCC00'),
(3, '#ff0000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compromiso_politico`
--

CREATE TABLE `compromiso_politico` (
  `id_cpolitico` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_final` date NOT NULL,
  `encargado` varchar(45) NOT NULL,
  `lugar` varchar(200) NOT NULL,
  `asosio` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compromiso_social_horas`
--

CREATE TABLE `compromiso_social_horas` (
  `id_compromiso` int(11) NOT NULL,
  `nombre` varchar(95) NOT NULL,
  `fecha` date NOT NULL,
  `horas` int(11) NOT NULL,
  `id_datos_personales` int(11) NOT NULL,
  `taller_id_taller` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `convenio_universidad`
--

CREATE TABLE `convenio_universidad` (
  `id` int(11) NOT NULL,
  `universidad_id` int(11) NOT NULL,
  `nombre` varchar(95) DEFAULT NULL,
  `inicio` date DEFAULT NULL,
  `final` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `convocatorias`
--

CREATE TABLE `convocatorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_final` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `convocatorias_has_users`
--

CREATE TABLE `convocatorias_has_users` (
  `convocatorias_id` int(11) NOT NULL,
  `users_id_users` int(11) NOT NULL,
  `tipo_accion_id` int(11) NOT NULL,
  `created_at` multilinestring DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `creacion_becarios_has_users`
--

CREATE TABLE `creacion_becarios_has_users` (
  `id` int(11) NOT NULL,
  `datos_personales_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `tipo_accion_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `creacion_becarios_has_users`
--

INSERT INTO `creacion_becarios_has_users` (`id`, `datos_personales_id`, `users_id`, `tipo_accion_id`, `created_at`, `updated_at`) VALUES
(1, 45, 4, 15, '2018-11-21 22:54:14', '2018-11-21 22:54:14'),
(2, 41, 4, 16, '2018-11-21 22:57:54', '2018-11-21 22:57:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_laboral`
--

CREATE TABLE `datos_laboral` (
  `id` int(11) NOT NULL,
  `identidad` varchar(300) DEFAULT NULL,
  `cargo` varchar(300) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `jefe_inmediato` varchar(200) DEFAULT NULL,
  `telefono_referencia` varchar(15) DEFAULT NULL,
  `tipo_ingreso` int(11) DEFAULT NULL,
  `ingreso` int(11) DEFAULT NULL,
  `id_solicitante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_madre`
--

CREATE TABLE `datos_madre` (
  `id` int(11) NOT NULL,
  `identidad` varchar(13) NOT NULL,
  `nombre_completo` varchar(50) NOT NULL,
  `email` varchar(250) DEFAULT NULL,
  `celular` varchar(15) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `datos_madre`
--

INSERT INTO `datos_madre` (`id`, `identidad`, `nombre_completo`, `email`, `celular`, `updated_at`, `created_at`) VALUES
(16, '0807199400130', 'Carmen Argentina Colindres', NULL, '33303379', '2018-11-01 14:31:44', '2018-11-01 14:31:44'),
(22, '5444444444444', 'Carmen Argentina Colindres', NULL, '33303379', '2018-11-05 20:40:06', '2018-11-05 20:40:06'),
(23, '5444444444444', 'Carmen Argentina Colindres', NULL, '33303379', '2018-11-05 20:41:57', '2018-11-05 20:41:57'),
(24, '5444444444444', 'Carmen Argentina Colindres', NULL, '33303379', '2018-11-05 20:42:46', '2018-11-05 20:42:46'),
(25, '5444444444444', 'Carmen Argentina Colindres', NULL, '33303379', '2018-11-05 20:45:13', '2018-11-05 20:45:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_madre_has_users`
--

CREATE TABLE `datos_madre_has_users` (
  `datos_madre_id_madre` int(11) NOT NULL,
  `users_id_users` int(11) NOT NULL,
  `tipo_accion_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_padre`
--

CREATE TABLE `datos_padre` (
  `id` int(11) NOT NULL,
  `identidad` varchar(13) NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `email` varchar(250) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `datos_padre`
--

INSERT INTO `datos_padre` (`id`, `identidad`, `nombre_completo`, `email`, `celular`, `created_at`, `updated_at`) VALUES
(10, '0508199500130', 'Selvin Dublain', NULL, '94511656', '2018-11-01 14:31:44', '2018-11-01 14:31:44'),
(11, '0705197500320', 'ariel morazan', NULL, '55444444', '2018-11-05 20:11:47', '2018-11-05 20:11:47'),
(12, '0705197500320', 'ariel morazan', NULL, '55444444', '2018-11-05 20:12:54', '2018-11-05 20:12:54'),
(13, '0705197500320', 'ariel morazan', NULL, '55444444', '2018-11-05 20:15:28', '2018-11-05 20:15:28'),
(14, '0705197500320', 'ariel morazan', NULL, '55444444', '2018-11-05 20:26:57', '2018-11-05 20:26:57'),
(15, '0705197500320', 'ariel morazan', NULL, '55444444', '2018-11-05 20:29:15', '2018-11-05 20:29:15'),
(16, '0705197500320', 'ariel morazan', NULL, '55444444', '2018-11-05 20:30:23', '2018-11-05 20:30:23'),
(17, '0705197500320', 'ariel morazan', NULL, '55444444', '2018-11-05 20:30:55', '2018-11-05 20:30:55'),
(18, '0705197500320', 'ariel morazan', NULL, '94511656', '2018-11-05 20:40:06', '2018-11-05 20:40:06'),
(19, '0705197500320', 'ariel morazan', NULL, '94511656', '2018-11-05 20:41:58', '2018-11-05 20:41:58'),
(20, '0705197500320', 'ariel morazan', NULL, '94511656', '2018-11-05 20:42:46', '2018-11-05 20:42:46'),
(21, '0705197500320', 'Selvin Dublain', NULL, '55444444', '2018-11-05 20:45:13', '2018-11-05 20:45:13'),
(22, '0508199500130', 'ariel morazan', NULL, '94511656', '2018-11-21 22:53:18', '2018-11-21 22:53:18'),
(23, '0508199500130', 'ariel morazan', NULL, '94511656', '2018-11-21 22:54:14', '2018-11-21 22:54:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_padre_has_users`
--

CREATE TABLE `datos_padre_has_users` (
  `datos_padre_id_padre` int(11) NOT NULL,
  `users_id_users` int(11) NOT NULL,
  `tipo_accion_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `datos_padre_has_userscol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_personales`
--

CREATE TABLE `datos_personales` (
  `id` int(11) NOT NULL,
  `id_cargo` int(11) DEFAULT NULL,
  `id_municipio` int(11) DEFAULT NULL,
  `genero` int(11) DEFAULT NULL,
  `estado_civil` int(11) DEFAULT NULL,
  `id_padre` int(11) DEFAULT NULL,
  `id_madre` int(11) DEFAULT NULL,
  `id_laboral` int(11) DEFAULT NULL,
  `id_extracurr` int(11) DEFAULT NULL,
  `id_grupo_becarios` int(11) DEFAULT NULL,
  `id_banco` int(11) DEFAULT NULL,
  `id_documentos` int(11) DEFAULT NULL,
  `identidad` varchar(13) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `primer_nombre` varchar(100) DEFAULT NULL,
  `segundo_nombre` varchar(100) DEFAULT NULL,
  `primer_apellido` varchar(100) DEFAULT NULL,
  `segundo_apellido` varchar(100) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `discapacidad` varchar(2) DEFAULT NULL,
  `ciudad` varchar(200) DEFAULT NULL,
  `ciudad_res` varchar(200) DEFAULT NULL,
  `colonia` varchar(200) DEFAULT NULL,
  `bloque` varchar(200) DEFAULT NULL,
  `casa` varchar(200) DEFAULT NULL,
  `referenciaDir` varchar(200) DEFAULT NULL,
  `cod_postal` smallint(6) DEFAULT NULL,
  `telefono` varchar(11) DEFAULT NULL,
  `celular` varchar(11) DEFAULT NULL,
  `num_whatsapp` varchar(11) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `passw` varchar(250) DEFAULT NULL,
  `longitud` varchar(500) DEFAULT NULL,
  `latitud` varchar(500) DEFAULT NULL,
  `departamento_residencia` int(11) DEFAULT NULL,
  `becas_id` int(11) DEFAULT NULL,
  `cuenta_universitaria` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `estado_estudios` varchar(45) DEFAULT NULL,
  `fecha_estado_estudios` date DEFAULT NULL,
  `practica` varchar(45) DEFAULT NULL,
  `practica_inicio` date DEFAULT NULL,
  `practica_fin` date DEFAULT NULL,
  `estado_practica` varchar(45) DEFAULT NULL,
  `retencion_inicio` date DEFAULT NULL,
  `retencion_final` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `datos_personales`
--

INSERT INTO `datos_personales` (`id`, `id_cargo`, `id_municipio`, `genero`, `estado_civil`, `id_padre`, `id_madre`, `id_laboral`, `id_extracurr`, `id_grupo_becarios`, `id_banco`, `id_documentos`, `identidad`, `nombre`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `fecha_nacimiento`, `discapacidad`, `ciudad`, `ciudad_res`, `colonia`, `bloque`, `casa`, `referenciaDir`, `cod_postal`, `telefono`, `celular`, `num_whatsapp`, `email`, `passw`, `longitud`, `latitud`, `departamento_residencia`, `becas_id`, `cuenta_universitaria`, `created_at`, `updated_at`, `estado_estudios`, `fecha_estado_estudios`, `practica`, `practica_inicio`, `practica_fin`, `estado_practica`, `retencion_inicio`, `retencion_final`) VALUES
(30, NULL, 111, 1, 1, 10, 16, NULL, NULL, NULL, NULL, NULL, '0705199400130', 'Selvin Ariel Morazan Colindres', NULL, NULL, NULL, NULL, '2018-11-15', NULL, 'Tegucigalpa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '99138307', NULL, NULL, NULL, NULL, NULL, NULL, 1, '20131001356', '2018-11-01 14:31:45', '2018-11-21 20:35:23', 'Activo', '2018-11-21', 'Practica', '2018-11-22', '2018-11-22', 'Activo', '2018-06-01', '2018-06-30'),
(41, NULL, 111, 2, 1, 21, 25, NULL, NULL, NULL, NULL, NULL, '2555555555555', 'Selena Gabriela Morazan Colindres', NULL, NULL, NULL, NULL, '2014-08-12', NULL, 'Tegucigalpa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '89999999', NULL, NULL, NULL, NULL, NULL, NULL, 1, '55555555555', '2018-11-05 20:45:14', '2018-11-21 20:36:11', 'Activo', '2018-11-21', NULL, NULL, NULL, NULL, '2017-04-18', '2018-06-30'),
(45, NULL, 111, 1, 1, 23, NULL, NULL, NULL, NULL, NULL, NULL, '0801199512796', 'Oscar Edgardo Lanza Nelson', 'Oscar', 'Edgardo', 'Lanza', 'Nelson', '2018-11-21', NULL, 'Tegucigalpa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '94688777', NULL, NULL, NULL, NULL, NULL, NULL, 1, '20141001360', '2018-11-21 22:54:14', '2018-11-21 22:54:14', 'Activo', '2018-11-21', NULL, NULL, NULL, NULL, '2017-04-18', '2017-04-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_personales_has_carreras`
--

CREATE TABLE `datos_personales_has_carreras` (
  `id` int(11) NOT NULL,
  `id_datos_personales` int(11) NOT NULL,
  `carrera_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `datos_personales_has_carreras`
--

INSERT INTO `datos_personales_has_carreras` (`id`, `id_datos_personales`, `carrera_id`, `created_at`, `updated_at`) VALUES
(12, 30, 2, '2018-11-01 14:31:45', '2018-11-21 23:58:05'),
(13, 41, 18, '2018-11-05 20:45:14', '2018-11-21 21:08:23'),
(14, 45, 273, '2018-11-21 22:54:14', '2018-11-21 23:58:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id_depto` int(11) NOT NULL,
  `departamento` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id_depto`, `departamento`) VALUES
(1, 'Atlántida'),
(2, 'Choluteca'),
(3, 'Colón'),
(4, 'Comayagua'),
(5, 'Copán'),
(6, 'Cortes'),
(7, 'El Paraíso'),
(8, 'Francisco Morazán'),
(9, 'Gracias a Dios'),
(10, 'Intibucá'),
(11, 'Islas de la Bahía'),
(12, 'La Paz'),
(13, 'Lempira'),
(14, 'Ocotepeque'),
(15, 'Olancho'),
(16, 'Santa Bárbara'),
(17, 'Valle'),
(18, 'Yoro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `depa_asignado`
--

CREATE TABLE `depa_asignado` (
  `created_at` timestamp NULL DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `departamento_id_depto` int(11) NOT NULL,
  `estado` enum('Inactivo','Activo') DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `depa_asignado`
--

INSERT INTO `depa_asignado` (`created_at`, `users_id`, `departamento_id_depto`, `estado`, `updated_at`, `id`) VALUES
('2018-10-12 22:14:36', 1, 8, 'Inactivo', '2018-10-15 15:51:08', 1),
('2018-10-12 22:31:36', 1, 10, 'Inactivo', '2018-10-17 17:03:34', 2),
('2018-10-12 22:36:28', 1, 7, 'Activo', '2018-10-12 22:36:28', 3),
('2018-10-12 22:40:46', 1, 4, 'Activo', '2018-10-12 22:40:46', 4),
('2018-10-15 15:43:51', 1, 1, 'Inactivo', '2018-10-15 15:44:15', 5),
('2018-10-15 15:51:18', 1, 1, 'Activo', '2018-10-15 15:51:18', 6),
('2018-10-17 17:03:25', 1, 8, 'Activo', '2018-10-17 17:03:25', 7),
('2018-10-17 17:37:42', 3, 4, 'Inactivo', '2018-10-17 17:37:55', 8),
('2018-10-17 17:37:51', 3, 6, 'Inactivo', '2018-10-30 18:04:52', 9),
('2018-10-17 17:43:59', 3, 4, 'Activo', '2018-10-17 17:43:59', 10),
('2018-10-17 17:47:20', 3, 8, 'Activo', '2018-10-17 17:47:20', 11),
('2018-10-17 17:47:26', 3, 15, 'Activo', '2018-10-17 17:47:26', 12),
('2018-10-17 17:47:32', 3, 18, 'Activo', '2018-10-17 17:47:33', 13),
('2018-10-17 18:08:37', 5, 7, 'Activo', '2018-10-17 18:08:37', 14),
('2018-10-17 18:08:48', 5, 9, 'Activo', '2018-10-17 18:08:48', 15),
('2018-10-17 18:42:55', 2, 5, 'Activo', '2018-10-17 18:42:55', 16),
('2018-10-17 18:43:02', 2, 2, 'Activo', '2018-10-17 18:43:02', 17),
('2018-10-17 21:43:29', 2, 8, 'Activo', '2018-10-17 21:43:30', 18),
('2018-10-17 21:55:43', 6, 7, 'Activo', '2018-10-17 21:55:43', 19),
('2018-10-17 21:55:51', 6, 9, 'Inactivo', '2018-10-17 21:56:34', 20),
('2018-10-19 21:52:29', 5, 8, 'Inactivo', '2018-10-19 21:52:49', 21),
('2018-10-19 21:52:46', 5, 3, 'Activo', '2018-10-19 21:52:46', 22),
('2018-10-26 20:49:54', 4, 6, 'Activo', '2018-10-26 20:49:54', 23),
('2018-10-26 20:50:00', 4, 9, 'Activo', '2018-10-26 20:50:00', 24),
('2018-10-30 21:39:27', 7, 4, 'Inactivo', '2018-10-30 21:39:41', 25),
('2018-11-02 17:33:03', 9, 7, 'Activo', '2018-11-02 17:33:03', 26),
('2018-11-02 17:33:10', 9, 12, 'Activo', '2018-11-02 17:33:10', 27),
('2018-11-13 21:25:12', 8, 3, 'Inactivo', '2018-11-13 21:25:24', 28),
('2018-11-13 21:25:19', 8, 4, 'Activo', '2018-11-13 21:25:19', 29);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `digitalizacion_documentos`
--

CREATE TABLE `digitalizacion_documentos` (
  `id` int(11) NOT NULL,
  `datos_personales_id` int(11) NOT NULL,
  `url` varchar(45) DEFAULT NULL,
  `periodo` varchar(45) DEFAULT NULL,
  `anio` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `digitalizacion_documentos`
--

INSERT INTO `digitalizacion_documentos` (`id`, `datos_personales_id`, `url`, `periodo`, `anio`, `created_at`, `updated_at`) VALUES
(1, 30, 'Expediente_0705199400130_1541165114.pdf', 'I periodo', '2018-11-01', '2018-11-02 13:25:14', '2018-11-02 13:25:14'),
(2, 30, 'Expediente_0705199400130_1541166086.pdf', 'II periodo', '2018-11-23', '2018-11-02 13:41:26', '2018-11-02 13:41:26'),
(3, 30, 'Expediente_0705199400130_1541169916.pptx', 'III periodo', '2018-11-02', '2018-11-02 14:45:16', '2018-11-02 14:45:16'),
(4, 30, 'Expediente_0705199400130_1541169960.pdf', 'IV periodo', '2018-11-02', '2018-11-02 14:46:00', '2018-11-02 14:46:00'),
(5, 30, 'Expediente_0705199400130_1541170055.pdf', 'IV periodo', '2018-11-02', '2018-11-02 14:47:35', '2018-11-02 14:47:35'),
(6, 30, 'Expediente_0705199400130_1541170098.pdf', 'IV periodo', '2018-11-02', '2018-11-02 14:48:18', '2018-11-02 14:48:18'),
(7, 30, 'Expediente_0705199400130_1541170098.pdf', 'IV periodo', '2018-11-02', '2018-11-02 14:48:18', '2018-11-02 14:48:18'),
(8, 30, 'Expediente_0705199400130_1541173638.pdf', 'I periodo', '2018-11-28', '2018-11-02 15:47:18', '2018-11-02 15:47:18'),
(9, 30, 'Expediente_0705199400130_1541174122.pdf', 'II periodo', '2017-02-01', '2018-11-02 15:55:22', '2018-11-02 15:55:22'),
(10, 30, 'Expediente_0705199400130_1541174217.pdf', 'II periodo', '2016-02-09', '2018-11-02 15:56:57', '2018-11-02 15:56:57'),
(11, 30, 'Expediente_0705199400130_1541174291.pdf', 'III periodo', '2015-01-01', '2018-11-02 15:58:11', '2018-11-02 15:58:11'),
(12, 30, 'Expediente_0705199400130_1541174346.pdf', 'IV periodo', '2014-01-05', '2018-11-02 15:59:06', '2018-11-02 15:59:06'),
(13, 30, 'Expediente_0705199400130_1541188493.pdf', 'Documentacion completa', '2018-11-14', '2018-11-02 19:54:53', '2018-11-02 19:54:53'),
(14, 30, 'Expediente_0705199400130_1541188688.pdf', 'Documentacion completa nueva', '2018-11-08', '2018-11-02 19:58:08', '2018-11-02 19:58:08'),
(15, 30, 'Expediente_0705199400130_1542137971.pdf', 'pruebas', '2018-11-13', '2018-11-13 19:39:31', '2018-11-13 19:39:31'),
(16, 41, 'Expediente_2555555555555_1542226639.pdf', 'Documentacion completa', '2018-11-14', '2018-11-14 20:17:19', '2018-11-14 20:17:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE `documento` (
  `id_documento` int(11) NOT NULL,
  `id_solicitante` int(11) NOT NULL,
  `nombre_archivo` varchar(250) NOT NULL,
  `titulo` varchar(250) NOT NULL,
  `id_convocatoria` int(11) NOT NULL,
  `nombre_recomendado` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento_has_users`
--

CREATE TABLE `documento_has_users` (
  `documento_id_documento` int(11) NOT NULL,
  `users_id_users` int(11) NOT NULL,
  `tipo_accion_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_civil`
--

CREATE TABLE `estado_civil` (
  `id_estado_civil` int(11) NOT NULL,
  `estado_civil` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estado_civil`
--

INSERT INTO `estado_civil` (`id_estado_civil`, `estado_civil`) VALUES
(1, 'Soltero'),
(2, 'Casado'),
(3, 'Unión Libre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_civil_has_users`
--

CREATE TABLE `estado_civil_has_users` (
  `estado_civil_id_estado_civil` int(11) NOT NULL,
  `users_id_users` int(11) NOT NULL,
  `tipo_accion_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_estudios`
--

CREATE TABLE `estado_estudios` (
  `id` int(11) NOT NULL,
  `datos_personales_id` int(11) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado_estudios`
--

INSERT INTO `estado_estudios` (`id`, `datos_personales_id`, `estado`, `descripcion`, `created_at`, `updated_at`) VALUES
(14, 30, 'Activo', 'por el sistema', '2018-11-21 17:19:06', '2018-11-21 17:19:06'),
(15, 41, 'Activo', 'por el sistema', '2018-11-21 17:20:05', '2018-11-21 17:20:05'),
(16, 45, 'Activo', 'Activo por el sistema', '2018-11-21 22:54:14', '2018-11-21 22:54:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_estudios_has_users`
--

CREATE TABLE `estado_estudios_has_users` (
  `id` int(11) NOT NULL,
  `estado_estudios_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `tipo_accion_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado_estudios_has_users`
--

INSERT INTO `estado_estudios_has_users` (`id`, `estado_estudios_id`, `users_id`, `tipo_accion_id`, `created_at`, `updated_at`) VALUES
(1, 14, 4, 11, '2018-11-21 17:19:07', '2018-11-21 11:19:07'),
(2, 15, 4, 11, '2018-11-21 17:20:05', '2018-11-21 11:20:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_pago`
--

CREATE TABLE `estado_pago` (
  `id_estado_pago` int(11) NOT NULL,
  `nombre_estado_pago` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_pago_has_users`
--

CREATE TABLE `estado_pago_has_users` (
  `estado_pago_id_estado_pago` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `extra_curricular`
--

CREATE TABLE `extra_curricular` (
  `id_extracurr` int(11) NOT NULL,
  `url` varchar(300) NOT NULL,
  `id_solicitante` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `extra_curricular_has_users`
--

CREATE TABLE `extra_curricular_has_users` (
  `extra_curricular_id_extracurr` int(11) NOT NULL,
  `users_id_users` int(11) NOT NULL,
  `tipo_accion_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facultad`
--

CREATE TABLE `facultad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(65) NOT NULL,
  `campus_id` int(11) NOT NULL,
  `codigo_facultad_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `facultad`
--

INSERT INTO `facultad` (`id`, `nombre`, `campus_id`, `codigo_facultad_id`) VALUES
(1, 'INGENIERIA	\r\n', 4, 1),
(2, 'FACULTAD DE CIENCIAS MEDICAS	\r\n', 4, 7),
(3, 'CIENCIAS ECONÓMICAS', 4, 6),
(4, 'HUMANIDADES Y ARTES', 4, 5),
(5, 'FACULTAD DE CIENCIAS', 4, 1),
(6, 'CIENCIAS ESPACIALES', 4, 1),
(7, 'CIENCIAS JURÍDICAS', 4, 5),
(8, 'CIENCIAS QUÍMICAS Y FARMACIA', 4, 7),
(9, 'CIENCIAS SOCIALES', 4, 5),
(10, 'ODONTOLOGÍA', 4, 7),
(11, 'FACULTAD CURC', 92, 8),
(12, 'FACULTAD CURLA', 5, 8),
(13, 'FACULTAD CURLP', 6, 8),
(14, 'FACULTAD CURNO', 8, 8),
(15, 'FACULTAD CUROC', 7, 8),
(16, 'FACULTAD UNAH TEC AGUÁN', 3, 8),
(17, 'FACULTAD UNAH TEC DANLÍ', 1, 8),
(18, 'FACULTAD UNAH VS', 2, 8),
(19, 'FACULTAD CRAED CHOLUTECA', 96, 8),
(20, 'FACULTAD CRAED JUTICALPA', 97, 8),
(21, 'FACULTAD CRAED LA ENTRADA COPAN', 98, 8),
(22, 'FACULTAD CRAED EL PARAÍSO', 99, 8),
(23, 'FACULTAD CRAED EL PROGRESO', 100, 8),
(24, 'FACULTAD CRAED SIGUATEPEQUE', 101, 8),
(25, 'FACULTAD CRAED TEGUCIGALPA', 102, 8),
(26, 'FACULTAD CRAED TOCOA', 103, 8),
(27, 'FACULTAD I.T.S. TELA', 104, 8),
(28, 'FACULTAD TELECENTRO CHOLOMA', 105, 8),
(29, 'FACULTAD TELECENTO PUERTO CORTÉS', 106, 8),
(30, 'FACULTAD TELECENTRO GRACIAS', 107, 8),
(31, 'FACULTAD TELECENTRO OCOTEPEQUE', 108, 8),
(32, 'FACULTAD TELECENTRO ROATÁN', 109, 8),
(34, 'LICENCIATURA', 110, 8),
(35, 'LICENCIATURA', 111, 8),
(36, 'LICENCIATURA', 112, 8),
(37, 'LICENCIATURA', 113, 8),
(38, 'LICENCIATURA', 114, 8),
(39, 'LICENCIATURA', 115, 8),
(40, 'LICENCIATURA', 116, 8),
(41, 'INGENIERIA', 110, 8),
(42, 'INGENIERIA', 111, 8),
(43, 'INGENIERIA', 112, 8),
(44, 'INGENIERIA', 113, 8),
(45, 'INGENIERIA', 114, 8),
(46, 'INGENIERIA', 115, 8),
(47, 'INGENIERIA', 116, 8),
(48, 'MAESTRIA', 111, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ficha_documentos`
--

CREATE TABLE `ficha_documentos` (
  ` id` int(11) NOT NULL,
  `url` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `datos_personales_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id_genero` int(11) NOT NULL,
  `genero` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id_genero`, `genero`) VALUES
(1, 'Masculino'),
(2, 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo_becarios`
--

CREATE TABLE `grupo_becarios` (
  `id_grupo_becarios` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `id_embajador` int(11) NOT NULL,
  `id_guia` int(11) NOT NULL,
  `grupo_becarioscol` varchar(45) DEFAULT NULL,
  `id_tipo_grupo` int(11) NOT NULL,
  `id_casa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo_becarios_has_users`
--

CREATE TABLE `grupo_becarios_has_users` (
  `grupo_becarios_id_grupo_becarios` int(11) NOT NULL,
  `users_id_users` int(11) NOT NULL,
  `tipo_accion_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_sesiones`
--

CREATE TABLE `historial_sesiones` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `historial_sesiones`
--

INSERT INTO `historial_sesiones` (`id`, `created_at`, `updated_at`, `users_id`) VALUES
(1, '2018-11-21 16:26:59', '2018-11-21 16:26:59', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `indicadores`
--

CREATE TABLE `indicadores` (
  `id_indicadores` int(11) NOT NULL,
  `descripcion` varchar(800) NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `id_actividades` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id_migrations` int(11) NOT NULL,
  `migration` varchar(255) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE `municipio` (
  `id_municipio` int(11) NOT NULL,
  `municipio` varchar(200) NOT NULL,
  `id_depto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `municipio`
--

INSERT INTO `municipio` (`id_municipio`, `municipio`, `id_depto`) VALUES
(1, 'La Ceiba', 1),
(2, 'Arizona', 1),
(3, 'El Porvenir', 1),
(4, 'Esparta', 1),
(5, 'Jutiapa', 1),
(6, 'La Masica', 1),
(7, 'San Francisco', 1),
(8, 'Tela', 1),
(9, 'Choluteca', 2),
(10, 'Apacilagua', 2),
(11, 'Concepción de María', 2),
(12, 'Duyure', 2),
(13, 'El Corpus', 2),
(14, 'El Triunfo', 2),
(15, 'Marcovia', 2),
(16, 'Morolica', 2),
(17, 'Namasigüe', 2),
(18, 'Orocuina', 2),
(19, 'Pespire', 2),
(20, 'San Antonio de Flores', 2),
(21, 'San Isidro', 2),
(22, 'San José', 2),
(23, 'San Marcos de Colón', 2),
(24, 'Santa Ana de Yusguare', 2),
(25, 'Trujillo', 2),
(26, 'Balfate', 3),
(27, 'Bonito Oriental', 3),
(28, 'Iriona', 3),
(29, 'Limón', 3),
(30, 'Sabá', 3),
(31, 'Santa Fe', 3),
(32, 'Santa Rosa de Aguán', 3),
(33, 'Sonaguera', 3),
(34, 'Tocoa', 3),
(35, 'Comayagua', 4),
(36, 'Ajuterique', 4),
(37, 'El Rosario', 4),
(38, 'Esquías', 4),
(39, 'Humuya', 4),
(40, 'La Libertad', 4),
(41, 'Lamaní', 4),
(42, 'La Trinidad', 4),
(43, 'Las Lajas', 4),
(44, 'Lejamaní', 4),
(45, 'Meámbar', 4),
(46, 'Minas de Oro', 4),
(47, 'Ojos de Agua', 4),
(48, 'San Jerónimo', 4),
(49, 'San José de Comayagua', 4),
(50, 'San José del Potrero', 4),
(51, 'San Luis', 4),
(52, 'San Sebastián', 4),
(53, 'Siguatepeque', 4),
(54, 'Villa de San Antonio', 4),
(55, 'Taulabé', 4),
(56, 'Santa Rosa de Copán', 5),
(57, 'Cabañas', 5),
(58, 'Concepción', 5),
(59, 'Copán Ruinas', 5),
(60, 'Corquín', 5),
(61, 'Cucuyagua', 5),
(62, 'Dolores', 5),
(63, 'Dulce Nombre', 5),
(64, 'El Paraíso', 5),
(65, 'Florida', 5),
(67, 'La Jigua', 5),
(68, 'La Unión', 5),
(69, 'Nueva Arcadia', 5),
(70, 'San Agustín', 5),
(71, 'San Antonio', 5),
(72, 'San Jerónimo', 5),
(73, 'San José', 5),
(74, 'San Juan de Opoa', 5),
(75, 'San Nicolás', 5),
(76, 'San Pedro', 5),
(77, 'Santa Rita', 5),
(78, 'Trinidad de Copán', 5),
(79, 'Veracruz', 5),
(80, 'San Pedro Sula', 6),
(81, 'Choloma', 6),
(82, 'La Lima', 6),
(83, 'Omoa', 6),
(84, 'Pimienta', 6),
(85, 'Potrerillos', 6),
(86, 'Puerto Cortés', 6),
(87, 'San Antonio de Cortés', 6),
(88, 'San Francisco de Yojoa', 6),
(89, 'San Manuel', 6),
(90, 'Santa Cruz de Yojoa', 6),
(91, 'Villanueva', 6),
(92, 'Yuscarán', 7),
(93, 'Alauca', 7),
(94, 'Danlí', 7),
(95, 'El Paraíso', 7),
(96, 'Güinope', 7),
(97, 'Jacaleapa', 7),
(98, 'Liure', 7),
(99, 'Morocelí', 7),
(100, 'Oropolí', 7),
(101, 'Potrerillos', 7),
(102, 'San Antonio de Flores', 7),
(103, 'San Lucas', 7),
(104, 'San Matías', 7),
(105, 'Soledad', 7),
(106, 'Teupasenti', 7),
(107, 'Texiguat', 7),
(108, 'Trojes', 7),
(109, 'Vado Ancho', 7),
(110, 'Yauyupe', 7),
(111, 'Distrito Central (Tegucigalpa)', 8),
(112, 'Alubarén', 8),
(113, 'Cedros', 8),
(114, 'Curarén', 8),
(115, 'El Porvenir', 8),
(116, 'Guaimaca', 8),
(117, 'La Libertad', 8),
(118, 'La Venta', 8),
(119, 'Lepaterique', 8),
(120, 'Maraita', 8),
(121, 'Marale', 8),
(122, 'Nueva Armenia', 8),
(123, 'Ojojona', 8),
(124, 'Orica', 8),
(125, 'Reitoca', 8),
(126, 'Sabanagrande', 8),
(127, 'San Antonio de Oriente', 8),
(128, 'San Buenaventura', 8),
(129, 'San Ignacio', 8),
(130, 'San Juan de Flores', 8),
(131, 'San Miguelito', 8),
(132, 'Santa Ana', 8),
(133, 'Santa Lucía', 8),
(134, 'Talanga', 8),
(135, 'Tatumbla', 8),
(136, 'Valle de Ángeles', 8),
(137, 'Vallecillo', 8),
(138, 'Villa de San Francisco', 8),
(139, 'Puerto Lempira', 9),
(140, 'Brus Laguna', 9),
(141, 'Ahuas', 9),
(142, 'Juan Francisco Bulnes', 9),
(143, 'Villeda Morales', 9),
(144, 'Wampusirpi', 9),
(145, 'La Esperanza', 10),
(146, 'Camasca', 10),
(147, 'Colomoncagua', 10),
(148, 'Concepción', 10),
(149, 'Dolores', 10),
(150, 'Intibucá', 10),
(151, 'Jesús de Otoro', 10),
(152, 'Magdalena', 10),
(153, 'Masaguara', 10),
(154, 'San Antonio', 10),
(155, 'San Francisco de Opalaca', 10),
(156, 'San Isidro', 10),
(157, 'San Juan', 10),
(158, 'San Marcos de La Sierra', 10),
(159, 'San Miguelito', 10),
(160, 'Santa Lucía', 10),
(161, 'Yamaranguila', 10),
(162, 'Roatán', 11),
(163, 'Guanaja', 11),
(164, 'José Santos Guardiola', 11),
(165, 'Utila', 11),
(166, 'La Paz', 12),
(167, 'Aguantequerique', 12),
(168, 'Cabañas', 12),
(169, 'Cane', 12),
(170, 'Chinacla', 12),
(171, 'Guajíquiro', 12),
(172, 'Lauterique', 12),
(173, 'Marcala', 12),
(174, 'Mercedes de Oriente', 12),
(175, 'Opatoro', 12),
(176, 'San Antonio del Norte', 12),
(177, 'San José', 12),
(178, 'San Juan', 12),
(179, 'San Pedro de Tutule', 12),
(180, 'Santa Ana', 12),
(181, 'Santa Elena', 12),
(182, 'Santa María', 12),
(183, 'Santiago de Puringla', 12),
(184, 'Yarula', 12),
(185, 'Gracias', 13),
(186, 'Belén', 13),
(187, 'Candelaria', 13),
(188, 'Cololaca', 13),
(189, 'Erandique', 13),
(190, 'Gualcince', 13),
(191, 'Guarita', 13),
(192, 'La Campa', 13),
(193, 'La Iguala', 13),
(194, 'La Unión', 13),
(195, 'La Virtud', 13),
(196, 'Las Flores', 13),
(197, 'Lepaera', 13),
(198, 'Mapulaca', 13),
(199, 'Piraera', 13),
(200, 'San Andrés', 13),
(201, 'San Francisco', 13),
(202, 'San Juan Guarita', 13),
(203, 'San Manuel Colohete', 13),
(204, 'San Marcos de Caiquín', 13),
(205, 'San Rafael', 13),
(206, 'San Sebastián', 13),
(207, 'Santa Cruz', 13),
(208, 'Talgua', 13),
(209, 'Tambla', 13),
(210, 'Tomalá', 13),
(211, 'Valladolid', 13),
(212, 'Virginia', 13),
(213, 'Ocotepeque', 14),
(214, 'Belén Gualcho', 14),
(215, 'Concepción', 14),
(216, 'Dolores Merendón', 14),
(217, 'Fraternidad', 14),
(218, 'La Encarnación', 14),
(219, 'La Labor', 14),
(220, 'Lucerna', 14),
(221, 'Mercedes', 14),
(222, 'San Fernando', 14),
(223, 'San Francisco del Valle', 14),
(224, 'San Jorge', 14),
(225, 'San Marcos', 14),
(226, 'Santa Fe', 14),
(227, 'Sensenti', 14),
(228, 'Sinuapa', 14),
(229, 'Juticalpa', 15),
(230, 'Campamento', 15),
(231, 'Catacamas', 15),
(232, 'Concordia', 15),
(233, 'Dulce Nombre de Culmí', 15),
(234, 'El Rosario', 15),
(235, 'Esquipulas del Norte', 15),
(236, 'Gualaco', 15),
(237, 'Guarizama', 15),
(238, 'Guata', 15),
(239, 'Guayape', 15),
(240, 'Jano', 15),
(241, 'La Unión', 15),
(242, 'Manguilile', 15),
(243, 'Manto', 15),
(244, 'Patuca', 15),
(245, 'Salama', 15),
(246, 'San Esteban', 15),
(247, 'San Francisco de Becerra', 15),
(248, 'Santa María del Real', 15),
(249, 'Silca', 15),
(250, '', 15),
(251, 'Yocón', 15),
(252, 'Santa Bárbara', 16),
(253, 'Arada', 16),
(254, 'Atima', 16),
(255, 'Azacualpa', 16),
(256, 'Ceguaca', 16),
(257, 'Chinda', 16),
(258, 'Concepción del Norte', 16),
(259, 'Concepción del Sur', 16),
(260, 'El Níspero', 16),
(261, 'Gualala', 16),
(262, 'Ilama', 16),
(263, 'Las Vegas', 16),
(264, 'Macuelizo', 16),
(265, 'Naranjito', 16),
(266, 'Nueva Frontera', 16),
(267, 'Nuevo Celilac', 16),
(268, 'Petoa', 16),
(269, 'Protección', 16),
(270, 'Quimistán', 16),
(271, 'San Francisco de Ojuera', 16),
(272, 'San José de Colinas', 16),
(273, 'San Luis', 16),
(274, 'San Marcos', 16),
(275, 'San Nicolás', 16),
(276, 'San Pedro Zacapa', 16),
(277, 'San Vicente Centenario', 16),
(278, 'Santa Rita', 16),
(279, 'Trinidad', 16),
(280, 'Nacaome', 17),
(281, 'Alianza', 17),
(282, 'Amapala', 17),
(283, 'Aramecina', 17),
(284, 'Caridad', 17),
(285, 'Goascorán', 17),
(286, 'Langue', 17),
(287, 'San Francisco de Coray', 17),
(288, 'San Lorenzo', 17),
(289, 'Yoro', 18),
(290, 'Arenal', 18),
(291, 'El Negrito', 18),
(292, 'El Progreso', 18),
(293, 'Jocón', 18),
(294, 'Morazán', 18),
(295, 'Olanchito', 18),
(296, 'Santa Rita', 18),
(297, 'Sulaco', 18),
(298, 'Victoria', 18),
(299, 'Yorito', 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nombre_complementaria`
--

CREATE TABLE `nombre_complementaria` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `estado` enum('Activo','Desactivo') DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `nombre_complementaria`
--

INSERT INTO `nombre_complementaria` (`id`, `users_id`, `nombre`, `fecha`, `created_at`, `updated_at`, `estado`) VALUES
(11, 4, 'noviembre  #12', '2018-11-01', '2018-11-16 13:48:27', '2018-11-16 13:48:27', 'Activo'),
(12, 4, 'noveimbre  #13', '2018-11-01', '2018-11-16 14:00:31', '2018-11-16 14:00:31', 'Activo'),
(13, 4, 'Diciembre  #14', '2018-12-01', '2018-11-16 14:05:09', '2018-11-16 14:05:09', 'Activo'),
(14, 4, 'DICIEMBRE', '2018-12-01', '2018-11-16 15:41:44', '2018-11-16 15:41:44', 'Activo'),
(15, 4, 'SEPTIEMBRE', '2018-09-01', '2018-11-16 16:32:07', '2018-11-16 16:32:07', 'Activo'),
(16, 8, 'noviembre33', '2018-11-01', '2018-11-16 21:49:04', '2018-11-16 21:49:04', 'Activo'),
(17, 9, 'Complementaria #1 FM Agosto', '2018-08-01', '2018-11-16 22:05:00', '2018-11-20 15:51:00', 'Desactivo'),
(18, 9, 'Complementaria #1 FM agosto', '2018-08-01', '2018-11-16 22:05:28', '2018-11-16 22:05:28', 'Activo'),
(19, 4, 'complementaria junio 2018', '2018-06-01', '2018-11-20 15:38:00', '2018-11-20 15:38:00', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id_pagos` int(11) NOT NULL,
  `mes` varchar(100) DEFAULT NULL,
  `fecha_pago` datetime DEFAULT NULL,
  `observacion` varchar(300) DEFAULT NULL,
  `id_tipo_pago` int(11) NOT NULL,
  `id_estado_pago` int(11) NOT NULL,
  `id_datos_personales` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_has_users`
--

CREATE TABLE `pagos_has_users` (
  `id_pagos` int(11) NOT NULL,
  `id_users` int(11) NOT NULL,
  `tipo_accion_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_meses_universidad`
--

CREATE TABLE `pagos_meses_universidad` (
  `id` int(11) NOT NULL,
  `01` varchar(45) DEFAULT NULL,
  `02` varchar(45) DEFAULT NULL,
  `03` varchar(45) DEFAULT NULL,
  `04` varchar(45) DEFAULT NULL,
  `05` varchar(45) DEFAULT NULL,
  `06` varchar(45) DEFAULT NULL,
  `07` varchar(45) DEFAULT NULL,
  `08` varchar(45) DEFAULT NULL,
  `09` varchar(45) DEFAULT NULL,
  `10` varchar(45) DEFAULT NULL,
  `11` varchar(45) DEFAULT NULL,
  `12` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `universidad_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pagos_meses_universidad`
--

INSERT INTO `pagos_meses_universidad` (`id`, `01`, `02`, `03`, `04`, `05`, `06`, `07`, `08`, `09`, `10`, `11`, `12`, `created_at`, `updated_at`, `universidad_id`) VALUES
(1, 'NO', 'SI', 'SI', 'SI', 'SI', 'AMBOS PERIODO', 'SI', 'SI', 'SI', 'SI', 'SI', 'SI', '2018-10-30 20:35:34', '2018-11-15 21:25:34', 1),
(2, 'SI', 'SI', 'NO', 'SI', 'SI', 'AMBOS PERIODO', 'SI', 'SI', 'SI', 'SI', 'SI', 'SI', '2018-10-30 21:51:42', '2018-11-19 20:23:17', 2),
(3, 'SI', 'SI', 'SI', 'AMBOS PERIODO', 'NO', 'SI', 'SI', 'SI', 'NO', 'SI', 'SI', 'SI', '2018-11-07 20:07:32', '2018-11-07 20:07:32', 4),
(4, 'NO', 'SI', 'SI', 'SI', 'AMBOS PERIODO', 'SI', 'SI', 'SI', 'SI', 'AMBOS PERIODO', 'SI', 'SI', '2018-11-19 20:19:30', '2018-11-19 20:59:44', 10),
(5, 'SI', 'SI', 'SI', 'AMBOS PERIODO', 'SI', 'SI', 'SI', 'SI', 'AMBOS PERIODO', 'SI', 'SI', 'SI', '2018-11-19 20:33:09', '2018-11-19 20:36:41', 9),
(6, 'SI', 'SI', 'SI', 'AMBOS PERIODO', 'SI', 'SI', 'SI', 'SI', 'SI', 'SI', 'SI', 'NO', '2018-11-19 20:37:32', '2018-11-19 20:37:59', 7),
(7, 'NO', 'SI', 'SI', 'SI', 'AMBOS PERIODO', 'SI', 'SI', NULL, 'AMBOS PERIODO', 'SI', 'SI', 'NO', '2018-11-19 20:56:27', '2018-11-19 20:56:27', 8),
(8, 'SI', 'SI', 'SI', 'SI', 'SI', 'AMBOS PERIODO', 'SI', NULL, 'SI', 'SI', 'SI', 'SI', '2018-11-22 00:02:07', '2018-11-22 00:02:07', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(250) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('selvin.morazan@becashonduras2020.gob.hn', '$2y$10$U8wxlMopMVsN.eCJ96ufCO1s7rZLpsE5lPemjhiUeJ38SaW0HNSyy', '2018-11-02 17:55:51'),
('Jenny.madrid@becashonduras2020.gob.hn', '$2y$10$eytyOnIigc7MR1i/.HeRfevIzb.BnyFwWIAhf9OvnOdpB.wdJvgFm', '2018-11-02 20:53:19'),
('selvinmorazan@gmail.com', '$2y$10$pmsaQflkmI0HLvsXstcjd.0SSD8hJIFuVf2HrGWG/bFMwgLM0M6e2', '2018-11-15 16:44:06'),
('oscarnelson18@gmail.com', '$2y$10$UgU9fz3Dk1INRKpjtupjfOJlbHR999Jul5YH3SuulkGDlM66qW7Ly', '2018-11-15 16:55:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo_universidad`
--

CREATE TABLE `periodo_universidad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `universidad_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `periodo_universidad`
--

INSERT INTO `periodo_universidad` (`id`, `nombre`, `universidad_id`) VALUES
(1, 'I Periodo', 1),
(2, 'II Periodo', 1),
(3, 'III Periodo', 1),
(4, 'I Periodo', 2),
(5, 'II Periodo', 2),
(6, 'III Periodo', 2),
(7, 'IV Periodo', 2),
(8, 'I Periodo', 3),
(9, 'II Periodo', 3),
(10, 'III Periodo', 3),
(11, 'I Periodo', 4),
(12, 'II Periodo', 4),
(13, 'III Periodo', 4),
(14, 'IV Periodo', 4),
(15, 'I Periodo', 5),
(16, 'II Periodo', 5),
(17, 'III Periodo', 5),
(18, 'I Periodo', 6),
(19, 'II Periodo', 6),
(20, 'III Periodo', 6),
(21, 'IV Periodo', 6),
(22, 'I Periodo', 7),
(23, 'II Periodo', 7),
(24, 'III Periodo', 7),
(25, 'I Periodo', 8),
(26, 'II Periodo', 8),
(27, 'III Periodo', 8),
(28, 'I Periodo', 9),
(29, 'II Periodo', 9),
(30, 'III Periodo', 9),
(31, 'I Periodo', 10),
(32, 'II Periodo', 10),
(33, 'III Periodo', 10),
(34, 'I Periodo', 11),
(35, 'II Periodo', 11),
(36, 'III Periodo', 11),
(37, 'IV Periodo', 11),
(38, 'I Periodo', 12),
(39, 'II Periodo', 12),
(40, 'III Periodo', 12),
(41, 'I Periodo', 13),
(42, 'II Periodo', 13),
(43, 'III Periodo', 13),
(44, 'I Periodo', 14),
(45, 'II Periodo', 14),
(46, 'III Periodo', 14),
(47, 'I Periodo', 15),
(48, 'II Periodo', 15),
(49, 'III Periodo', 15),
(50, 'I Periodo', 17),
(51, 'II Periodo', 17),
(52, 'III Periodo', 17),
(53, 'I Periodo', 18),
(54, 'II Periodo', 18),
(55, 'III Periodo', 18),
(56, 'IV Periodo', 18),
(57, 'I Periodo', 16),
(58, 'II Periodo', 16),
(59, 'III Periodo', 16),
(60, 'I Periodo', 19),
(61, 'II Periodo', 19),
(62, 'III Periodo', 19),
(63, 'I Periodo', 20),
(64, 'II Periodo', 20),
(65, 'III Periodo', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_dependiente`
--

CREATE TABLE `persona_dependiente` (
  `id` int(11) NOT NULL,
  `id_datos_personales` int(11) NOT NULL,
  `identidad` varchar(13) DEFAULT NULL,
  `nombre_completo` varchar(50) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `parentesco` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona_dependiente`
--

INSERT INTO `persona_dependiente` (`id`, `id_datos_personales`, `identidad`, `nombre_completo`, `email`, `celular`, `parentesco`, `created_at`, `updated_at`) VALUES
(15, 30, '0807199200130', 'Francisco Dias', NULL, '94511665', 'Cuñado(a)', '2018-11-01 14:31:45', '2018-11-01 21:02:03'),
(16, 41, '4545555555555', 'ariel morazan', NULL, '74444444', 'Hermano(a)', '2018-11-05 20:45:14', '2018-11-05 20:45:14'),
(17, 45, '4545555555555', 'Roxana lizzeth', NULL, '25545898', 'Madre', '2018-11-21 22:54:14', '2018-11-21 22:54:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `per_act`
--

CREATE TABLE `per_act` (
  `id_per_act` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `actividades_id_actividades` int(11) NOT NULL,
  `id_datos_personales` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `per_com`
--

CREATE TABLE `per_com` (
  `id_per_com` int(11) NOT NULL,
  `id_datos_personales` int(11) NOT NULL,
  `id_cpolitico` int(11) NOT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planilla_complementaria`
--

CREATE TABLE `planilla_complementaria` (
  `id` int(11) NOT NULL,
  `datos_personales_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `observacion` varchar(250) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `nombre_complementaria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `planilla_complementaria`
--

INSERT INTO `planilla_complementaria` (`id`, `datos_personales_id`, `users_id`, `created_at`, `updated_at`, `observacion`, `fecha`, `nombre_complementaria_id`) VALUES
(17, 30, 4, '2018-11-16 20:22:36', '2018-11-16 20:22:36', 'horas', '2018-11-01', 11),
(18, 30, 8, '2018-11-16 21:46:13', '2018-11-16 21:46:13', 'fgtghry', '2018-12-01', 14),
(19, 30, 9, '2018-11-16 22:06:22', '2018-11-16 22:06:22', 'Por Gay', '2018-08-01', 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `poa`
--

CREATE TABLE `poa` (
  `id_poa` int(11) NOT NULL,
  `objetivo_g` varchar(200) NOT NULL,
  `objetivo_desarrollo` varchar(200) NOT NULL,
  `objetivo_especifico` varchar(1000) NOT NULL,
  `resultados_produc` varchar(200) DEFAULT NULL,
  `responsable` varchar(200) DEFAULT NULL,
  `asocio` varchar(200) DEFAULT NULL,
  `recursos_necesarios` varchar(200) DEFAULT NULL,
  `prespuesto` bigint(20) DEFAULT NULL,
  `fecha_implementacio` varchar(800) DEFAULT NULL,
  `supuestos` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `practica`
--

CREATE TABLE `practica` (
  `id` int(11) NOT NULL,
  `datos_personales_id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `inicio` timestamp NULL DEFAULT NULL,
  `final` timestamp NULL DEFAULT NULL,
  `estado` enum('Activo','Inactivo') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `practica`
--

INSERT INTO `practica` (`id`, `datos_personales_id`, `nombre`, `url`, `inicio`, `final`, `estado`, `created_at`, `updated_at`) VALUES
(1, 30, 'Practica', 'Practica_0705199400130_1541520787.pdf', '2018-08-16 06:00:00', '2018-09-25 06:00:00', 'Activo', '2018-11-06 16:13:07', '2018-11-06 16:13:07'),
(2, 30, 'Practica', 'Practica_0705199400130_1542820837.docx', '2018-11-22 06:00:00', '2018-11-22 06:00:00', 'Activo', '2018-11-21 17:20:37', '2018-11-21 17:20:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `retenido`
--

CREATE TABLE `retenido` (
  `id` int(11) NOT NULL,
  `id_datos_personales` int(11) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `inicio` date NOT NULL,
  `final` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `retenido`
--

INSERT INTO `retenido` (`id`, `id_datos_personales`, `descripcion`, `inicio`, `final`, `created_at`, `updated_at`) VALUES
(1, 30, 'falta', '2018-06-01', '2018-06-30', '2018-11-15 19:23:47', '2018-11-15 19:23:47'),
(2, 30, 'eresfds', '2018-09-01', '2018-09-30', '2018-11-16 21:51:26', '2018-11-16 21:51:26'),
(3, 30, 'pruebas sistema', '2018-01-01', '2018-01-31', '2018-11-21 19:39:53', '2018-11-21 19:39:53'),
(4, 30, 'pruebas sistema 2', '2018-02-01', '2018-02-28', '2018-11-21 19:42:57', '2018-11-21 19:42:57'),
(5, 30, 'pruebas sistema 2', '2018-02-01', '2018-02-28', '2018-11-21 19:43:19', '2018-11-21 19:43:19'),
(6, 30, 'falta de horas', '2018-06-01', '2018-06-30', '2018-11-21 20:35:23', '2018-11-21 20:35:23'),
(7, 41, 'falta de horas', '2018-06-01', '2018-06-30', '2018-11-21 20:36:11', '2018-11-21 20:36:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `retenido_has_users`
--

CREATE TABLE `retenido_has_users` (
  `id` int(11) NOT NULL,
  `id_retenido` int(11) NOT NULL,
  `id_users` int(11) NOT NULL,
  `tipo_accion_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `retenido_has_users`
--

INSERT INTO `retenido_has_users` (`id`, `id_retenido`, `id_users`, `tipo_accion_id`, `created_at`, `updated_at`) VALUES
(1, 5, 4, 13, '2018-11-21 19:43:19', '2018-11-21 19:43:19'),
(2, 6, 4, 13, '2018-11-21 20:35:23', '2018-11-21 20:35:23'),
(3, 7, 4, 13, '2018-11-21 20:36:11', '2018-11-21 20:36:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_accion`
--

CREATE TABLE `tipo_accion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `color_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_accion`
--

INSERT INTO `tipo_accion` (`id`, `nombre`, `color_id`) VALUES
(1, 'Creo la beca', 1),
(2, 'Modifico la beca', 2),
(3, 'Creo el calendario', 1),
(4, 'Modifico el calendario', 2),
(5, 'Creo el Pago Universidad', 1),
(6, 'Modifico el Pago Universidad', 2),
(7, 'Creo Complementaria', 1),
(8, 'Desactivo Complementaria', 3),
(9, 'Actualizo Periodo del Becario(a)', 1),
(10, 'Edito Periodo del Becario(a)', 2),
(11, 'Cambio estado del Becario(a)', 1),
(12, 'Asigno Practica al Becario(a)', 1),
(13, 'Retención del Pago del Becario(a)', 2),
(14, 'Cambio de Universidad', 2),
(15, 'Creo el Becario(a)', 1),
(16, 'Edito el Becario(a)', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_actualizacion`
--

CREATE TABLE `tipo_actualizacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cargo`
--

CREATE TABLE `tipo_cargo` (
  `id_cargo` int(11) NOT NULL,
  `nombre_cargo` varchar(200) NOT NULL,
  `monto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cargo_has_users`
--

CREATE TABLE `tipo_cargo_has_users` (
  `tipo_cargo_id_cargo` int(11) NOT NULL,
  `users_id_users` int(11) NOT NULL,
  `tipo_accion_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_casas`
--

CREATE TABLE `tipo_casas` (
  `id_casa` int(11) NOT NULL,
  `nombre_casa` varchar(45) DEFAULT NULL,
  `url_foto` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_casas_has_users`
--

CREATE TABLE `tipo_casas_has_users` (
  `tipo_casas_id_casa` int(11) NOT NULL,
  `users_id_users` int(11) NOT NULL,
  `tipo_accion_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_grupo`
--

CREATE TABLE `tipo_grupo` (
  `id_tipo_grupo` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_grupo_has_users`
--

CREATE TABLE `tipo_grupo_has_users` (
  `tipo_grupo_id_tipo_grupo` int(11) NOT NULL,
  `users_id_users` int(11) NOT NULL,
  `tipo_accion_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_ingreso`
--

CREATE TABLE `tipo_ingreso` (
  `id_tipo_ingreso` int(11) NOT NULL,
  `tipo_ingreso` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_ingreso_has_users`
--

CREATE TABLE `tipo_ingreso_has_users` (
  `tipo_ingreso_id_tipo_ingreso` int(11) NOT NULL,
  `users_id_users` int(11) NOT NULL,
  `tipo_accion_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pago`
--

CREATE TABLE `tipo_pago` (
  `id_tipo_pago` int(11) NOT NULL,
  `nombre_tipo_pago` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_periodo`
--

CREATE TABLE `tipo_periodo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_periodo`
--

INSERT INTO `tipo_periodo` (`id`, `nombre`) VALUES
(1, 'SEMESTRALES'),
(2, 'TRIMESTRALES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `universidad`
--

CREATE TABLE `universidad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(165) NOT NULL,
  `abreviatura` varchar(45) NOT NULL,
  `url_imagen` varchar(95) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `universidad`
--

INSERT INTO `universidad` (`id`, `nombre`, `abreviatura`, `url_imagen`) VALUES
(1, 'UNIVERSIDAD NACIONAL AUTÓNOMA DE HONDURAS', 'UNAH', 'UNAH.jpg'),
(2, 'UNIVERSIDAD METROPOLITANA DE HONDURAS', 'UMH', 'UMH.png'),
(3, 'UNIVERSIDAD CRISTIANA DE HONDURAS', 'UCRISH', 'UCRISH.jpg'),
(4, 'UNIVERSIDAD TECNÓLOGICA CENTROAMERICANA', 'UNITEC CEUTEC', 'unitec.png'),
(5, 'UNIVERSIDAD NACIONAL DE AGRICULTURA ', 'UNAG', 'UNAG.jpg'),
(6, 'UNIVERSIDAD POLITÉCNICA DE HONDURAS', 'UPH', 'Politecnica.jpg'),
(7, 'UNIVERSIDAD TECNOLÓGICA DE HONDURAS', 'UTH', 'UTH.jpg'),
(8, 'UNIVERSIDAD CRISTIANA EVANGÉLICA NUEVO MILENIO', 'UCENM', 'UCENM.png'),
(9, 'CENTRO DE DISEÑO, ARQUITECTURA Y CONSTRUCCIÓN ', 'CEDAC', 'CEDAC.png'),
(10, 'UNIVERSIDAD CATÓLICA DE HONDURAS ', 'UNICAH', 'UNICAH.jpeg'),
(11, 'UNIVERSIDAD JESÚS DE NAZARETH', 'UJN', 'UJN.jpg'),
(12, 'UNIVERSIDAD DE SAN PEDRO SULA ', 'USAP', 'USAP.png'),
(13, 'UNIVERSIDAD PEDAGÓGICA NACIONAL FRANCISCO MORAZÁN (CUED \'CH, VL, AT, OL, SB\')\r\n\r\n\r\n', 'UPNFM (CUED \'CH, VL, AT, OL, SB\')', 'UPNFM.jpg'),
(14, 'UNIVERSIDAD JOSÉ CECILIO DEL VALLE', 'UJCV', 'JOSE.png'),
(15, 'INTERNATIONAL TECHNICAL SOLUTIONS', 'ITS', 'ITS.png'),
(16, 'UNIVERSIDAD PEDAGÓGICA NACIONAL FRANCISCO MORAZÁN (PREUFOD)', 'UPNFM (PREUFOD)', 'UPNFM.jpg'),
(17, 'UNIVERSIDAD NACIONAL DE CIENCIAS FORESTALES', 'ESNACIFOR', 'esnacifor.jpg'),
(18, 'UNIVERSIDAD DE ZAMORANO', 'ZAMORANO', 'ZAMORANO.png'),
(19, '	\r\nUNIVERSIDAD PEDAGÓGICA NACIONAL FRANCISCO MORAZÁN (UPNFM FORMACIÓN CONTINUA)\r\n', 'UPNFM FORMACIÓN CONTINUA', 'UPNFM.jpg'),
(20, 'UNIVERSIDAD PEDAGÓGICA NACIONAL FRANCISCO MORAZÁN (CUED \'FM, CM, CP, GD\')', 'UPNFM (CUED \'FM, CM, CP, GD\')', 'UPNFM.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `email` varchar(50) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` enum('Miembro','Administrador','Gerencia de Formacion y Capacitacion','Gerencia de Compromiso Social y Juvenil','tablet','Gerencia de Monitoreo y Evaluacio','Gerencia de Formacion y Liderazgo','Gerencia Contabilidad','Gerencia Planilla','Operaciones') DEFAULT 'Miembro',
  `img_url` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `type`, `img_url`) VALUES
(1, 'ariel morazan', 'selvinmorazawqe}n@gmail.com', NULL, '$2y$10$63ukk0EDOR0La7v8DXk2EO699qqtTGFCagBkcwSTCl7ejU8tCTwA6', 'blcfu0AexpAQj0tfSBaUnCFB7KDo3MrMsbnw4MItJJL12ckyyce3j7pkzqHf', '2018-10-12 17:20:52', '2018-10-17 17:03:39', 'Administrador', NULL),
(2, 'ariel morazan', 'selvinmofrazan@gmail.com', NULL, '$2y$10$dQZ3m7CCeB9TtmGhdMSgMO4v4kv.na/Z9DkjgONiH3LqfIyktw9zK', 'jYaxTGZLLQ3wptti5X9WeKVNfaBGJpAK456jLte9FF3jwVKAWIYF5G1NQWaK', '2018-10-15 15:41:49', '2018-10-17 18:49:39', 'Administrador', NULL),
(3, 'ariel colindres', 'selvin@gmail.co', NULL, '$2y$10$F.Z3KjCbrd.pV0MCXk.MGuCjbXKtLMqdnv7ma8s8BpNSYLLm0JXD6', NULL, '2018-10-15 16:12:52', '2018-10-17 17:47:16', 'Gerencia Contabilidad', NULL),
(4, 'ariel morazan', 'selvinmorazan@gmail.com', NULL, '$2y$10$MEgpCO4E1cSEQuVgEl8qv.8YmKsuzoiBsZih9aBU735ogzw7j6zWy', 'SHj0ovC1y8LZQzY37IPPDtY7FKm8NP7aPOKDiZydzjoRbIOsJ3rnAojjGJDu', '2018-10-16 21:58:15', '2018-11-02 17:18:12', 'Operaciones', 'Foto_perfilCel_1541179092.jpg'),
(5, 'samanta', 'samanta@gmail.com', NULL, '$2y$10$U83EUBKbhpmURqZz5yBdFuwpmY7HR327oXmvhrL.Oumc/ZySEqK/.', '0WM08RzzCcj13NtpGUZjThTfEaxd8eRw2yejZOpjeBPeTMC3s6Hnbc2NuuWF', '2018-10-17 18:07:23', '2018-10-19 21:51:56', 'Gerencia Planilla', NULL),
(6, 'dania mejia', 'dania@gmail.com', NULL, '$2y$10$PJmsl1ghYLnTLjBP.VuSd.Yil4CWgipziBdD3VrfKiCB0RoapyYvq', '3PLNOi3UHxDJ14Tmq3MbQXdrA6AvUnPzlfs4zOCnVT0KSLuEIaEbxvn6BWkb', '2018-10-17 21:54:02', '2018-10-17 21:55:15', 'Operaciones', NULL),
(7, 'osca nelson', 'oscarnelson18@gmail.com', NULL, '$2y$10$/dxCKVZ8JcWPFVPW/szbNuC0DeD1KkcP57VtkEUeJnRkWAhkDqCym', 'yYN1QllnhGEnGSFI9AUCps7oUNKONvwCXlEpoDTwmwDoeDfxDO3xjrNahRJ9', '2018-10-18 20:01:46', '2018-10-30 21:39:22', 'Operaciones', NULL),
(8, 'Camilo Espinoza', 'camilo.osmary@gmail.com', NULL, '$2y$10$N86xy9PYgcE3wcewwlqiSOdg02Wjr7EXRM/yTk8MwSey3I84LvQJS', 'FnqjpXdLq9BFWFTl5nZeOpgxLw3HcXWvgAvqAv8fEA0FaNxEAh8djwMwrrRU', '2018-10-23 15:29:21', '2018-11-13 21:25:07', 'Administrador', 'Foto_perfilCel_1541180684.jpg'),
(9, 'Hector Leonel Nolasco', 'asparin281@gmail.com', NULL, '$2y$10$kS5/2YVKD4X37E8RZ41Wh.a1rscPgKyftibbJr89MlMYkJoIIPB2i', 'vIQvjUZSWgayImP25jgHGn4Wctz0lGyIKKahPqLRq3vU1mpQzbQMVnPJR2MR', '2018-11-02 14:37:56', '2018-11-15 20:09:12', 'Operaciones', 'Foto_perfilCel_1541179157.jpg'),
(10, 'victor', 'victor.menchaca@becashonduras2020.gob.hn', NULL, '$2y$10$BoBIL.jkrSp793o2z9h4Y.yFPAdiUnhMJdFLshVdb8WOnkDMDW7tm', 'z9kh09xQdBk4jEA6AoJDLryg2B9AbvOTlWXF4yJoaAfYawssTZI74fisGHGv', '2018-11-02 15:50:24', '2018-11-02 20:00:22', 'Miembro', 'Foto_perfilCel_1541188822.jpg'),
(11, 'Colindres Morazan', 'selvin.morazan@becashonduras2020.gob.hn', NULL, '$2y$10$wbLb/r42V3N078BEkkl7A.Ee3lnt2lBl8bBZVcw.qF0RgIDIrauIC', '6jQLDCz5N3ZUk4K5PfjvP3eV95FuXIPwWGlHuzuG4fB8Zdu2w0dRIKmbJHD0', '2018-11-02 17:52:05', '2018-11-02 17:52:05', 'Miembro', NULL),
(12, 'Jenny Madrid', 'Jenny.madrid@becashonduras2020.gob.hn', NULL, '$2y$10$YwQwunK.XDt3aCjWCbYSWu/DfQMe3uJQiERTKeM5PaynslZWrZV1C', '3AZdciulIBaT4MFsCWT48WIKYiqgfNLIgUVxHdND6u9XVDDECNJPN6qj07qv', '2018-11-02 20:39:39', '2018-11-02 20:39:39', 'Miembro', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_has_actualizacion_periodo`
--

CREATE TABLE `users_has_actualizacion_periodo` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `actualizacion_periodo_id` int(11) NOT NULL,
  `tipo_accion_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users_has_actualizacion_periodo`
--

INSERT INTO `users_has_actualizacion_periodo` (`id`, `users_id`, `actualizacion_periodo_id`, `tipo_accion_id`, `created_at`, `updated_at`) VALUES
(1, 4, 46, 9, '2018-11-20 17:11:34', '2018-11-20 17:11:34'),
(2, 4, 47, 9, '2018-11-20 17:22:33', '2018-11-20 17:22:33'),
(3, 4, 48, 9, '2018-11-21 23:59:55', '2018-11-21 23:59:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_has_becas`
--

CREATE TABLE `users_has_becas` (
  `id` int(11) NOT NULL,
  `tipo_accion_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `becas_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users_has_becas`
--

INSERT INTO `users_has_becas` (`id`, `tipo_accion_id`, `users_id`, `becas_id`, `created_at`, `updated_at`) VALUES
(20, 2, 4, 1, '2018-10-31 20:41:39', '2018-10-31 20:41:39'),
(21, 1, 4, 14, '2018-11-01 14:33:39', '2018-11-01 14:33:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_has_calendario_universidad`
--

CREATE TABLE `users_has_calendario_universidad` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `calendario_universidad_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tipo_accion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users_has_calendario_universidad`
--

INSERT INTO `users_has_calendario_universidad` (`id`, `users_id`, `calendario_universidad_id`, `created_at`, `updated_at`, `tipo_accion_id`) VALUES
(1, 4, 9, '2018-11-15 17:35:56', '2018-11-15 17:35:56', 3),
(2, 4, 10, '2018-11-15 17:47:06', '2018-11-15 17:47:06', 3),
(3, 7, 11, '2018-11-15 17:49:09', '2018-11-15 17:49:09', 3),
(4, 7, 12, '2018-11-15 19:05:06', '2018-11-15 19:05:06', 3),
(5, 4, 3, '2018-11-15 20:42:09', '2018-11-15 20:42:09', 4),
(6, 7, 1, '2018-11-15 20:46:43', '2018-11-15 20:46:43', 4),
(7, 7, 1, '2018-11-15 20:47:30', '2018-11-15 20:47:30', 4),
(8, 7, 1, '2018-11-15 20:48:40', '2018-11-15 20:48:40', 4),
(12, 7, 3, '2018-11-15 20:55:55', '2018-11-15 20:55:55', 4),
(13, 7, 13, '2018-11-15 20:56:56', '2018-11-15 20:56:56', 3),
(14, 4, 1, '2018-11-19 16:52:56', '2018-11-19 16:52:56', 4),
(15, 4, 1, '2018-11-19 17:11:58', '2018-11-19 17:11:58', 4),
(16, 4, 14, '2018-11-21 23:56:54', '2018-11-21 23:56:54', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_has_compromiso_politico`
--

CREATE TABLE `users_has_compromiso_politico` (
  `users_id_users` int(11) NOT NULL,
  `compromiso_politico_id_cpolitico` int(11) NOT NULL,
  `tipo_accion_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_has_compromiso_social_horas`
--

CREATE TABLE `users_has_compromiso_social_horas` (
  `users_id_users` int(11) NOT NULL,
  `compromiso_social_horas_id_compromiso` int(11) NOT NULL,
  `tipo_accion_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_has_datos_laboral`
--

CREATE TABLE `users_has_datos_laboral` (
  `users_id_users` int(11) NOT NULL,
  `datos_laboral_id` int(11) NOT NULL,
  `tipo_accion_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_has_meses_universidad`
--

CREATE TABLE `users_has_meses_universidad` (
  `id` int(11) NOT NULL,
  `users_id` int(11) DEFAULT NULL,
  `pagos_meses_universidad_id` int(11) DEFAULT NULL,
  `tipo_accion_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users_has_meses_universidad`
--

INSERT INTO `users_has_meses_universidad` (`id`, `users_id`, `pagos_meses_universidad_id`, `tipo_accion_id`, `created_at`, `updated_at`) VALUES
(1, 4, 4, 5, '2018-11-19 20:19:30', '2018-11-19 20:19:30'),
(2, 4, 2, 6, '2018-11-19 20:23:17', '2018-11-19 20:23:17'),
(3, 4, 5, 5, '2018-11-19 20:33:09', '2018-11-19 20:33:09'),
(4, 4, 5, 6, '2018-11-19 20:36:41', '2018-11-19 20:36:41'),
(5, 4, 6, 5, '2018-11-19 20:37:32', '2018-11-19 20:37:32'),
(6, 4, 6, 6, '2018-11-19 20:37:59', '2018-11-19 20:37:59'),
(7, 4, 1, 6, '2018-11-19 20:55:17', '2018-11-19 20:55:17'),
(8, 4, 4, 6, '2018-11-19 20:55:46', '2018-11-19 20:55:46'),
(9, 4, 7, 5, '2018-11-19 20:56:27', '2018-11-19 20:56:27'),
(10, 4, 4, 6, '2018-11-19 20:59:44', '2018-11-19 20:59:44'),
(11, 4, 8, 5, '2018-11-22 00:02:07', '2018-11-22 00:02:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_has_nombre_complementaria`
--

CREATE TABLE `users_has_nombre_complementaria` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `nombre_complementaria_id` int(11) NOT NULL,
  `tipo_accion_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users_has_nombre_complementaria`
--

INSERT INTO `users_has_nombre_complementaria` (`id`, `users_id`, `nombre_complementaria_id`, `tipo_accion_id`, `created_at`, `updated_at`) VALUES
(1, 4, 19, 7, '2018-11-20 15:38:00', '2018-11-20 15:38:00'),
(2, 4, 17, 8, '2018-11-20 15:51:00', '2018-11-20 15:51:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_has_per_act`
--

CREATE TABLE `users_has_per_act` (
  `users_id_users` int(11) NOT NULL,
  `per_act_id_per_act` int(11) NOT NULL,
  `tipo_accion_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_has_per_com`
--

CREATE TABLE `users_has_per_com` (
  `users_id_users` int(11) NOT NULL,
  `per_com_id_per_com` int(11) NOT NULL,
  `tipo_accion_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_has_practica`
--

CREATE TABLE `users_has_practica` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `practica_id` int(11) NOT NULL,
  `tipo_accion_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users_has_practica`
--

INSERT INTO `users_has_practica` (`id`, `users_id`, `practica_id`, `tipo_accion_id`, `created_at`, `updated_at`) VALUES
(1, 4, 2, 12, '2018-11-21 17:20:37', '2018-11-21 17:20:37');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD PRIMARY KEY (`id_actividades`),
  ADD KEY `fk_actividades_poa1_idx` (`id_poa`);

--
-- Indices de la tabla `actividades_has_users`
--
ALTER TABLE `actividades_has_users`
  ADD PRIMARY KEY (`actividades_id_actividades`,`users_id_users`),
  ADD KEY `fk_actividades_has_users_users1_idx` (`users_id_users`),
  ADD KEY `fk_actividades_has_users_actividades1_idx` (`actividades_id_actividades`),
  ADD KEY `fk_actividades_has_users_tipo_accion1_idx` (`tipo_accion_id`);

--
-- Indices de la tabla `actualizacion_periodo`
--
ALTER TABLE `actualizacion_periodo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_actualizacion_periodo_datos_personales1_idx` (`id_datos_personales`),
  ADD KEY `fk_actualizacion_periodo_calendario_universidad1_idx` (`calendario_universidad_id`);

--
-- Indices de la tabla `actulizacion_documentos_has_users`
--
ALTER TABLE `actulizacion_documentos_has_users`
  ADD PRIMARY KEY (`actulizacion_documentos_id`,`users_id_users`),
  ADD KEY `fk_actulizacion_documentos_has_users_users1_idx` (`users_id_users`),
  ADD KEY `fk_actulizacion_documentos_has_users_actulizacion_documento_idx` (`actulizacion_documentos_id`),
  ADD KEY `fk_actulizacion_documentos_has_users_tipo_accion1_idx` (`tipo_accion_id`);

--
-- Indices de la tabla `banco`
--
ALTER TABLE `banco`
  ADD PRIMARY KEY (`id_banco`);

--
-- Indices de la tabla `banco_has_users`
--
ALTER TABLE `banco_has_users`
  ADD PRIMARY KEY (`banco_id_banco`,`users_id_users`),
  ADD KEY `fk_banco_has_users_users1_idx` (`users_id_users`),
  ADD KEY `fk_banco_has_users_banco1_idx` (`banco_id_banco`),
  ADD KEY `fk_banco_has_users_tipo_accion1_idx` (`tipo_accion_id`);

--
-- Indices de la tabla `becas`
--
ALTER TABLE `becas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `calendario_universidad`
--
ALTER TABLE `calendario_universidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_calendario_universidad_universidad1_idx` (`universidad_id`);

--
-- Indices de la tabla `cambio_universidad_has_users`
--
ALTER TABLE `cambio_universidad_has_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_datos_personales_has_users_users1_idx` (`users_id`),
  ADD KEY `fk_datos_personales_has_users_datos_personales1_idx` (`datos_personales_id`),
  ADD KEY `fk_datos_personales_has_users_tipo_accion1_idx` (`tipo_accion_id`);

--
-- Indices de la tabla `campus`
--
ALTER TABLE `campus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_campus_universidad1_idx` (`universidad_id`),
  ADD KEY `fk_campus_municipio1_idx` (`id_municipio`);

--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_carreras_facultad1_idx` (`facultad_id`),
  ADD KEY `fk_carreras_codigo_carrera1_idx` (`codigo_id`);

--
-- Indices de la tabla `carrera_has_users`
--
ALTER TABLE `carrera_has_users`
  ADD PRIMARY KEY (`users_id_users`),
  ADD KEY `fk_carrera_has_users_users1_idx` (`users_id_users`),
  ADD KEY `fk_carrera_has_users_tipo_accion1_idx` (`tipo_accion_id`);

--
-- Indices de la tabla `codigo_carrera`
--
ALTER TABLE `codigo_carrera`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `codigo_facultad`
--
ALTER TABLE `codigo_facultad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compromiso_politico`
--
ALTER TABLE `compromiso_politico`
  ADD PRIMARY KEY (`id_cpolitico`);

--
-- Indices de la tabla `compromiso_social_horas`
--
ALTER TABLE `compromiso_social_horas`
  ADD PRIMARY KEY (`id_compromiso`),
  ADD KEY `fk_compromiso_social_horas_datos_personales2_idx` (`id_datos_personales`);

--
-- Indices de la tabla `convenio_universidad`
--
ALTER TABLE `convenio_universidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_convenio_universidad_universidad1_idx` (`universidad_id`);

--
-- Indices de la tabla `convocatorias`
--
ALTER TABLE `convocatorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `convocatorias_has_users`
--
ALTER TABLE `convocatorias_has_users`
  ADD PRIMARY KEY (`convocatorias_id`,`users_id_users`),
  ADD KEY `fk_convocatorias_has_users_users1_idx` (`users_id_users`),
  ADD KEY `fk_convocatorias_has_users_convocatorias1_idx` (`convocatorias_id`),
  ADD KEY `fk_convocatorias_has_users_tipo_accion1_idx` (`tipo_accion_id`);

--
-- Indices de la tabla `creacion_becarios_has_users`
--
ALTER TABLE `creacion_becarios_has_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_datos_personales_has_users_users2_idx` (`users_id`),
  ADD KEY `fk_datos_personales_has_users_datos_personales2_idx` (`datos_personales_id`),
  ADD KEY `fk_creacion_becarios_has_users_tipo_accion1_idx` (`tipo_accion_id`);

--
-- Indices de la tabla `datos_laboral`
--
ALTER TABLE `datos_laboral`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tip_ingres` (`tipo_ingreso`);

--
-- Indices de la tabla `datos_madre`
--
ALTER TABLE `datos_madre`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `datos_madre_has_users`
--
ALTER TABLE `datos_madre_has_users`
  ADD PRIMARY KEY (`datos_madre_id_madre`,`users_id_users`),
  ADD KEY `fk_datos_madre_has_users_users1_idx` (`users_id_users`),
  ADD KEY `fk_datos_madre_has_users_datos_madre1_idx` (`datos_madre_id_madre`),
  ADD KEY `fk_datos_madre_has_users_tipo_accion1_idx` (`tipo_accion_id`);

--
-- Indices de la tabla `datos_padre`
--
ALTER TABLE `datos_padre`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `datos_padre_has_users`
--
ALTER TABLE `datos_padre_has_users`
  ADD PRIMARY KEY (`datos_padre_id_padre`,`users_id_users`),
  ADD KEY `fk_datos_padre_has_users_users1_idx` (`users_id_users`),
  ADD KEY `fk_datos_padre_has_users_datos_padre1_idx` (`datos_padre_id_padre`),
  ADD KEY `fk_datos_padre_has_users_tipo_accion1_idx` (`tipo_accion_id`);

--
-- Indices de la tabla `datos_personales`
--
ALTER TABLE `datos_personales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_personaltogener` (`genero`),
  ADD KEY `fk_estacivtopersonal` (`estado_civil`),
  ADD KEY `fk_municiotopersonal` (`id_municipio`),
  ADD KEY `fk_padre_to_soli` (`id_padre`),
  ADD KEY `fk_madre_to sol` (`id_madre`),
  ADD KEY `id_laboral` (`id_laboral`),
  ADD KEY `id_extracurr` (`id_extracurr`),
  ADD KEY `id_cargo` (`id_cargo`),
  ADD KEY `fk_datos_personales_grupo_becarios1_idx` (`id_grupo_becarios`),
  ADD KEY `fk_datos_personales_banco1_idx` (`id_banco`),
  ADD KEY `fk_datos_personales_actulizacion_documentos1_idx` (`id_documentos`),
  ADD KEY `fk_datos_personales_departamento1_idx` (`departamento_residencia`),
  ADD KEY `fk_datos_personales_becas1_idx` (`becas_id`);

--
-- Indices de la tabla `datos_personales_has_carreras`
--
ALTER TABLE `datos_personales_has_carreras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_datos_personales_has_carreras_carreras1_idx` (`carrera_id`),
  ADD KEY `fk_datos_personales_has_carreras_datos_personales1_idx` (`id_datos_personales`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id_depto`);

--
-- Indices de la tabla `depa_asignado`
--
ALTER TABLE `depa_asignado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_depa_asignado_users1_idx` (`users_id`),
  ADD KEY `fk_depa_asignado_departamento1_idx` (`departamento_id_depto`);

--
-- Indices de la tabla `digitalizacion_documentos`
--
ALTER TABLE `digitalizacion_documentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_digitalizacion_documentos_datos_personales1_idx` (`datos_personales_id`);

--
-- Indices de la tabla `documento`
--
ALTER TABLE `documento`
  ADD PRIMARY KEY (`id_documento`),
  ADD KEY `solicitante_idx` (`id_solicitante`),
  ADD KEY `fk_documento_convocatorias1_idx` (`id_convocatoria`);

--
-- Indices de la tabla `documento_has_users`
--
ALTER TABLE `documento_has_users`
  ADD PRIMARY KEY (`documento_id_documento`,`users_id_users`),
  ADD KEY `fk_documento_has_users_users1_idx` (`users_id_users`),
  ADD KEY `fk_documento_has_users_documento1_idx` (`documento_id_documento`),
  ADD KEY `fk_documento_has_users_tipo_accion1_idx` (`tipo_accion_id`);

--
-- Indices de la tabla `estado_civil`
--
ALTER TABLE `estado_civil`
  ADD PRIMARY KEY (`id_estado_civil`);

--
-- Indices de la tabla `estado_civil_has_users`
--
ALTER TABLE `estado_civil_has_users`
  ADD PRIMARY KEY (`estado_civil_id_estado_civil`,`users_id_users`),
  ADD KEY `fk_estado_civil_has_users_users1_idx` (`users_id_users`),
  ADD KEY `fk_estado_civil_has_users_estado_civil1_idx` (`estado_civil_id_estado_civil`),
  ADD KEY `fk_estado_civil_has_users_tipo_accion1_idx` (`tipo_accion_id`);

--
-- Indices de la tabla `estado_estudios`
--
ALTER TABLE `estado_estudios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_estado_estudios_datos_personales1_idx` (`datos_personales_id`);

--
-- Indices de la tabla `estado_estudios_has_users`
--
ALTER TABLE `estado_estudios_has_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_estado_estudios_has_users_users1_idx` (`users_id`),
  ADD KEY `fk_estado_estudios_has_users_estado_estudios1_idx` (`estado_estudios_id`),
  ADD KEY `fk_estado_estudios_has_users_tipo_accion1_idx` (`tipo_accion_id`);

--
-- Indices de la tabla `estado_pago`
--
ALTER TABLE `estado_pago`
  ADD PRIMARY KEY (`id_estado_pago`);

--
-- Indices de la tabla `estado_pago_has_users`
--
ALTER TABLE `estado_pago_has_users`
  ADD PRIMARY KEY (`estado_pago_id_estado_pago`,`users_id`),
  ADD KEY `fk_estado_pago_has_users_users1_idx` (`users_id`),
  ADD KEY `fk_estado_pago_has_users_estado_pago1_idx` (`estado_pago_id_estado_pago`);

--
-- Indices de la tabla `extra_curricular`
--
ALTER TABLE `extra_curricular`
  ADD PRIMARY KEY (`id_extracurr`);

--
-- Indices de la tabla `extra_curricular_has_users`
--
ALTER TABLE `extra_curricular_has_users`
  ADD PRIMARY KEY (`extra_curricular_id_extracurr`,`users_id_users`),
  ADD KEY `fk_extra_curricular_has_users_users1_idx` (`users_id_users`),
  ADD KEY `fk_extra_curricular_has_users_extra_curricular1_idx` (`extra_curricular_id_extracurr`),
  ADD KEY `fk_extra_curricular_has_users_tipo_accion1_idx` (`tipo_accion_id`);

--
-- Indices de la tabla `facultad`
--
ALTER TABLE `facultad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_facultad_campus1_idx` (`campus_id`),
  ADD KEY `fk_facultad_codigo_facultad1_idx` (`codigo_facultad_id`);

--
-- Indices de la tabla `ficha_documentos`
--
ALTER TABLE `ficha_documentos`
  ADD PRIMARY KEY (` id`),
  ADD KEY `fk_ficha_documentos_datos_personales1_idx` (`datos_personales_id`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id_genero`);

--
-- Indices de la tabla `grupo_becarios`
--
ALTER TABLE `grupo_becarios`
  ADD PRIMARY KEY (`id_grupo_becarios`),
  ADD KEY `fk_grupo_becarios_datos_personales1_idx` (`id_guia`),
  ADD KEY `fk_grupo_becarios_tipo_grupo1_idx` (`id_tipo_grupo`),
  ADD KEY `fk_grupo_becarios_tipo_casas1_idx` (`id_casa`);

--
-- Indices de la tabla `grupo_becarios_has_users`
--
ALTER TABLE `grupo_becarios_has_users`
  ADD PRIMARY KEY (`grupo_becarios_id_grupo_becarios`,`users_id_users`,`tipo_accion_id`),
  ADD KEY `fk_grupo_becarios_has_users_users1_idx` (`users_id_users`),
  ADD KEY `fk_grupo_becarios_has_users_grupo_becarios1_idx` (`grupo_becarios_id_grupo_becarios`),
  ADD KEY `fk_grupo_becarios_has_users_tipo_accion1_idx` (`tipo_accion_id`);

--
-- Indices de la tabla `historial_sesiones`
--
ALTER TABLE `historial_sesiones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_historial_sesiones_users1_idx` (`users_id`);

--
-- Indices de la tabla `indicadores`
--
ALTER TABLE `indicadores`
  ADD PRIMARY KEY (`id_indicadores`),
  ADD KEY `fk_indicadores_actividades1_idx` (`id_actividades`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id_migrations`);

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`id_municipio`),
  ADD KEY `id_departamento` (`id_depto`);

--
-- Indices de la tabla `nombre_complementaria`
--
ALTER TABLE `nombre_complementaria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_nombre_complementaria_users1_idx` (`users_id`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pagos`),
  ADD KEY `fk_pagos_tipo_pago1_idx` (`id_tipo_pago`),
  ADD KEY `fk_pagos_estado_pago1_idx` (`id_estado_pago`),
  ADD KEY `fk_pagos_datos_personales1_idx` (`id_datos_personales`);

--
-- Indices de la tabla `pagos_has_users`
--
ALTER TABLE `pagos_has_users`
  ADD PRIMARY KEY (`id_pagos`,`id_users`),
  ADD KEY `fk_pagos_has_users_users1_idx` (`id_users`),
  ADD KEY `fk_pagos_has_users_pagos1_idx` (`id_pagos`),
  ADD KEY `fk_pagos_has_users_tipo_accion1_idx` (`tipo_accion_id`);

--
-- Indices de la tabla `pagos_meses_universidad`
--
ALTER TABLE `pagos_meses_universidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pagos_meses_universidad_universidad1_idx` (`universidad_id`);

--
-- Indices de la tabla `periodo_universidad`
--
ALTER TABLE `periodo_universidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_periodo_universidad_universidad1_idx` (`universidad_id`);

--
-- Indices de la tabla `persona_dependiente`
--
ALTER TABLE `persona_dependiente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_persona_dependiente_datos_personales1_idx` (`id_datos_personales`);

--
-- Indices de la tabla `per_act`
--
ALTER TABLE `per_act`
  ADD PRIMARY KEY (`id_per_act`),
  ADD KEY `fk_per_act_actividades1_idx` (`actividades_id_actividades`),
  ADD KEY `fk_per_act_datos_personales2_idx` (`id_datos_personales`);

--
-- Indices de la tabla `per_com`
--
ALTER TABLE `per_com`
  ADD PRIMARY KEY (`id_per_com`),
  ADD KEY `fk_per_com_datos_personales1_idx` (`id_datos_personales`),
  ADD KEY `fk_per_com_compromiso_politico1_idx` (`id_cpolitico`);

--
-- Indices de la tabla `planilla_complementaria`
--
ALTER TABLE `planilla_complementaria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_planilla_complementaria_datos_personales1_idx` (`datos_personales_id`),
  ADD KEY `fk_planilla_complementaria_users1_idx` (`users_id`),
  ADD KEY `fk_planilla_complementaria_nombre_complementaria1_idx` (`nombre_complementaria_id`);

--
-- Indices de la tabla `poa`
--
ALTER TABLE `poa`
  ADD PRIMARY KEY (`id_poa`);

--
-- Indices de la tabla `practica`
--
ALTER TABLE `practica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_practica_datos_personales1_idx` (`datos_personales_id`);

--
-- Indices de la tabla `retenido`
--
ALTER TABLE `retenido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `retenido_idx` (`id_datos_personales`);

--
-- Indices de la tabla `retenido_has_users`
--
ALTER TABLE `retenido_has_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_retenido_has_users_users1_idx` (`id_users`),
  ADD KEY `fk_retenido_has_users_retenido1_idx` (`id_retenido`),
  ADD KEY `fk_retenido_has_users_tipo_accion1_idx` (`tipo_accion_id`);

--
-- Indices de la tabla `tipo_accion`
--
ALTER TABLE `tipo_accion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tipo_accion_color1_idx` (`color_id`);

--
-- Indices de la tabla `tipo_actualizacion`
--
ALTER TABLE `tipo_actualizacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_cargo`
--
ALTER TABLE `tipo_cargo`
  ADD PRIMARY KEY (`id_cargo`) USING BTREE;

--
-- Indices de la tabla `tipo_cargo_has_users`
--
ALTER TABLE `tipo_cargo_has_users`
  ADD PRIMARY KEY (`tipo_cargo_id_cargo`,`users_id_users`,`tipo_accion_id`),
  ADD KEY `fk_tipo_cargo_has_users_users1_idx` (`users_id_users`),
  ADD KEY `fk_tipo_cargo_has_users_tipo_cargo1_idx` (`tipo_cargo_id_cargo`),
  ADD KEY `fk_tipo_cargo_has_users_tipo_accion1_idx` (`tipo_accion_id`);

--
-- Indices de la tabla `tipo_casas`
--
ALTER TABLE `tipo_casas`
  ADD PRIMARY KEY (`id_casa`);

--
-- Indices de la tabla `tipo_casas_has_users`
--
ALTER TABLE `tipo_casas_has_users`
  ADD PRIMARY KEY (`tipo_casas_id_casa`,`users_id_users`,`tipo_accion_id`),
  ADD KEY `fk_tipo_casas_has_users_users1_idx` (`users_id_users`),
  ADD KEY `fk_tipo_casas_has_users_tipo_casas1_idx` (`tipo_casas_id_casa`),
  ADD KEY `fk_tipo_casas_has_users_tipo_accion1_idx` (`tipo_accion_id`);

--
-- Indices de la tabla `tipo_grupo`
--
ALTER TABLE `tipo_grupo`
  ADD PRIMARY KEY (`id_tipo_grupo`);

--
-- Indices de la tabla `tipo_grupo_has_users`
--
ALTER TABLE `tipo_grupo_has_users`
  ADD PRIMARY KEY (`tipo_grupo_id_tipo_grupo`,`users_id_users`,`tipo_accion_id`),
  ADD KEY `fk_tipo_grupo_has_users_users1_idx` (`users_id_users`),
  ADD KEY `fk_tipo_grupo_has_users_tipo_grupo1_idx` (`tipo_grupo_id_tipo_grupo`),
  ADD KEY `fk_tipo_grupo_has_users_tipo_accion1_idx` (`tipo_accion_id`);

--
-- Indices de la tabla `tipo_ingreso`
--
ALTER TABLE `tipo_ingreso`
  ADD PRIMARY KEY (`id_tipo_ingreso`);

--
-- Indices de la tabla `tipo_ingreso_has_users`
--
ALTER TABLE `tipo_ingreso_has_users`
  ADD PRIMARY KEY (`tipo_ingreso_id_tipo_ingreso`,`users_id_users`),
  ADD KEY `fk_tipo_ingreso_has_users_users1_idx` (`users_id_users`),
  ADD KEY `fk_tipo_ingreso_has_users_tipo_ingreso1_idx` (`tipo_ingreso_id_tipo_ingreso`),
  ADD KEY `fk_tipo_ingreso_has_users_tipo_accion1_idx` (`tipo_accion_id`);

--
-- Indices de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  ADD PRIMARY KEY (`id_tipo_pago`);

--
-- Indices de la tabla `tipo_periodo`
--
ALTER TABLE `tipo_periodo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `universidad`
--
ALTER TABLE `universidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- Indices de la tabla `users_has_actualizacion_periodo`
--
ALTER TABLE `users_has_actualizacion_periodo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_has_actualizacion_periodo_actualizacion_periodo1_idx` (`actualizacion_periodo_id`),
  ADD KEY `fk_users_has_actualizacion_periodo_users1_idx` (`users_id`),
  ADD KEY `fk_users_has_actualizacion_periodo_tipo_accion1_idx` (`tipo_accion_id`);

--
-- Indices de la tabla `users_has_becas`
--
ALTER TABLE `users_has_becas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_has_becas_becas1_idx` (`becas_id`),
  ADD KEY `fk_users_has_becas_users1_idx` (`users_id`),
  ADD KEY `fk_users_has_becas_tipo_accion1_idx` (`tipo_accion_id`);

--
-- Indices de la tabla `users_has_calendario_universidad`
--
ALTER TABLE `users_has_calendario_universidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_has_calendario_universidad_calendario_universidad1_idx` (`calendario_universidad_id`),
  ADD KEY `fk_users_has_calendario_universidad_users1_idx` (`users_id`),
  ADD KEY `fk_users_has_calendario_universidad_tipo_accion1_idx` (`tipo_accion_id`);

--
-- Indices de la tabla `users_has_compromiso_politico`
--
ALTER TABLE `users_has_compromiso_politico`
  ADD PRIMARY KEY (`users_id_users`,`compromiso_politico_id_cpolitico`,`tipo_accion_id`),
  ADD KEY `fk_users_has_compromiso_politico_compromiso_politico1_idx` (`compromiso_politico_id_cpolitico`),
  ADD KEY `fk_users_has_compromiso_politico_users1_idx` (`users_id_users`),
  ADD KEY `fk_users_has_compromiso_politico_tipo_accion1_idx` (`tipo_accion_id`);

--
-- Indices de la tabla `users_has_compromiso_social_horas`
--
ALTER TABLE `users_has_compromiso_social_horas`
  ADD PRIMARY KEY (`users_id_users`,`compromiso_social_horas_id_compromiso`),
  ADD KEY `fk_users_has_compromiso_social_horas_compromiso_social_hora_idx` (`compromiso_social_horas_id_compromiso`),
  ADD KEY `fk_users_has_compromiso_social_horas_users1_idx` (`users_id_users`),
  ADD KEY `fk_users_has_compromiso_social_horas_tipo_accion1_idx` (`tipo_accion_id`);

--
-- Indices de la tabla `users_has_datos_laboral`
--
ALTER TABLE `users_has_datos_laboral`
  ADD PRIMARY KEY (`users_id_users`,`datos_laboral_id`),
  ADD KEY `fk_users_has_datos_laboral_datos_laboral1_idx` (`datos_laboral_id`),
  ADD KEY `fk_users_has_datos_laboral_users1_idx` (`users_id_users`),
  ADD KEY `fk_users_has_datos_laboral_tipo_accion1_idx` (`tipo_accion_id`);

--
-- Indices de la tabla `users_has_meses_universidad`
--
ALTER TABLE `users_has_meses_universidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_has_pagos_meses_universidad_pagos_meses_universida_idx` (`pagos_meses_universidad_id`),
  ADD KEY `fk_users_has_pagos_meses_universidad_users1_idx` (`users_id`),
  ADD KEY `fk_users_has_pagos_meses_universidad_tipo_accion1_idx` (`tipo_accion_id`);

--
-- Indices de la tabla `users_has_nombre_complementaria`
--
ALTER TABLE `users_has_nombre_complementaria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_has_nombre_complementaria_nombre_complementaria1_idx` (`nombre_complementaria_id`),
  ADD KEY `fk_users_has_nombre_complementaria_users1_idx` (`users_id`),
  ADD KEY `fk_users_has_nombre_complementaria_tipo_accion1_idx` (`tipo_accion_id`);

--
-- Indices de la tabla `users_has_per_act`
--
ALTER TABLE `users_has_per_act`
  ADD PRIMARY KEY (`users_id_users`,`per_act_id_per_act`),
  ADD KEY `fk_users_has_per_act_per_act1_idx` (`per_act_id_per_act`),
  ADD KEY `fk_users_has_per_act_users1_idx` (`users_id_users`),
  ADD KEY `fk_users_has_per_act_tipo_accion1_idx` (`tipo_accion_id`);

--
-- Indices de la tabla `users_has_per_com`
--
ALTER TABLE `users_has_per_com`
  ADD PRIMARY KEY (`users_id_users`,`per_com_id_per_com`,`tipo_accion_id`),
  ADD KEY `fk_users_has_per_com_per_com1_idx` (`per_com_id_per_com`),
  ADD KEY `fk_users_has_per_com_users1_idx` (`users_id_users`),
  ADD KEY `fk_users_has_per_com_tipo_accion1_idx` (`tipo_accion_id`);

--
-- Indices de la tabla `users_has_practica`
--
ALTER TABLE `users_has_practica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_has_practica_practica1_idx` (`practica_id`),
  ADD KEY `fk_users_has_practica_users1_idx` (`users_id`),
  ADD KEY `fk_users_has_practica_tipo_accion1_idx` (`tipo_accion_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actualizacion_periodo`
--
ALTER TABLE `actualizacion_periodo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `becas`
--
ALTER TABLE `becas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `calendario_universidad`
--
ALTER TABLE `calendario_universidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `cambio_universidad_has_users`
--
ALTER TABLE `cambio_universidad_has_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `campus`
--
ALTER TABLE `campus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT de la tabla `carreras`
--
ALTER TABLE `carreras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=316;

--
-- AUTO_INCREMENT de la tabla `codigo_carrera`
--
ALTER TABLE `codigo_carrera`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT de la tabla `codigo_facultad`
--
ALTER TABLE `codigo_facultad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `color`
--
ALTER TABLE `color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `convenio_universidad`
--
ALTER TABLE `convenio_universidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `convocatorias`
--
ALTER TABLE `convocatorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `creacion_becarios_has_users`
--
ALTER TABLE `creacion_becarios_has_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `datos_laboral`
--
ALTER TABLE `datos_laboral`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `datos_madre`
--
ALTER TABLE `datos_madre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `datos_padre`
--
ALTER TABLE `datos_padre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `datos_personales`
--
ALTER TABLE `datos_personales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `datos_personales_has_carreras`
--
ALTER TABLE `datos_personales_has_carreras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id_depto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `depa_asignado`
--
ALTER TABLE `depa_asignado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `digitalizacion_documentos`
--
ALTER TABLE `digitalizacion_documentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `documento`
--
ALTER TABLE `documento`
  MODIFY `id_documento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_civil`
--
ALTER TABLE `estado_civil`
  MODIFY `id_estado_civil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estado_estudios`
--
ALTER TABLE `estado_estudios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `estado_estudios_has_users`
--
ALTER TABLE `estado_estudios_has_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `extra_curricular`
--
ALTER TABLE `extra_curricular`
  MODIFY `id_extracurr` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `facultad`
--
ALTER TABLE `facultad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `ficha_documentos`
--
ALTER TABLE `ficha_documentos`
  MODIFY ` id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `historial_sesiones`
--
ALTER TABLE `historial_sesiones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `municipio`
--
ALTER TABLE `municipio`
  MODIFY `id_municipio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=300;

--
-- AUTO_INCREMENT de la tabla `nombre_complementaria`
--
ALTER TABLE `nombre_complementaria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id_pagos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos_meses_universidad`
--
ALTER TABLE `pagos_meses_universidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `periodo_universidad`
--
ALTER TABLE `periodo_universidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `persona_dependiente`
--
ALTER TABLE `persona_dependiente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `planilla_complementaria`
--
ALTER TABLE `planilla_complementaria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `practica`
--
ALTER TABLE `practica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `retenido`
--
ALTER TABLE `retenido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `retenido_has_users`
--
ALTER TABLE `retenido_has_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_accion`
--
ALTER TABLE `tipo_accion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tipo_actualizacion`
--
ALTER TABLE `tipo_actualizacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_cargo`
--
ALTER TABLE `tipo_cargo`
  MODIFY `id_cargo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_ingreso`
--
ALTER TABLE `tipo_ingreso`
  MODIFY `id_tipo_ingreso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_periodo`
--
ALTER TABLE `tipo_periodo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `universidad`
--
ALTER TABLE `universidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `users_has_actualizacion_periodo`
--
ALTER TABLE `users_has_actualizacion_periodo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users_has_becas`
--
ALTER TABLE `users_has_becas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `users_has_calendario_universidad`
--
ALTER TABLE `users_has_calendario_universidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `users_has_meses_universidad`
--
ALTER TABLE `users_has_meses_universidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `users_has_nombre_complementaria`
--
ALTER TABLE `users_has_nombre_complementaria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users_has_practica`
--
ALTER TABLE `users_has_practica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD CONSTRAINT `fk_actividades_poa1` FOREIGN KEY (`id_poa`) REFERENCES `poa` (`id_poa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `actividades_has_users`
--
ALTER TABLE `actividades_has_users`
  ADD CONSTRAINT `fk_actividades_has_users_actividades1` FOREIGN KEY (`actividades_id_actividades`) REFERENCES `actividades` (`id_actividades`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_actividades_has_users_tipo_accion1` FOREIGN KEY (`tipo_accion_id`) REFERENCES `tipo_accion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_actividades_has_users_users1` FOREIGN KEY (`users_id_users`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `actualizacion_periodo`
--
ALTER TABLE `actualizacion_periodo`
  ADD CONSTRAINT `fk_actualizacion_periodo_calendario_universidad1` FOREIGN KEY (`calendario_universidad_id`) REFERENCES `calendario_universidad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_actualizacion_periodo_datos_personales1` FOREIGN KEY (`id_datos_personales`) REFERENCES `datos_personales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `actulizacion_documentos_has_users`
--
ALTER TABLE `actulizacion_documentos_has_users`
  ADD CONSTRAINT `fk_actulizacion_documentos_has_users_actulizacion_documentos1` FOREIGN KEY (`actulizacion_documentos_id`) REFERENCES `actualizacion_documentos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_actulizacion_documentos_has_users_tipo_accion1` FOREIGN KEY (`tipo_accion_id`) REFERENCES `tipo_accion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_actulizacion_documentos_has_users_users1` FOREIGN KEY (`users_id_users`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `banco_has_users`
--
ALTER TABLE `banco_has_users`
  ADD CONSTRAINT `fk_banco_has_users_banco1` FOREIGN KEY (`banco_id_banco`) REFERENCES `banco` (`id_banco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_banco_has_users_tipo_accion1` FOREIGN KEY (`tipo_accion_id`) REFERENCES `tipo_accion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_banco_has_users_users1` FOREIGN KEY (`users_id_users`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `calendario_universidad`
--
ALTER TABLE `calendario_universidad`
  ADD CONSTRAINT `fk_calendario_universidad_universidad1` FOREIGN KEY (`universidad_id`) REFERENCES `universidad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cambio_universidad_has_users`
--
ALTER TABLE `cambio_universidad_has_users`
  ADD CONSTRAINT `fk_datos_personales_has_users_datos_personales1` FOREIGN KEY (`datos_personales_id`) REFERENCES `datos_personales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_datos_personales_has_users_tipo_accion1` FOREIGN KEY (`tipo_accion_id`) REFERENCES `tipo_accion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_datos_personales_has_users_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `campus`
--
ALTER TABLE `campus`
  ADD CONSTRAINT `fk_campus_municipio1` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id_municipio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_campus_universidad1` FOREIGN KEY (`universidad_id`) REFERENCES `universidad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD CONSTRAINT `fk_carreras_codigo_carrera1` FOREIGN KEY (`codigo_id`) REFERENCES `codigo_carrera` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_carreras_facultad1` FOREIGN KEY (`facultad_id`) REFERENCES `facultad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `carrera_has_users`
--
ALTER TABLE `carrera_has_users`
  ADD CONSTRAINT `fk_carrera_has_users_tipo_accion1` FOREIGN KEY (`tipo_accion_id`) REFERENCES `tipo_accion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_carrera_has_users_users1` FOREIGN KEY (`users_id_users`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `compromiso_social_horas`
--
ALTER TABLE `compromiso_social_horas`
  ADD CONSTRAINT `fk_compromiso_social_horas_datos_personales2` FOREIGN KEY (`id_datos_personales`) REFERENCES `datos_personales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `convenio_universidad`
--
ALTER TABLE `convenio_universidad`
  ADD CONSTRAINT `fk_convenio_universidad_universidad1` FOREIGN KEY (`universidad_id`) REFERENCES `universidad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `convocatorias_has_users`
--
ALTER TABLE `convocatorias_has_users`
  ADD CONSTRAINT `fk_convocatorias_has_users_convocatorias1` FOREIGN KEY (`convocatorias_id`) REFERENCES `convocatorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_convocatorias_has_users_tipo_accion1` FOREIGN KEY (`tipo_accion_id`) REFERENCES `tipo_accion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_convocatorias_has_users_users1` FOREIGN KEY (`users_id_users`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `creacion_becarios_has_users`
--
ALTER TABLE `creacion_becarios_has_users`
  ADD CONSTRAINT `fk_creacion_becarios_has_users_tipo_accion1` FOREIGN KEY (`tipo_accion_id`) REFERENCES `tipo_accion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_datos_personales_has_users_datos_personales2` FOREIGN KEY (`datos_personales_id`) REFERENCES `datos_personales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_datos_personales_has_users_users2` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `datos_laboral`
--
ALTER TABLE `datos_laboral`
  ADD CONSTRAINT `datos_laboral_ibfk_1` FOREIGN KEY (`tipo_ingreso`) REFERENCES `tipo_ingreso` (`id_tipo_ingreso`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `datos_madre_has_users`
--
ALTER TABLE `datos_madre_has_users`
  ADD CONSTRAINT `fk_datos_madre_has_users_datos_madre1` FOREIGN KEY (`datos_madre_id_madre`) REFERENCES `datos_madre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_datos_madre_has_users_tipo_accion1` FOREIGN KEY (`tipo_accion_id`) REFERENCES `tipo_accion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_datos_madre_has_users_users1` FOREIGN KEY (`users_id_users`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `datos_padre_has_users`
--
ALTER TABLE `datos_padre_has_users`
  ADD CONSTRAINT `fk_datos_padre_has_users_datos_padre1` FOREIGN KEY (`datos_padre_id_padre`) REFERENCES `datos_padre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_datos_padre_has_users_tipo_accion1` FOREIGN KEY (`tipo_accion_id`) REFERENCES `tipo_accion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_datos_padre_has_users_users1` FOREIGN KEY (`users_id_users`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `datos_personales`
--
ALTER TABLE `datos_personales`
  ADD CONSTRAINT `datos_laboral` FOREIGN KEY (`id_laboral`) REFERENCES `datos_laboral` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `estado_civil` FOREIGN KEY (`estado_civil`) REFERENCES `estado_civil` (`id_estado_civil`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_datos_personales_actulizacion_documentos1` FOREIGN KEY (`id_documentos`) REFERENCES `actualizacion_documentos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_datos_personales_banco1` FOREIGN KEY (`id_banco`) REFERENCES `banco` (`id_banco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_datos_personales_becas1` FOREIGN KEY (`becas_id`) REFERENCES `becas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_datos_personales_departamento1` FOREIGN KEY (`departamento_residencia`) REFERENCES `departamento` (`id_depto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_datos_personales_grupo_becarios1` FOREIGN KEY (`id_grupo_becarios`) REFERENCES `grupo_becarios` (`id_grupo_becarios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `genero` FOREIGN KEY (`genero`) REFERENCES `genero` (`id_genero`) ON UPDATE CASCADE,
  ADD CONSTRAINT `id_extracurric` FOREIGN KEY (`id_extracurr`) REFERENCES `extra_curricular` (`id_extracurr`) ON UPDATE CASCADE,
  ADD CONSTRAINT `id_padre` FOREIGN KEY (`id_padre`) REFERENCES `datos_padre` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `madre` FOREIGN KEY (`id_madre`) REFERENCES `datos_madre` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `municipio` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id_municipio`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tipo_cargo` FOREIGN KEY (`id_cargo`) REFERENCES `tipo_cargo` (`id_cargo`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `datos_personales_has_carreras`
--
ALTER TABLE `datos_personales_has_carreras`
  ADD CONSTRAINT `fk_datos_personales_has_carreras_carreras1` FOREIGN KEY (`carrera_id`) REFERENCES `carreras` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_datos_personales_has_carreras_datos_personales1` FOREIGN KEY (`id_datos_personales`) REFERENCES `datos_personales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `depa_asignado`
--
ALTER TABLE `depa_asignado`
  ADD CONSTRAINT `fk_depa_asignado_departamento1` FOREIGN KEY (`departamento_id_depto`) REFERENCES `departamento` (`id_depto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_depa_asignado_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `digitalizacion_documentos`
--
ALTER TABLE `digitalizacion_documentos`
  ADD CONSTRAINT `fk_digitalizacion_documentos_datos_personales1` FOREIGN KEY (`datos_personales_id`) REFERENCES `datos_personales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `documento`
--
ALTER TABLE `documento`
  ADD CONSTRAINT `fk_documento_convocatorias1` FOREIGN KEY (`id_convocatoria`) REFERENCES `convocatorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `solicitantee` FOREIGN KEY (`id_solicitante`) REFERENCES `datos_personales` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `documento_has_users`
--
ALTER TABLE `documento_has_users`
  ADD CONSTRAINT `fk_documento_has_users_documento1` FOREIGN KEY (`documento_id_documento`) REFERENCES `documento` (`id_documento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_documento_has_users_tipo_accion1` FOREIGN KEY (`tipo_accion_id`) REFERENCES `tipo_accion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_documento_has_users_users1` FOREIGN KEY (`users_id_users`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estado_civil_has_users`
--
ALTER TABLE `estado_civil_has_users`
  ADD CONSTRAINT `fk_estado_civil_has_users_estado_civil1` FOREIGN KEY (`estado_civil_id_estado_civil`) REFERENCES `estado_civil` (`id_estado_civil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estado_civil_has_users_tipo_accion1` FOREIGN KEY (`tipo_accion_id`) REFERENCES `tipo_accion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estado_civil_has_users_users1` FOREIGN KEY (`users_id_users`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estado_estudios`
--
ALTER TABLE `estado_estudios`
  ADD CONSTRAINT `fk_estado_estudios_datos_personales1` FOREIGN KEY (`datos_personales_id`) REFERENCES `datos_personales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estado_estudios_has_users`
--
ALTER TABLE `estado_estudios_has_users`
  ADD CONSTRAINT `fk_estado_estudios_has_users_estado_estudios1` FOREIGN KEY (`estado_estudios_id`) REFERENCES `estado_estudios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estado_estudios_has_users_tipo_accion1` FOREIGN KEY (`tipo_accion_id`) REFERENCES `tipo_accion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estado_estudios_has_users_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estado_pago_has_users`
--
ALTER TABLE `estado_pago_has_users`
  ADD CONSTRAINT `fk_estado_pago_has_users_estado_pago1` FOREIGN KEY (`estado_pago_id_estado_pago`) REFERENCES `estado_pago` (`id_estado_pago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estado_pago_has_users_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `extra_curricular_has_users`
--
ALTER TABLE `extra_curricular_has_users`
  ADD CONSTRAINT `fk_extra_curricular_has_users_extra_curricular1` FOREIGN KEY (`extra_curricular_id_extracurr`) REFERENCES `extra_curricular` (`id_extracurr`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_extra_curricular_has_users_tipo_accion1` FOREIGN KEY (`tipo_accion_id`) REFERENCES `tipo_accion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_extra_curricular_has_users_users1` FOREIGN KEY (`users_id_users`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `facultad`
--
ALTER TABLE `facultad`
  ADD CONSTRAINT `fk_facultad_campus1` FOREIGN KEY (`campus_id`) REFERENCES `campus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_facultad_codigo_facultad1` FOREIGN KEY (`codigo_facultad_id`) REFERENCES `codigo_facultad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ficha_documentos`
--
ALTER TABLE `ficha_documentos`
  ADD CONSTRAINT `fk_ficha_documentos_datos_personales1` FOREIGN KEY (`datos_personales_id`) REFERENCES `datos_personales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `grupo_becarios`
--
ALTER TABLE `grupo_becarios`
  ADD CONSTRAINT `fk_grupo_becarios_datos_personales1` FOREIGN KEY (`id_guia`) REFERENCES `datos_personales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_grupo_becarios_tipo_casas1` FOREIGN KEY (`id_casa`) REFERENCES `tipo_casas` (`id_casa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_grupo_becarios_tipo_grupo1` FOREIGN KEY (`id_tipo_grupo`) REFERENCES `tipo_grupo` (`id_tipo_grupo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `grupo_becarios_has_users`
--
ALTER TABLE `grupo_becarios_has_users`
  ADD CONSTRAINT `fk_grupo_becarios_has_users_grupo_becarios1` FOREIGN KEY (`grupo_becarios_id_grupo_becarios`) REFERENCES `grupo_becarios` (`id_grupo_becarios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_grupo_becarios_has_users_tipo_accion1` FOREIGN KEY (`tipo_accion_id`) REFERENCES `tipo_accion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_grupo_becarios_has_users_users1` FOREIGN KEY (`users_id_users`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `historial_sesiones`
--
ALTER TABLE `historial_sesiones`
  ADD CONSTRAINT `fk_historial_sesiones_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `indicadores`
--
ALTER TABLE `indicadores`
  ADD CONSTRAINT `fk_indicadores_actividades1` FOREIGN KEY (`id_actividades`) REFERENCES `actividades` (`id_actividades`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD CONSTRAINT `municipio_ibfk_1` FOREIGN KEY (`id_depto`) REFERENCES `departamento` (`id_depto`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `nombre_complementaria`
--
ALTER TABLE `nombre_complementaria`
  ADD CONSTRAINT `fk_nombre_complementaria_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `fk_pagos_datos_personales1` FOREIGN KEY (`id_datos_personales`) REFERENCES `datos_personales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pagos_estado_pago1` FOREIGN KEY (`id_estado_pago`) REFERENCES `estado_pago` (`id_estado_pago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pagos_tipo_pago1` FOREIGN KEY (`id_tipo_pago`) REFERENCES `tipo_pago` (`id_tipo_pago`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pagos_has_users`
--
ALTER TABLE `pagos_has_users`
  ADD CONSTRAINT `fk_pagos_has_users_pagos1` FOREIGN KEY (`id_pagos`) REFERENCES `pagos` (`id_pagos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pagos_has_users_tipo_accion1` FOREIGN KEY (`tipo_accion_id`) REFERENCES `tipo_accion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pagos_has_users_users1` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pagos_meses_universidad`
--
ALTER TABLE `pagos_meses_universidad`
  ADD CONSTRAINT `fk_pagos_meses_universidad_universidad1` FOREIGN KEY (`universidad_id`) REFERENCES `universidad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `periodo_universidad`
--
ALTER TABLE `periodo_universidad`
  ADD CONSTRAINT `fk_periodo_universidad_universidad1` FOREIGN KEY (`universidad_id`) REFERENCES `universidad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `persona_dependiente`
--
ALTER TABLE `persona_dependiente`
  ADD CONSTRAINT `fk_persona_dependiente_datos_personales1` FOREIGN KEY (`id_datos_personales`) REFERENCES `datos_personales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `per_act`
--
ALTER TABLE `per_act`
  ADD CONSTRAINT `fk_per_act_actividades1` FOREIGN KEY (`actividades_id_actividades`) REFERENCES `actividades` (`id_actividades`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_per_act_datos_personales2` FOREIGN KEY (`id_datos_personales`) REFERENCES `datos_personales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `per_com`
--
ALTER TABLE `per_com`
  ADD CONSTRAINT `fk_per_com_compromiso_politico1` FOREIGN KEY (`id_cpolitico`) REFERENCES `compromiso_politico` (`id_cpolitico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_per_com_datos_personales1` FOREIGN KEY (`id_datos_personales`) REFERENCES `datos_personales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `planilla_complementaria`
--
ALTER TABLE `planilla_complementaria`
  ADD CONSTRAINT `fk_planilla_complementaria_datos_personales1` FOREIGN KEY (`datos_personales_id`) REFERENCES `datos_personales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_planilla_complementaria_nombre_complementaria1` FOREIGN KEY (`nombre_complementaria_id`) REFERENCES `nombre_complementaria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_planilla_complementaria_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `practica`
--
ALTER TABLE `practica`
  ADD CONSTRAINT `fk_practica_datos_personales1` FOREIGN KEY (`datos_personales_id`) REFERENCES `datos_personales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `retenido`
--
ALTER TABLE `retenido`
  ADD CONSTRAINT `retenido` FOREIGN KEY (`id_datos_personales`) REFERENCES `datos_personales` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `retenido_has_users`
--
ALTER TABLE `retenido_has_users`
  ADD CONSTRAINT `fk_retenido_has_users_retenido1` FOREIGN KEY (`id_retenido`) REFERENCES `retenido` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_retenido_has_users_tipo_accion1` FOREIGN KEY (`tipo_accion_id`) REFERENCES `tipo_accion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_retenido_has_users_users1` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipo_accion`
--
ALTER TABLE `tipo_accion`
  ADD CONSTRAINT `fk_tipo_accion_color1` FOREIGN KEY (`color_id`) REFERENCES `color` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipo_cargo_has_users`
--
ALTER TABLE `tipo_cargo_has_users`
  ADD CONSTRAINT `fk_tipo_cargo_has_users_tipo_accion1` FOREIGN KEY (`tipo_accion_id`) REFERENCES `tipo_accion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tipo_cargo_has_users_tipo_cargo1` FOREIGN KEY (`tipo_cargo_id_cargo`) REFERENCES `tipo_cargo` (`id_cargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tipo_cargo_has_users_users1` FOREIGN KEY (`users_id_users`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipo_casas_has_users`
--
ALTER TABLE `tipo_casas_has_users`
  ADD CONSTRAINT `fk_tipo_casas_has_users_tipo_accion1` FOREIGN KEY (`tipo_accion_id`) REFERENCES `tipo_accion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tipo_casas_has_users_tipo_casas1` FOREIGN KEY (`tipo_casas_id_casa`) REFERENCES `tipo_casas` (`id_casa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tipo_casas_has_users_users1` FOREIGN KEY (`users_id_users`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipo_grupo_has_users`
--
ALTER TABLE `tipo_grupo_has_users`
  ADD CONSTRAINT `fk_tipo_grupo_has_users_tipo_accion1` FOREIGN KEY (`tipo_accion_id`) REFERENCES `tipo_accion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tipo_grupo_has_users_tipo_grupo1` FOREIGN KEY (`tipo_grupo_id_tipo_grupo`) REFERENCES `tipo_grupo` (`id_tipo_grupo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tipo_grupo_has_users_users1` FOREIGN KEY (`users_id_users`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipo_ingreso_has_users`
--
ALTER TABLE `tipo_ingreso_has_users`
  ADD CONSTRAINT `fk_tipo_ingreso_has_users_tipo_accion1` FOREIGN KEY (`tipo_accion_id`) REFERENCES `tipo_accion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tipo_ingreso_has_users_tipo_ingreso1` FOREIGN KEY (`tipo_ingreso_id_tipo_ingreso`) REFERENCES `tipo_ingreso` (`id_tipo_ingreso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tipo_ingreso_has_users_users1` FOREIGN KEY (`users_id_users`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users_has_actualizacion_periodo`
--
ALTER TABLE `users_has_actualizacion_periodo`
  ADD CONSTRAINT `fk_users_has_actualizacion_periodo_actualizacion_periodo1` FOREIGN KEY (`actualizacion_periodo_id`) REFERENCES `actualizacion_periodo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_actualizacion_periodo_tipo_accion1` FOREIGN KEY (`tipo_accion_id`) REFERENCES `tipo_accion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_actualizacion_periodo_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users_has_becas`
--
ALTER TABLE `users_has_becas`
  ADD CONSTRAINT `fk_users_has_becas_becas1` FOREIGN KEY (`becas_id`) REFERENCES `becas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_becas_tipo_accion1` FOREIGN KEY (`tipo_accion_id`) REFERENCES `tipo_accion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_becas_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users_has_calendario_universidad`
--
ALTER TABLE `users_has_calendario_universidad`
  ADD CONSTRAINT `fk_users_has_calendario_universidad_calendario_universidad1` FOREIGN KEY (`calendario_universidad_id`) REFERENCES `calendario_universidad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_calendario_universidad_tipo_accion1` FOREIGN KEY (`tipo_accion_id`) REFERENCES `tipo_accion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_calendario_universidad_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users_has_compromiso_politico`
--
ALTER TABLE `users_has_compromiso_politico`
  ADD CONSTRAINT `fk_users_has_compromiso_politico_compromiso_politico1` FOREIGN KEY (`compromiso_politico_id_cpolitico`) REFERENCES `compromiso_politico` (`id_cpolitico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_compromiso_politico_tipo_accion1` FOREIGN KEY (`tipo_accion_id`) REFERENCES `tipo_accion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_compromiso_politico_users1` FOREIGN KEY (`users_id_users`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users_has_compromiso_social_horas`
--
ALTER TABLE `users_has_compromiso_social_horas`
  ADD CONSTRAINT `fk_users_has_compromiso_social_horas_compromiso_social_horas1` FOREIGN KEY (`compromiso_social_horas_id_compromiso`) REFERENCES `compromiso_social_horas` (`id_compromiso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_compromiso_social_horas_tipo_accion1` FOREIGN KEY (`tipo_accion_id`) REFERENCES `tipo_accion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_compromiso_social_horas_users1` FOREIGN KEY (`users_id_users`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users_has_datos_laboral`
--
ALTER TABLE `users_has_datos_laboral`
  ADD CONSTRAINT `fk_users_has_datos_laboral_datos_laboral1` FOREIGN KEY (`datos_laboral_id`) REFERENCES `datos_laboral` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_datos_laboral_tipo_accion1` FOREIGN KEY (`tipo_accion_id`) REFERENCES `tipo_accion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_datos_laboral_users1` FOREIGN KEY (`users_id_users`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users_has_meses_universidad`
--
ALTER TABLE `users_has_meses_universidad`
  ADD CONSTRAINT `fk_users_has_pagos_meses_universidad_pagos_meses_universidad1` FOREIGN KEY (`pagos_meses_universidad_id`) REFERENCES `pagos_meses_universidad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_pagos_meses_universidad_tipo_accion1` FOREIGN KEY (`tipo_accion_id`) REFERENCES `tipo_accion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_pagos_meses_universidad_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users_has_nombre_complementaria`
--
ALTER TABLE `users_has_nombre_complementaria`
  ADD CONSTRAINT `fk_users_has_nombre_complementaria_nombre_complementaria1` FOREIGN KEY (`nombre_complementaria_id`) REFERENCES `nombre_complementaria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_nombre_complementaria_tipo_accion1` FOREIGN KEY (`tipo_accion_id`) REFERENCES `tipo_accion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_nombre_complementaria_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users_has_per_act`
--
ALTER TABLE `users_has_per_act`
  ADD CONSTRAINT `fk_users_has_per_act_per_act1` FOREIGN KEY (`per_act_id_per_act`) REFERENCES `per_act` (`id_per_act`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_per_act_tipo_accion1` FOREIGN KEY (`tipo_accion_id`) REFERENCES `tipo_accion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_per_act_users1` FOREIGN KEY (`users_id_users`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users_has_per_com`
--
ALTER TABLE `users_has_per_com`
  ADD CONSTRAINT `fk_users_has_per_com_per_com1` FOREIGN KEY (`per_com_id_per_com`) REFERENCES `per_com` (`id_per_com`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_per_com_tipo_accion1` FOREIGN KEY (`tipo_accion_id`) REFERENCES `tipo_accion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_per_com_users1` FOREIGN KEY (`users_id_users`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users_has_practica`
--
ALTER TABLE `users_has_practica`
  ADD CONSTRAINT `fk_users_has_practica_practica1` FOREIGN KEY (`practica_id`) REFERENCES `practica` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_practica_tipo_accion1` FOREIGN KEY (`tipo_accion_id`) REFERENCES `tipo_accion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_practica_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
