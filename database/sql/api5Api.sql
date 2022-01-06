-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.17-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6373
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para igtt4api
CREATE DATABASE IF NOT EXISTS `igtt4api` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `igtt4api`;

-- Volcando estructura para tabla igtt4api.cities
CREATE TABLE IF NOT EXISTS `cities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `city_co` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `municipality_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `user_id` bigint(20) unsigned NOT NULL,
  `postal_co` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone_co` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uuid` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `cities_city_co_unique` (`city_co`) USING BTREE,
  UNIQUE KEY `slug_unique` (`slug`) USING BTREE,
  UNIQUE KEY `uuid_unique` (`uuid`) USING BTREE,
  KEY `cities_municipality_id_foreign` (`municipality_id`) USING BTREE,
  CONSTRAINT `FK_cities_municipalities` FOREIGN KEY (`municipality_id`) REFERENCES `municipalities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Cities';

-- Volcando datos para la tabla igtt4api.cities: ~30 rows (aproximadamente)
REPLACE INTO `cities` (`id`, `city_co`, `description`, `municipality_id`, `user_id`, `postal_co`, `telephone_co`, `slug`, `uuid`, `created_at`, `updated_at`) VALUES
	(1, 'ccs', 'CARACAS (DF)', 1, 1, '1030', '212', 'ven-ctr-ddf-css', '429ce872-1624-45e9-a9f7-01b1a8232ab9', '2019-03-24 04:00:00', '2021-07-21 03:58:36'),
	(2, 'plcz', 'PUERTO LA CRUZ (ANZ)', 20, 1, '6023', '281', 'ven-ori-anz-plcz', '7b138e19-7bc7-44f7-a126-0dcb53790143', '2019-03-24 04:00:00', '2021-07-07 17:52:56'),
	(3, 'bar', 'BARCELONA (ANZ)', 9, 1, '6001', '281', 'ven-ori-anz-bar', '8c5dadaa-ee81-4eb1-89d4-078dac696730', '2019-03-24 04:00:00', '2021-07-07 17:54:10'),
	(4, 'lgua', 'LA GUAIRA (VAR)', 22, 1, '1160', '212', 'ven-ctr-var-lgua', '68255cc0-2313-4f08-8a01-55e98ec30030', '2019-03-24 04:00:00', '2021-07-07 17:55:50'),
	(5, 'mrcy', 'MARACAY (ARA)', 38, 1, '2103', '243', 'ven-ctr-ara-mrcy', 'd730949c-ea91-4e67-8c3f-cafbfb53b87c', '2019-03-24 04:00:00', '2021-07-07 17:59:49'),
	(6, 'smto', 'SAN MATEO (ARA)', 39, 1, '2120', '244', 'ven-ctr-ara-smto', '97236a08-33d6-4511-8816-1b3eb1c62947', '2019-03-24 04:00:00', '2021-07-07 18:00:23'),
	(7, 'lvto', 'LA VICTORIA (ARA)', 43, 1, '2121', '244', 'ven-ctr-ara-lvto', 'db5e26f1-9a15-4417-8912-a00f726e05e4', '2019-03-24 04:00:00', '2021-07-07 18:16:06'),
	(8, 'ltje', 'LAS TEJERIAS (ARA)', 51, 1, '2119', '244', 'ven-ctr-ara-ltje', 'abd22b34-d425-404b-97f0-63a92f50332f', '2019-03-24 04:00:00', '2021-07-07 18:12:11'),
	(9, 'cgua', 'CAGUA (ARA)', 52, 1, '2122', '244', 'ven-ctr-ara-cgua', 'e9ffb678-804e-47be-b380-12b862619ceb', '2019-03-24 04:00:00', '2021-07-07 18:09:37'),
	(10, 'tmro', 'TURMERO (ARA)', 50, 1, '2115', '244', 'ven-ctr-ara-tmro', 'f9d198e3-801c-4d11-949a-c613d48eaf3c', '2019-03-24 04:00:00', '2021-07-07 18:17:23'),
	(11, 'bqto', 'BARQUISIMETO (LAR)', 161, 1, '3001', '251', 'ven-occ-lar-irn-bqto', 'c35eaab6-92ad-4a8d-83b4-60dffaed76c6', '2019-04-07 04:00:00', '2021-07-07 18:01:06'),
	(12, 'caro', 'CARORA (LAR)', 166, 1, '3001', '252', 'ven-occ-lar-tor-caro', '52911b37-5ddd-427d-b490-6736dce4a3cb', '2019-04-07 04:00:00', '2021-07-07 18:02:06'),
	(13, 'lpra', 'LA PASTORA (LAR)', 166, 1, '3001', '252', 'ven-occ-lar-tor-lpra', '67339dbd-6626-47fa-89b4-7a5456533722', '2019-04-07 04:00:00', '2021-07-07 18:02:37'),
	(14, 'pcbo', 'PUERTO CABELLO (CBB)', 105, 1, '2050', '259', 'ven-ctr-cbb-pcbo', '404c1e44-c879-4a54-888d-7a405fb4bf9e', '2019-04-07 04:00:00', '2021-07-07 18:04:54'),
	(15, 'chve', 'CHARALLAVE (MIR)', 207, 1, '1210', '239', 'ven-ctr-mir-chve', '34db8ec1-1fd1-4d72-8a01-36055fd5d0b2', '2019-04-07 04:00:00', '2021-07-07 18:08:12'),
	(16, 'mtin', 'MATURIN (MON)', 211, 1, '6201', '291', 'ven-ori-mon-mtin', 'd5eb0203-c780-42ef-903a-b5307e5fd498', '2019-08-03 16:51:21', '2021-07-07 18:52:16'),
	(17, 'plmr', 'PORLAMAR (NES)', 222, 1, '6301', '295', 'ven-ori-nes-plmr', 'a761e6bf-a69b-4d1d-9ced-b14797d8be44', '2019-08-03 16:59:25', '2021-07-07 18:53:17'),
	(18, 'pal-cde', 'CABUDARE (LAR)', 164, 1, '3023', '251', 'ven-occ-lar-pal-cde', '8afed338-ab3f-4117-b05f-cb093e0bba94', '2019-12-24 05:38:20', '2021-07-07 17:51:34'),
	(19, 'ltda', 'LA TENDIDA (TAC)', 223, 1, '5040', '275', 'ven-and-tac-ltda', '20deb903-c4b1-4ac9-aa6f-03d6bff8b0aa', '2020-01-03 15:23:39', '2021-07-07 18:21:04'),
	(20, 'chva', 'CHIVACOA (YAR)', 224, 1, '3202', '251', 'ven-ctr-yar-chva', '1e5aafbd-ca10-4d19-8f16-4a83f23ea3ce', '2020-01-03 16:38:32', '2021-07-07 18:21:45'),
	(21, 'yrta', 'YARITAGUA (YAR)', 225, 1, '3203', '251', 'ven-ctr-yar-yrta', '2bc01a39-d6b2-46af-8067-cf9dfbfbc010', '2020-01-04 15:21:19', '2021-07-07 18:23:43'),
	(22, 'mcbo', 'MARACAIBO (ZUL)', 226, 1, '4001', '261', 'ven-occ-zul-mcbo', '75ebebcf-a10f-4891-885e-c3b075f283ea', '2020-01-04 16:13:49', '2021-07-07 18:51:36'),
	(23, 'sctl', 'SAN CRISTOBAL (TAC)', 227, 1, '5001', '276', 'ven-and-tac-sctl', '14328004-a9b3-4e1d-81e7-288baed63ae7', '2020-01-04 17:33:44', '2021-07-07 18:55:05'),
	(24, 'acgua', 'ACARIGUA (POR)', 228, 1, '3301', '255', 'ven-lla-por-acgua', '79f32500-cf73-4680-aeeb-d6cc7b8a581b', '2020-01-04 18:15:40', '2021-07-07 18:46:13'),
	(25, 'sjdm', 'SAN JUAN DE LOS MORROS (GUA)', 154, 1, '2301', '246', 'ven-lla-gua-sjdm', 'b9df0a09-e658-4a09-a3ef-196bcf331a7f', '2020-02-14 19:53:42', '2021-07-07 18:56:15'),
	(26, 'ptjo', 'PUNTO FIJO FALCON', 124, 1, '4102', '269', 'ven-occ-fal-ptjo', 'bec1383e-d90b-4d07-a4da-9054f38121f3', '2020-02-18 00:33:59', '2021-07-07 18:49:44'),
	(29, 'aclt', 'SANTA CRUZ LOS TAQUES (FAL)', 132, 1, '4102', '269', 'ven-occ-fal-sclt', '46b91097-06ee-4f51-9951-e5d41cae8cd2', '2020-02-18 00:39:24', '2021-07-07 19:00:54'),
	(30, 'qbor', 'QUIBOR (LAR)', 162, 1, '3061', '253', 'ven-occ-lar-jim-qbor', '614daea1-a67c-4d31-afa0-9df857c5cafc', '2020-05-23 14:27:56', '2021-07-07 18:56:51'),
	(33, 'arue', 'ARAURE (POR)', 229, 1, '3303', '255', 'ven-lla-por-arue', 'a2ee7173-9220-4ef4-80b4-71903bee5173', '2020-06-01 14:06:14', '2021-07-07 18:58:52'),
	(34, 'sfpe', 'SAN FELIPE (YAR)', 230, 1, '3201', '254', 'ven-ctr-yar-sfpe', 'ad7b9cd0-c639-49fa-b736-ea8f18a14b87', '2021-07-08 05:00:14', '2021-07-08 05:04:28'),
	(35, 'vlcia', 'VALENCIA', 108, 1, '2001', '241', 'ven-ctr-vlcia', '928273ce-c48c-4026-a411-9d32654df818', '2021-12-09 02:41:17', '2021-12-09 02:41:17');

-- Volcando estructura para tabla igtt4api.configurations
CREATE TABLE IF NOT EXISTS `configurations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `local_currency_co` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_currency_co` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_foreign_currency_quote_value` double(10,2) DEFAULT 0.00,
  `last_foreign_currency_quote_date` timestamp NULL DEFAULT NULL,
  `country_co` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `company_description` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_address` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_telephone_co` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_fax_co` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_fiscal_document_co` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_logo` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `days_per_year` int(3) unsigned DEFAULT 360,
  `weeks_per_year` int(2) unsigned DEFAULT 52,
  `months_per_year` int(2) unsigned DEFAULT 12,
  `days_per_month` int(2) unsigned DEFAULT 30,
  `days_per_week` int(2) unsigned DEFAULT 7,
  `hours_per_day` int(2) unsigned DEFAULT 24,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci MAX_ROWS=1;

-- Volcando datos para la tabla igtt4api.configurations: ~0 rows (aproximadamente)
REPLACE INTO `configurations` (`id`, `local_currency_co`, `foreign_currency_co`, `last_foreign_currency_quote_value`, `last_foreign_currency_quote_date`, `country_co`, `company_description`, `company_address`, `company_telephone_co`, `company_fax_co`, `company_email`, `company_fiscal_document_co`, `company_logo`, `days_per_year`, `weeks_per_year`, `months_per_year`, `days_per_month`, `days_per_week`, `hours_per_day`, `created_at`, `updated_at`) VALUES
	(1, '$', 'Bs', 0.00, '2020-05-23 10:54:57', 'VEN', 'Transporte El Milagro', 'Zona Industrial III, Barquisimeto, Edo Lara', '58-2510000000', NULL, 'transporteelmilagro@gmail.com', 'J-0000000', NULL, 360, 52, 12, 30, 7, 24, '2020-05-21 12:11:09', '2020-05-23 10:55:35');

-- Volcando estructura para tabla igtt4api.cost_concepts
CREATE TABLE IF NOT EXISTS `cost_concepts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cost_concept_co` varchar(5) NOT NULL,
  `description` varchar(80) NOT NULL,
  `k_active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `k_class` enum('FIXED','TYPE-VEHICLE','ROUTE','TYPE-CARGO') NOT NULL DEFAULT 'TYPE-VEHICLE',
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_cost_concept_co` (`cost_concept_co`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla igtt4api.cost_concepts: ~14 rows (aproximadamente)
REPLACE INTO `cost_concepts` (`id`, `cost_concept_co`, `description`, `k_active`, `k_class`, `user_id`, `created_at`, `update_at`) VALUES
	(1, 'SAD$', 'Sueldo Administradir', 'Y', 'FIXED', 1, '2020-05-23 12:07:01', '2020-05-23 12:07:02'),
	(2, 'SAC$', 'Salario Conductor', 'Y', 'FIXED', 1, '2020-05-23 12:07:05', '2020-05-23 12:07:06'),
	(3, 'GAD$', 'Gasto Administrativo', 'Y', 'FIXED', 1, '2020-05-23 12:07:08', '2020-05-23 12:07:08'),
	(4, 'DPE$', 'Dotacion Implementos de Seguridad', 'Y', 'FIXED', 1, '2020-05-23 12:07:11', '2020-05-23 12:07:11'),
	(5, 'ALQ$', 'Arrendamientos', 'Y', 'FIXED', 1, '2020-05-23 12:07:14', '2020-05-13 12:07:15'),
	(11, 'CAU$', 'Cauchos RXY', 'Y', 'TYPE-VEHICLE', 1, '2020-05-23 12:13:36', '2020-05-23 12:13:37'),
	(12, 'LUB$', 'Lubricacion/Filtros', 'Y', 'TYPE-VEHICLE', 1, '2020-05-23 12:13:37', '2020-05-23 12:13:38'),
	(13, 'SFR$', 'Sistema Frenos', 'Y', 'TYPE-VEHICLE', 1, '2020-05-23 12:13:40', '2020-05-23 12:13:41'),
	(14, 'RMT$', 'Reconstruccion Motor', 'Y', 'TYPE-VEHICLE', 1, '2020-05-23 12:13:42', '2020-05-23 12:13:43'),
	(15, 'RCJ$', 'Reconstruccion Caja', 'Y', 'TYPE-VEHICLE', 1, '2020-05-23 12:13:45', '2020-05-23 12:13:46'),
	(16, 'RSS$', 'Reconstruccion Suspencion', 'Y', 'TYPE-VEHICLE', 1, '2020-05-23 12:13:48', '2020-05-23 12:13:48'),
	(17, 'CMB$', 'Combustible Tanque 150 LTS', 'Y', 'TYPE-VEHICLE', 1, '2020-05-23 12:13:50', '2020-05-23 12:13:51'),
	(18, 'CPJE', 'Peajes', 'Y', 'ROUTE', 1, '2020-05-23 14:38:58', '2020-05-23 14:38:59'),
	(19, 'CCAL', 'Carga y Descarga (Caleta)', 'Y', 'TYPE-CARGO', 1, '2020-05-23 14:46:14', '2020-05-23 14:46:14');

-- Volcando estructura para tabla igtt4api.countries
CREATE TABLE IF NOT EXISTS `countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_co` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone_co` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `slug` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uuid` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `countries_country_co_unique` (`country_co`) USING BTREE,
  UNIQUE KEY `countries_country_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Countries';

