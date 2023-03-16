-- 19. Calculer le chiffre d'affaire par fournisseur pour l'année 93 sachant que les prix
-- indiqués sont hors taxes et que le taux de TVA est 20,60%.

SELECT 
  F.NUMFOU, 
  F.NOMFOU, 
  SUM(L.QTECDE * L.PRIUNI * 1.206) as Chiffre_d_affaires_HT
FROM LIGCOM L
JOIN ENTCOM E ON L.NUMCOM = E.NUMCOM
JOIN FOURNIS F ON E.NUMFOU = F.NUMFOU
WHERE YEAR(E.DATCOM) = 1993
GROUP BY F.NUMFOU, F.NOMFOU;