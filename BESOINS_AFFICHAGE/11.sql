-- Sortir les produits des commandes ayant le mot "urgent' en observation?
-- (Afficher le numéro de commande, le nom du fournisseur, le libellé du produit et
-- le sous total = quantité commandée * Prix unitaire)

SELECT ENTCOM.NUMCOM, FOURNIS.NOMFOU, PRODUIT.LIBART, (LIGCOM.QTECDE * LIGCOM.PRIUNI) AS SUB_TOTAL
FROM LIGCOM
INNER JOIN PRODUIT ON LIGCOM.CODART = PRODUIT.CODART
INNER JOIN ENTCOM ON LIGCOM.NUMCOM = ENTCOM.NUMCOM
INNER JOIN FOURNIS ON ENTCOM.NUMFOU = FOURNIS.NUMFOU
WHERE ENTCOM.OBSCOM LIKE '%urgent%';