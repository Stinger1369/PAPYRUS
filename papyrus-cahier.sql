-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 16 mars 2023 à 11:44
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `papyrus`
--

-- --------------------------------------------------------

--
-- Structure de la table `entcom`
--

CREATE TABLE `entcom` (
  `NUMCOM` int(11) NOT NULL,
  `OBSCOM` varchar(25) DEFAULT NULL,
  `DATCOM` date NOT NULL,
  `NUMFOU` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `entcom`
--

INSERT INTO `entcom` (`NUMCOM`, `OBSCOM`, `DATCOM`, `NUMFOU`) VALUES
(70010, NULL, '2007-02-10', '120'),
(70011, 'Commande urgente', '2007-03-01', '540'),
(70020, NULL, '2007-04-25', '9180'),
(70025, 'Commande urgente', '2007-04-30', '9150'),
(70210, 'Commande cadenc?e', '2007-05-05', '120'),
(70250, 'Commande cadenc?e', '2007-10-02', '8700'),
(70300, NULL, '2007-06-06', '9120'),
(70620, NULL, '2007-10-02', '540'),
(70625, NULL, '2007-10-09', '120'),
(70629, NULL, '2007-10-12', '9180');

-- --------------------------------------------------------

--
-- Structure de la table `fournis`
--

CREATE TABLE `fournis` (
  `NUMFOU` decimal(10,0) NOT NULL,
  `NOMFOU` varchar(30) NOT NULL,
  `RUEFOU` varchar(30) NOT NULL,
  `POSFOU` char(5) NOT NULL,
  `VILFOU` varchar(30) NOT NULL,
  `CONFOU` varchar(15) NOT NULL,
  `SATISF` decimal(3,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `fournis`
--

INSERT INTO `fournis` (`NUMFOU`, `NOMFOU`, `RUEFOU`, `POSFOU`, `VILFOU`, `CONFOU`, `SATISF`) VALUES
('120', 'GROBRIGAN', '20 rue du papier', '92200', 'papercity', 'Georges', '8'),
('540', 'ECLIPSE', '53, rue laisse flotter les rub', '78250', 'Bugbugville', 'Nestor', '7'),
('8700', 'MEDICIS', '120 rue des plantes', '75014', 'Paris', 'Lison', NULL),
('9120', 'DISCOBOL', '11 rue des sports', '85100', 'La Roche sur Yon', 'Hercule', '8'),
('9150', 'DEPANPAP', '26, avenue des locomotives', '59987', 'Coroncountry', 'Pollux', '5'),
('9180', 'HURRYTAPE', '68, boulevard des octets', '04044', 'Dumpville', 'Track', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `ligcom`
--

CREATE TABLE `ligcom` (
  `NUMCOM` int(6) NOT NULL,
  `CODART` char(4) NOT NULL,
  `NUMLIG` decimal(3,0) NOT NULL,
  `QTECDE` decimal(6,0) NOT NULL,
  `PRIUNI` decimal(5,2) NOT NULL,
  `QTELIV` decimal(6,0) DEFAULT NULL,
  `DERLIV` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ligcom`
--

INSERT INTO `ligcom` (`NUMCOM`, `CODART`, `NUMLIG`, `QTECDE`, `PRIUNI`, `QTELIV`, `DERLIV`) VALUES
(70010, 'D035', '4', '200', '40.00', '250', '2007-02-20'),
(70010, 'I100', '1', '3000', '470.00', '3000', '2007-03-15'),
(70010, 'I105', '2', '2000', '485.00', '2000', '2007-07-05'),
(70010, 'I108', '3', '1000', '680.00', '1000', '2007-08-20'),
(70010, 'P220', '5', '6000', '999.99', '6000', '2007-03-31'),
(70010, 'P240', '6', '6000', '999.99', '2000', '2007-03-31'),
(70011, 'I105', '1', '1000', '600.00', '1000', '2007-05-16'),
(70020, 'B001', '1', '200', '140.00', NULL, '2007-12-31'),
(70020, 'B002', '2', '200', '140.00', NULL, '2007-12-31'),
(70025, 'I100', '1', '1000', '590.00', '1000', '2007-05-15'),
(70025, 'I105', '2', '500', '590.00', '500', '2007-05-15'),
(70210, 'I100', '1', '1000', '470.00', '1000', '2007-07-15'),
(70210, 'P220', '2', '10000', '999.99', '10000', '2007-08-31'),
(70250, 'P220', '2', '10000', '999.99', '10000', '2007-11-10'),
(70250, 'P230', '1', '15000', '999.99', '12000', '2007-12-15'),
(70300, 'I110', '1', '50', '790.00', '50', '2007-10-31'),
(70620, 'I105', '1', '200', '600.00', '200', '2007-11-01'),
(70625, 'I100', '1', '1000', '470.00', '1000', '2007-10-15'),
(70625, 'P220', '2', '10000', '999.99', '10000', '2007-10-31'),
(70629, 'B001', '1', '200', '140.00', NULL, '2007-12-31'),
(70629, 'B002', '2', '200', '140.00', NULL, '2007-12-31');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `CODART` char(4) NOT NULL,
  `LIBART` varchar(25) NOT NULL,
  `STKLE` decimal(7,0) NOT NULL,
  `STKPHY` decimal(7,0) NOT NULL,
  `QTEANN` decimal(6,0) NOT NULL,
  `UNIMES` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`CODART`, `LIBART`, `STKLE`, `STKPHY`, `QTEANN`, `UNIMES`) VALUES
('B001', 'Bande magnetique 1200', '20', '87', '240', 'unit?'),
('B002', 'Bande magnetique 6250', '20', '12', '410', 'unit?'),
('CODA', 'LIBART', '0', '0', '0', 'UNIME'),
('D035', 'CD R slim 80 mm', '40', '42', '150', 'B010'),
('D050', 'CD R-W 80mm', '50', '4', '0', 'B010'),
('I100', 'Papier 1 ex continu', '100', '557', '3500', 'B1000'),
('I105', 'Papier 2 ex continu', '75', '5', '2300', 'B1000'),
('I108', 'Papier 3 ex continu', '200', '557', '3500', 'B500'),
('I110', 'Papier 4 ex continu', '10', '12', '63', 'B400'),
('P220', 'Pre-imprime commande', '500', '2500', '24500', 'B500'),
('P230', 'Pre-imprime facture', '500', '250', '12500', 'B500'),
('P240', 'Pre-imprime bulletin paie', '500', '3000', '6250', 'B500'),
('P250', 'Pre-imprime bon livraison', '500', '2500', '24500', 'B500'),
('P270', 'Pre-imprime bon fabricati', '500', '2500', '24500', 'B500'),
('R080', 'Ruban Epson 850', '10', '2', '120', 'unit?'),
('R132', 'Ruban imp1200 lignes', '25', '200', '182', 'unit?');

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

CREATE TABLE `vente` (
  `CODART` char(4) NOT NULL,
  `NUMFOU` decimal(10,0) NOT NULL,
  `DELLIV` decimal(3,0) NOT NULL,
  `QTE1` decimal(6,0) NOT NULL,
  `PRIX1` decimal(5,2) NOT NULL,
  `QTE2` decimal(6,0) DEFAULT NULL,
  `PRIX2` decimal(5,2) DEFAULT NULL,
  `QTE3` decimal(6,0) DEFAULT NULL,
  `PRIX3` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vente`
--

INSERT INTO `vente` (`CODART`, `NUMFOU`, `DELLIV`, `QTE1`, `PRIX1`, `QTE2`, `PRIX2`, `QTE3`, `PRIX3`) VALUES
('B001', '8700', '15', '0', '150.00', '50', '145.00', '100', '140.00'),
('B002', '8700', '15', '0', '210.00', '50', '200.00', '100', '185.00'),
('D035', '120', '0', '0', '40.00', NULL, NULL, NULL, NULL),
('D035', '9120', '5', '0', '40.00', '100', '30.00', NULL, NULL),
('I100', '120', '90', '0', '700.00', '50', '600.00', '120', '500.00'),
('I100', '540', '70', '0', '710.00', '60', '630.00', '100', '600.00'),
('I100', '9120', '60', '0', '800.00', '70', '600.00', '90', '500.00'),
('I100', '9150', '90', '0', '650.00', '90', '600.00', '200', '590.00'),
('I100', '9180', '30', '0', '778.75', '50', '697.07', '100', '490.00'),
('I105', '120', '90', '10', '705.00', '50', '630.00', '120', '500.00'),
('I105', '540', '70', '0', '810.00', '60', '645.00', '100', '600.00'),
('I105', '8700', '30', '0', '720.00', '50', '670.00', '100', '510.00'),
('I105', '9120', '60', '0', '920.00', '70', '800.00', '90', '700.00'),
('I105', '9150', '90', '0', '685.00', '90', '600.00', '200', '590.00'),
('I108', '120', '90', '5', '795.00', '30', '720.00', '100', '680.00'),
('I108', '9120', '60', '0', '920.00', '70', '820.00', '100', '780.00'),
('I110', '9120', '60', '0', '950.00', '70', '850.00', '90', '790.00'),
('I110', '9180', '90', '0', '973.44', '70', '905.15', '90', '835.00'),
('P220', '120', '15', '0', '999.99', '100', '999.99', NULL, NULL),
('P220', '8700', '20', '50', '999.99', '100', '999.99', NULL, NULL),
('P230', '120', '30', '0', '999.99', '100', '999.99', NULL, NULL),
('P230', '8700', '60', '0', '999.99', '50', '999.99', NULL, NULL),
('P240', '120', '15', '0', '999.99', '100', '999.99', NULL, NULL),
('P250', '120', '30', '0', '999.99', '100', '999.99', '500', '999.99'),
('P250', '9120', '30', '0', '999.99', '100', '999.99', '500', '999.99'),
('R080', '9120', '10', '0', '120.00', '100', '100.00', NULL, NULL),
('R132', '9120', '5', '0', '275.00', NULL, NULL, NULL, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `entcom`
--
ALTER TABLE `entcom`
  ADD PRIMARY KEY (`NUMCOM`),
  ADD KEY `NUMFOU` (`NUMFOU`);

--
-- Index pour la table `fournis`
--
ALTER TABLE `fournis`
  ADD PRIMARY KEY (`NUMFOU`);

--
-- Index pour la table `ligcom`
--
ALTER TABLE `ligcom`
  ADD PRIMARY KEY (`NUMCOM`,`CODART`,`NUMLIG`),
  ADD KEY `CODART` (`CODART`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`CODART`);

--
-- Index pour la table `vente`
--
ALTER TABLE `vente`
  ADD PRIMARY KEY (`CODART`,`NUMFOU`),
  ADD KEY `NUMFOU` (`NUMFOU`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `entcom`
--
ALTER TABLE `entcom`
  MODIFY `NUMCOM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70630;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `entcom`
--
ALTER TABLE `entcom`
  ADD CONSTRAINT `entcom_ibfk_1` FOREIGN KEY (`NUMFOU`) REFERENCES `fournis` (`NUMFOU`);

--
-- Contraintes pour la table `ligcom`
--
ALTER TABLE `ligcom`
  ADD CONSTRAINT `ligcom_ibfk_1` FOREIGN KEY (`NUMCOM`) REFERENCES `entcom` (`NUMCOM`),
  ADD CONSTRAINT `ligcom_ibfk_2` FOREIGN KEY (`CODART`) REFERENCES `produit` (`CODART`);

--
-- Contraintes pour la table `vente`
--
ALTER TABLE `vente`
  ADD CONSTRAINT `vente_ibfk_1` FOREIGN KEY (`CODART`) REFERENCES `produit` (`CODART`),
  ADD CONSTRAINT `vente_ibfk_2` FOREIGN KEY (`NUMFOU`) REFERENCES `fournis` (`NUMFOU`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
