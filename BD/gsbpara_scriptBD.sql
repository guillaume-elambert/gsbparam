-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 15 Octobre 2019 à 09:57
-- Version du serveur :  5.7.9-log
-- Version de PHP :  7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `elambert_gsbparam`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

DROP TABLE IF EXISTS `administrateur`;
CREATE TABLE IF NOT EXISTS `administrateur` (
  `id` char(3) COLLATE latin1_bin NOT NULL,
  `nom` char(32) COLLATE latin1_bin NOT NULL,
  `mdp` char(255) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Contenu de la table `administrateur`
--

INSERT INTO `administrateur` (`id`, `nom`, `mdp`) VALUES
('1', 'root', '$2y$10$vd3tGpa182f5ZzKy.2FaIORZ9wDktPzrQyAYJerkgOxOYhfCOwhO2');

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `id` char(32) COLLATE utf8_bin NOT NULL,
  `libelle` char(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`id`, `libelle`) VALUES
('CH', 'Cheveux'),
('FO', 'Forme'),
('PS', 'Protection Solaire');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `mail` varchar(90) COLLATE utf8_bin NOT NULL,
  `mdp` varchar(255) COLLATE utf8_bin NOT NULL,
  `nom` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `prenom` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `rue` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `cp` char(5) COLLATE utf8_bin DEFAULT NULL,
  `ville` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`mail`, `mdp`, `nom`, `prenom`, `rue`, `cp`, `ville`) VALUES
