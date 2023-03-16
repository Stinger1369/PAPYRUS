-- 5. Suppression des entête de commande qui n'ont aucune ligne

DELETE FROM ENTCOM
WHERE NUMCOM NOT IN (SELECT DISTINCT NUMCOM FROM LIGCOM);