

--creation de la base de donnees papyrus 
--creation de la table produit
CREATE TABLE IF NOT EXISTS PRODUIT (
  CODART CHAR(4) PRIMARY KEY,
  LIBART VARCHAR(25) NOT NULL,
  STKLE DECIMAL(7,0) NOT NULL,
  STKPHY DECIMAL(7,0) NOT NULL,
  QTEANN DECIMAL(6,0) NOT NULL,
  UNIMES CHAR(5) NOT NULL
);

--insertion des donnees dans la table produit
INSERT IGNORE INTO PRODUIT (CODART, LIBART, STKLE, STKPHY, QTEANN, UNIMES) VALUES
('B001', 'Bande magnétique 1200', 20, 87, 240, 'unité'),
('B002', 'Bande magnétique 6250', 20, 12, 410, 'unité'),
('D035', 'CD R slim 80 mm', 40, 42, 150, 'B010'),
('D050', 'CD R-W 80mm', 50, 4, 0, 'B010'),
('I100', 'Papier 1 ex continu', 100, 557, 3500, 'B1000'),
('I105', 'Papier 2 ex continu', 75, 5, 2300, 'B1000'),
('I108', 'Papier 3 ex continu', 200, 557, 3500, 'B500'),
('I110', 'Papier 4 ex continu', 10, 12, 63, 'B400'),
('P220', 'Pré-imprimé commande', 500, 2500, 24500, 'B500'),
('P230', 'Pré-imprimé facture', 500, 250, 12500, 'B500'),
('P240', 'Pré-imprimé bulletin paie', 500, 3000, 6250, 'B500'),
('P250', 'Pré-imprimé bon livraison', 500, 2500, 24500, 'B500'),
('P270', 'Pré-imprimé bon fabrication', 500, 2500, 24500, 'B500'),
('R080', 'ruban Epson 850', 10, 2, 120, 'unité'),
('R132', 'ruban impl 1200 lignes', 25, 200, 182, 'unité');

UPDATE PRODUIT
SET LIBART = REPLACE(LIBART, 'Pré-imprimé', 'Pre-imprime');

UPDATE PRODUIT
SET LIBART = 'Bande magnetique 6250'
WHERE CODART = 'B001';

UPDATE PRODUIT
SET LIBART = 'Bande magnetique 6250'
WHERE CODART = 'B002';

UPDATE PRODUIT
SET LIBART = 'Pre-imprime commande'
WHERE CODART = 'P220';

UPDATE PRODUIT
SET LIBART = 'Pre-imprime facture'
WHERE CODART = 'P230';

UPDATE PRODUIT
SET LIBART = 'Pre-imprime bulletin paie'
WHERE CODART = 'P240';

UPDATE PRODUIT
SET LIBART = 'Pre-imprime bon livraison'
WHERE CODART = 'P250';

UPDATE PRODUIT
SET LIBART = 'Pre-imprime bon fabrication'
WHERE CODART = 'P270';



--creation de la table fournisseur

CREATE TABLE IF NOT EXISTS FOURNIS (
  NUMFOU DECIMAL(10,0) PRIMARY KEY,
  NOMFOU VARCHAR(30) NOT NULL,
  RUEFOU VARCHAR(30) NOT NULL,
  POSFOU CHAR(5) NOT NULL,
  VILFOU VARCHAR(30) NOT NULL,
  CONFOU VARCHAR(15) NOT NULL,
  SATISF DECIMAL(3,0)
);

--insertion des donnees dans la table fournisseur

INSERT IGNORE INTO `FOURNIS` (`NUMFOU`, `NOMFOU`, `RUEFOU`, `POSFOU`, `VILFOU`, `CONFOU`, `SATISF`) VALUES
(120, 'GROBRIGAN', '20 rue du papier', '92200', 'papercity', 'Georges', 8),
(540, 'ECLIPSE', '53, rue laisse flotter les rub', '78250', 'Bugbugville', 'Nestor', 7),
(8700, 'MEDICIS', '120 rue des plantes', '75014', 'Paris', 'Lison', NULL),
(9120, 'DISCOBOL', '11 rue des sports', '85100', 'La Roche sur Yon', 'Hercule', 8),
(9150, 'DEPANPAP', '26, avenue des locomotives', '59987', 'Coroncountry', 'Pollux', 5),
(9180, 'HURRYTAPE', '68, boulevard des octets', '04044', 'Dumpville', 'Track', NULL);



