-- Coder de 3 manières différentes la requête suivante :
-- Lister le nom des fournisseurs susceptibles de livrer au moins un article

--1
SELECT DISTINCT f.NOMFOU
FROM FOURNIS f
INNER JOIN VENTE v ON f.NUMFOU = v.NUMFOU;

--2

SELECT NOMFOU
FROM FOURNIS
WHERE NUMFOU IN (
  SELECT DISTINCT NUMFOU
  FROM LIGCOM
);


--3

SELECT NOMFOU
FROM FOURNIS
WHERE EXISTS (
  SELECT *
  FROM LIGCOM
  WHERE NUMFOU = FOURNIS.NUMFOU
);