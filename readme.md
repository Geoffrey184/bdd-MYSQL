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

La liste des actrices ou acteurs principaux pour un film donné :
````sql

````

La liste des films pour une actrice ou un acteur donné :
````sql

````

Ajouter un film :
````sql
INSERT INTO film (id_film, titre, nombre_acteur, realisteur, duree, annee_sortie)
VALUES (1, 'ironman', 40, 'Jon Favreau', '01:26:00', '2008-07-08');
````

Ajouter une actrice ou un acteur :
````sql
INSERT INTO acteur (id_acteur, nom_acteur, prenom_acteur, role_acteur, date_naissance)
VALUES (3, 'Doe', 'John', 'Principal', '1990-05-15');
````


Modifier un film :
````sql
UPDATE film
SET titre = 'Hulk'
WHERE id_film = 3;
````

Supprimer une actrice ou un acteur :
````sql
DELETE FROM acteur
WHERE id_acteur = 2;
````

Afficher les 3 derniers acteurs/actrices ajouté(e)s :
````sql
SELECT nom_acteur, prenom_acteur
FROM acteur
ORDER BY id_acteur DESC
LIMIT 3;
````
