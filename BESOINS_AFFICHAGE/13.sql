-- Coder de 2 manières différentes la requête suivante :
-- Lister les commandes (Numéro et date) dont le fournisseur est celui de la
-- commande 70210

--1
-- SELECT NUMCOM, DATCOM
-- FROM ENTCOM
-- WHERE NUMFOU = (
--   SELECT NUMFOU
--   FROM ENTCOM
--   WHERE NUMCOM = '70210'
-- );

--2
SELECT ec.NUMCOM, ec.DATCOM
FROM ENTCOM ec
INNER JOIN (
  SELECT NUMFOU
  FROM ENTCOM
  WHERE NUMCOM = '70210'
) AS subq ON ec.NUMFOU = subq.NUMFOU;