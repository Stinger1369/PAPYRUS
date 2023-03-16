-- Lister les commandes dont le total est supérieur à 10 000€ ; on exclura dans le
-- calcul du total les articles commandés en quantité supérieure ou égale à 1000.
-- (Affichage numéro de commande et total)

SELECT NUMCOM, SUM(IF(QTECDE<1000, QTECDE*PRIUNI, 0)) 
AS TOTAL
FROM LIGCOM
GROUP BY NUMCOM
HAVING TOTAL > 10000;