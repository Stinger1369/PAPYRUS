-- 2. Mettre à jour le prix unitaire des articles égaux 0, en affectant le plus petit prix unitaire (prix1) des fournisseurs susceptible de fournir cet article

UPDATE PRODUIT p
SET p.UNIMES = (
  SELECT MIN(v.PRIX1)
  FROM VENTE v
  WHERE v.CODART = p.CODART
)
WHERE p.UNIMES = 0;