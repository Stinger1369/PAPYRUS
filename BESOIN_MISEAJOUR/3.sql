-- 3. Mettre à jour le champ obscom en positionnant '*****' pour toutes les commandes
-- dont le fournisseur a un indice de satisfaction <5


UPDATE ENTCOM e
SET e.OBSCOM = '*****'
WHERE e.NUMFOU IN (
  SELECT f.NUMFOU
  FROM FOURNIS f
  WHERE f.SATISF < 5
);