--creation de la table commande

CREATE TABLE IF NOT EXISTS ENTCOM (
  NUMCOM INT(6) AUTO_INCREMENT PRIMARY KEY,
  OBSCOM VARCHAR(25),
  DATCOM DATE NOT NULL,
  NUMFOU DECIMAL(10,0),
  FOREIGN KEY (NUMFOU) REFERENCES FOURNIS(NUMFOU)
);

--insertion des donnees dans la table commande

INSERT INTO `entcom` (`NUMCOM`, `OBSCOM`, `DATCOM`, `NUMFOU`) VALUES
(70010, NULL, '2007-02-10', 120),
(70011, 'Commande urgente', '2007-03-01', 540),
(70020, NULL, '2007-04-25', 9180),
(70025, 'Commande urgente', '2007-04-30', 9150),
(70210, 'Commande cadenc?e', '2007-05-05', 120),
(70250, 'Commande cadenc?e', '2007-10-02', 8700),
(70300, NULL, '2007-06-06', 9120),
(70620, NULL, '2007-10-02', 540),
(70625, NULL, '2007-10-09', 120),
(70629, NULL, '2007-10-12', 9180);



--creation de la table ligne de commande

CREATE TABLE IF NOT EXISTS LIGCOM (
  NUMCOM INT(6) NOT NULL,
  CODART CHAR(4) NOT NULL,
  NUMLIG DECIMAL(3,0) NOT NULL,
  QTECDE DECIMAL(6,0) NOT NULL,
  PRIUNI DECIMAL(5,2) NOT NULL,
  QTELIV DECIMAL(6,0),
  DERLIV DATE,
  PRIMARY KEY (NUMCOM, CODART, NUMLIG),
  FOREIGN KEY (NUMCOM) REFERENCES ENTCOM(NUMCOM),
  FOREIGN KEY (CODART) REFERENCES PRODUIT(CODART)
);

--insertion des donnees dans la table ligne de commande

INSERT IGNORE INTO `ligcom` (`NUMCOM`, `NUMLIG`, `CODART`, `QTECDE`, `PRIUNI`, `QTELIV`, `DERLIV`) VALUES
(70010, 1, 'I100', 3000, '470.00', 3000, '2007-03-15'),
(70010, 2, 'I105', 2000, '485.00', 2000, '2007-07-05'),
(70010, 3, 'I108', 1000, '680.00', 1000, '2007-08-20'),
(70010, 4, 'D035', 200, '40.00', 250, '2007-02-20'),
(70010, 5, 'P220', 6000, '3500.00', 6000, '2007-03-31'),
(70010, 6, 'P240', 6000, '2000.00', 2000, '2007-03-31'),
(70011, 1, 'I105', 1000, '600.00', 1000, '2007-05-16'),
(70020, 1, 'B001', 200, '140.00', NULL, '2007-12-31'),
(70020, 2, 'B002', 200, '140.00', NULL, '2007-12-31'),
(70025, 1, 'I100', 1000, '590.00', 1000, '2007-05-15'),
(70025, 2, 'I105', 500, '590.00', 500, '2007-05-15'),
(70210, 1, 'I100', 1000, '470.00', 1000, '2007-07-15'),
(70210, 2, 'P220', 10000, '3500.00', 10000, '2007-08-31'),
(70250, 1, 'P230', 15000, '4900.00', 12000, '2007-12-15'),
(70250, 2, 'P220', 10000, '3350.00', 10000, '2007-11-10'),
(70300, 1, 'I110', 50, '790.00', 50, '2007-10-31'),
(70620, 1, 'I105', 200, '600.00', 200, '2007-11-01'),
(70625, 1, 'I100', 1000, '470.00', 1000, '2007-10-15'),
(70625, 2, 'P220', 10000, '3500.00', 10000, '2007-10-31'),
(70629, 1, 'B001', 200, '140.00', NULL, '2007-12-31'),
(70629, 2, 'B002', 200, '140.00', NULL, '2007-12-31');

