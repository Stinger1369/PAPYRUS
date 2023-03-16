-- 20. Existe-t-il des lignes de commande non cohérentes avec les produits vendus par
-- les fournisseurs. ?

SELECT 
  L.* 
FROM LIGCOM L
JOIN ENTCOM E ON L.NUMCOM = E.NUMCOM
LEFT JOIN VENTE V ON L.CODART = V.CODART AND E.NUMFOU = V.NUMFOU
WHERE V.CODART IS NULL;