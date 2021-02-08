-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.17-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para db_condominios
CREATE DATABASE IF NOT EXISTS `db_condominios` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_condominios`;

-- Volcando estructura para tabla db_condominios.casa
CREATE TABLE IF NOT EXISTS `casa` (
  `casa_id` int(11) NOT NULL AUTO_INCREMENT,
  `casa_numero` varchar(6) COLLATE utf8_spanish_ci DEFAULT NULL,
  `casa_clustar` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `casa_calle` varchar(75) COLLATE utf8_spanish_ci DEFAULT NULL,
  `casa_activity_date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`casa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla db_condominios.casa: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `casa` DISABLE KEYS */;
INSERT INTO `casa` (`casa_id`, `casa_numero`, `casa_clustar`, `casa_calle`, `casa_activity_date`) VALUES
	(0, '0', '21', 'Adm. y Vig.', '2019-08-01 21:21:09'),
	(1, '521', '21', 'Argenitina', '2019-08-01 21:21:58'),
	(2, '451', '21', 'Brazil', '2019-08-01 21:22:14'),
	(3, '632', '21', 'Chile', '2019-08-01 21:22:24'),
	(4, '1025', '21', 'Dinamarca', '2019-08-01 21:22:40'),
	(5, '696', '21', 'Ecuador', '2019-08-01 21:24:00');
/*!40000 ALTER TABLE `casa` ENABLE KEYS */;

-- Volcando estructura para tabla db_condominios.c_cobrar
CREATE TABLE IF NOT EXISTS `c_cobrar` (
  `c_cobrar_seq_no` int(11) NOT NULL AUTO_INCREMENT,
  `c_cobrar_id_casa` int(11) DEFAULT NULL,
  `c_cobrar_mes` int(11) DEFAULT NULL,
  `c_cobrar_no_referencia` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `c_cobrar_fecha_limite` date DEFAULT NULL,
  `c_cobrar_cargo_mensual` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `c_cobrar_pago` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `c_cobrar_fecha_pago` date DEFAULT NULL,
  `c_cobrar_meses_moratorio` varchar(4) COLLATE utf8_spanish_ci DEFAULT NULL,
  `c_cobrar_Intereses_moratorios` varchar(9) COLLATE utf8_spanish_ci DEFAULT NULL,
  `c_cobrar_total_a_pagar` varchar(9) COLLATE utf8_spanish_ci DEFAULT NULL,
  `c_cobrar_suma_monto_total_c_Intereses` varchar(9) COLLATE utf8_spanish_ci DEFAULT NULL,
  `c_cobrar_total_pagar_c_multa` varchar(9) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`c_cobrar_seq_no`),
  KEY `FK_c_cobrar_id_casa` (`c_cobrar_id_casa`),
  CONSTRAINT `FK_c_cobrar_id_casa` FOREIGN KEY (`c_cobrar_id_casa`) REFERENCES `casa` (`casa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla db_condominios.c_cobrar: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `c_cobrar` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_cobrar` ENABLE KEYS */;

-- Volcando estructura para tabla db_condominios.horario_trabajo
CREATE TABLE IF NOT EXISTS `horario_trabajo` (
  `HORARIO_TRABAJO_id_horario` int(11) NOT NULL AUTO_INCREMENT,
  `HORARIO_TRABAJO_id_usuario` int(11) DEFAULT NULL,
  `HORARIO_TRABAJO_id_turno` int(11) DEFAULT NULL,
  `HORARIO_TRABAJO_FECHA_INICIA` date DEFAULT NULL,
  `HORARIO_TRABAJO_FECHA_FINALIZA` date DEFAULT NULL,
  `HORARIO_TRABAJO_observaciones` varchar(120) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`HORARIO_TRABAJO_id_horario`),
  KEY `FK_HORARIO_TRABAJO_id_usuario` (`HORARIO_TRABAJO_id_usuario`),
  KEY `FK_HORARIO_TRABAJO_id_turno` (`HORARIO_TRABAJO_id_turno`),
  CONSTRAINT `FK_HORARIO_TRABAJO_id_turno` FOREIGN KEY (`HORARIO_TRABAJO_id_turno`) REFERENCES `turno_trabajo` (`TURNO_TRABAJO_id_turno`),
  CONSTRAINT `FK_HORARIO_TRABAJO_id_usuario` FOREIGN KEY (`HORARIO_TRABAJO_id_usuario`) REFERENCES `usuario` (`usuario_id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla db_condominios.horario_trabajo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `horario_trabajo` DISABLE KEYS */;
