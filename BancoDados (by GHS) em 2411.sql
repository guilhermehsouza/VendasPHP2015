CREATE DATABASE  IF NOT EXISTS `papelaria` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `papelaria`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win32 (x86)
--
-- Host: localhost    Database: papelaria
-- ------------------------------------------------------
-- Server version	5.7.8-rc-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carrinho`
--

DROP TABLE IF EXISTS `carrinho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrinho` (
  `CodCarrinho` int(11) NOT NULL AUTO_INCREMENT,
  `CodSessao` varchar(200) DEFAULT NULL,
  `CodProduto` int(11) DEFAULT NULL,
  `Descricao` varchar(100) DEFAULT NULL,
  `Quantidade` float(10,2) DEFAULT NULL,
  `Preco` float(10,2) DEFAULT NULL,
  `Total` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`CodCarrinho`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrinho`
--

LOCK TABLES `carrinho` WRITE;
/*!40000 ALTER TABLE `carrinho` DISABLE KEYS */;
INSERT INTO `carrinho` VALUES (1,'o7gdf1kn8d3bckh10j16kepi20',2,'Agenda diária mini Femmina 2016',1.00,9.99,9.99),(2,'o7gdf1kn8d3bckh10j16kepi20',1,'Agenda diária Brief Case Preta 2016',1.00,11.90,11.90),(3,'o7gdf1kn8d3bckh10j16kepi20',3,'Agenda comercial semanal Matra petra 2016',1.00,32.90,32.90),(4,'o7gdf1kn8d3bckh10j16kepi20',27,'Borracha branca c/ cinta Max pequena',1.00,5.00,5.00),(5,'o7gdf1kn8d3bckh10j16kepi20',27,'Borracha branca c/ cinta Max pequena',1.00,5.00,5.00),(24,'b7gj5ojofl1r056efnpqblkna6',2,'Agenda diária mini Femmina 2016',3.00,9.99,29.97);
/*!40000 ALTER TABLE `carrinho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `CodCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`CodCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Agendas'),(2,'Cadernos'),(3,'Colas'),(4,'Apontadores'),(5,'Borrachas'),(6,'Lápis'),(7,'Lapís de Cor'),(8,'Canetas'),(9,'Lapiseiras'),(10,'Estojos'),(11,'Mochilas');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `CodCliente` int(11) NOT NULL AUTO_INCREMENT,
  `CodEstado` int(11) NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `CPF` varchar(15) DEFAULT NULL,
  `RG` varchar(15) DEFAULT NULL,
  `Endereco` varchar(100) DEFAULT NULL,
  `Bairro` varchar(100) DEFAULT NULL,
  `CEP` varchar(10) DEFAULT NULL,
  `Cidade` varchar(100) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `DataNascimento` date DEFAULT NULL,
  `Senha` varchar(200) DEFAULT NULL,
  `Sexo` varchar(1) DEFAULT NULL,
  `Telefone` varchar(10) DEFAULT NULL,
  `Celular` varchar(12) DEFAULT NULL,
  `Login` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`CodCliente`),
  KEY `fk_Cliente_Estados1_idx` (`CodEstado`),
  CONSTRAINT `fk_Cliente_Estados1` FOREIGN KEY (`CodEstado`) REFERENCES `estados` (`CodEstado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,25,'Marcus','46699531840','557571790','rua antonia guerino 315','natal merli','13720000','sÃ£o josÃ© do rio pardo','h2oduarte@hotmail.com','1999-07-02','202cb962ac59075b964b07152d234b70','1','36812206','989387544','vennominag'),(2,25,'GUILHERME HENRIQUE DE SOUZA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'192309aaddc500140db28668e1bbd8b5',NULL,NULL,NULL,'guilherme'),(3,25,'ANA CRISTINA GONÇALVES DE SOUZA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'276b6c4692e78d4799c12ada515bc3e4',NULL,NULL,NULL,'ana');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estados` (
  `CodEstado` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`CodEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'Acre'),(2,'Alagoas'),(3,'Amapá'),(4,'Amazonas'),(5,'Bahia'),(6,'Ceará'),(7,'Distrito Federal'),(8,'Espírito Santo'),(9,'Goiás'),(10,'Maranhão'),(11,'Mato Grosso'),(12,'Mato Grosso do Sul'),(13,'Minas Gerais'),(14,'Pará'),(15,'Paraíba'),(16,'Paraná'),(17,'Pernambuco'),(18,'Piauí'),(19,'Rio de Janeiro'),(20,'Rio Grande do Norte'),(21,'Rio Grande do Sul'),(22,'Rondônia'),(23,'Roraima'),(24,'Santa Catarina'),(25,'São Paulo'),(26,'Sergipe'),(27,'Tocantins');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formasdepagamentos`
--

DROP TABLE IF EXISTS `formasdepagamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formasdepagamentos` (
  `CodFormadePagamento` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CodFormadePagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formasdepagamentos`
--

LOCK TABLES `formasdepagamentos` WRITE;
/*!40000 ALTER TABLE `formasdepagamentos` DISABLE KEYS */;
INSERT INTO `formasdepagamentos` VALUES (1,'Vista'),(2,'Prazo');
/*!40000 ALTER TABLE `formasdepagamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedores`
--

DROP TABLE IF EXISTS `fornecedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornecedores` (
  `CodFornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CodFornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedores`
--

LOCK TABLES `fornecedores` WRITE;
/*!40000 ALTER TABLE `fornecedores` DISABLE KEYS */;
INSERT INTO `fornecedores` VALUES (1,'Spiral '),(2,'Pombo '),(3,'Confetti '),(4,'Tenaz '),(5,'Bic '),(6,'Pritt '),(7,'Acrilex '),(8,'Faber Castell '),(9,'Easy Office '),(10,'Maped '),(11,'Pentel '),(12,'Mercur '),(13,'Happy-time '),(14,'Molin '),(15,'Tris '),(16,'Paper Mate '),(17,'Waleu '),(18,'Goodie '),(19,'DAC '),(20,'Oceanlink '),(21,'Baohua '),(22,'Yes '),(23,'Samsonite '),(24,'Yangzi ');
/*!40000 ALTER TABLE `fornecedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtos` (
  `CodProduto` int(11) NOT NULL AUTO_INCREMENT,
  `CodCategoria` int(11) NOT NULL,
  `CodFornecedor` int(11) NOT NULL,
  `Nome` varchar(150) DEFAULT NULL,
  `PrecoVenda` float(10,2) DEFAULT NULL,
  `Foto` varchar(100) DEFAULT NULL,
  `Avaliacao` float DEFAULT NULL,
  `QtdeProdutos` int(10) unsigned NOT NULL,
  PRIMARY KEY (`CodProduto`),
  KEY `fk_Produtos_Categorias_idx` (`CodCategoria`),
  KEY `fk_Produtos_Fornecedores1_idx` (`CodFornecedor`),
  CONSTRAINT `fk_Produtos_Categorias` FOREIGN KEY (`CodCategoria`) REFERENCES `categorias` (`CodCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produtos_Fornecedores1` FOREIGN KEY (`CodFornecedor`) REFERENCES `fornecedores` (`CodFornecedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,1,1,'Agenda diária Brief Case Preta 2016',11.90,'imagens/agendas/png/1.png',NULL,20),(2,1,1,'Agenda diária mini Femmina 2016',9.99,'imagens/agendas/png/2.png',NULL,20),(3,1,2,'Agenda comercial semanal Matra petra 2016',32.90,'imagens/agendas/png/3.png',NULL,20),(4,1,1,'Agenda diária Brief Case azul 2016',11.90,'imagens/agendas/png/4.png',NULL,20),(5,1,3,'Agenda diária clássica pesponto 2016 ',48.90,'imagens/agendas/png/5.png',NULL,20),(6,2,1,'Caderno universitário capa dura 1x1 96 fls My Pet',6.50,'imagens/cadernos/png/1.png',NULL,20),(7,2,1,'Caderno universitário capa dura 1x1 96 fls Black Out ',6.50,'imagens/cadernos/png/2.png',NULL,20),(8,2,1,'Caderno universitário capa dura 10x1 200fls Femmina',9.90,'imagens/cadernos/png/3.png',NULL,20),(9,2,1,'Caderno universitário capa dura 10x1 200 fls Barcelona ',13.90,'imagens/cadernos/png/4.png',NULL,20),(10,2,1,'Caderno universitário capa dura 10x1 200 fls Disney Stitch ',14.00,'imagens/cadernos/png/5.png',NULL,20),(11,2,1,'Caderno universitário capa dura 10x1 200 fls Rolling Stone',13.90,'imagens/cadernos/png/6.png',NULL,20),(12,2,1,'Caderno universitário capa dura 10x1 200 fls Femmina',9.90,'imagens/cadernos/png/7.png',NULL,20),(13,2,1,'Caderno universitário capa dura 10x1 200 fls Scribble Nauts ',13.90,'imagens/cadernos/png/8.png',NULL,20),(14,2,1,'Caderno universitário capa dura 10x1 200 fls preto',9.90,'imagens/cadernos/png/9.png',NULL,20),(15,2,1,'Caderno universitário capa dura 10x1 200 fls Hard Cover',10.00,'imagens/cadernos/png/10.png',NULL,20),(16,3,4,'Cola branca 100g lavável',3.00,'imagens/itens em geral/COLA/1.png',NULL,20),(17,3,4,'Cola branca 35g lavável ',1.00,'imagens/itens em geral/COLA/2.png',NULL,20),(18,3,6,'Cola em bastão 10g ',4.00,'imagens/itens em geral/COLA/3.png',NULL,20),(19,3,7,'Cola colorida com gliter',11.50,'imagens/itens em geral/COLA/4.png',NULL,20),(20,3,8,'Cola colorida 23g ',8.00,'imagens/itens em geral/COLA/5.png',NULL,20),(21,4,8,'Apontador c/deposito ',5.00,'imagens/itens em geral/APONTADOR/1.png',NULL,20),(22,4,8,'Apontador manual de mesa preto ',30.00,'imagens/itens em geral/APONTADOR/2.png',NULL,20),(23,4,9,'Apontador simples Boogy ',2.90,'imagens/itens em geral/APONTADOR/3.png',NULL,20),(24,4,10,'Apontador simples vivo sortidos ',3.10,'imagens/itens em geral/APONTADOR/4.png',NULL,20),(25,4,10,'Apontador à pilha autom.turbo twist ',60.00,'imagens/itens em geral/APONTADOR/5.png',NULL,20),(26,4,10,'Apontador c/deposito globo ',7.00,'imagens/itens em geral/APONTADOR/6.png',NULL,20),(27,5,8,'Borracha branca c/ cinta Max pequena',5.00,'imagens/itens em geral/borracha/1.png',NULL,20),(28,5,11,'Caneta borracha click eraser corpo colorido ',7.00,'imagens/itens em geral/borracha/2.png',NULL,20),(29,5,10,'Borracha precision',3.00,'imagens/itens em geral/borracha/3.png',NULL,20),(30,5,12,'Borracha clean pull pack ',2.70,'imagens/itens em geral/borracha/4.png',NULL,20),(31,6,13,'Lápis preto n.2 redondo  CX 144 UN',29.00,'imagens/itens em geral/lapis/1.png',NULL,20),(32,6,8,'Lápis preto n.2 max redondo CX 4 UN',6.00,'imagens/itens em geral/lapis/2.png',NULL,20),(33,6,14,'Lápis preto n.2 c/borracha Minions  BT4 UN',7.00,'imagens/itens em geral/lapis/3.png',NULL,20),(34,6,5,'Lápis preto n.2 Evolution redondo BT4 UN',4.00,'imagens/itens em geral/lapis/4.png',NULL,20),(35,6,15,'Lápis preto n.2 c/borracha Princesas BT4 UN',5.00,'imagens/itens em geral/lapis/5.png',NULL,20),(36,6,15,'Lápis preto n.2 c/borracha Monster High BT4 UN',7.00,'imagens/itens em geral/lapis/6.png',NULL,20),(37,7,8,'Lápis de Cor 48 cores redondo (24 bicolor)',24.90,'imagens/itens em geral/LAPIS DE COR/1.png',NULL,20),(38,7,8,'Lápis de Cor 24 cores redondo (12 bicolor)',11.50,'imagens/itens em geral/LAPIS DE COR/2.png',NULL,20),(39,7,13,'Lápis de Cor 36 cores redondo',9.70,'imagens/itens em geral/LAPIS DE COR/3.png',NULL,20),(40,7,13,'Lápis de Cor 12 cores redondo ',4.00,'imagens/itens em geral/LAPIS DE COR/4.png',NULL,20),(41,7,14,'Lápis de Cor 12 cores Minions ',10.00,'imagens/itens em geral/LAPIS DE COR/5.png',NULL,20),(42,7,8,'Lápis de Cor 12 cores redondo Misturinha ',16.30,'imagens/itens em geral/LAPIS DE COR/6.png',NULL,20),(43,8,14,'Caneta esferográfica 0.7mm metálica(az/pr/vm)  3 UN',7.00,'imagens/itens em geral/CANETA/1.png',NULL,20),(44,8,5,'Caneta esferográfica 0.7mm Cristal az/pt/vm 3 UN',6.00,'imagens/itens em geral/CANETA/2.png',NULL,20),(45,8,5,'Caneta esferográfica 0.7mm Cristal Fash. az/rx/rs/vd  4 UN',16.00,'imagens/itens em geral/CANETA/3.png',NULL,20),(46,8,5,'Caneta esferográfica 0.7mm Kilom.100 az/pt/vm  3 UN',9.00,'imagens/itens em geral/CANETA/4.png',NULL,20),(47,8,11,'Caneta esferográfica 0.7mm azul 1 UN ',5.00,'imagens/itens em geral/CANETA/5.png',NULL,20),(48,8,11,'Caneta esferográfica 0.7mm preta 1 UN',5.00,'imagens/itens em geral/CANETA/6.png',NULL,20),(49,9,8,'Lapiseira 0.7mm Grip Matic sortida 1 UN',12.00,'imagens/itens em geral/LAPISEIRA/1.png',NULL,20),(50,9,8,'Lapiseira 0.7mm Poly Matic sortida 1 UN',9.00,'imagens/itens em geral/LAPISEIRA/2.png',NULL,20),(51,9,5,'Lapiseira 0.7mm Shimmers  3 UN',7.00,'imagens/itens em geral/LAPISEIRA/3.png',NULL,20),(52,9,14,'Lapiseira 0.7mm Hello Kitty 1 UN',16.00,'imagens/itens em geral/LAPISEIRA/4.png',NULL,20),(53,9,11,'Lapiseira 0.7mm técnica azul + 1tb c/12 minas 1 UN',30.00,'imagens/itens em geral/LAPISEIRA/5.png',NULL,20),(54,9,11,'Lapiseira 0.7mm técnica vermel.+1tb c/12 minas 1 UN',28.00,'imagens/itens em geral/LAPISEIRA/6.png',NULL,20),(55,10,17,'Estojo escolar plást. branco 1 UN',5.00,'imagens/estojo/1.png',NULL,20),(56,10,18,'Estojo escolar poli. amassadinho duplex 1 UN',4.00,'imagens/estojo/2.png',NULL,20),(57,10,18,'Estojo escolar lona teen color 1 UN',4.00,'imagens/estojo/3.png',NULL,20),(58,10,18,'Estojo escolar poli. quadruplex amassado 1 UN',4.00,'imagens/estojo/4.png',NULL,20),(59,10,19,'Estojo escolar poli. Quadradinhos sortido 1 UN',3.00,'imagens/estojo/5.png',NULL,20),(60,10,20,'Estojo escolar poli. winner 1 UN',7.00,'imagens/estojo/6.png',NULL,20),(61,11,21,'Mochila p/notebook até 15\" em poliester ',160.00,'imagens/mochilas/1.png',NULL,20),(62,11,21,'Mochila p/notebook até 19\" c/rodas ',200.00,'imagens/mochilas/2.png',NULL,20),(63,11,22,'Mochila nylon 2 div. e bolso frontal p/notebook ',150.00,'imagens/mochilas/3.png',NULL,20),(64,11,20,'Mochila poli',169.00,'imagens/mochilas/4.png',NULL,20),(66,11,23,'Mochila poli. Ines Coral Print ',114.00,'imagens/mochilas/5.png',NULL,20),(67,11,24,'Mochila poli. Dark Fashion ',110.00,'imagens/mochilas/6.png',NULL,20);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendas` (
  `CodVenda` int(11) NOT NULL AUTO_INCREMENT,
  `CodCliente` int(11) NOT NULL,
  `CodFormadePagamento` int(11) NOT NULL,
  `Data` date DEFAULT NULL,
  `ValorTotal` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`CodVenda`),
  KEY `fk_Cliente_has_Produtos_Cliente1_idx` (`CodCliente`),
  KEY `fk_Vendas_FormasdePagamentos1_idx` (`CodFormadePagamento`),
  CONSTRAINT `fk_Cliente_has_Produtos_Cliente1` FOREIGN KEY (`CodCliente`) REFERENCES `clientes` (`CodCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vendas_FormasdePagamentos1` FOREIGN KEY (`CodFormadePagamento`) REFERENCES `formasdepagamentos` (`CodFormadePagamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendasprodutos`
--

DROP TABLE IF EXISTS `vendasprodutos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendasprodutos` (
  `CodVendaProduto` int(11) NOT NULL,
  `CodVenda` int(11) NOT NULL,
  `CodProduto` int(11) NOT NULL,
  `Qtde` float(10,2) DEFAULT NULL,
  `ValorProduto` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`CodVendaProduto`),
  KEY `fk_Vendas_has_Produtos_Produtos1_idx` (`CodProduto`),
  KEY `fk_Vendas_has_Produtos_Vendas1_idx` (`CodVenda`),
  CONSTRAINT `fk_Vendas_has_Produtos_Produtos1` FOREIGN KEY (`CodProduto`) REFERENCES `produtos` (`CodProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vendas_has_Produtos_Vendas1` FOREIGN KEY (`CodVenda`) REFERENCES `vendas` (`CodVenda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendasprodutos`
--

LOCK TABLES `vendasprodutos` WRITE;
/*!40000 ALTER TABLE `vendasprodutos` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendasprodutos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-24 13:16:24
