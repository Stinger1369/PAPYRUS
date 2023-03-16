-- Editer les produits ayant un stock inférieur ou égal au stock d'alerte et dont la
-- quantité annuelle est inférieur est inférieure à 1000
-- (informations à fournir : n° produit, libellé produit, stock, stock actuel d'alerte,
-- quantité annuelle)

SELECT CODART, LIBART, STKPHY, STKLE, QTEANN
FROM PRODUIT
WHERE STKPHY <= STKLE AND QTEANN < 1000;