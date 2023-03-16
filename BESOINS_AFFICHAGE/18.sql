-- En fin d'année, sortir la liste des produits dont la quantité annuelle prévue est
-- inférieure de 10 % à la quantité réellement commandée.


SELECT *
FROM PRODUIT
WHERE QTEANN < (
  SELECT SUM(QTECDE) * 0.9
  FROM LIGCOM
  WHERE PRODUIT.CODART = LIGCOM.CODART
);