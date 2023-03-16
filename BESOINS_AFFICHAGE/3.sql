-- Afficher le nombre de commandes fournisseurs passées, et le nombre de fournisseur concernés.

SELECT COUNT(NUMCOM) AS NOMBRE_COMMANDES, COUNT(DISTINCT NUMFOU) AS NOMBRE_FOURNISSEURS
FROM ENTCOM;