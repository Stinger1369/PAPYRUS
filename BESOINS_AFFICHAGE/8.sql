-- Lister le total de chaque commande par total décroissant
-- (Affichage numéro de commande et total)

SELECT NUMCOM, (QTELIV*PRIUNI) AS TOTAL
FROM LIGCOM
ORDER BY TOTAL DESC;