-- Active: 1678960461224@@127.0.0.1@3306@papyrus
-- 1. Application d'une augmentation de tarif de 4% pour le prix 1, 2% pour le prix2 pour le fournisseur 9180

UPDATE VENTE
SET PRIX1 = PRIX1 * 1.04, PRIX2 = PRIX2 * 1.02
WHERE NUMFOU = 9180;
 