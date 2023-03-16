-- Quelles sont les commandes passées au mois de mars et avril ?

SELECT NUMCOM, DATCOM
FROM ENTCOM
WHERE MONTH(DATCOM) IN (3, 4);