('dupont@wanadoo.fr', '$2y$10$C099mWcA2WqRaQuLVCiH.OEQW5rJonwEn7RjxwYGkEWnHzY62cy3C', 'Dupont', 'Jacques', '12, rue haute', '75001', 'Paris'),
('durant@free.fr', '$2y$10$C099mWcA2WqRaQuLVCiH.OEQW5rJonwEn7RjxwYGkEWnHzY62cy3C', 'Durant', 'Yves', '23, rue des ombres', '75012', 'Paris'),
('guillaume.elambert@yahoo.fr', '$2y$10$C099mWcA2WqRaQuLVCiH.OEQW5rJonwEn7RjxwYGkEWnHzY62cy3C', 'Elambert', 'Guillaume', '8 bis rue de Saint Benoit', '78610', 'Auffargis');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id` char(32) COLLATE utf8_bin NOT NULL,
  `dateCommande` date DEFAULT NULL,
  `mailClient` varchar(90) COLLATE utf8_bin NOT NULL,
  `nomClient` varchar(90) COLLATE utf8_bin NOT NULL,
  `prenomClient` varchar(90) COLLATE utf8_bin NOT NULL,
  `rueClient` varchar(90) COLLATE utf8_bin NOT NULL,
  `cpClient` char(5) COLLATE utf8_bin NOT NULL,
  `villeClient` varchar(90) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_client_commande_mail` (`mailClient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `commande`
--

INSERT INTO `commande` (`id`, `dateCommande`, `mailClient`, `nomClient`, `prenomClient`, `rueClient`, `cpClient`, `villeClient`) VALUES
('1101461660', '2011-07-12', 'dupont@wanadoo.fr', '', '', '', '', ''),
('1101461665', '2011-07-20', 'durant@free.fr', '', '', '', '', ''),
('1101461666', '2019-09-24', 'guillaume.elambert@yahoo.fr', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `contenir`
--

DROP TABLE IF EXISTS `contenir`;
CREATE TABLE IF NOT EXISTS `contenir` (
  `idCommande` char(32) COLLATE utf8_bin NOT NULL,
  `idProduit` char(32) COLLATE utf8_bin NOT NULL,
  `qte` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idCommande`,`idProduit`),
  KEY `I_FK_CONTENIR_COMMANDE` (`idCommande`),
  KEY `I_FK_CONTENIR_Produit` (`idProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `contenir`
--

INSERT INTO `contenir` (`idCommande`, `idProduit`, `qte`) VALUES
('1101461660', 'f03', 1),
('1101461660', 'p01', 1),
('1101461665', 'f05', 1),
('1101461665', 'p06', 1),
('1101461666', 'c01', 2),
('1101461666', 'c02', 5),
('1101461666', 'c04', 9);

-- --------------------------------------------------------

--
-- Structure de la table `panier_client`
--

DROP TABLE IF EXISTS `panier_client`;
CREATE TABLE IF NOT EXISTS `panier_client` (
  `mailClient` varchar(90) COLLATE utf8_bin NOT NULL,
  `produit` char(32) COLLATE utf8_bin NOT NULL,
  `qte` int(11) NOT NULL,
  PRIMARY KEY (`produit`),
  KEY `FK_client_panierClient_mailClient` (`mailClient`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `id` char(32) COLLATE utf8_bin NOT NULL,
  `description` char(50) COLLATE utf8_bin DEFAULT NULL,
  `prix` decimal(10,2) DEFAULT NULL,
  `image` char(100) COLLATE utf8_bin DEFAULT NULL,
  `idCategorie` char(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `I_FK_Produit_CATEGORIE` (`idCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `produit`
--

INSERT INTO `produit` (`id`, `description`, `prix`, `image`, `idCategorie`) VALUES
('c01', 'Laino Shampooing Douche au Thé Vert BIO', '5.00', 'images/laino-shampooing-douche-au-the-vert-bio-200ml.png', 'CH'),
('c02', 'Laino Shampooing Douche au Thé Vert BIO', '5.00', 'images/klorane-fibres-de-lin-baume-apres-shampooing-150-ml.jpg', 'CH'),
('c03', 'Laino Shampooing Douche au Thé Vert BIO', '5.00', 'images/weleda-kids-2in1-shower-shampoo-orange-fruitee-150-ml.jpg', 'CH'),
('c04', 'Laino Shampooing Douche au Thé Vert BIO', '5.00', 'images/weleda-kids-2in1-shower-shampoo-vanille-douce-150-ml.jpg', 'CH'),
('c05', 'Laino Shampooing Douche au Thé Vert BIO', '5.00', 'images/klorane-shampooing-sec-a-l-extrait-d-ortie-spray-150ml.png', 'CH'),
('c06', 'Laino Shampooing Douche au Thé Vert BIO', '5.00', 'images/phytopulp-mousse-volume-intense-200ml.jpg', 'CH'),
('c07', 'Laino Shampooing Douche au Thé Vert BIO', '5.00', 'images/bio-beaute-by-nuxe-shampooing-nutritif-200ml.png', 'CH'),
('f01', 'Laino Shampooing Douche au Thé Vert BIO', '5.00', 'images/nuxe-men-contour-des-yeux-multi-fonctions-15ml.png', 'CH'),
('f02', 'Laino Shampooing Douche au Thé Vert BIO', '5.00', 'images/tisane-romon-nature-sommirel-bio-sachet-20.jpg', 'CH'),
('f03', 'Laino Shampooing Douche au Thé Vert BIO', '5.00', 'images/la-roche-posay-cicaplast-creme-pansement-40ml.jpg', 'CH'),
('f04', 'Laino Shampooing Douche au Thé Vert BIO', '5.00', 'images/futuro-sport-stabilisateur-pour-cheville-deluxe-attelle-cheville.png', 'CH'),
('f05', 'Laino Shampooing Douche au Thé Vert BIO', '5.00', 'images/microlife-pese-personne-electronique-weegschaal-ws80.jpg', 'CH'),
('f06', 'Laino Shampooing Douche au Thé Vert BIO', '5.00', 'images/melapi-miel-thym-liquide-500g.jpg', 'CH'),
('f07', 'Laino Shampooing Douche au Thé Vert BIO', '5.00', 'images/melapi-pollen-250g.jpg', 'CH'),
('p01', 'Laino Shampooing Douche au Thé Vert BIO', '5.00', 'images/avene-solaire-spray-tres-haute-protection-spf50200ml.png', 'CH'),
('p02', 'Laino Shampooing Douche au Thé Vert BIO', '5.00', 'images/mustela-solaire-lait-tres-haute-protection-spf50-100ml.jpg', 'CH'),
('p03', 'Laino Shampooing Douche au Thé Vert BIO', '5.00', 'images/isdin-eryfotona-aak-fluid-100-50ml.jpg', 'CH'),
('p04', 'Laino Shampooing Douche au Thé Vert BIO', '5.00', 'images/la-roche-posay-anthelios-50-brume-visage-toucher-sec-75ml.png', 'CH'),
('p05', 'Laino Shampooing Douche au Thé Vert BIO', '5.00', 'images/nuxe-sun-huile-lactee-capillaire-protectrice-100ml.png', 'CH'),
('p06', 'Laino Shampooing Douche au Thé Vert BIO', '5.00', 'images/uriage-bariesun-stick-levres-spf30-4g.jpg', 'CH'),
('p07', 'Laino Shampooing Douche au Thé Vert BIO', '5.00', 'images/bioderma-cicabio-creme-spf50-30ml.png', 'CH');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FK_client_commande_mail` FOREIGN KEY (`mailClient`) REFERENCES `client` (`mail`);

--
-- Contraintes pour la table `contenir`
--
ALTER TABLE `contenir`
  ADD CONSTRAINT `contenir_ibfk_1` FOREIGN KEY (`idCommande`) REFERENCES `commande` (`id`),
  ADD CONSTRAINT `contenir_ibfk_2` FOREIGN KEY (`idProduit`) REFERENCES `produit` (`id`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`idCategorie`) REFERENCES `categorie` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



DROP USER IF EXISTS 'visiteurSite'@'localhost';
CREATE USER 'visiteurSite'@'localhost' IDENTIFIED BY 'a5UTXhjsMreUpAJU';
GRANT ALL PRIVILEGES ON `elambert_gsbparam`.* TO 'visiteurSite'@'localhost';