--creation de la table vente

CREATE TABLE IF NOT EXISTS VENTE (
  CODART CHAR(4) NOT NULL,
  NUMFOU DECIMAL(10,0) NOT NULL,
  DELLIV DECIMAL(3,0) NOT NULL,
  QTE1 DECIMAL(6,0) NOT NULL,
  PRIX1 DECIMAL(5,2) NOT NULL,
  QTE2 DECIMAL(6,0),
  PRIX2 DECIMAL(5,2),
  QTE3 DECIMAL(6,0),
  PRIX3 DECIMAL(5,2),
  PRIMARY KEY (CODART, NUMFOU),
  FOREIGN KEY (CODART) REFERENCES PRODUIT(CODART),
  FOREIGN KEY (NUMFOU) REFERENCES FOURNIS(NUMFOU)
);

--insertion des donnees dans la table vente

INSERT IGNORE INTO `vente` (`CODART`, `NUMFOU`, `DELLIV`, `QTE1`, `PRIX1`, `QTE2`, `PRIX2`, `QTE3`, `PRIX3`) VALUES
('B001', 8700, 15, 0, '150.00', 50, '145.00', 100, '140.00'),
('B002', 8700, 15, 0, '210.00', 50, '200.00', 100, '185.00'),
('D035', 120, 0, 0, '40.00', NULL, NULL, NULL, NULL),
('D035', 9120, 5, 0, '40.00', 100, '30.00', NULL, NULL),
('I100', 120, 90, 0, '700.00', 50, '600.00', 120, '500.00'),
('I100', 540, 70, 0, '710.00', 60, '630.00', 100, '600.00'),
('I100', 9120, 60, 0, '800.00', 70, '600.00', 90, '500.00'),
('I100', 9150, 90, 0, '650.00', 90, '600.00', 200, '590.00'),
('I100', 9180, 30, 0, '720.00', 50, '670.00', 100, '490.00'),
('I105', 120, 90, 10, '705.00', 50, '630.00', 120, '500.00'),
('I105', 540, 70, 0, '810.00', 60, '645.00', 100, '600.00'),
('I105', 8700, 30, 0, '720.00', 50, '670.00', 100, '510.00'),
('I105', 9120, 60, 0, '920.00', 70, '800.00', 90, '700.00'),
('I105', 9150, 90, 0, '685.00', 90, '600.00', 200, '590.00'),
('I108', 120, 90, 5, '795.00', 30, '720.00', 100, '680.00'),
('I108', 9120, 60, 0, '920.00', 70, '820.00', 100, '780.00'),
('I110', 9120, 60, 0, '950.00', 70, '850.00', 90, '790.00'),
('I110', 9180, 90, 0, '900.00', 70, '870.00', 90, '835.00'),
('P220', 120, 15, 0, '3700.00', 100, '3500.00', NULL, NULL),
('P220', 8700, 20, 50, '3500.00', 100, '3350.00', NULL, NULL),
('P230', 120, 30, 0, '5200.00', 100, '5000.00', NULL, NULL),
('P230', 8700, 60, 0, '5000.00', 50, '4900.00', NULL, NULL),
('P240', 120, 15, 0, '2200.00', 100, '2000.00', NULL, NULL),
('P250', 120, 30, 0, '1500.00', 100, '1400.00', 500, '1200.00'),
('P250', 9120, 30, 0, '1500.00', 100, '1400.00', 500, '1200.00'),
('R080', 9120, 10, 0, '120.00', 100, '100.00', NULL, NULL),
('R132', 9120, 5, 0, '275.00', NULL, NULL, NULL, NULL);



-- ALTER TABLE VENTE
-- MODIFY CODART CHAR(6) NOT NULL;