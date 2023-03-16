-- Quels sont les fournisseurs situés dans les départements 75 78 92 77 ?
-- L’affichage (département, nom fournisseur) sera effectué par département
-- décroissant, puis par ordre alphabétique

SELECT SUBSTR(POSFOU, 1, 2) AS DEPARTEMENT, NOMFOU
FROM FOURNIS
WHERE SUBSTR(POSFOU, 1, 2) IN ('75', '78', '92', '77')
ORDER BY DEPARTEMENT DESC, NOMFOU ASC;