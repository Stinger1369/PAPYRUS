-- Coder de 2 manières différentes la requête suivante :
-- Dans les articles susceptibles d’être vendus, lister les articles moins chers (basés
-- sur Prix1) que le moins cher des rubans (article dont le premier caractère
-- commence par R). On affichera le libellé de l’article et prix1.

--1 ADD

-- SELECT p.LIBART, v.PRIX1
-- FROM PRODUIT p
-- JOIN VENTE v ON p.CODART = v.CODART
-- WHERE p.LIBART NOT LIKE 'R%' AND v.PRIX1 < (SELECT MIN(PRIX1) FROM VENTE WHERE CODART LIKE 'R%');


SELECT p.LIBART, v.PRIX1
FROM PRODUIT p
JOIN VENTE v ON p.CODART = v.CODART
WHERE p.LIBART NOT LIKE 'R%' AND v.PRIX1 < (SELECT PRIX1 FROM VENTE WHERE CODART LIKE 'R%' ORDER BY PRIX1 LIMIT 1);