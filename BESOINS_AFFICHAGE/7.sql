-- Quelles sont les commandes du jour qui ont des observations particulières ?
-- (Affichage numéro de commande, date de commande)

SELECT NUMCOM, DATCOM
FROM ENTCOM
WHERE DATCOM = CURDATE() AND OBSCOM IS NOT NULL;