-- Volcando datos para la tabla igtt4api.countries: ~13 rows (aproximadamente)
REPLACE INTO `countries` (`id`, `country_co`, `description`, `path_image`, `telephone_co`, `user_id`, `slug`, `uuid`, `created_at`, `updated_at`) VALUES
	(1, 'PER', 'PERU', 'per.png', '+51', 1, 'per', 'af756502-7e7a-438b-befc-07416dffaefa', '2019-10-09 19:53:43', '2021-06-07 00:53:35'),
	(2, 'VEN', 'VENENEZUELA', 'ven.png', '+58', 1, 'ven', '74dc004a-d9c6-44fb-9b33-73639aef5cc5', '2019-03-20 04:33:24', '2021-06-07 00:54:14'),
	(3, 'COL', 'COLOMBIA', 'col.png', '+57', 1, 'col', '7a3fc6b0-0be0-47e5-97b6-591e04ec4442', '2019-03-20 04:37:05', '2021-06-07 00:54:42'),
	(4, 'BRA', 'BRASIL', 'bra.png', '+55', 1, 'bra', '98715a64-2d09-43ab-bb43-88f13afc64fc', '2019-03-20 04:39:13', '2021-06-07 00:55:19'),
	(5, 'USA', 'UNITED STATE OF AMERICA', 'usa.png', '1', 1, 'usa', 'ebe7172e-e25e-4145-8e7b-1fc0dfa4ceba', '2021-05-16 21:45:36', '2021-06-07 00:56:53'),
	(6, 'ECU', 'ECUADOR', 'ecu.png', '+59', 1, 'ecu', '4bfeadce-c141-4afb-b625-899eb28ffae4', '2019-09-18 15:46:59', '2021-06-07 00:56:09'),
	(7, 'PAN', 'PANAMA', 'pan.png', '+21', 1, 'pan', '03278e14-b9b4-4fca-a8e0-5208e0afcf5b', '2020-02-21 00:51:34', '2021-06-07 00:58:49'),
	(9, 'ARG', 'ARGENTINA', 'arg.png', '+54', 1, 'arg', 'b8a50e5a-32d3-4c62-82c1-4955dd7ff569', '2020-06-01 17:36:15', '2021-06-07 00:59:15'),
	(10, 'URY', 'URUGUAY', 'ury.png', '+59', 1, 'ury', '3f569643-3a3f-4966-81fa-e6b76fbb3349', '2020-06-01 17:39:02', '2021-06-07 00:59:41'),
	(11, 'MEX', 'MEXICO', 'mex.png', '+52', 1, 'mex', 'b489baf6-26ac-4d92-bd6a-e0f86935cb29', '2020-06-01 17:42:11', '2021-06-07 01:00:00'),
	(12, 'CSR', 'COSTA RICA', 'CSR.png', '+50', 1, 'csr', '4bc22b20-1f04-488b-9839-0ab561bef0e6', '2020-06-03 14:42:21', '2021-06-07 00:57:23'),
	(13, 'GUY', 'GUYANA', 'guy.png', '55', 1, 'guy', '2a71db7a-b27d-46f3-8a4f-86180bd8114c', '2021-05-16 19:08:37', '2021-06-07 00:57:43'),
	(14, 'NIC', 'NICARAGUA', 'nic-flag.png', '505', 1, 'nic', '1dbdea90-98bb-4c8b-a1b2-e8bcc2b66434', '2021-05-16 19:12:14', '2022-01-05 18:53:26');

-- Volcando estructura para tabla igtt4api.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_co` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `k_type_customer` enum('F','D','M') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'F',
  `location_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `address` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone_co` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax_co` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fiscal_document_co` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `k_category_co` enum('A','B','C') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'C',
  `k_sector` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_contact` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone_contact` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_contact` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uuid` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `customers_customer_co_unique` (`customer_co`) USING BTREE,
  KEY `customers_location_id_foreign` (`location_id`) USING BTREE,
  CONSTRAINT `FK_location` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Customers';

-- Volcando datos para la tabla igtt4api.customers: ~15 rows (aproximadamente)
REPLACE INTO `customers` (`id`, `customer_co`, `description`, `k_type_customer`, `location_id`, `address`, `telephone_co`, `fax_co`, `email`, `fiscal_document_co`, `k_category_co`, `k_sector`, `name_contact`, `telephone_contact`, `email_contact`, `slug`, `uuid`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 'MKR', 'MAKRO DE VENEZUELA', 'M', 2, 'Av. Intercomunal de Antímano, Cruce con Av. Principal de La Yaguara, Parroquia la Vega, Caracas', '212', '212', '', 'J-00319235-0', 'A', 'FOOD AND DRINKS', 'Makro', '212', NULL, 'ven-ctr-ddf-css-lib-lurbna-mkro', '15237112-a59d-4196-8b64-837d83466c4b', 1, '2019-03-24 04:00:00', '2021-07-14 15:09:48'),
	(2, 'CLP', 'CENTRAL LA PASTORA CA', 'F', 9, 'Carretera Panamericana. Km 495. La Pastora. Estado Lara', '0252-4000400', NULL, 'comunicacioneslapastora@gmail.com', 'J-00006277-3 ', 'A', 'AGROINDUSTRY', NULL, NULL, NULL, 'ven-occ-lar-tor-lpra-clp', '584335fe-af55-4af4-8486-6f0918016dba', 1, '2019-04-07 04:00:00', '2021-07-14 14:52:28'),
	(3, 'CHR', 'CHOCOLATES EL REY, CA.', 'F', 12, 'Carrera A-2, Parcelas A-23 y A-24, Zona Industrial II, Barquisimeto, Edo. Lara, Venezuela.', '(0251) 2415056,', '(0251) 2415057', 'chocolates@chocolate.com.ve', 'J-00084844-0', 'A', 'FOOD AND DRINKS', NULL, NULL, NULL, 'ven-occ-lar-irn-bqto-chrey', '3b934ebe-1b27-482f-8827-f15558896b42', 1, '2019-04-07 04:00:00', '2021-07-14 14:53:43'),
	(4, 'CGI', 'CARGIL DE VENEZUELA, ', 'F', 15, 'Edificio Parque Cristal.\r\nTore Oeste, Piso 8. Avenida Francisco de Miranda. Caracas, Distrito Capital.', '(0212) 208 51 11', NULL, 'comercializacion@cargil.com', 'J-00000000-9 ', 'A', 'AGROINDUSTRY', NULL, NULL, NULL, 'ven-ctr-ddf-css-lib-cgdvzla', '6e5135de-7e5a-4ef0-8826-b786ce87eff9', 1, '2019-04-07 04:00:00', '2021-07-14 14:55:32'),
	(5, 'ALX', 'PRODUCTOS ALIMEX, C.A.', 'F', 11, 'Calle 28 Carrera 3 Zona Industrial I. Barquisimeto Estado Lara ', '(0251) 237 61 79', NULL, 'ventascomercial.oficina@eltunal.com', 'J-00045339-0', 'A', 'FOOD AND DRINKS', NULL, NULL, NULL, 'ven-occ-lar-irn-bqto-prdamx', 'b8a465df-6aef-42bf-867a-3bdc89227f86', 1, '2019-04-07 04:00:00', '2021-07-14 14:57:47'),
	(8, 'ADC', 'ALIMENTOS DIGASMAR ADICA, C.A.', 'D', 16, 'Villa Rosa Avn. Juan Bautista Arismendi Edif. Digasmar', '(0295) 2692919', '(0295) 2693014', 'grupodigasmar@digasmar.com.ve', 'J-30759154-4', 'C', 'FOOD AND DRINKS', NULL, '	0414-7855712', NULL, 'ven-ori-nes-plmr-adica', '65a2cc8c-7d62-4637-9641-389fdbc10907', 1, '2020-01-03 15:29:22', '2021-07-14 15:00:25'),
	(9, 'LLA', 'LACTEOS LOS ANDES CA.', 'F', 17, 'Av. Intercomunal Barquisimeto - Acarigua, Cabudare 3023, Lara', '(0426)-4103394', NULL, 'logistica@lacteoslosandes.gob.ve', 'G-00000001-1', 'C', 'FOOD AND DRINKS', NULL, NULL, NULL, 'ven-occ-lar-pal-cde-llde', '862b675c-605e-49dd-a26d-de921151f582', 1, '2019-12-24 05:50:18', '2021-07-14 15:02:20'),
	(10, 'AGM', 'AGROINDUSTRIA DE LA MONTAÑA CA.', 'F', 18, 'Carretera Panamericana Casa Nº S/N. Sector Bocono La Tendida', '(0275) 5163617', NULL, 'logistica@agroindustriadelamontana.com', 'J-29915867-4', 'C', 'FOOD AND DRINKS', NULL, NULL, NULL, 'ven-and-tac-ltda-ailmta', 'abe09b60-99a2-4e4f-a750-168816c93ca8', 1, '2020-01-03 15:29:07', '2021-07-14 15:05:03'),
	(11, 'TBR', 'TUBRICA', 'F', 12, 'Calle A-2, Barquisimeto 3001, Lara', '(0251) 2501777', NULL, 'logistica@tubrica.com', 'J-08516082-5', 'A', 'PLASTIC', 'Gustavo Munera', '+584142498872', 'gmunera@tubrica.com', 'ven-occ-lar-irn-bqto-tbca', '6dbe30f6-8b7b-4cf4-86f5-323be5c9eaf2', 1, '2020-01-03 02:45:39', '2021-07-14 15:06:46'),
	(13, 'PCC', 'PROCESADORA AGROINDUSTRAL CAMPO CLARO', 'F', 21, 'Chivacoa', NULL, NULL, '', 'J-00000000-10', 'C', 'FOOD AND DRINKS', NULL, NULL, NULL, 'ven-ctr-yar-chva-aclro', 'ebe63109-bf53-42ba-b163-637daf55b185', 1, '2020-01-04 16:50:34', '2021-07-14 15:09:03'),
	(14, 'GRZHM', 'GARZON HIPERMECADO CA.', 'M', 23, 'CALLE PRINCIPAL DE MADRE JUANA EDIFICIO GARZON PB LOCAL N° H-24A EDIFICIO GARZON MADR', '0276 3419223', NULL, 'info@helgarzon.com/', 'J-30526930-0', 'C', 'FOOD AND DRINKS', NULL, NULL, NULL, 'ven-and-tac-sctl-grzon', '49448de8-b677-4dcc-ac6d-3540eb0c2a36', 1, '2020-01-04 17:29:38', '2021-07-14 20:38:19'),
	(15, 'IPB', 'INVERSIONES PAUMAR CA.', 'D', 13, 'Mercado Mayorista, Edif. Nº. 3, Local A2, A3, A4, Zona Industrial III, Barquisimeto', '02512690795', NULL, '', NULL, 'C', 'FOOD AND DRINKS', NULL, NULL, NULL, 'ven-occ-lar-irn-bqto-ipmar', '332bb5e5-6aba-4250-9f08-343555237f92', 1, '2021-07-14 11:14:37', '2021-07-14 15:13:33'),
	(16, 'CAP', 'CENTRAL AZUCARERO PORTUGUESA', 'F', 33, 'Carretera Nacional via Payara', '0255-7116200', NULL, 'informacion@capca.com.ve', 'J-07505170-0', 'A', 'FOOD AND DRINKS', NULL, NULL, NULL, 'ven-lla-por-acgua-capca', '22e81f95-d3f4-499c-b0ab-cf4181732c54', 1, '2021-07-14 14:44:15', '2021-07-14 14:44:15'),
	(17, 'COPSA', 'CONSORCIO OLEAGINOSO PORTUGUESA (COPOSA)', 'F', 33, 'Carretera Nacional via Payara', '0255-6002300', NULL, 'distribuidora.centrooccidente@coposa.com', NULL, 'C', 'FOOD AND DRINKS', NULL, NULL, NULL, 'ven-lla-por-acgua-cpsa-lla', 'a621076d-dd81-4a77-82a6-c8753a08c2da', 1, '2021-07-14 11:28:09', '2021-07-14 15:29:23'),
	(18, 'ACRTAL', 'ARROZ CRISTAL CA', 'F', 33, 'Carretera Nacional Vía Payara, Edificio Arroz Cristal.', '0255-6210883', NULL, 'info@arrozcristal.com.ve', 'J-00225418-1', 'C', 'FOOD AND DRINKS', 'CAHONAVO CASTRO', NULL, 'GERENCIA_GENERAL@ARROZCRISTAL.COM.VE', 'ven-lla-por-acgua-acrtal', 'bc4f4e0f-349a-4d6f-b256-8821b02ecb51', 1, '2021-07-14 19:58:30', '2021-07-14 19:58:30');

-- Volcando estructura para tabla igtt4api.employees
CREATE TABLE IF NOT EXISTS `employees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_co` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `k_status` enum('AVAILABLE','VACATIONS','SERVING','DISCARDED','LOCATED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'AVAILABLE',
  `k_level` enum('A','B','C') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'C',
  `partner_id` bigint(20) unsigned DEFAULT NULL,
  `transfer_id` bigint(20) unsigned DEFAULT NULL,
  `truck_id` bigint(20) unsigned DEFAULT NULL,
  `trailer_id` bigint(20) unsigned DEFAULT NULL,
  `location_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_employee_co_unique` (`employee_co`),
  KEY `employees_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Employees';

-- Volcando datos para la tabla igtt4api.employees: ~0 rows (aproximadamente)

-- Volcando estructura para tabla igtt4api.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla igtt4api.failed_jobs: ~0 rows (aproximadamente)

-- Volcando estructura para tabla igtt4api.fixed_cost_concepts
CREATE TABLE IF NOT EXISTS `fixed_cost_concepts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cost_concept_id` bigint(20) unsigned NOT NULL,
  `k_active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `use_currency` varchar(3) DEFAULT NULL,
  `frecuency` int(2) NOT NULL DEFAULT 1,
  `currency_value` double(12,4) NOT NULL DEFAULT 0.0000,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_fixed_cost_concepts` (`cost_concept_id`),
  CONSTRAINT `FK_fixed_cost_concepts` FOREIGN KEY (`cost_concept_id`) REFERENCES `cost_concepts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla igtt4api.fixed_cost_concepts: ~0 rows (aproximadamente)

-- Volcando estructura para tabla igtt4api.foreign_currency_quotes
CREATE TABLE IF NOT EXISTS `foreign_currency_quotes` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `quote_date` datetime NOT NULL DEFAULT current_timestamp(),
  `quote_value` double(10,2) NOT NULL DEFAULT 0.00,
  `user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla igtt4api.foreign_currency_quotes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla igtt4api.freights