/*!40000 ALTER TABLE `horario_trabajo` ENABLE KEYS */;

-- Volcando estructura para tabla db_condominios.multa
CREATE TABLE IF NOT EXISTS `multa` (
  `multa_seq_no` int(11) NOT NULL AUTO_INCREMENT,
  `multa_id` int(11) DEFAULT NULL,
  `multa_id_casa` int(11) DEFAULT NULL,
  `multa_id_tipo_infraccion` int(11) DEFAULT NULL,
  `multa_fecha_infraccion` datetime NOT NULL DEFAULT current_timestamp(),
  `multa_fecha_notificación` datetime DEFAULT current_timestamp(),
  `multa_fecha_limite_pago` date DEFAULT NULL,
  `multa_fecha_pago` date DEFAULT NULL,
  `multa_num_meses_moratorio` int(11) DEFAULT NULL,
  `multa_monto_total_Intereses` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `multa_registro_activo` datetime DEFAULT NULL,
  PRIMARY KEY (`multa_seq_no`),
  KEY `FK_multa_id_casa` (`multa_id_casa`),
  KEY `FK_multa_id_tipo_infraccion` (`multa_id_tipo_infraccion`),
  CONSTRAINT `FK_multa_id_casa` FOREIGN KEY (`multa_id_casa`) REFERENCES `casa` (`casa_id`),
  CONSTRAINT `FK_multa_id_tipo_infraccion` FOREIGN KEY (`multa_id_tipo_infraccion`) REFERENCES `tipo_multa` (`TIPO_MULTA_id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla db_condominios.multa: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `multa` DISABLE KEYS */;
/*!40000 ALTER TABLE `multa` ENABLE KEYS */;

-- Volcando estructura para tabla db_condominios.pago_de_servicios_admin
CREATE TABLE IF NOT EXISTS `pago_de_servicios_admin` (
  `PAGO_DE_SERVICIOS_seq_no` int(11) NOT NULL AUTO_INCREMENT,
  `PAGO_DE_SERVICIOS_id` int(11) NOT NULL,
  `PAGO_DE_SERVICIOS_id_tipo_servicio` int(11) NOT NULL,
  `PAGO_DE_SERVICIOS_monto` varchar(9) COLLATE utf8_spanish_ci DEFAULT NULL,
  `PAGO_DE_SERVICIOS_fecha_de_pago` date DEFAULT NULL,
  `PAGO_DE_SERVICIOS_img_factura` varchar(95) COLLATE utf8_spanish_ci DEFAULT NULL,
  `PAGO_DE_SERVICIOS_activity_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`PAGO_DE_SERVICIOS_seq_no`),
  KEY `FK_PAGO_DE_SERVICIOS_id` (`PAGO_DE_SERVICIOS_id`),
  KEY `FK_PAGO_DE_SERVICIOS_id_tipo_servicio` (`PAGO_DE_SERVICIOS_id_tipo_servicio`),
  CONSTRAINT `FK_PAGO_DE_SERVICIOS_id` FOREIGN KEY (`PAGO_DE_SERVICIOS_id`) REFERENCES `servicio` (`servicio_id`),
  CONSTRAINT `FK_PAGO_DE_SERVICIOS_id_tipo_servicio` FOREIGN KEY (`PAGO_DE_SERVICIOS_id_tipo_servicio`) REFERENCES `tipo_servicio` (`TIPO_SERVICIO_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla db_condominios.pago_de_servicios_admin: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pago_de_servicios_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago_de_servicios_admin` ENABLE KEYS */;

-- Volcando estructura para tabla db_condominios.proveedores
CREATE TABLE IF NOT EXISTS `proveedores` (
  `proveedor_id` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor_id_tipo` int(11) NOT NULL,
  `proveedor_nombre` varchar(120) COLLATE utf8_spanish_ci DEFAULT NULL,
  `proveedor_telefono` varchar(12) COLLATE utf8_spanish_ci DEFAULT NULL,
  `proveedor_direccion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `proveedor_email` varchar(75) COLLATE utf8_spanish_ci DEFAULT NULL,
  `proveedor_estado` varchar(75) COLLATE utf8_spanish_ci DEFAULT NULL,
  `proveedor_municipio` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `proveedor_calif_promedio` varchar(6) COLLATE utf8_spanish_ci DEFAULT NULL,
  `proveedor_reseña` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `proveedor_activity_date` datetime DEFAULT NULL,
  PRIMARY KEY (`proveedor_id`),
  KEY `FK_proveedor_id_tipo` (`proveedor_id_tipo`),
  CONSTRAINT `FK_proveedor_id_tipo` FOREIGN KEY (`proveedor_id_tipo`) REFERENCES `tipo_proveedor` (`TIPO_PROVEEDOR_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla db_condominios.proveedores: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` (`proveedor_id`, `proveedor_id_tipo`, `proveedor_nombre`, `proveedor_telefono`, `proveedor_direccion`, `proveedor_email`, `proveedor_estado`, `proveedor_municipio`, `proveedor_calif_promedio`, `proveedor_reseña`, `proveedor_activity_date`) VALUES
	(1, 2, 'Don "Juanito"', '2222526385', 'Sepa su madre', 'no tiene', 'Puebla', 'Cholula', '8.5', 'Es chido el Ñor', '2019-08-01 21:41:32'),
	(2, 3, 'Don "Petter"', '2222526352', 'Conocido', 'no tiene', 'Tlaxcala', 'SPM', '9.5', 'es bueno en su chamba', '2019-08-01 21:42:30'),
	(3, 4, 'Jardines de Puebla AC.', '2222526352', 'Calle 4 pte. 1052', 'jardines_puebla@hotmail.com', 'México', 'Delegación Cuahutemoc', '10', 'Chingon chingon', '2019-08-01 21:44:13'),
	(4, 1, 'Don Chinos', '5263417485', 'NA', 'NA', 'NA', 'Na', '5', 'es bien culero', '2019-08-01 21:44:52');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;

-- Volcando estructura para tabla db_condominios.servicio
CREATE TABLE IF NOT EXISTS `servicio` (
  `servicio_id` int(11) NOT NULL AUTO_INCREMENT,
  `servicio_id_proveedor` int(11) NOT NULL,
  `servicio_id_usuario` int(11) NOT NULL,
  `servicio_hr_entrada` time DEFAULT NULL,
  `servicio_f_entrada` date DEFAULT NULL,
  `servicio_hr_salida` time DEFAULT NULL,
  `servicio_f_salida` date DEFAULT NULL,
  `servicio_observaciones` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `servicio_id_usr_reg` int(11) NOT NULL,
  `servicio_activity_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`servicio_id`),
  KEY `FK_servicio_id_proveedor` (`servicio_id_proveedor`),
  KEY `FK_servicio_id_usuario` (`servicio_id_usuario`),
  KEY `FK_servicio_id_usr_reg` (`servicio_id_usr_reg`),
  CONSTRAINT `FK_servicio_id_proveedor` FOREIGN KEY (`servicio_id_proveedor`) REFERENCES `proveedores` (`proveedor_id`),
  CONSTRAINT `FK_servicio_id_usr_reg` FOREIGN KEY (`servicio_id_usr_reg`) REFERENCES `usuario` (`usuario_id_usuario`),
  CONSTRAINT `FK_servicio_id_usuario` FOREIGN KEY (`servicio_id_usuario`) REFERENCES `usuario` (`usuario_id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla db_condominios.servicio: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;

-- Volcando estructura para tabla db_condominios.tipo_multa
CREATE TABLE IF NOT EXISTS `tipo_multa` (
  `TIPO_MULTA_id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO_MULTA_concepto` varchar(75) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TIPO_MULTA_umas` varchar(4) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TIPO_MULTA_costo_umas` varchar(9) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TIPO_MULTA_observaciones` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TIPO_MULTA_vigencia` varchar(75) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TIPO_MULTA_img_reglamento` varchar(75) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TIPO_MULTA_activity_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`TIPO_MULTA_id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla db_condominios.tipo_multa: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_multa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_multa` ENABLE KEYS */;

-- Volcando estructura para tabla db_condominios.tipo_proveedor
CREATE TABLE IF NOT EXISTS `tipo_proveedor` (
  `TIPO_PROVEEDOR_id` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO_PROVEEDOR_descripcion` varchar(75) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TIPO_PROVEEDOR_activity_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`TIPO_PROVEEDOR_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla db_condominios.tipo_proveedor: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_proveedor` DISABLE KEYS */;
INSERT INTO `tipo_proveedor` (`TIPO_PROVEEDOR_id`, `TIPO_PROVEEDOR_descripcion`, `TIPO_PROVEEDOR_activity_date`) VALUES
	(1, 'Albañilería', '2019-08-01 21:39:31'),
	(2, 'Plomería', '2019-08-01 21:39:38'),
	(3, 'Electricista', '2019-08-01 21:39:45'),
	(4, 'Jardinero', '2019-08-01 21:39:50'),
	(5, 'Mensajería', '2019-08-01 21:40:03');
/*!40000 ALTER TABLE `tipo_proveedor` ENABLE KEYS */;

-- Volcando estructura para tabla db_condominios.tipo_servicio
CREATE TABLE IF NOT EXISTS `tipo_servicio` (
  `TIPO_SERVICIO_id` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO_SERVICIO_descripcion` varchar(90) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TIPO_SERVICIO_activity_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`TIPO_SERVICIO_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla db_condominios.tipo_servicio: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_servicio` DISABLE KEYS */;
INSERT INTO `tipo_servicio` (`TIPO_SERVICIO_id`, `TIPO_SERVICIO_descripcion`, `TIPO_SERVICIO_activity_date`) VALUES
	(1, 'Jardinería', '2019-07-24 12:44:53'),
	(2, 'Seguridad Privada', '2019-07-24 12:45:08'),
	(3, 'Limpieza', '2019-08-01 21:38:53'),
	(4, 'Recolección de Basura', '2019-08-01 21:39:02'),
	(5, 'Electricista', '2019-08-01 21:39:14');
/*!40000 ALTER TABLE `tipo_servicio` ENABLE KEYS */;

-- Volcando estructura para tabla db_condominios.tipo_usuario
CREATE TABLE IF NOT EXISTS `tipo_usuario` (
  `TIPO_USUARIO_id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO_USUARIO_descripcion` varchar(75) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TIPO_USUARIO_activity_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`TIPO_USUARIO_id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla db_condominios.tipo_usuario: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
INSERT INTO `tipo_usuario` (`TIPO_USUARIO_id_tipo`, `TIPO_USUARIO_descripcion`, `TIPO_USUARIO_activity_date`) VALUES
	(1, 'Habitante', '2019-08-01 21:17:12'),
	(2, 'Vigilante', '2019-08-01 21:17:19'),
	(3, 'Administrador', '2019-08-01 21:17:25'),
	(4, 'Mesa Directiva', '2019-08-01 21:17:33');
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;

-- Volcando estructura para tabla db_condominios.turno_trabajo
CREATE TABLE IF NOT EXISTS `turno_trabajo` (
  `TURNO_TRABAJO_id_turno` int(11) NOT NULL AUTO_INCREMENT,
  `TURNO_TRABAJO_nombre` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TURNO_TRABAJO_hr_entrada` time DEFAULT NULL,
  `TURNO_TRABAJO_hr_salida` time DEFAULT NULL,
  `TURNO_TRABAJO_activity_id_usr` int(11) DEFAULT NULL,
  `TURNO_TRABAJO_activity_date` datetime DEFAULT NULL,
  PRIMARY KEY (`TURNO_TRABAJO_id_turno`),
  KEY `FK_TURNO_TRABAJO_activity_id_usr` (`TURNO_TRABAJO_activity_id_usr`),
  CONSTRAINT `FK_TURNO_TRABAJO_activity_id_usr` FOREIGN KEY (`TURNO_TRABAJO_activity_id_usr`) REFERENCES `usuario` (`usuario_id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla db_condominios.turno_trabajo: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `turno_trabajo` DISABLE KEYS */;
INSERT INTO `turno_trabajo` (`TURNO_TRABAJO_id_turno`, `TURNO_TRABAJO_nombre`, `TURNO_TRABAJO_hr_entrada`, `TURNO_TRABAJO_hr_salida`, `TURNO_TRABAJO_activity_id_usr`, `TURNO_TRABAJO_activity_date`) VALUES
	(1, 'Matutino', '07:00:00', '15:00:00', 4, '2019-07-01 21:36:13'),
	(2, 'Vespertino', '15:00:00', '23:00:00', 4, '2019-08-01 21:36:39'),
	(3, 'Turno_Completo', '07:00:00', '19:00:00', 4, '2019-08-01 21:37:15'),
	(4, 'Nocturno', '19:00:00', '07:00:00', 4, '2019-08-01 21:37:41');
/*!40000 ALTER TABLE `turno_trabajo` ENABLE KEYS */;

-- Volcando estructura para tabla db_condominios.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `usuario_id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id_tipo_usuario` int(11) NOT NULL,
  `usuario_id_casa` int(11) NOT NULL,
  `usuario_nombre` varchar(75) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usuario_aPaterno` varchar(75) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usuario_aMaterno` varchar(75) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usuario_activity_date` datetime NOT NULL DEFAULT current_timestamp(),
  `usuario_pwd` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usuario_usrname` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`usuario_id_usuario`),
  KEY `FK_usuario_id_tipo_usuario` (`usuario_id_tipo_usuario`),
  KEY `FK_usuario_id_casa` (`usuario_id_casa`),
  CONSTRAINT `FK_usuario_id_casa` FOREIGN KEY (`usuario_id_casa`) REFERENCES `casa` (`casa_id`),
  CONSTRAINT `FK_usuario_id_tipo_usuario` FOREIGN KEY (`usuario_id_tipo_usuario`) REFERENCES `tipo_usuario` (`TIPO_USUARIO_id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla db_condominios.usuario: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`usuario_id_usuario`, `usuario_id_tipo_usuario`, `usuario_id_casa`, `usuario_nombre`, `usuario_aPaterno`, `usuario_aMaterno`, `usuario_activity_date`, `usuario_pwd`, `usuario_usrname`) VALUES
	(1, 1, 2, 'Roberto', 'Muñoz', 'Mendoza', '2019-08-01 21:27:44', '12356', 'mroberto@gmail.com'),
	(2, 1, 4, 'Carlos', 'Pérez', 'Aguirre', '2019-08-01 21:28:06', '12356', 'pcarlos@gmail.com'),
	(3, 2, 0, 'José', 'Sanchez', 'Esquina', '2019-08-01 21:28:39', '12356', 'sjose@gmail.com'),
	(4, 3, 0, 'Johnny', 'León', 'Cascada', '2019-08-01 21:28:55', '12356', 'ljohnny@gmail.com'),
	(5, 4, 5, 'Steve', 'Jobs', NULL, '2019-08-01 21:31:49', '12356', 'jsteve@gmail.com'),
	(6, 4, 3, 'Juan', 'Sánchez', 'Galves', '2019-08-01 21:32:26', '12356', 'sjuan@gmail.com'),
	(7, 4, 1, 'Fernando', 'Sol', 'Guevara', '2019-08-01 21:33:21', '12356', 'sfernando@gmail.com'),
	(8, 2, 0, 'Antonio', 'Vazques', 'Perez', '2019-08-01 21:28:39', '12356', 'vantonio@gmail.com'),
	(9, 2, 0, 'Omar', 'Benitez', 'castro', '2019-08-01 21:28:39', '12356', 'bomar@gmail.com');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Volcando estructura para tabla db_condominios.visitas
CREATE TABLE IF NOT EXISTS `visitas` (
  `visitas_seq_no` int(11) NOT NULL AUTO_INCREMENT,
  `visita_id_qr` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `visita_nombre_visitante` varchar(175) COLLATE utf8_spanish_ci NOT NULL,
  `visita_id_casa` int(11) NOT NULL,
  `visita_hr_entrada` time DEFAULT NULL,
  `vista_fecha_entrada` date DEFAULT NULL,
  `vista_fecha_hr_salida` datetime DEFAULT NULL,
  `visita_observaciones` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `visita_activity_id_usuario` int(11) NOT NULL COMMENT 'Se guarda el ID del usuario que guarda el registro',
  `visita_activity_date` datetime NOT NULL DEFAULT current_timestamp(),
  `visita_confirma_vigilante` varchar(2) COLLATE utf8_spanish_ci DEFAULT NULL,
  `visita_ind_registro_activo` varchar(2) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'Y',
  `visita_img_1` varchar(175) COLLATE utf8_spanish_ci DEFAULT NULL,
  `visita_img_2` varchar(175) COLLATE utf8_spanish_ci DEFAULT NULL,
  `visita_img_3` varchar(175) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`visitas_seq_no`),
  KEY `FK_visita_id_casa` (`visita_id_casa`),
  KEY `FK_visita_activity_id_usuario` (`visita_activity_id_usuario`),
  CONSTRAINT `FK_visita_activity_id_usuario` FOREIGN KEY (`visita_activity_id_usuario`) REFERENCES `usuario` (`usuario_id_usuario`),
  CONSTRAINT `FK_visita_id_casa` FOREIGN KEY (`visita_id_casa`) REFERENCES `casa` (`casa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla db_condominios.visitas: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `visitas` DISABLE KEYS */;
INSERT INTO `visitas` (`visitas_seq_no`, `visita_id_qr`, `visita_nombre_visitante`, `visita_id_casa`, `visita_hr_entrada`, `vista_fecha_entrada`, `vista_fecha_hr_salida`, `visita_observaciones`, `visita_activity_id_usuario`, `visita_activity_date`, `visita_confirma_vigilante`, `visita_ind_registro_activo`, `visita_img_1`, `visita_img_2`, `visita_img_3`) VALUES
	(1, '02081900001', 'Roberto Petlachi', 1, '15:00:00', '2019-08-03', '2019-08-17 00:00:00', '***NO SE PRESENTO LA VISITA EN LA FECHA PROGRAMADA***', 7, '2019-08-02 14:19:23', NULL, 'N', NULL, NULL, NULL),
	(2, '02081900002', 'Eduardo Arriaga', 5, '19:00:00', '2019-08-04', '2019-08-17 00:00:00', '***NO SE PRESENTO LA VISITA EN LA FECHA PROGRAMADA***', 6, '2019-08-02 14:19:23', NULL, 'N', NULL, NULL, NULL),
	(3, '02081900003', 'Alejandro Armenta', 2, '18:30:00', '2019-08-05', '2019-08-17 00:00:00', '***NO SE PRESENTO LA VISITA EN LA FECHA PROGRAMADA***', 1, '2019-08-02 14:23:14', NULL, 'N', NULL, NULL, NULL),
	(4, '02081900001', 'Roberto Petlachi', 1, '15:00:00', '2019-08-03', NULL, 'Llego 1hr mas tarde', 3, '2019-08-03 16:19:23', 'Y', 'N', NULL, NULL, NULL),
	(5, '02081900004', 'Orlando Hernandez', 3, '19:30:00', '2019-08-05', '2019-08-17 00:00:00', '***NO SE PRESENTO LA VISITA EN LA FECHA PROGRAMADA***', 5, '2019-08-02 14:23:14', NULL, 'N', NULL, NULL, NULL),
	(6, '02081900005', 'Karina Bonilla', 4, '21:00:00', '2019-08-05', '2019-08-17 00:00:00', '***NO SE PRESENTO LA VISITA EN LA FECHA PROGRAMADA***', 1, '2019-08-02 14:23:14', NULL, 'N', NULL, NULL, NULL),
	(7, '02081900001', 'Roberto Petlachi', 1, '15:00:00', '2019-08-03', NULL, 'Comenta que va a su trabajo y regresa mas tardepero regresara mas tarde', 8, '2019-08-03 16:19:23', 'Y', 'N', NULL, NULL, NULL),
	(8, '02081900002', 'Eduardo Arriaga', 5, '19:00:00', '2019-08-04', NULL, 'Llego en UBER se agrega foto con datos de vehiculo', 6, '2019-08-04 19:19:23', 'Y', 'N', NULL, NULL, NULL),
	(9, '02081900002', 'Eduardo Arriaga', 5, '19:00:00', '2019-08-04', '2019-08-04 23:29:19', 'Salio en UBER se agrega foto con datos del vehiculo', 6, '2019-08-04 23:30:23', 'Y', 'Y', NULL, NULL, NULL),
	(10, '02081900003', 'Eduardo Arriaga', 5, '19:00:00', '2019-08-10', '2019-08-17 00:00:00', '***NO SE PRESENTO LA VISITA EN LA FECHA PROGRAMADA***', 6, '2019-08-02 17:28:00', NULL, 'N', NULL, NULL, NULL),
	(12, '02081900001', 'Roberto Petlachi', 1, '15:00:00', '2019-08-03', NULL, 'regreso del trabajo vuelve a ingresar', 8, '2019-08-06 17:00:00', 'Y', 'N', NULL, NULL, NULL),
	(13, '02081900001', 'Roberto Petlachi', 1, '15:00:00', '2019-08-03', '2019-08-16 13:37:03', 'Salio definitivamente', 8, '2019-08-06 17:00:00', 'Y', 'Y', NULL, NULL, NULL);
/*!40000 ALTER TABLE `visitas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
