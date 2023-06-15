Les titres et dates de sortie des films du plus récent au plus ancien :

````sql
SELECT titre, annee_sortie
FROM film
ORDER BY annee_sortie DESC;
````


les noms, prénoms et âges des acteurs ou actrices de plus de 30 ans dans l'ordre alphabétique :

````sql
SELECT nom_acteur, prenom_acteur, TIMESTAMPDIFF(YEAR, date_naissance, CURDATE()) AS age
FROM acteur
WHERE TIMESTAMPDIFF(YEAR, date_naissance, CURDATE()) > 30
ORDER BY nom_acteur, prenom_acteur;
````