CREATE TABLE IF NOT EXISTS `freights` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) unsigned NOT NULL,
  `route_id` bigint(20) unsigned NOT NULL,
  `type_cargo_id` bigint(20) unsigned NOT NULL,
  `type_vehicle_id` bigint(20) unsigned NOT NULL,
  `type_freight_id` bigint(20) unsigned NOT NULL,
  `upload_date` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `finish_date` datetime DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  KEY `PK_FREIGHT` (`id`),
  KEY `FK_freight_user` (`user_id`),
  CONSTRAINT `FK_freight_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla igtt4api.freights: ~0 rows (aproximadamente)

-- Volcando estructura para tabla igtt4api.freight_prices
CREATE TABLE IF NOT EXISTS `freight_prices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) unsigned NOT NULL,
  `route_id` bigint(20) unsigned NOT NULL,
  `type_cargo_id` bigint(20) unsigned NOT NULL,
  `type_vehicle_id` bigint(20) unsigned NOT NULL,
  `type_freight_id` bigint(20) unsigned NOT NULL,
  `billing_price` double unsigned NOT NULL DEFAULT 0,
  `logistics_price` double unsigned NOT NULL DEFAULT 0,
  `effective_at` date NOT NULL,
  `expiration at` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_freight_prices_customers` (`customer_id`),
  KEY `FK_freight_prices_routes` (`route_id`),
  KEY `FK_freight_prices_type_cargos` (`type_cargo_id`),
  KEY `FK_freight_prices_type_vehicles` (`type_vehicle_id`),
  KEY `FK_freight_prices_type_freights` (`type_freight_id`),
  CONSTRAINT `FK_freight_prices_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_freight_prices_routes` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_freight_prices_type_cargos` FOREIGN KEY (`type_cargo_id`) REFERENCES `type_cargos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_freight_prices_type_freights` FOREIGN KEY (`type_freight_id`) REFERENCES `type_freights` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_freight_prices_type_vehicles` FOREIGN KEY (`type_vehicle_id`) REFERENCES `type_vehicles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='freight prices';

-- Volcando datos para la tabla igtt4api.freight_prices: ~0 rows (aproximadamente)
REPLACE INTO `freight_prices` (`id`, `customer_id`, `route_id`, `type_cargo_id`, `type_vehicle_id`, `type_freight_id`, `billing_price`, `logistics_price`, `effective_at`, `expiration at`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 1, 1, 1, 1450, 35, '2021-04-10', '0000-00-00', '2021-04-10 23:32:02', NULL);

-- Volcando estructura para tabla igtt4api.freight_secuences
CREATE TABLE IF NOT EXISTS `freight_secuences` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `freight_id` bigint(20) unsigned NOT NULL,
  `secuence_number` tinyint(4) DEFAULT NULL,
  `route_id` bigint(20) unsigned DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `finish_date` datetime DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  KEY `PK_FREIGHT_SECUENCES` (`id`),
  KEY `UK_FREIGHT_SECUENCES` (`freight_id`,`secuence_number`),
  KEY `FK_FREIGHT_SECUENCE_ROUTE` (`route_id`),
  CONSTRAINT `FK_FREIGHT_SECUENCE_FREIGHT` FOREIGN KEY (`freight_id`) REFERENCES `freights` (`id`),
  CONSTRAINT `FK_FREIGHT_SECUENCE_ROUTE` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla igtt4api.freight_secuences: ~0 rows (aproximadamente)

