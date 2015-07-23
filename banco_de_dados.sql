-- phpMyAdmin SQL Dump
-- version 4.2.12deb2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Tempo de geração: 04/06/2015 às 15:16
-- Versão do servidor: 5.6.24-0ubuntu2
-- Versão do PHP: 5.6.4-4ubuntu6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de dados: `adpizza_development`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
`id` int(11) NOT NULL,
  `nm_cliente` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num_tel_cliente` int(11) DEFAULT NULL,
  `nm_endereco_cliente` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num_endereco` int(11) DEFAULT NULL,
  `nm_complemento` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nm_bairro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nm_cidade` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nm_uf` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `cep` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Fazendo dump de dados para tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nm_cliente`, `num_tel_cliente`, `nm_endereco_cliente`, `num_endereco`, `nm_complemento`, `nm_bairro`, `nm_cidade`, `nm_uf`, `created_at`, `updated_at`, `cep`) VALUES
(1, 'José Pedro', 33424561, 'Rua Amarela', 2, 'Casa B', 'Vila Azul', 'Santos', 'SP', '2015-05-29 19:40:41', '2015-06-03 16:54:44', 11345020);

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens`
--

CREATE TABLE IF NOT EXISTS `itens` (
`id` int(11) NOT NULL,
  `nm_item` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qtd_item` float DEFAULT NULL,
  `vl_item` float DEFAULT NULL,
  `ds_item` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Fazendo dump de dados para tabela `itens`
--

INSERT INTO `itens` (`id`, `nm_item`, `qtd_item`, `vl_item`, `ds_item`, `created_at`, `updated_at`) VALUES
(1, 'Pizza Mussarela', 110, 20, 'Mussarela e Tomate', '2015-05-30 15:25:43', '2015-06-04 17:01:27'),
(2, 'Pizza Pizzaiolo', 100, 35, 'Linguiça Calabresa, Linguiça Toscana, Catupiry e Bacon', '2015-05-30 15:28:21', '2015-05-30 15:28:21');

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens_pedidos`
--

CREATE TABLE IF NOT EXISTS `itens_pedidos` (
  `item_id` int(11) DEFAULT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `qtd_item_pedido` float DEFAULT NULL,
  `vl_item_pedido` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Fazendo dump de dados para tabela `itens_pedidos`
--

INSERT INTO `itens_pedidos` (`item_id`, `pedido_id`, `qtd_item_pedido`, `vl_item_pedido`) VALUES
(20, NULL, 2, 40),
(35, NULL, 2, 70),
(NULL, NULL, NULL, NULL),
(NULL, NULL, NULL, NULL),
(NULL, NULL, NULL, NULL),
(NULL, NULL, NULL, NULL),
(NULL, NULL, NULL, NULL),
(NULL, NULL, NULL, NULL),
(NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE IF NOT EXISTS `pedidos` (
`id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `dt_pedido` date DEFAULT NULL,
  `vl_total` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Fazendo dump de dados para tabela `pedidos`
--

INSERT INTO `pedidos` (`id`, `cliente_id`, `dt_pedido`, `vl_total`, `created_at`, `updated_at`) VALUES
(4, 1, '2015-06-03', 110, '2015-06-03 16:53:51', '2015-06-03 16:53:51');

-- --------------------------------------------------------

--
-- Estrutura para tabela `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Fazendo dump de dados para tabela `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20150529150503'),
('20150529190834'),
('20150529193011'),
('20150529203709'),
('20150530145035'),
('20150530150337'),
('20150530151239');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
 ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `itens`
--
ALTER TABLE `itens`
 ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
 ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `schema_migrations`
--
ALTER TABLE `schema_migrations`
 ADD UNIQUE KEY `unique_schema_migrations` (`version`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de tabela `itens`
--
ALTER TABLE `itens`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
