# 1 III.1 PHASE 1
### Quel est l’ordre à adopter ? Argumenter.

L'ordre dans lequel les tables doivent être remplies dépend des relations entre elles, en particulier des clés étrangères. Les clés étrangères sont des contraintes qui garantissent l'intégrité référentielle, c'est-à-dire qu'elles s'assurent que les données référencées existent réellement dans les tables liées.

Dans le cas de cette base de données, voici l'ordre recommandé pour remplir les tables et les arguments pour chaque étape :

TABLE FOURNIS : Cette table contient les informations sur les fournisseurs. Comme aucune autre table n'est référencée en tant que clé étrangère dans cette table, il est logique de la remplir en premier.

TABLE ARTICLES : Cette table contient les informations sur les articles. Elle est liée à la table FOURNIS via une clé étrangère (NUMFOU). Il est donc nécessaire de remplir la table FOURNIS avant de pouvoir insérer des données dans la table ARTICLES.

TABLE CLIENTS : Cette table contient les informations sur les clients. Comme aucune autre table n'est référencée en tant que clé étrangère dans cette table, elle peut être remplie indépendamment des autres tables.

TABLE VENTE : Cette table contient les informations sur les ventes et les prix des articles en fonction des fournisseurs. Elle est liée aux tables ARTICLES (CODART) et FOURNIS (NUMFOU) via des clés étrangères. Il est donc nécessaire de remplir les tables ARTICLES et FOURNIS avant de pouvoir insérer des données dans la table VENTE.

TABLE COMMANDES : Cette table contient les informations sur les commandes. Elle est liée à la table CLIENTS via une clé étrangère (NUMCLI). Il est donc nécessaire de remplir la table CLIENTS avant de pouvoir insérer des données dans la table COMMANDES.

TABLE LIGCOM : Cette table contient les informations sur les lignes de commandes. Elle est liée aux tables ARTICLES (CODART) et COMMANDES (NUMCOM) via des clés étrangères. Il est donc nécessaire de remplir les tables ARTICLES et COMMANDES avant de pouvoir insérer des données dans la table LIGCOM.

En résumé, l'ordre à adopter pour remplir les tables est le suivant :

FOURNIS
ARTICLES
CLIENTS
VENTE
COMMANDES
LIGCOM
Cet ordre garantit que toutes les contraintes d'intégrité référentielle sont respectées et qu'aucune erreur ne se produira lors de l'insertion des données.