-- Volcando estructura para tabla igtt4api.locations
CREATE TABLE IF NOT EXISTS `locations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_co` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_co` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `nu_gps_lat` double(8,4) DEFAULT NULL,
  `nu_gps_lon` double(8,4) DEFAULT NULL,
  `uuid` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `locations_location_co_unique` (`location_co`) USING BTREE,
  UNIQUE KEY `slug_unique` (`slug`) USING BTREE,
  UNIQUE KEY `uuid_unique` (`uuid`) USING BTREE,
  KEY `locations_city_id_foreign` (`city_id`) USING BTREE,
  CONSTRAINT `FK_city` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla igtt4api.locations: ~28 rows (aproximadamente)
REPLACE INTO `locations` (`id`, `location_co`, `description`, `postal_co`, `city_id`, `nu_gps_lat`, `nu_gps_lon`, `uuid`, `slug`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 'ccs-001', 'LA YAGUARA (Caracas CCS)', '1020', 1, 10.4806, -66.9729, '209a1821-fa6f-4e0f-a912-cb97d1e864ca', 'ven-ctr-ddf-css-lib-lygra', 1, '2019-03-24 04:00:00', '2021-07-09 00:06:50'),
	(2, 'ccs-002', 'LA URBINA (Caracas CCS)', '1073', 1, 10.4894, -66.8099, 'b0d717ba-e56f-4357-be31-7c9beb3b644c', 'ven-ctr-ddf-css-lib-lurbna', 1, '2019-03-24 04:00:00', '2021-07-09 00:06:10'),
	(3, 'ptolz-001', 'CERRO VIDONO (Pto La Cruz ANZ)', '6023', 2, 10.1817, -64.6460, 'c34ced5a-dabd-437a-a956-702d74a9c5a1', 'ven-ori-anz-plcz', 1, '2019-03-24 04:00:00', '2021-07-09 00:31:10'),
	(4, 'lgra-001', 'SECTOR TRIANGULO DE MARE (La Guaira VAR)', '1162', 4, 10.5947, -66.9928, '70eeab2e-d631-4149-9405-725df6de362f', 'ven-ctr-var-lgua', 1, '2019-03-24 04:00:00', '2021-07-09 00:29:29'),
	(5, 'tmmo-001', 'SECTOR LA MORITA (Tumeremo ARA)', '2107', 10, 10.2269, -67.5343, '6c9039dc-c97a-4051-92eb-0b36c2e1f336', 'ven-ctr-ara-tmro', 1, '2019-03-24 04:00:00', '2021-07-09 00:31:27'),
	(6, 'mcay-001', 'BARRIO SAN RAFAEL (Maracay ARA)', '2101', 5, 10.2261, -67.5922, '176078ef-16b3-4f62-9f5d-2f150c86ac20', 'ven-ctr-ara-mrcy', 1, '2019-03-24 04:00:00', '2021-07-09 00:29:43'),
	(9, 'krora-001', 'LA PASTORA (La Pastora-Carora LAR)', '3055', 13, 9.8305, -70.1925, '535ab506-426a-4ea6-aec5-203e4b295726', 'ven-occ-lar-tor-lpra-lpra', 1, '2019-04-07 04:00:00', '2021-07-09 00:28:58'),
	(10, 'krora-002', 'SECTOR PURICAURE (Via Lara-Zulia Carora LAR)', '3050', 12, 10.0938, -70.4593, '924b0389-71c4-42ba-8cd9-c2d526f74cf8', 'ven-occ-lar-tor-caro', 1, '2019-04-07 04:00:00', '2021-07-09 00:29:12'),
	(11, 'bqto-001', 'ZONA INDUSTRIAL I (Barquisimeto LAR)', '3001', 11, 10.0746, -69.3589, 'eb2553a9-2ba1-4b54-91a8-0380f3983b6f', 'ven-occ-lar-irn-bqto-zind-I', 1, '2019-04-07 04:00:00', '2021-07-09 00:25:33'),
	(12, 'bqto-002', 'ZONA INDUSTRIAL II (Barquisimeto LAR)', '3001', 11, 10.0882, -69.3636, '7b381c66-63c3-43b9-91ea-4258ac63d474', 'ven-occ-lar-irn-bqto-zind-II', 1, '2019-04-07 04:00:00', '2021-07-09 00:25:46'),
	(13, 'bqto-003', 'ZONA INDUSTRIAL III (Barquisimeto LAR)', '3001', 11, 10.0663, -69.3828, '8b127578-92ee-4d9e-97ab-2fe581430937', 'ven-occ-lar-irn-bqto-zind-III', 1, '2019-04-07 04:00:00', '2021-07-09 00:28:03'),
	(14, 'chve-001', 'SECTOR LA PENA (Charallave MIR)', '1210', 15, 10.2089, -66.8459, '92cf4ac2-9915-4367-bebf-7b0f86dc6e6a', 'ven-ctr-mir-chve', 1, '2019-04-07 04:00:00', '2021-07-09 00:10:32'),
	(15, 'css-003', 'SANTA EDUVIGIS (Caracas CCS)', NULL, 1, 10.4977, -66.8455, 'dc783e20-f5ad-4b42-b7c2-79e2b2f63acf', 'ven-ctr-ddf-css-lib', 1, '2019-04-07 04:00:00', '2021-07-09 00:05:07'),
	(16, 'plmar-001', 'PORLAMAR (Margarita NES)', '6301', 17, NULL, NULL, '977f825f-7311-425d-b7db-428b901c6dd7', 'ven-ori-nes-plmr', 1, '2019-08-03 17:00:25', '2021-07-09 00:08:47'),
	(17, 'cbdre-001', 'LA MATA (Cabudare LAR)', '3001', 18, 10.0291, -69.2539, '6bec235f-6a45-4f38-be16-0afe58b09729', 'ven-occ-lar-pal-cde', 1, '2019-12-24 05:41:44', '2021-07-09 00:17:09'),
	(18, 'bcno-001', 'SECTOR BOCONO - LA TENDIDA (TAC)', '5040', 19, 8.5065, -71.8341, '71a30897-f40a-4fa4-ab8f-76fcf788b876', 'ven-and-tac-ltda', 1, '2020-01-03 15:25:08', '2021-07-09 00:23:48'),
	(19, 'yrta-001', 'SECTOR LAS CANARIAS - (Yaritagua YAR)', '3203', 21, 10.0753, -69.1283, '71e9b125-621d-48fe-9f1b-8dae63bae638', 'ven-ctr-yar-yrta-slcnr', 1, '2020-01-04 17:25:34', '2021-07-09 00:11:55'),
	(20, 'mcbo-001', 'SECTOR MONTE CLARO (Maracaibo Norte ZUL)', '4001', 22, NULL, NULL, '9601bb95-68de-4da7-869a-7e8fbc426853', 'ven-occ-zul-mcbo', 1, '2020-01-04 17:25:28', '2021-07-09 00:29:56'),
	(21, 'yrta-003', 'CHIVACOA (Chivacoa YAR)', '3202', 20, 10.1600, -68.9097, '96a1fb7f-27f8-4270-9d0a-e6d7eeb1698c', 'ven-ctr-yar-chva', 1, '2020-01-04 17:15:10', '2021-07-09 00:31:56'),
	(22, 'bqto-006', 'ZONA ESTE (Barquisimeto LAR)', '3001', 11, 10.0701, -69.2973, 'efdabe49-de56-4c48-9825-bf05d4277f4f', 'ven-occ-lar-bqto-zeste', 1, '2020-01-04 17:25:23', '2021-07-09 00:13:44'),
	(23, 'scbal-001', 'SECTOR LA CONCORDIA (Sancristobal TAC)', '5001', 23, 7.7540, -72.2271, '1441c16b-bfa9-4284-9505-9c9a9d75310d', 'ven-and-tac-sctl', 1, '2020-01-04 17:36:27', '2021-07-09 00:23:14'),
	(24, 'acrgua-001', 'CENTRO COMERCIAL LLANO (Acarigua POR)', '3301', 24, 9.5728, -69.1981, 'b6bf314d-e217-448d-8338-4063d71df455', 'ven-lla-por-acgua-ccllnos', 1, '2020-01-04 18:18:11', '2021-07-09 00:23:26'),
	(25, 'sjdm-001', 'CENTRO MAKRO SAN JUAN DE LOS MORROS (Guarico)', NULL, 25, NULL, NULL, '81d924ea-2644-40fa-8faf-3b1c12daaaf2', 'ven-lla-gua-sjdm', 1, '2020-02-14 19:57:13', '2021-07-09 00:09:09'),
	(26, 'prgna-001', 'PARAGUARANA (FAL)', NULL, 29, NULL, NULL, 'cc03f82b-12bc-45d1-93b7-b2117a641c2f', 'ven-occ-fal-sclt', 1, '2020-02-18 00:44:17', '2021-07-09 00:26:39'),
	(27, 'krora-000', 'CARORA (Carora LAR)', NULL, 12, 10.1744, -70.0815, '2f3bfca9-5dd7-4df5-944c-a0611770f596', 'ven-occ-lar-tor-caro-lptra', 1, '2021-02-07 18:42:24', '2021-07-09 00:26:10'),
	(28, 'bqto-005', 'CARDENALITO (Barquisimeto LAR)', '3001', 11, 10.0841, -69.2306, '9545ebab-a38f-4e5a-878f-92c18619fb0e', 'ven-occ-lar-irn-bqto', 1, '2021-03-09 10:16:55', '2021-07-09 00:28:27'),
	(29, 'yrta-002', 'SECTOR CASETEJAS - (Yaritagua YAR)', '3203', 21, 10.1199, -69.1992, 'e7f53b48-8ca5-477d-af9f-584b7bdf8e89', 'ven-ctr-yar-yrta', 1, '2021-03-09 10:31:45', '2021-07-09 00:31:49'),
	(30, 'arure-001', 'BARAURE (Araure POR)', '3303', 33, 9.5804, -69.2006, '7945f119-09b4-4ab4-b58f-aaee2fdc0bc6', 'ven-lla-por-aure-baure', 1, '2021-07-13 21:35:39', '2021-07-14 19:23:48'),
	(32, 'mcbo-002', 'ZONA INDUSTRIAL I (Maracaibo ZUL)', '4004', 22, 10.5888, -71.6674, '53d1d711-4729-48a4-8939-f4e44be1af3d', 'ven-occ-zul-mcbo-zindi', 1, '2021-07-13 22:04:05', '2021-07-14 19:35:10'),
	(33, 'acrgua-002', 'SECTOR PIEDRAS BLANCAS (Acarigua POR)', '3301', 24, NULL, NULL, 'b3a730a0-d533-44cc-b244-f8674244d4f2', 'ven-lla-por-acgua-spbca', 1, '2021-07-14 10:17:43', '2021-07-14 19:23:24'),
	(34, 'mcbo-003', 'PARQUE INDUSTRIAL ANGELINI (Maracaibo ZUL)', '4004', 22, NULL, NULL, '127940e7-d7cd-49d2-bc45-c0618b03d8aa', 'ven-occ-zul-mcbo-piamz', 1, '2021-07-14 18:55:14', '2021-07-14 18:55:14');

-- Volcando estructura para tabla igtt4api.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla igtt4api.migrations: ~6 rows (aproximadamente)
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(2, '2014_10_12_000000_create_users_table', 1),
	(3, '2021_04_11_171143_create_configurations_table', 1),
	(4, '2021_04_11_201417_create_countries_table', 1),
	(5, '2021_06_12_223922_create_regions_table', 1),
	(6, '2014_10_12_100000_create_password_resets_table', 2),
	(7, '2019_08_19_000000_create_failed_jobs_table', 2),
	(8, '2019_12_14_000001_create_personal_access_tokens_table', 2);

-- Volcando estructura para tabla igtt4api.municipalities
CREATE TABLE IF NOT EXISTS `municipalities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `municipality_co` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuid` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `municipalities_municipality_co_unique` (`municipality_co`) USING BTREE,
  KEY `municipalities_province_id_foreign` (`province_id`) USING BTREE,
  CONSTRAINT `FK_province` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla igtt4api.municipalities: ~210 rows (aproximadamente)
REPLACE INTO `municipalities` (`id`, `municipality_co`, `description`, `slug`, `uuid`, `province_id`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 'css-li', 'LIBERTADOR (Caracas)', 'ven-ctr-ddf-css-lib', '571e3d51-6c9c-4aad-8a3a-8cbe710a84e7', 1, 1, '2019-03-24 04:00:00', '2021-07-07 18:37:03'),
	(2, 'css-me', 'METROPOLITANO (Caracas)', 'ven-ctr-ddf-css-met', '63fe4c80-d1c9-4093-a8ed-f7a077e5a307', 1, 1, '2019-03-24 04:00:00', '2021-07-07 19:52:30'),
	(3, 'amz-ar', 'ATURES (Pto. Ayacucho AMA)', 'ven-ori-amz-pcho-are', '054e7b3d-7aa2-4071-8c8f-27efb78974b5', 2, 1, '2019-03-24 04:00:00', '2021-07-07 19:52:36'),
	(4, 'amz-aco', 'ALTO ORINOCO (La Esmeralda AMA)', 'ven-ori-amz-aco', '', 2, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(5, 'amz-atp', 'ATABAPO (San Fernando de Atabapo AMA)', 'ven-ori-amz-atpo', '', 2, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(6, 'amz-sjm', 'MANAPIARE (San Juan de Manapiare AMA)', 'ven-ori-amz-sjme', '', 2, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(7, 'amz-mro', 'MAROA (Maroa AMA)', 'ven-ori-amz-mroa', '3a5a5f83-ef4e-4e6c-ae9f-d73cea780d32', 2, 1, '2019-03-24 04:00:00', '2021-07-05 00:30:21'),
	(8, 'amz-scr', 'RIO NEGRO (San Carlos de Rio Negro AMA)', 'ven-ori-amz-scrn', '', 2, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(9, 'anz-sbv', 'SIMON BOLIVAR (Barcelona ANZ)', 'ven-ori-anz-bcna-sbvr', '', 3, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(10, 'anz-anc', 'ANACO (Anaco ANZ)', 'ven-ori-anz-anco', 'fdbf6d5f-09da-4c6b-9455-8c872487c88e', 3, 1, '2019-03-24 04:00:00', '2021-07-07 19:52:58'),
	(11, 'anz-ara', 'ARAGUA (Aragua de Barcelona ANZ)', 'ven-ori-anz-bcna-arag', '', 3, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(12, 'anz-dbd', 'DIEGO BAUTISTA DE URBANEJA (Lecheria ANZ)', 'ven-ori-anz-lec-dbdu', '', 3, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(13, 'anz-fdp', 'FERNANDO DE PENALVER (Puerto Piritu ANZ)', 'ven-ori-anz-ptop-fdp', '', 3, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(14, 'anz-fdc', 'FRANCISCO DEL CARMEN CARVAJAL (Valle de Guanape ANZ)', 'ven-ori-anz-vgpe-fdcc', '', 3, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(15, 'anz-fdm', 'FRANCISCO DE MIRANDA (Pariaguán ANZ)', 'ven-ori-anz-pgan-fdm', '', 3, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(16, 'anz-gnt', 'GUANTA (Guanta ANZ)', 'ven-ori-anz-gnta', '', 3, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(17, 'anz-idc', 'INDEPENDENCIA (Soledad ANZ)', 'ven-ori-anz-sldad-idcia', '', 3, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(19, '03-10', 'JOSE GREGORIO MONAGAS (Mapiare ANZ)', 'ven-ori-anz-03-10', '', 3, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(20, 'anz-jas', 'JUAN ANTONIO SOTILLO (Puerto La Cruz ANZ)', 'ven-ori-anz-plc-jas', '', 3, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(21, 'anz-lbt', 'LIBERTAD (San Mateo ANZ)', 'ven-ori-anz-sm-lbtd', '', 3, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(22, 'var-vga', 'VARGAS (La Guaira VAR)', 'ven-ctr-var-lgra-vgas', '57891654-23fd-4df9-8f36-4e3ffead3215', 22, 1, '2019-03-24 04:00:00', '2021-07-07 19:53:41'),
	(23, 'anz-jmc', 'JUAN MANUEL CAJIGAL (Onoto ANZ)', 'ven-ori-anz-onto-jmc', '', 3, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(24, 'anz-meb', 'MANUEL EZEQUIEL BRUZUAL (Clarines ANZ)', 'ven-ori-anz-crnes-meb', '', 3, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(25, '03-15', 'PEDRO MARIA FREITES (Cantaura ANZ)', 'ven-ori-anz-03-15', '', 3, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(26, 'anz-prt', 'PIRITU (Piritu ANZ)', 'ven-ori-anz-prtu', '', 3, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(27, '03-17', 'SAN JOSE DE GUANIPA (El tigrito ANZ)', 'ven-ori-anz-03-17', '', 3, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(28, '03-18', 'SAN JUAN DE CAPISTRANO (Boca de Uchire ANZ)', 'ven-ori-anz-03-18', '', 3, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(29, '03-19', 'SANTA ANA (Santa Ana ANZ)', 'ven-ori-anz-03-19', '', 3, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(30, '03-20', 'SIMON RODRIGUEZ (El Tigre ANZ)', 'ven-ori-anz-03-20', '', 3, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(31, 'apu-sfa', 'SAN FERNANDO (San Fernando APU)', 'ven-lla-apu-sfapre', '', 4, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(32, '04-02', 'ACHAGUAS (Achaguas ANZ)', 'ven-lla-apu-04-02', '', 4, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(33, '04-03', 'BIRUACA (Biruaca APU)', 'ven-ori-anz-04-03', '', 3, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(34, '04-04', 'MUNOZ (Bruzual APU)', 'ven-lla-apu-04-04', '', 4, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(35, '04-05', 'PAEZ (Guasdualito APU)', 'ven-lla-apu-04-05', '', 4, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(36, '04-06', 'PEDRO CAMEJO (San Juan de Payara APU)', 'ven-lla-apu-04-06', '', 4, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(37, '04-07', 'ROMULO GALLEGOS (Elorza APU)', 'ven-lla-apu-04-07', '', 4, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(38, '05-01', 'GIRARDOT (Maracay ARA)', 'ven-ctr-ara-05-01', '', 5, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(39, '05-02', 'BOLIVAR (San Mateo ARA)', 'ven-ctr-ara-05-02', '', 5, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(40, '05-03', 'CAMATAGUA (Camatagua ARA)', 'ven-ctr-ara-05-03', '', 5, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(41, '05-04', 'FRANCISCO LINARES ALCANTARAS (Santa Rita ARA)', 'ven-ctr-ara-05-04', '', 5, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(42, '05-05', 'JOSE ANGEL LAMAS (Santa Cruz ARA)', 'ven-ctr-ara-05-05', '', 5, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(43, '05-06', 'JOSE FELIZ RIVAS (La Victoria ARA)', 'ven-ctr-ara-05-06', '', 5, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(44, '05-07', 'JOSE RAFAEL REVENGA (El Concejo ARA)', 'ven-ctr-ara-05-07', '', 5, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(45, '05-08', 'LIBERTADOR (Palo Negro ARA)', 'ven-ctr-ara-05-08', '', 5, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(46, '05-09', 'MARIO BRICENO IRAGORY (El Limon ARA)', 'ven-ctr-ara-05-09', '', 5, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(47, '05-10', 'OCUMARE (Ocumare de la Costa ARA)', 'ven-ctr-ara-05-10', '', 5, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(48, '05-11', 'SAN CASIMIRO (San Casimiro ARA)', 'ven-ctr-ara-05-11', '', 5, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(49, '05-12', 'SAN SEBASTIAN (San Sebastian ARA)', 'ven-ctr-ara-05-12', '', 5, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(50, '05-13', 'SANTIAGO MARINO (Turmero ARA)', 'ven-ctr-ara-05-13', '', 5, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(51, '05-14', 'SANTOS MICHELENA (Las Tejerias ARA)', 'ven-ctr-ara-05-14', '', 5, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(52, '05-15', 'SUCRE (Cagua ARA)', 'ven-ctr-ara-05-15', '', 5, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(53, '05-16', 'TOVAR (Colonia Tovar ARA)', 'ven-ctr-ara-05-16', '', 5, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(54, '05-17', 'URDANETA (Barbacoas ARA)', 'ven-ctr-ara-05-17', '', 5, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(55, '05-18', 'ZAMORA (Villa de Cura ARA)', 'ven-ctr-ara-05-18', '', 5, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(56, '06-01', 'ARISMENDI (Arismendi BAR)', 'ven-lla-bar-06-01', '', 6, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(57, 'bar-brn', 'BARINAS (Barinas BAR)', 'ven-lla-bar-brn', '71001d3f-2d48-4733-89b0-273779230e64', 6, 1, '2019-04-07 04:00:00', '2021-07-07 19:55:06'),
	(60, 'bar-aeb', 'ANDRES ELOY BLANCO (El Canton BAR)', 'ven-lla-bar-ecton-aeb', '', 6, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(61, '06-04', 'BOLIVAR (Barinitas BAR)', 'ven-lla-bar-06-04', '', 6, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(62, '06-05', 'CRUZ PAREDES (Barrancas BAR)', 'ven-lla-bar-06-05', '', 6, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(63, '06-06', 'OBISPOS (Obispos BAR)', 'ven-lla-bar-06-06', '', 6, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(64, 'bar-pdz', 'PEDRAZA (Ciudad Bolivia BAR)', 'ven-lla-bar-cbol-pdza', '', 6, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(65, 'bar-rja', 'ROJAS (Libertad BAR)', 'ven-lla-bar-lbtad-rjas', '', 6, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(66, 'bar-ssa', 'SOSA (Ciudad de Nutrias BAR)', 'ven-lla-bar-ctrias-ssa', '', 6, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(67, 'bar-ajd', 'ANTONIO JOSE DE SUCRE (Socopo BAR)', 'ven-lla-bar-sopo-ajds', '', 6, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(68, 'bar-art', 'ARVELO TORREALBA (Sabaneta BAR)', 'ven-lla-bar-sbnta-artba', '', 6, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(69, 'bar-eqz', 'EZAQUIEL ZAMORA (Santa Barbara BAR)', 'ven-lla-bar-stabra-eqzra', '', 6, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(70, 'bol-agt', 'ANGOSTURA (Ciudad Piar BOL)', 'ven-ori-bol-cpiar-agtra', '', 7, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(71, 'bol-crn', 'CARONI (Ciudad Guayana BOL)', 'ven-ori-bol-cgna-crmi', '', 7, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(72, 'bol-cdn', 'CEDENO (Caicara del Orinoco BOL)', 'ven-ori-bol-ccdoco-cdno', '', 7, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(73, 'bol-ppc', 'PADRE PEDRO CHIEN (El Palmar BOL)', 'ven-ori-bol-epmar-ppc', '', 7, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(74, 'bol-ecl', 'EL CALLAO (El Callao BOL)', 'ven-ori-bol-ecllao', '', 7, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(75, 'bol-gbn', 'GRAN SABANA (Sta. Elena de Uairen BOL)', 'ven-ori-bol-seu-gbna', '', 7, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(76, 'bol-hre', 'HERES (Ciudad Bolivar BOL)', 'ven-ori-bol-cbvar-hres', '', 7, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(77, 'bol-pia', 'PIAR (upata BOL)', 'ven-ori-bol-upta-piar', '', 7, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(78, 'bol-rsc', 'ROSCIA (Guasipati BOL)', 'ven-ori-bol-gspti-rscia', '', 7, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(79, 'bol-sfn', 'SIFONTES (Tumeremo BOL)', 'ven-ori-bol-trmo-sfnte', '', 7, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(80, 'bol-scr', 'SUCRE (Maripa BOL)', 'ven-ori-bol-mrpa-scre', '', 7, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(81, 'cbb-bjm', 'BEJUMA (Bejuma CBB)', 'ven-ctr-cbb-bjma', '', 8, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(82, 'cbb-car', 'CARLOS ARVELO (Guigue CBB)', 'ven-ctr-cbb-ggue-carvlo', '', 8, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(97, 'cbb-dib', 'DIEGO IBARRA (Mariara CBB)', 'ven-ctr-cbb-mrira-dibrra', '', 8, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(98, 'cbb-gcr', 'GUACARA (Guacara CBB)', 'ven-ctr-cbb-gcra', '', 8, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(99, 'cbb-jjm', 'JUAN JOSE MORA (Moron CBB)', 'ven-ctr-cbb-mron-jjmra', '', 8, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(100, 'cbb-lbd', 'LIBERTADOR (Tocuyito CBB)', 'ven-ctr-cbb-etyito-libdor', '', 8, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(101, 'cbb-lgy', 'LOS GUAYOS (Los Guayos CBB)', 'ven-ctr-cbb-lgyos', '', 8, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(102, '08-08', 'MIRANDA (Miranda CBB)', 'ven-ctr-cbb-08-08', '', 8, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(103, '08-09', 'MONTALBAN (Montalban CBB)', 'ven-ctr-cbb-08-09', '', 8, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(104, '08-10', 'NAGUANAGUA (Naguanagua CBB)', 'ven-ctr-cbb-08-10', '', 8, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(105, 'pcbo', 'PUERTO CABELLO (Puero Cabello CBB)', 'ven-ctr-cbb-pcbo', 'ae1c0ff0-debd-4acc-bec4-aa0084857011', 8, 1, '2019-04-07 04:00:00', '2021-07-07 18:35:41'),
	(106, '08-12', 'SAN DIEGO (San Diego CBB)', 'ven-ctr-cbb-08-12', '', 8, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(107, '08-13', 'SAN JUAQUIN (San Juaquin CBB)', 'ven-ctr-cbb-08-13', '', 8, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(108, 'vlcia', 'VALENCIA (Valencia CBB)', 'ven-ctr-cbb-vlcia', '5163a6dd-c566-4b2d-8318-08785bd308ac', 8, 1, '2019-04-07 04:00:00', '2021-07-07 19:09:52'),
	(109, '09-01', 'ANZOATEGUI (Cojedes COJ)', 'ven-lla-coj-09-01', '', 9, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(110, '09-02', 'PAO DE SAN JUAN BAUTISTA (El Pao)', 'ven-lla-coj-09-02', '', 9, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(111, '09-03', 'TINAQUILLO (Tinaquillo COJ)', 'ven-lla-coj-09-03', '', 9, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(112, '09-04', 'GIRARDOT (Macapo COJ)', 'ven-lla-coj-09-04', '', 9, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(113, '09-05', 'RICAURTE (Libertad COJ)', 'ven-lla-coj-09-05', '', 9, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(114, '09-06', 'ROMULO GALLEGOS (Las Vegas COJ)', 'ven-lla-coj-09-06', '', 9, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(115, 'scls', 'SAN CARLOS (San Carlos COJ)', 'ven-lla-coj-scls', 'e170e17e-69e3-4be3-ad49-29ecb3f36d4c', 9, 1, '2019-04-07 04:00:00', '2021-07-07 19:18:53'),
	(116, 'tnco', 'TINACO (Tinaco COJ)', 'ven-lla-coj-tnco', 'e78b6b70-a374-43d0-82ab-eaf5423b124a', 9, 1, '2019-04-07 04:00:00', '2021-07-07 19:56:40'),
	(117, '10-01', 'ANTONIO DIAZ (Curiapo DAM)', 'ven-ori-dam-10-01', '', 10, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(118, '10-02', 'CASACOIMA (Sierra Imataca DAM)', 'ven-ori-dam-10-02', '', 10, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(119, '10-03', 'PERDENALES (Perdenales DAM)', 'ven-ori-dam-10-03', '', 10, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(120, '10-04', 'TUCUPITA (Tucupita DAM)', 'ven-ori-dam-10-04', '', 10, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(121, '11-01', 'ACOSTA (San Juan de los Cayos FAL)', 'ven-occ-fal-11-01', '', 11, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(122, '11-02', 'BOLIVAR (San Luis FAL)', 'ven-occ-fal-11-02', '', 11, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(123, '11-03', 'BUCHIVACOA (Capatárida FAL)', 'ven-occ-fal-11-03', '', 11, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(124, '11-04', 'CARIRUBANA (Punto Fijo FAL)', 'ven-occ-fal-11-04', '', 11, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(125, '11-05', 'COLINA (La Vela de Coro FAL)', 'ven-occ-fal-11-05', '', 11, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(126, '11-06', 'DABAJURO (Dabajuro FAL)', 'ven-occ-fal-11-06', '', 11, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(127, '11-07', 'DEMOCRACIA (Pedregal FAL)', 'ven-occ-fal-11-07', '', 11, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(128, '11-08', 'FALCON (Pueblo Nuevo FAL)', 'ven-occ-fal-11-08', '', 11, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(129, '11-09', 'FEDERACION (Churuguara FAL)', 'ven-occ-fal-11-09', '', 11, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(130, '11-10', 'ITURRIZA (Chichiriviche FAL)', 'ven-occ-fal-11-10', '', 11, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(131, '11-11', ' JACURA (Jacura FAL)', 'ven-occ-fal-11-11', '', 11, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(132, '11-12', 'LOS TAQUES (Santa Cruz de Los Taques FAL)', 'ven-occ-fal-11-12', '', 11, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(133, '11-13', 'MAUROA (Mene de Mauroa FAL)', 'ven-occ-fal-11-13', '', 11, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(134, '11-14', 'CACIQUE MANAURE (Yaracal FAL)', 'ven-occ-fal-11-14', '', 11, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(137, '11-15', 'MIRANDA (Santa Ana de Coro FAL)', 'ven-occ-fal-11-15', '', 11, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(138, '11-16', 'PALMA SOLA (Palma Sola FAL)', 'ven-occ-fal-11-16', '', 11, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(139, '11-17', 'PETIT (Cabure FAL)', 'ven-occ-fal-11-17', '', 11, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(140, '11-18', 'PIRITU (Píritu FAL)', 'ven-occ-fal-11-18', '', 11, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(141, '11-19', 'SAN FRANCISCO (Mirimire FAL)', 'ven-occ-fal-11-19', '', 11, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(142, '11-20', 'JOSE LAURENCIO SILVA (Tucacas FAL)', 'ven-occ-fal-11-20', '', 11, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(143, '11-21', 'ZAMORA (Puerto Cumarebo FAL)', 'ven-occ-fal-11-21', '', 11, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(144, '12-01', 'CHAGUARAMAS (Chaguaramas GUA)', 'ven-lla-gua-12-01', '', 12, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(145, '12-02', 'CAMAGUAN (Camaguán GUA)', 'ven-lla-gua-12-02', '', 12, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(146, '12-03', 'El SOCORRO (El Socorro GUA)', 'ven-lla-gua-12-03', '', 12, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(147, '12-04', 'FRANCISCO DE MIRANDA (Calabozo GUA)', 'ven-lla-gua-12-04', '', 12, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(148, '12-05', 'LEONARDO INFANTE (Valle de la Pascua GUA)', 'ven-lla-gua-12-05', '', 12, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(149, '12-06', 'LAS MERCEDES (Las Mercedes del Llano GUA)', 'ven-lla-gua-12-06', '', 12, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(150, '12-07', 'JOSE FELIX RIVAS (Tucupido GUA)', 'ven-lla-gua-12-07', '', 12, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(151, '12-08', 'JOSE TADEO MONAGAS (Altagracia de Orituco GUA)', 'ven-lla-gua-12-08', '', 12, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(152, '12-09', 'JUAN GERMAN ROSCIO (San Juan De Los Morros GUA)', 'ven-lla-gua-12-09', '', 12, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(153, '12-10', 'JULIAN MELLADO (El Sombrero GUA)', 'ven-lla-gua-12-10', '', 12, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(154, '12-11', 'ORTIZ (Ortiz GUA)', 'ven-lla-gua-12-11', '', 12, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(155, '12-12', 'SAN GERONIMO DE GUAYABAL (Guayabal GUA)', 'ven-lla-gua-12-12', '', 12, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(156, '12-13', 'SAN JOSE DE GUARIBA (San José de Guaribe GUA)', 'ven-lla-gua-12-13', '', 12, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(157, '12-14', 'STA MARIA DE IPIRE (Santa María de Ipire GUA)', 'ven-lla-gua-12-14', '', 12, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(158, '12-15', 'ZARAZA (Zaraza GUA)', 'ven-lla-gua-12-15', '', 12, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(159, 'lar-aeb', 'ANDRES ELOY BLANCO (Sanare LAR)', 'ven-occ-lar-aeb', '9c7ed208-7410-4c09-a0a2-e9ac0640c22b', 13, 1, '2019-04-07 04:00:00', '2021-07-04 22:13:47'),
	(160, 'lar-cpo', 'CRESPO (Duaca LAR)', 'ven-occ-lar-cpo', 'b2b87bf8-ae47-4242-9216-968920a1b2f3', 13, 1, '2019-04-07 04:00:00', '2021-07-04 22:02:55'),
	(161, 'lar-irn', 'IRIBARREN (Barquisimeto BAR)', 'ven-occ-lar-irn', '67cbe3b1-d819-40de-b8d7-4ef68ca3d0f6', 13, 1, '2019-04-07 04:00:00', '2021-07-04 22:14:22'),
	(162, 'lar-jim', 'JIMENEZ (Quíbor LAR)', 'ven-occ-lar-jim', '140869f2-33b3-4622-b596-38b43b036a30', 13, 1, '2019-04-07 04:00:00', '2021-07-04 22:15:09'),
	(163, 'lar-mor', 'MORAN (El Tocuyo LAR)', 'ven-occ-lar-mor', 'edf35fa8-f3af-4f75-bc1d-1cf3b7240784', 13, 1, '2019-04-07 04:00:00', '2021-07-04 22:15:30'),
	(164, 'lar-pal', 'PALAVECINO (Cabudare LAR)', 'ven-occ-lar-pal', '35d0f14b-0f3e-4653-9e05-ab5c43566316', 13, 1, '2019-04-07 04:00:00', '2021-07-04 22:15:37'),
	(165, 'lar-spa', 'SIMON PLANAS (Sarare LAR)', 'ven-occ-lar-spa', 'd10ba4ad-0469-4709-9f48-5b30155cc8d7', 13, 1, '2019-04-07 04:00:00', '2021-07-04 22:16:03'),
	(166, 'lar-tor', 'TORRES (Carora LAR)', 'ven-occ-lar-tor', 'ac1214f0-dbde-4f21-b2af-7daaee953f7e', 13, 1, '2019-04-07 04:00:00', '2021-07-04 22:16:12'),
	(167, 'lar-uta', 'URDANETA (Siquisique LAR)', 'ven-occ-lar-uta', 'ded938d9-356a-49a2-8be3-aa5a665f949a', 13, 1, '2019-04-07 04:00:00', '2021-07-04 22:16:34'),
	(168, '14-01', 'ALBERTO ADRIANI (El Vigía MER)', 'ven-and-mer-14-01', '', 14, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(169, '14-02', 'ANDRES BELLO (La Azulita MER)', 'ven-and-mer-14-02', '', 14, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(170, '14-03', 'PINTO SALINAS (Santa Cruz de Mora MER)', 'ven-and-mer-14-03', '', 14, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(171, 'argua', 'ARICAGUA (Aricagua MER)', 'ven-and-mer-argua', 'c8911bcf-b3f0-4c57-8819-9d4780405d41', 14, 1, '2019-04-07 04:00:00', '2021-07-07 18:38:17'),
	(172, '14-05', 'ARZOBISPO CHACON (Canagua MER)', 'ven-and-mer-14-05', '', 14, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(173, '14-06', 'CAMPO ELIAS (Ejido MER)', 'ven-and-mer-14-06', '', 14, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(174, '14-07', 'CARACCIOLO PARRA OLMEDO (Tucani MER)', 'ven-and-mer-14-07', '', 14, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(175, '14-08', 'CARDENAL QUINTERO (Santo Domingo MER)', 'ven-and-mer-14-08', '', 14, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(176, '14-09', 'GUARAQUE (Guaraque MER)', 'ven-and-mer-14-09', '', 14, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(177, '14-10', 'JULIO CESAR SALAS (Arapuey MER)', 'ven-and-mer-14-10', '', 14, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(178, '14-11', 'JUSTO BRICENO (Torondoy MER)', 'ven-and-mer-14-11', '', 14, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(179, '14-12', 'LIBERTADOR (Mérida MER)', 'ven-and-mer-14-12', '', 14, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(180, '14-13', 'MIRANDA (Timotes MER)', 'ven-and-mer-14-13', '', 14, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(181, '14-14', 'OBISPO RAMOS DE LORA (Santa Elena de Arenales MER)', 'ven-and-mer-14-14', '', 14, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(182, '14-15', 'PADRE NOGUERA (Santa María de Caparo MER)', 'ven-and-mer-14-15', '', 14, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(183, '14-16', 'PUEBLO LLANO (Pueblo Llano)', 'ven-and-mer-14-16', '', 14, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(184, '14-17', 'RANGEL (Mucuchíes MER)', 'ven-and-mer-14-17', '', 14, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(185, '14-18', 'RIVAS DAVILA (Bailadores MER)', 'ven-and-mer-14-18', '', 14, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(186, '14-19', 'SANTOS MARQUINA (Tabay MER)', 'ven-and-mer-14-19', '', 14, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(187, '14-20', 'SUCRE (Lagunillas MER)', 'ven-and-mer-14-20', '', 14, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(188, '14-21', 'TOVAR (Tovar MER)', 'ven-and-mer-14-21', '', 14, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(189, '14-22', 'TULIO FEBRES CORDERO (Nueva Bolivia MER)', 'ven-and-mer-14-22', '', 14, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(190, '14-23', 'ZEA (Zea MER)', 'ven-and-mer-14-23', '', 14, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(191, '15-01', 'ACEVEDO (Caucagua MIR)', 'ven-ctr-mir-15-01', '', 15, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(192, '15-02', 'ANDRES BELLO (Barlovento MIR)', 'ven-ctr-mir-15-02', '', 15, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(193, '15-03', 'BARUTA (Baruta MIR)', 'ven-ctr-mir-15-03', '', 15, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(194, '15-04', 'BRION (Higuerote MIR)', 'ven-ctr-mir-15-04', '', 15, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(195, '15-05', 'BOLIVAR (Yare MIR)', 'ven-ctr-mir-15-05', '', 15, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(196, '15-06', 'BUROZ (Mamporal MIR)', 'ven-ctr-mir-15-06', '', 15, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(197, '15-07', 'CARRIZAL (Carrizal MIR)', 'ven-ctr-mir-15-07', '', 15, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(198, '15-08', 'CHACAO (Chacao MIR)', 'ven-ctr-mir-15-08', '', 15, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(199, '15-09', 'EL HATILLO (El Hatillo MIR)', 'ven-ctr-mir-15-09', '', 15, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(200, 'gpuro', 'GUAICAIPURO (Los Teques MIR)', 'ven-ctr-mir-gpuro', 'b10b9191-e39a-4e0b-8cb2-86bb0fc69767', 15, 1, '2019-04-07 04:00:00', '2021-07-07 18:44:23'),
	(201, '15-11', 'GUAL (Cúpira MIR)', 'ven-ctr-mir-15-11', '', 15, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(202, '15-12', 'INDEPENDENCIA (Santa Teresa del Tuy MIR)', 'ven-ctr-mir-15-12', '', 15, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(203, '15-13', 'LANDER (Ocumare del Tuy MIR)', 'ven-ctr-mir-15-13', '', 15, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(204, '15-14', 'LOS SALIAS (San Antonio de Los Altos MIR)', 'ven-ctr-mir-15-14', '', 15, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(205, '15-15', 'PAEZ (Río Chico MIR)', 'ven-ctr-mir-15-15', '', 15, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(206, '15-16', 'PAZ CASTILLO (Santa Lucía del Tuy MIR)', 'ven-ctr-mir-15-16', '', 15, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(207, '15-17', 'ROJAS (Charallave MIR)', 'ven-ctr-mir-15-17', '', 15, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(208, '15-18', 'SUCRE (Petare MIR)', 'ven-ctr-mir-15-18', '', 15, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(209, '15-19', 'URDANETA (Cúa MIR)', 'ven-ctr-mir-15-19', '', 15, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(210, '15-20', 'ZAMORA (Guatire MIR)', 'ven-ctr-mir-15-20', '', 15, 1, '2019-04-07 04:00:00', '2019-04-07 04:00:00'),
	(211, 'mrin', 'MATURIN (Maturin MON)', 'ven-ori-mon-mrin', '27852c67-b9df-42df-b910-be127af40008', 16, 1, '2019-08-03 16:38:48', '2021-07-07 18:41:02'),
	(212, '16-02', 'ACOSTA (San Antonio de Maturin MON)', 'ven-ori-mon-16-02', '', 16, 1, '2019-08-03 16:39:54', '2019-08-03 16:39:55'),
	(213, '16-03', 'AGUASAY (Aguasay MON)', 'ven-ori-mon-16-03', '', 16, 1, '2019-08-03 16:40:58', '2019-08-03 16:40:59'),
	(214, '16-04', 'BOLIVAR (Caripito MON)', 'ven-ori-mon-16-04', '', 16, 1, '2019-08-03 16:41:43', '2019-08-03 16:41:43'),
	(215, '16-05', 'CARIPE (Caripe MON)', 'ven-ori-mon-16-05', '', 16, 1, '2019-08-03 16:42:08', '2019-08-03 16:42:08'),
	(216, '16-06', 'CEDENO (Caicara de Maturin MON)', 'ven-ori-mon-16-06', '', 16, 1, '2019-08-03 16:43:01', '2019-08-03 16:43:01'),
	(217, '16-07', 'EZEQUIEL ZAMORA (Punta de Mata MON)', 'ven-ori-mon-16-07', '', 16, 1, '2019-08-03 16:43:32', '2019-08-03 16:43:35'),
	(218, '17-01', 'ARISMENDI (La Asuncion NES)', 'ven-ori-nes-17-01', '', 17, 1, '2019-08-03 16:46:14', '2019-08-03 16:46:14'),
	(219, '17-02', 'ANTOLIN DEL CAMPO (Paraguachi NES)', 'ven-ori-nes-17-02', '', 17, 1, '2019-08-03 16:46:54', '2019-08-03 16:46:55'),
	(221, '17-03', 'DIAZ (San Juan Bautista NES)', 'ven-ori-nes-17-03', '', 17, 1, '2019-08-03 16:47:56', '2019-08-03 16:47:57'),
	(222, '17-04', 'GARCIA (El Valle del Espiritu Santo)', 'ven-ori-nes-17-04', '', 17, 1, '2019-08-03 17:05:59', '2019-08-03 17:06:00'),
	(223, '20-01', 'SAMUEL DARIO MALDONADO (La Tendida TAC)', 'ven-and-tac-20-01', '', 20, 1, '2020-01-03 15:20:38', '2020-01-03 15:20:38'),
	(224, '23-01', 'BRUZUAL (Chivaoa YAR)', 'ven-ctr-yar-23-01', '', 23, 1, '2020-01-03 16:32:36', '2020-01-03 16:32:37'),
	(225, '23-02', 'PEÑA (Yaritagua YAR)', 'ven-ctr-yar-23-02', '', 23, 1, '2020-01-04 15:19:39', '2020-01-04 15:19:40'),
	(226, 'mcbo', 'MARACAIBO (Maracaibo ZUL)', 'ven-occ-zul-mcbo', 'b7fda070-7631-4e25-90a1-99dd88a8b487', 24, 1, '2020-01-04 15:42:53', '2021-07-07 18:40:16'),
	(227, '20-02', 'SAN CRISTOBAL (San Cristobal TAC)', 'ven-and-tac-20-02', '', 20, 1, '2020-01-04 17:31:58', '2020-01-04 17:31:58'),
	(228, 'mpez', 'PAEZ (Acarigua POR)', 'ven-lla-por-mpez', 'd6127227-8335-4177-b89b-1218c8dcdaa9', 18, 1, '2020-01-04 18:13:57', '2021-07-07 19:51:55'),
	(229, '18-02', 'ARAURE (Araure POR)', 'ven-lla-por-18-02', '', 18, 1, '2020-06-01 14:04:13', '2020-06-01 14:04:14'),
	(230, 'sfpe', 'SAN FELIPE (San Felipe YAR)', 'ven-ctr-sfpe', '9158634c-dedb-40f9-b5c7-8205ff4654e6', 23, 1, '2021-07-08 05:29:12', '2021-07-08 05:29:12');

-- Volcando estructura para tabla igtt4api.partners
CREATE TABLE IF NOT EXISTS `partners` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `partner_co` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefone_co` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax_co` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_co` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fiscal_document_co` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_contact` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone_contact` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_contact` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `partners_partner_co_unique` (`partner_co`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla igtt4api.partners: ~0 rows (aproximadamente)

-- Volcando estructura para tabla igtt4api.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla igtt4api.password_resets: ~0 rows (aproximadamente)

-- Volcando estructura para tabla igtt4api.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla igtt4api.personal_access_tokens: ~1 rows (aproximadamente)
REPLACE INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
	(290, 'App\\Models\\User', 1, 'rage-001', 'f4ee73228c2c3e1d47d7821989e7d8b4c0df1fbeb323ddf73134f3599bf06c3a', '["*"]', '2022-01-06 22:54:08', '2022-01-06 22:22:28', '2022-01-06 22:54:08');

-- Volcando estructura para tabla igtt4api.provinces
CREATE TABLE IF NOT EXISTS `provinces` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `province_co` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uuid` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `provinces_province_co_unique` (`province_co`) USING BTREE,
  KEY `provinces_region_id_foreign` (`region_id`) USING BTREE,
  CONSTRAINT `FK_region` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla igtt4api.provinces: ~24 rows (aproximadamente)
REPLACE INTO `provinces` (`id`, `province_co`, `description`, `slug`, `uuid`, `region_id`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 'ctr-ddf', 'DISTRITO FEDERAL', 'ven-ctr-ddf', '34cfce03-6e47-4823-bb96-9363c19faa87', 1, 1, '2019-03-24 04:00:00', '2021-07-04 13:28:28'),
	(2, 'ori-amz', 'AMAZONAS', 'ven-ori-amz', '61c5fcd6-db0d-46c8-b9ea-ee03f9050695', 5, 1, '2019-03-24 04:00:00', '2021-07-04 13:29:00'),
	(3, 'ori-anz', 'ANZOATEGUI', 'ven-ori-anz', '15b2580d-10b5-4209-ba53-5d417c47eb41', 5, 1, '2019-03-24 04:00:00', '2021-07-04 13:29:10'),
	(4, 'lla-apu', 'APURE', 'ven-lla-apu', '5fff0c98-c776-44e8-8149-37168ce65c95', 4, 1, '2019-03-24 04:00:00', '2021-07-04 13:30:18'),
	(5, 'ctr-ara', 'ARAGUA', 'ven-ctr-ara', '2bd7104c-fc4b-4a94-adb4-f6b0ddfe090b', 1, 1, '2019-03-24 04:00:00', '2021-07-04 13:30:27'),
	(6, 'lla-bar', 'BARINAS', 'ven-lla-bar', 'aa4fc704-2cd5-40c3-8464-fec8f94e1cbd', 4, 1, '2019-03-24 04:00:00', '2021-07-04 13:31:28'),
	(7, 'ori-bol', 'BOLIVAR', 'ven-ori-bol', '352cda0c-0fa5-4978-b453-61fda841eb26', 5, 1, '2019-03-24 04:00:00', '2021-07-04 13:31:38'),
	(8, 'ctr-cbb', 'CARABOBO', 'ven-ctr-cbb', '13254d70-f0fd-4389-b156-c5e691525c32', 1, 1, '2019-03-24 04:00:00', '2021-07-04 13:32:26'),
	(9, 'lla-coj', 'COJEDES', 'ven-lla-coj', '2c550288-02eb-4411-8808-c76fa67ec8a8', 4, 1, '2019-03-24 04:00:00', '2021-07-04 13:32:38'),
	(10, 'ori-dam', 'DELTA AMACURO', 'ven-ori-dam', 'c1286be7-4098-4f6d-98be-2b520ffb7c32', 5, 1, '2019-03-24 04:00:00', '2021-07-04 13:33:22'),
	(11, 'occ-fal', 'FALCON', 'ven-occ-fal', '4fc05adc-ed76-4a75-96a9-42790261a951', 3, 1, '2019-03-24 04:00:00', '2021-07-04 13:33:37'),
	(12, 'lla-gua', 'GUARICO', 'ven-lla-gua', '687b30dd-a228-4b46-9131-75264f5728b1', 4, 1, '2019-03-24 04:00:00', '2021-07-04 13:33:59'),
	(13, 'occ-lar', 'LARA', 'ven-occ-lar', '89c47dc2-233c-4777-a52f-a4717571bbf1', 3, 1, '2019-03-24 04:00:00', '2021-07-04 13:30:58'),
	(14, 'and-mer', 'MERIDA', 'ven-and-mer', '37b3d71d-6977-4c23-85a4-9295179f5cfa', 6, 1, '2019-03-24 04:00:00', '2021-07-04 13:34:35'),
	(15, 'ctr-mir', 'MIRANDA', 'ven-ctr-mir', '9f1d431e-24dd-4724-8abf-5464d8660544', 1, 1, '2019-03-24 04:00:00', '2021-07-04 13:35:03'),
	(16, 'ori-mon', 'MONAGAS', 'ven-ori-mon', '5edbfc25-7fae-45bb-a933-583731c9b789', 5, 1, '2019-03-24 04:00:00', '2021-07-04 13:35:14'),
	(17, 'ori-nes', 'NUEVA ESPARTA', 'ven-ori-nes', '306b01e9-4dcd-445f-b49f-dfa6713660bd', 5, 1, '2019-03-24 04:00:00', '2021-07-04 13:36:32'),
	(18, 'lla-por', 'PORTUGUESA', 'ven-lla-por', 'dc508beb-c506-4d1a-a00d-f70e78d086b4', 4, 1, '2019-03-24 04:00:00', '2021-07-04 13:36:09'),
	(19, 'ori-suc', 'SUCRE', 'ven-ori-suc', 'c405b379-608e-41f5-97d8-89b78f69d867', 5, 1, '2019-03-24 04:00:00', '2021-07-04 13:37:46'),
	(20, 'and-tac', 'TACHIRA', 'ven-and-tac', '4a51842c-60cf-4f0f-9dbc-e33d9d9e0e83', 6, 1, '2019-03-24 04:00:00', '2021-07-04 13:37:56'),
	(21, 'and-tru', 'TRUJILLO', 'ven-and-tru', 'b70a20c6-c66a-41b9-b22a-04dbf3810bab', 6, 1, '2019-03-24 04:00:00', '2021-07-04 13:35:43'),
	(22, 'ctr-var', 'VARGAS', 'ven-ctr-var', '86681805-7dc0-42fe-80e1-c8e3b5334fb9', 1, 1, '2019-03-24 04:00:00', '2021-07-04 13:38:14'),
	(23, 'ctr-yar', 'YARACUY', 'ven-ctr-yar', '036874e3-5436-4170-a197-f344e6b25095', 1, 1, '2019-03-24 04:00:00', '2021-07-04 13:37:08'),
	(24, 'occ-zul', 'ZULIA', 'ven-occ-zul', 'ddd88d92-23dd-45c7-84b3-f7898e9902c4', 3, 1, '2019-03-24 04:00:00', '2021-07-05 00:06:36');

-- Volcando estructura para tabla igtt4api.regions
CREATE TABLE IF NOT EXISTS `regions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `region_co` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuid` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `regions_region_co_unique` (`region_co`) USING BTREE,
  KEY `regions_country_id_foreign` (`country_id`) USING BTREE,
  CONSTRAINT `FK_country` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla igtt4api.regions: ~5 rows (aproximadamente)
REPLACE INTO `regions` (`id`, `region_co`, `description`, `country_id`, `created_at`, `updated_at`, `slug`, `uuid`, `user_id`) VALUES
	(1, 'ctr', 'CENTRO', 2, '2019-03-24 04:00:00', '2021-06-13 02:52:43', 'ven-ctr', 'b99a8c51-09d3-455f-9795-27969ca8fe91', 1),
	(3, 'occ', 'OCCIDENTE', 2, '2019-03-24 04:00:00', '2021-06-13 02:53:34', 'ven-occ', 'b93b8dc2-2539-4a2a-8f1e-0d1a63ff9a3b', 1),
	(4, 'lla', 'LOS LLANOS', 2, '2019-03-24 04:00:00', '2021-06-13 02:53:47', 'ven-lla', 'a91b2f82-5f81-4c9e-8da6-a8adae735d4d', 1),
	(5, 'ori', 'ORIENTE', 2, '2019-03-24 04:00:00', '2021-06-13 02:53:57', 'ven-ori', '5c6b0157-8e7b-437f-ae21-15224530a959', 1),
	(6, 'and', 'LOS ANDES', 2, '2019-03-24 04:00:00', '2021-06-13 02:54:08', 'ven-and', '4441c85c-7eb2-458c-8df2-068e77732db5', 1);

-- Volcando estructura para tabla igtt4api.routes
CREATE TABLE IF NOT EXISTS `routes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `route_co` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uuid` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_city_id` bigint(20) unsigned DEFAULT NULL,
  `to_city_id` bigint(20) unsigned DEFAULT NULL,
  `k_level_co` enum('A','B','C') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'A' COMMENT 'A->Plain, B->Semi Mountainous, C->Mountainous',
  `distance_km` double(22,2) NOT NULL,
  `estimated_time_hrs` double(6,2) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `routes_route_co_unique` (`route_co`) USING BTREE,
  UNIQUE KEY `routes_cities_unique` (`from_city_id`,`to_city_id`) USING BTREE,
  KEY `routes_from_city_foreign` (`from_city_id`) USING BTREE,
  KEY `routes_end_city_foreign` (`to_city_id`) USING BTREE,
  CONSTRAINT `FK_routes_city_from` FOREIGN KEY (`from_city_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `FK_routes_city_to` FOREIGN KEY (`to_city_id`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla igtt4api.routes: ~17 rows (aproximadamente)
REPLACE INTO `routes` (`id`, `route_co`, `description`, `slug`, `uuid`, `from_city_id`, `to_city_id`, `k_level_co`, `distance_km`, `estimated_time_hrs`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, '11-12', 'BARQUISIMETO - CARORA', 'bqto-carora', '69f47037-6cb5-4368-a2e2-7c26c2ecb1d9', 11, 12, 'B', 102.37, 2.16, 1, '2020-05-23 14:18:53', '2021-12-09 01:19:51'),
	(2, '11-30', 'BARQUISIMETO - QUIBOR', 'bqto-quibor', 'c9e07756-06ab-4d34-9805-caaef02c8962', 11, 30, 'A', 39.27, 0.83, 1, '2020-05-23 14:29:06', '2021-12-09 01:20:26'),
	(3, '11-18', 'BARQUISIMETO - CABUDARE', 'bqto-cabudare', 'd567d5e8-5c77-4d72-a8d6-7f2bc834625b', 11, 18, 'A', 12.22, 0.36, 1, '2020-05-23 20:00:18', '2021-12-09 01:20:37'),
	(4, '11-20', 'BARQUISIMETO - CHIVACOA', 'bqto-chivacoa', '14e201fc-0919-40ff-b115-74bc6e386422', 11, 20, 'A', 58.00, 1.22, 1, '2020-05-23 20:13:17', '2021-12-09 01:22:50'),
	(5, '11-21', 'BARQUISIMETO - YARITAGUA', 'bqto-yaritagua', '8b179cab-d026-4842-9a5b-9e9d9d8e9d2a', 11, 21, 'A', 24.57, 0.52, 1, '2020-05-23 20:14:38', '2021-12-09 01:23:33'),
	(6, '11-24', 'BARQUISIMETO - ACARIGUA', 'bqto-acarigua', '6c16116e-cbf9-4f58-8cbb-8ef4045aa776', 11, 24, 'A', 78.00, 1.00, 1, '2020-06-01 13:56:07', '2021-12-09 01:23:43'),
	(7, '11-33', 'BARQUISIMETO - ARAURE', 'bqto-apure', '3f9fe2c8-fa9f-445f-84a4-9b416296bdca', 11, 33, 'A', 77.00, 1.00, 1, '2020-06-01 14:07:27', '2021-12-09 01:23:55'),
	(8, '11-13', 'BARQUISIMETO - LA PASTORA', 'bqto-lapastora', '1cd16b0d-4878-4d4b-852c-d73c11641312', 11, 13, 'A', 118.00, 3.00, 1, '2021-02-07 18:17:54', '2021-12-09 01:24:33'),
	(9, '21-11', 'YARITAGUA - BARQUISIMETO', 'yaritagua-bqto', '960ae4f0-52f2-4392-a2ee-27a24db6127c', 21, 11, 'A', 24.00, 0.00, 1, '2021-02-07 18:36:22', '2021-12-09 01:24:42'),
	(10, '20-11', 'CHIVACOA - BARQUISIMETO', 'chivacoa-bqto', '443ad798-c6ed-4ae5-812e-d414b3c93213', 20, 11, 'A', 58.00, 1.00, 1, '2021-02-07 18:37:59', '2021-12-09 01:24:50'),
	(11, '12-11', 'CARORA - BARQUISIMETO', 'carora-bqto', 'd24c3174-eea7-4990-b834-e6996871b79f', 12, 11, 'A', 102.00, 2.00, 1, '2021-02-07 18:46:03', '2021-12-09 01:25:10'),
	(12, '11-1', 'BARQUISIMETO - CARACAS', 'bqto-ccs', '191205d7-96c0-4ffc-8858-2e32eca7fa1f', 11, 1, 'B', 365.00, 4.99, 1, '2021-12-09 01:37:27', '2021-12-09 01:37:27'),
	(13, '11-5', 'BARQUISIMETO - MARACAY', 'bqto-mrcy', '4555310c-3af3-456a-92bb-deaaaf0d482c', 11, 5, 'B', 248.40, 3.50, 1, '2021-12-09 01:39:28', '2021-12-09 01:39:28'),
	(14, '5-11', 'MARACAY - BARQUISIMETO', 'mrcy-bqto', 'ca9ccfa8-d09b-4619-b354-af20637ede7e', 5, 11, 'B', 248.40, 3.50, 1, '2021-12-09 01:42:07', '2021-12-09 01:42:07'),
	(15, '1-11', 'CARACAS - BARQUISIMETO', 'ccs-bqto', '783dd325-cc66-4bf3-b56f-4cb2a68924ff', 1, 11, 'B', 365.00, 4.99, 1, '2021-12-09 01:45:18', '2021-12-09 01:45:18'),
	(16, '11-35', 'BARQUISIMETO - VALENCIA', 'bqto-vlcia', 'c8e315de-7ca7-4bcc-b51d-9e1a02b2d370', 11, 35, 'B', 188.70, 2.99, 1, '2021-12-09 02:50:19', '2021-12-09 02:50:19'),
	(17, '35-11', 'VALENCIA - BARQUISIMETO', 'vlcia-bqto', '427e26a4-5bf7-4e65-9fac-4eff24fe1be4', 35, 11, 'B', 188.70, 2.99, 1, '2021-12-09 03:04:54', '2021-12-09 03:04:54');

-- Volcando estructura para tabla igtt4api.route_locations
CREATE TABLE IF NOT EXISTS `route_locations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `route_id` bigint(20) unsigned NOT NULL,
  `location_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_route_location` (`route_id`,`location_id`),
  KEY `FK_route_location` (`location_id`),
  CONSTRAINT `FK_route_locations_location` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `FK_route_locations_route` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Locaciones que transita la ruta';

-- Volcando datos para la tabla igtt4api.route_locations: ~1 rows (aproximadamente)
REPLACE INTO `route_locations` (`id`, `route_id`, `location_id`) VALUES
	(5, 1, 12),
	(4, 1, 13);

-- Volcando estructura para tabla igtt4api.shops
CREATE TABLE IF NOT EXISTS `shops` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `shop_co` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` bigint(20) unsigned DEFAULT 0,
  `address` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nu_gps_lat` double(8,4) NOT NULL DEFAULT 0.0000,
  `nu_gps_lon` double(8,4) NOT NULL DEFAULT 0.0000,
  `telephone_co` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax_co` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_contact` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_contact` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone_contact` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `uuid` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `shop_shops_co_unique` (`shop_co`) USING BTREE,
  KEY `shops_location_id_foreign` (`location_id`) USING BTREE,
  CONSTRAINT `FK_shops_location` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla igtt4api.shops: ~6 rows (aproximadamente)
REPLACE INTO `shops` (`id`, `shop_co`, `description`, `location_id`, `address`, `nu_gps_lat`, `nu_gps_lon`, `telephone_co`, `fax_co`, `email`, `name_contact`, `email_contact`, `telephone_contact`, `user_id`, `uuid`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 'MKR01', 'TIENDA MAKRO LA YAGUARA (CCS)', 1, 'Avenida Intercomunal de Antinamo, Caracas 1000, Distrito Capita', 10.4771, -66.9526, '(0212)4710310', '02124439946', 'st02vtas@makro.com.ve', 'Ronald Guerra', NULL, NULL, 1, 'd8ccd9f5-bfcb-43e4-8c4b-ef0b73df0c53', 'shop-mkr01', '2021-07-13 22:07:34', '2021-12-09 04:46:38'),
	(2, 'ANSCA', 'Almacenadora Nueva Segovia CA', 11, 'Av. Carlos Siffoni, con Calle 1, Edif. Almacenadora Nueva Segovia, Zona Industrial I, Barquisimeto', 0.0000, 0.0000, '(0251)269.2982 (0251)269.1483 (0251)441.1245 (0251', NULL, '', NULL, NULL, NULL, 1, '5d2b7273-93cf-47d5-9b95-74700fa48853', 'shop-ansca', '2021-07-13 21:12:28', '2021-12-09 04:47:40'),
	(3, 'ASCPCA', 'Almacenadora de Semillas y Cereales Portuguesa CA', 30, 'Av. Trino Melean, Galpón S/N (Frente a Corpoelec), Baraure, Araure', 0.0000, 0.0000, '(0255)665.2345 (0412)051.0365', NULL, '', NULL, NULL, NULL, 1, '605b4694-168d-4a16-b1e7-7f813f916090', 'shop- ascpca', '2021-07-13 21:15:41', '2021-12-09 04:46:53'),
	(4, 'PFGCA', 'Prosfiga CA', 11, 'Carrera 1, con Calle 1, Nº. 191, Zona Industrial III, Barquisimeto', 0.0000, 0.0000, '0251)269.2956', NULL, '', NULL, NULL, NULL, 1, '6f01517a-0d3c-481f-a0e5-8737c346f2fa', 'shop-pfgca', '2021-07-13 21:44:53', '2021-12-09 04:47:00'),
	(5, 'CEGCA', 'Comercializadora Eduardo Guaindo CA', 11, 'Mercado Mayorista de Barquisimeto, Galpón N°.6B, Centro, Barquisimeto', 0.0000, 0.0000, '(0251)269.0841', NULL, '', NULL, NULL, NULL, 1, '40dae7a6-8ec3-4ba9-918e-f5c1ce12eff8', 'shop-cegca', '2021-07-13 21:46:28', '2021-12-09 04:47:11'),
	(6, 'AEFDCA', 'Almacenamiento en Frio Deca', 32, '2da. Etapa, Zona Industrial I, MaracaiboAvenida 68, Maracaibo 4005, No. SE-GI-3 Zulia', 0.0000, 0.0000, '(0261)736.1877/0984', NULL, 'atencionalcliente@enfriodeca.com', NULL, NULL, NULL, 1, '92e47059-5c90-42d9-bc14-64a693ae5a95', 'shop-aefdca', '2021-07-13 22:07:32', '2021-12-09 04:47:51');

-- Volcando estructura para tabla igtt4api.subsidiaries
CREATE TABLE IF NOT EXISTS `subsidiaries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subsidiary_co` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `shop_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `uuid` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `subsidiaries_subsidiary_co_unique` (`subsidiary_co`) USING BTREE,
  KEY `subsidiaries_customer_id_foreign` (`customer_id`) USING BTREE,
  KEY `FK_subsidiaries_shop` (`shop_id`),
  CONSTRAINT `FK_subsidiaries_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `FK_subsidiaries_shop` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla igtt4api.subsidiaries: ~0 rows (aproximadamente)
REPLACE INTO `subsidiaries` (`id`, `subsidiary_co`, `customer_id`, `shop_id`, `user_id`, `uuid`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 'MKR01', 1, 1, 1, 'c00334a3-7f35-4445-8fe7-97d0f3368c3c', 'sbdry-mkr-001', '2021-07-13 00:21:45', '2021-12-09 14:02:26');

-- Volcando estructura para tabla igtt4api.tolls
CREATE TABLE IF NOT EXISTS `tolls` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `toll_co` varchar(5) NOT NULL,
  `descriptions` varchar(80) NOT NULL,
  `location_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_toll` (`toll_co`),
  KEY `FK__locations` (`location_id`),
  CONSTRAINT `FK__locations` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla igtt4api.tolls: ~3 rows (aproximadamente)
REPLACE INTO `tolls` (`id`, `toll_co`, `descriptions`, `location_id`, `user_id`, `created_at`, `update_at`) VALUES
	(1, 'PJ-01', 'Peaje Cardenalito (LAR)', 28, 1, '2020-05-25 15:47:07', '2020-05-25 15:47:08'),
	(2, 'PJ-02', 'Peaje Casetejas (YAR)', 28, 1, '2021-03-09 10:28:38', '2022-03-09 10:28:38'),
	(3, 'PJ-03', 'Peaje Libertad (LAR)', 29, 1, '2021-03-09 10:36:49', '2022-03-09 10:36:49');

-- Volcando estructura para tabla igtt4api.toll_type_vehicle
CREATE TABLE IF NOT EXISTS `toll_type_vehicle` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `toll_id` bigint(20) unsigned NOT NULL,
  `type_vehicle_id` bigint(20) unsigned NOT NULL,
  `use_currency` varchar(3) NOT NULL DEFAULT '$',
  `currency_value` double(12,4) NOT NULL DEFAULT 0.0000,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_toll_type_vehicle_tolls` (`toll_id`),
  KEY `FK_toll_type_vehicle_type_vehicles` (`type_vehicle_id`),
  CONSTRAINT `FK_toll_type_vehicle_tolls` FOREIGN KEY (`toll_id`) REFERENCES `tolls` (`id`),
  CONSTRAINT `FK_toll_type_vehicle_type_vehicles` FOREIGN KEY (`type_vehicle_id`) REFERENCES `type_vehicles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla igtt4api.toll_type_vehicle: ~0 rows (aproximadamente)

-- Volcando estructura para tabla igtt4api.trailers
CREATE TABLE IF NOT EXISTS `trailers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `trailer_co` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `external_co` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_vehicle_id` bigint(20) unsigned NOT NULL,
  `year` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial_chassis` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `k_status` enum('AVAILABLE','MAINTENANCE','SERVING','DISCARDED','LOCATED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'AVAILABLE',
  `partner_id` bigint(20) unsigned DEFAULT NULL,
  `transfer_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `location_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trailers_trailer_co_unique` (`trailer_co`),
  UNIQUE KEY `trailers_external_co_unique` (`external_co`),
  KEY `trailers_partner_id_foreign` (`partner_id`),
  KEY `trailers_user_id_foreign` (`user_id`),
  KEY `FK_trailers_type_vehicles` (`type_vehicle_id`),
  CONSTRAINT `FK_trailers_type_vehicles` FOREIGN KEY (`type_vehicle_id`) REFERENCES `type_vehicles` (`id`),
  CONSTRAINT `trailers_partner_id_foreign` FOREIGN KEY (`partner_id`) REFERENCES `partners` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla igtt4api.trailers: ~0 rows (aproximadamente)

-- Volcando estructura para tabla igtt4api.trucks
CREATE TABLE IF NOT EXISTS `trucks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `truck_co` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `external_co` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_vehicle_id` bigint(20) unsigned NOT NULL,
  `k_active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `k_type_gas` enum('GAS','DIESEL','GASOLINE') NOT NULL DEFAULT 'DIESEL',
  `year` int(4) NOT NULL DEFAULT 0,
  `model` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `manufacturer` varchar(50) DEFAULT NULL,
  `serial_engine` varchar(50) DEFAULT NULL,
  `serial_chassis` varchar(50) DEFAULT NULL,
  `k_status` enum('AVAILABLE','MAINTENANCE','SERVING','DISCARDED','LOCATED') NOT NULL DEFAULT 'AVAILABLE',
  `k_system_inyection` enum('ELECTRONIC','CONVENTIONAL') NOT NULL DEFAULT 'ELECTRONIC',
  `partner_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `transfer_id` bigint(20) unsigned DEFAULT NULL,
  `location_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `trucks_truck_co_unique` (`truck_co`) USING BTREE,
  UNIQUE KEY `trucks_external_co_unique` (`external_co`) USING BTREE,
  KEY `FK_truck_type_vehicle` (`type_vehicle_id`) USING BTREE,
  KEY `FK_trucks_partners` (`partner_id`),
  KEY `FK_trucks_locations` (`location_id`),
  CONSTRAINT `FK_trucks_locations` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `FK_trucks_partners` FOREIGN KEY (`partner_id`) REFERENCES `partners` (`id`),
  CONSTRAINT `FK_trucks_type_vehicle` FOREIGN KEY (`type_vehicle_id`) REFERENCES `type_vehicles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla igtt4api.trucks: ~0 rows (aproximadamente)

-- Volcando estructura para tabla igtt4api.type_cargos
CREATE TABLE IF NOT EXISTS `type_cargos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type_cargo_co` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `k_weight_factor` enum('Y','N') COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `k_active` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `type_cargos_type_cargo_co_unique` (`type_cargo_co`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Tipo de  Cargas';

-- Volcando datos para la tabla igtt4api.type_cargos: ~8 rows (aproximadamente)
REPLACE INTO `type_cargos` (`id`, `type_cargo_co`, `description`, `k_weight_factor`, `k_active`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 'REF', 'CARGA REFRIGERADA', 'N', 'Y', 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(2, 'SEC', 'CARGA SECA', 'N', 'Y', 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(3, 'CPE', 'CARGA PELIGROSA', 'N', 'Y', 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(4, 'CDE', 'CARGA DELICADA', 'N', 'Y', 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(5, 'VIV', 'VIVERES', 'N', 'Y', 1, '2020-05-23 13:27:32', '2020-05-23 13:27:33'),
	(6, 'GRA', 'CARGA ABIERTA GRANEL', 'Y', 'Y', 1, '2021-03-09 11:21:20', '2022-03-09 11:21:21'),
	(7, 'LIQ', 'CARGA LIQUIDA', 'Y', 'Y', 1, '2021-05-17 02:15:57', '2021-05-17 02:15:57'),
	(8, 'CMP', 'CARGA MAQUINARIA PESADA', 'N', 'Y', 1, '2021-05-17 02:17:20', '2021-05-17 02:17:21'),
	(9, 'GAS', 'CARGA GASEOSA', 'N', 'Y', 1, '2021-05-17 02:21:19', '2021-05-17 02:21:20');

-- Volcando estructura para tabla igtt4api.type_freights
CREATE TABLE IF NOT EXISTS `type_freights` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type_freight_co` varchar(5) NOT NULL COMMENT 'Code',
  `description` varchar(50) NOT NULL,
  `k_multi_load` enum('Y','N') NOT NULL DEFAULT 'N',
  `k_multi_delivery` enum('Y','N') NOT NULL DEFAULT 'N',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `TYPE_FREIGHT_UK` (`type_freight_co`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='type of freight';

-- Volcando datos para la tabla igtt4api.type_freights: ~3 rows (aproximadamente)
REPLACE INTO `type_freights` (`id`, `type_freight_co`, `description`, `k_multi_load`, `k_multi_delivery`, `created_at`, `updated_at`) VALUES
	(1, 'PTP', 'Puerta a Puerta', 'N', 'N', '2021-04-10 22:00:34', '2021-04-10 22:00:34'),
	(2, 'PMP', 'Puerta a Multi Repartos', 'N', 'Y', '2021-04-10 22:05:22', '2021-04-10 22:05:22'),
	(3, 'MCP', 'Multi Cargas a Puerta', 'Y', 'N', '2021-04-10 22:05:58', '2021-04-10 22:05:59'),
	(4, 'MTM', 'Multi Cargas y Multi Repartos', 'Y', 'Y', '2021-04-10 22:06:46', '2021-04-10 22:06:47');

-- Volcando estructura para tabla igtt4api.type_vehicles
CREATE TABLE IF NOT EXISTS `type_vehicles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type_vehicle_co` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `k_active` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `k_class` enum('TRUCK','TRAILER','CAVA','PLATAFORM') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'TRAILER',
  `k_catalogue` enum('TRACTOR','TRAILER') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'TRACTOR',
  `loading_capacity_tm` double(3,1) DEFAULT NULL,
  `high_mt` double(3,1) DEFAULT NULL,
  `long_mt` double(3,1) DEFAULT NULL,
  `width_mt` double(3,1) DEFAULT NULL,
  `cubic_capacity_mt` double(3,1) DEFAULT NULL,
  `number_axes` int(2) DEFAULT 2,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `type_vehicles_type_vehicle_co_unique` (`type_vehicle_co`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla igtt4api.type_vehicles: ~13 rows (aproximadamente)
REPLACE INTO `type_vehicles` (`id`, `type_vehicle_co`, `description`, `k_active`, `k_class`, `k_catalogue`, `loading_capacity_tm`, `high_mt`, `long_mt`, `width_mt`, `cubic_capacity_mt`, `number_axes`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 'CH2', 'CHUTO 2 EJES', 'Y', 'TRUCK', 'TRACTOR', 25.0, 3.5, 6.0, 2.5, 0.0, 2, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(2, 'CH3', 'CHUTO 3 EJES', 'Y', 'TRUCK', 'TRACTOR', 30.0, 3.5, 6.0, 2.5, 0.0, 3, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(3, 'TRG2', 'TRAILER GRANDE REFRIGERADO 2 EJES', 'Y', 'TRAILER', 'TRAILER', 30.0, 2.5, 12.5, 2.5, 70.0, 2, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(4, 'TRG3', 'TRAILER GRANDE REFRIGERADO 3 EJES', 'Y', 'TRAILER', 'TRAILER', NULL, NULL, NULL, NULL, NULL, 3, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(5, 'PL2', 'PLATAFORMA 2 EJES', 'Y', 'PLATAFORM', 'TRACTOR', NULL, NULL, NULL, NULL, NULL, 2, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(6, 'PL3', 'PLATAFORMA 3 EJES', 'Y', 'PLATAFORM', 'TRACTOR', NULL, NULL, NULL, NULL, NULL, 3, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(7, 'TC2', 'TANQUE CERRADO 2 EJES', 'Y', 'TRAILER', 'TRAILER', NULL, NULL, NULL, NULL, NULL, 2, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(8, 'TC3', 'TANQUE CERRADO 3 EJES', 'Y', 'TRAILER', 'TRAILER', NULL, NULL, NULL, NULL, NULL, 3, 1, '2019-03-24 04:00:00', '2019-03-24 04:00:00'),
	(9, 'CVP2', 'CAVA PEQUENA TIPO NPR  2 EJES', 'Y', 'CAVA', 'TRACTOR', 4.5, 2.5, 5.0, 2.3, 2.3, 2, 1, '2019-12-23 23:26:16', '2019-12-23 23:26:17'),
	(10, 'CVG3', 'CAVA  GRANDE TIPO NPR 3 EJES', 'Y', 'CAVA', 'TRACTOR', NULL, NULL, NULL, NULL, NULL, 3, 1, '2019-12-23 23:26:18', '2019-12-23 23:26:18'),
	(11, 'CVG2', 'CAVA GRANDE 2 TIPO NPR EJES ', 'Y', 'CAVA', 'TRACTOR', NULL, NULL, NULL, NULL, NULL, 2, 1, '2020-05-23 11:10:51', '2020-05-23 11:10:52'),
	(12, 'CVP3', 'CAVA PEQUENA TIPO 350 2 EJES', 'Y', 'TRUCK', 'TRACTOR', NULL, NULL, NULL, NULL, NULL, 2, 1, '2020-05-25 17:36:57', '2020-05-25 17:37:03'),
	(13, 'CVP4', 'CAVA PEQUENA TIPO PICKUP', 'Y', 'TRUCK', 'TRACTOR', NULL, NULL, NULL, NULL, NULL, 2, 1, '2020-05-25 17:39:20', '2020-05-25 17:39:26');

-- Volcando estructura para tabla igtt4api.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uuid` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rol` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'GUEST',
  `device_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'GUEST',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valid` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `address_ip` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `token_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `users_email_unique` (`email`) USING BTREE,
  UNIQUE KEY `api_token_unique` (`api_token`) USING BTREE,
  UNIQUE KEY `uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='TABLA DE USUARIO DE APLICACION DEL CLIENTE API';

-- Volcando datos para la tabla igtt4api.users: ~4 rows (aproximadamente)
REPLACE INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `api_token`, `uuid`, `rol`, `device_id`, `remember_token`, `valid`, `address_ip`, `created_at`, `updated_at`, `token_at`) VALUES
	(1, 'Ronald Guerra', 'rageragg2004@gmail.com', '2021-04-11 21:45:47', '$2y$04$K4jKb5pPDzy6F9FbzvXb1OrM7d1ddshuwJVGMF3pQStcd0sutud.m', '290|QKZO2vLNrYxyv7kq4vzga8mLNQED1ceBWUtKOqep', '5a5b083e-b10a-468e-9885-bca4d7d0c0a5', 'ADMINISTRATOR', 'rage-001', 'YaIMAmsmN9', 'Y', '127.0.0.1', '2021-04-11 21:45:47', '2022-01-06 22:22:29', '2022-01-07 06:22:29'),
	(70, 'Eliese Escobar', 'eliese.escobar@rageca.com.ve', NULL, '$2y$10$35pPTDcxfoMOmN7.yRsFQeuW6.8da7mPVBlh810ClZeokkM3blm3m', NULL, '38a06374-4d4c-4ada-8472-119c14605432', 'LOGISTIC', 'GUEST', NULL, 'Y', NULL, '2021-12-27 15:11:01', '2021-12-27 15:11:01', NULL),
	(71, 'Yaneth Guedez', 'yaneth.guedez@rageca.com.ve', NULL, '$2y$10$krnRe/0PJ.oci3vvE/wwUu6zxW46OQFrQU8vrQAfUq3I2lQUEFEbK', NULL, 'b3637d56-60dd-4d8e-a991-206268af0237', 'BUSSINE', 'GUEST', NULL, 'Y', NULL, '2021-12-27 15:12:41', '2022-01-05 23:19:14', NULL),
	(83, 'Yanira Suarez', 'yanira.suarez@rageca.com.ve', NULL, '$2y$10$fwwQNiuscBxOBk66zh.1hu0vNxLmONZdxA.LuKq83.xJnmwJGsiQG', NULL, '97c16335-8fc6-41ed-9572-b58c7f3b51d5', 'EMPLOYEE', 'GUEST', NULL, 'Y', NULL, '2022-01-06 18:50:40', '2022-01-06 19:00:17', NULL);

-- Volcando estructura para tabla igtt4api.vehicle_cost_concepts
CREATE TABLE IF NOT EXISTS `vehicle_cost_concepts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cost_concept_id` bigint(20) unsigned NOT NULL,
  `type_vehicle_id` bigint(20) unsigned NOT NULL,
  `k_active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `k_unit` enum('KM','HRS') NOT NULL DEFAULT 'KM',
  `performance` double(12,4) NOT NULL DEFAULT 0.0000,
  `use_currency` varchar(3) DEFAULT NULL,
  `frecuency` int(2) NOT NULL DEFAULT 1,
  `currency_value` double(12,4) NOT NULL DEFAULT 0.0000,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_variable_cost_concepts` (`type_vehicle_id`,`cost_concept_id`),
  KEY `FK_cost_concepts_variable_cost` (`cost_concept_id`),
  CONSTRAINT `FK_cost_concepts_variable_cost` FOREIGN KEY (`cost_concept_id`) REFERENCES `cost_concepts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla igtt4api.vehicle_cost_concepts: ~0 rows (aproximadamente)

-- Volcando estructura para vista igtt4api.v_configurations
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `v_configurations` (
	`local_currency_co` VARCHAR(3) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`foreign_currency_co` VARCHAR(3) NULL COLLATE 'utf8mb4_unicode_ci',
	`last_foreign_currency_quote_value` DOUBLE(10,2) NULL,
	`country_co` VARCHAR(10) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`company_description` VARCHAR(80) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`company_telephone_co` VARCHAR(50) NULL COLLATE 'utf8mb4_unicode_ci',
	`company_email` VARCHAR(60) NULL COLLATE 'utf8mb4_unicode_ci',
	`days_per_year` INT(3) UNSIGNED NULL,
	`weeks_per_year` INT(2) UNSIGNED NULL,
	`months_per_year` INT(2) UNSIGNED NULL,
	`days_per_month` INT(2) UNSIGNED NULL,
	`days_per_week` INT(2) UNSIGNED NULL,
	`hours_per_day` INT(2) UNSIGNED NULL,
	`hours_per_week` BIGINT(20) UNSIGNED NULL,
	`hours_per_month` BIGINT(20) UNSIGNED NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista igtt4api.v_statistics_administrator
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `v_statistics_administrator` (
	`valid` CHAR(1) NULL COLLATE 'utf8mb4_unicode_ci',
	`id` BIGINT(20) UNSIGNED NOT NULL,
	`rol` VARCHAR(50) NULL COLLATE 'utf8mb4_unicode_ci',
	`name` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`cant_countries` BIGINT(21) NULL,
	`cant_regions` BIGINT(21) NULL,
	`cant_provinces` BIGINT(21) NULL,
	`cant_municipalities` BIGINT(21) NULL,
	`cant_cities` BIGINT(21) NULL,
	`cant_locations` BIGINT(21) NULL,
	`cant_shops` BIGINT(21) NULL,
	`cant_customers` BIGINT(21) NULL,
	`cant_subsidiaries` BIGINT(21) NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista igtt4api.v_configurations
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `v_configurations`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_configurations` AS SELECT local_currency_co,
       foreign_currency_co,
		 last_foreign_currency_quote_value,
		 country_co,
		 company_description,
		 company_telephone_co,
		 company_email,
		 days_per_year,
		 weeks_per_year,
		 months_per_year,
		 days_per_month,
		 days_per_week,
		 hours_per_day,
		 (hours_per_day*days_per_week) hours_per_week,
		 (hours_per_day*days_per_month) hours_per_month
  FROM configurations ;

-- Volcando estructura para vista igtt4api.v_statistics_administrator
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `v_statistics_administrator`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_statistics_administrator` AS SELECT a.valid, a.id, a.rol, a.name,
       ( SELECT COUNT(b.id) FROM countries b WHERE b.user_id = a.id )  cant_countries,
       ( SELECT COUNT(c.id) FROM regions c WHERE c.user_id = a.id )  cant_regions,
       ( SELECT COUNT(c.id) FROM provinces c WHERE c.user_id = a.id )  cant_provinces,
       ( SELECT COUNT(c.id) FROM municipalities c WHERE c.user_id = a.id )  cant_municipalities,
       ( SELECT COUNT(c.id) FROM cities c WHERE c.user_id = a.id )  cant_cities,
       ( SELECT COUNT(c.id) FROM locations c WHERE c.user_id = a.id )  cant_locations,
       ( SELECT COUNT(c.id) FROM shops c WHERE c.user_id = a.id )  cant_shops,
       ( SELECT COUNT(c.id) FROM customers c WHERE c.user_id = a.id )  cant_customers,
       ( SELECT COUNT(c.id) FROM subsidiaries c WHERE c.user_id = a.id )  cant_subsidiaries
  FROM users a
 WHERE rol = 'ADMINISTRATOR' ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
