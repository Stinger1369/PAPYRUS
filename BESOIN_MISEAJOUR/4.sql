-- 4. Suppression du produit I110
DELETE FROM LIGCOM
WHERE CODART = 'I110';

DELETE FROM VENTE
WHERE CODART = 'I110';

DELETE FROM PRODUIT
WHERE CODART = 'I110';