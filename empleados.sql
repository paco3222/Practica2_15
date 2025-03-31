-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 31-03-2025 a las 19:50:36
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empleados`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `contar_desarrolladores`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `contar_desarrolladores` ()   BEGIN
    SELECT COUNT(*) FROM Empleado_general WHERE puesto = 'Desarrollador';
END$$

DROP PROCEDURE IF EXISTS `contar_registros_mayor_5`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `contar_registros_mayor_5` ()   BEGIN
    SELECT COUNT(*) FROM Miscelanea WHERE cantidad > 5;
END$$

DROP PROCEDURE IF EXISTS `obtener_empleados_analistas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_empleados_analistas` ()   BEGIN
    SELECT nombre, salario FROM Empleado_general WHERE puesto = 'Analista';
END$$

DROP PROCEDURE IF EXISTS `obtener_empleados_ingresaron_2020`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_empleados_ingresaron_2020` ()   BEGIN
    SELECT nombre FROM Empleado_general WHERE YEAR(fecha_ingreso) = 2020;
END$$

DROP PROCEDURE IF EXISTS `obtener_empleados_mayores_30`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_empleados_mayores_30` ()   BEGIN
    SELECT * FROM Empleado_general WHERE edad > 30;
END$$

DROP PROCEDURE IF EXISTS `obtener_promedio_salario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_promedio_salario` ()   BEGIN
    SELECT AVG(salario) FROM Empleado_general;
END$$

DROP PROCEDURE IF EXISTS `obtener_registros_completados`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_registros_completados` ()   BEGIN
    SELECT * FROM Miscelanea WHERE estado = 'Completado';
END$$

DROP PROCEDURE IF EXISTS `obtener_registros_pendientes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_registros_pendientes` ()   BEGIN
    SELECT descripcion FROM Miscelanea WHERE estado = 'Pendiente';
END$$

DROP PROCEDURE IF EXISTS `obtener_registros_por_fecha`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_registros_por_fecha` (`fecha_inicio` DATE, `fecha_fin` DATE)   BEGIN
    SELECT * FROM Miscelanea WHERE fecha BETWEEN fecha_inicio AND fecha_fin;
END$$

DROP PROCEDURE IF EXISTS `obtener_registros_por_responsable`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_registros_por_responsable` (`responsable_nombre` VARCHAR(100))   BEGIN
    SELECT descripcion, fecha FROM Miscelanea WHERE responsable = responsable_nombre;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_general`
--

DROP TABLE IF EXISTS `empleado_general`;
CREATE TABLE IF NOT EXISTS `empleado_general` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `puesto` varchar(100) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `empleado_general`
--

INSERT INTO `empleado_general` (`id`, `nombre`, `edad`, `puesto`, `salario`, `fecha_ingreso`) VALUES
(1, 'Mario Soto', 30, 'Analista', 35000.00, '2020-01-15'),
(2, 'Saul Soto', 28, 'Desarrollador', 40000.00, '2021-06-23'),
(3, 'Aime Rodriguez', 35, 'Gerente', 55000.00, '2018-08-10'),
(4, 'Paul Puchis', 25, 'Diseñador', 30000.00, '2022-02-18'),
(5, 'Marisol Hernandez', 40, 'Jefa de ventas', 60000.00, '2017-11-07'),
(6, 'Francisco Chavez', 50, 'Director', 70000.00, '2015-04-12'),
(7, 'Romina Chavez', 32, 'Analista', 35000.00, '2019-05-25'),
(8, 'Carolina Medina', 29, 'Desarrolladora', 42000.00, '2020-09-13'),
(9, 'Neftali Mendoza', 45, 'Manager', 55000.00, '2016-12-19'),
(10, 'Wyliam Castillo', 37, 'Técnico', 38000.00, '2018-03-29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `miscelanea`
--

DROP TABLE IF EXISTS `miscelanea`;
CREATE TABLE IF NOT EXISTS `miscelanea` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `observaciones` text,
  `responsable` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `miscelanea`
--

INSERT INTO `miscelanea` (`id`, `descripcion`, `cantidad`, `fecha`, `estado`, `observaciones`, `responsable`) VALUES
(1, 'Revisión de equipo', 2, '2025-03-15', 'Completado', 'Todo en orden', 'Francisco Chavez'),
(2, 'Pedido de material', 5, '2025-03-18', 'Pendiente', 'En espera de confirmación', 'Carolina Medina'),
(3, 'Mantenimiento de servidor', 1, '2025-03-20', 'Completado', 'Sin incidencias', 'Neftali Mendoza'),
(4, 'Capacitación técnica', 10, '2025-03-25', 'Pendiente', 'Confirmado para el 30/03', 'Wyliam Castillo'),
(5, 'Revisión de contratos', 3, '2025-03-22', 'En proceso', 'Requiere firmas', 'Aime Rodriguez'),
(6, 'Auditoría interna', 1, '2025-03-10', 'Completado', 'Sin problemas encontrados', 'Marisol Hernandez'),
(7, 'Análisis de ventas', 4, '2025-03-13', 'Completado', 'Requiere ajustes', 'Mario Soto'),
(8, 'Implementación de software', 6, '2025-03-21', 'Pendiente', 'Esperando revisión', 'Saul Soto'),
(9, 'Desarrollo de proyecto', 8, '2025-03-17', 'Completado', 'Fase final', 'Paul Puchis'),
(10, 'Pruebas de calidad', 2, '2025-03-12', 'Completado', 'Todo aprobado', 'Romina Chavez'),
(11, 'Reunión de estrategia', 7, '2025-03-23', 'Pendiente', 'Confirmada', 'Francisco Chavez'),
(12, 'Control de presupuesto', 1, '2025-03-14', 'Completado', 'Aprobado', 'Marisol Hernandez'),
(13, 'Evaluación de personal', 5, '2025-03-19', 'En proceso', 'Aún no concluye', 'Wyliam Castillo'),
(14, 'Desarrollo de campañas', 3, '2025-03-16', 'Completado', 'En ejecución', 'Carolina Medina'),
(15, 'Revisión de cuentas', 4, '2025-03-26', 'Pendiente', 'A la espera de autorización', 'Saul Soto');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
