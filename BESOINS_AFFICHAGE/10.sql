-- Lister les commandes par nom fournisseur
-- (Afficher le nom du fournisseur, le numéro de commande et la date)

SELECT FOURNIS.NOMFOU, ENTCOM.NUMCOM, ENTCOM.DATCOM
FROM ENTCOM
INNER JOIN FOURNIS ON ENTCOM.NUMFOU = FOURNIS.NUMFOU
ORDER BY FOURNIS.NOMFOU ASC;