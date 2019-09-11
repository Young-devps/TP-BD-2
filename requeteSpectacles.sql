# Requêtes SQL
# Quand vous vous connectez à la base ``Officiel des spectacles'' dont le schéma a été présenté précédemment. 
# Cette base contient un petit jeu de données plus ou moins réaliste. 
# il faut concevoir, saisir et exécuter les ordres SQL correspondant aux requêtes suivantes.


# Sélections simples

# 1. Les titres de films triés. 
# Solution : 
SELECT titre 
FROM film
ORDER BY titre;

# 2. Nom et année de naissance des artistes nés après 1950.
# Solution :
SELECT nom, annee_naissance
FROM   artiste
WHERE annee_naissance >= 1950;

# 3 : Les cinémas du 14ème arrondissement.
# Solution :
SELECT *
FROM   cinema
WHERE arrondissement = 14;

# 4 : Les artistes dont le nom commence par 'H' (commande LIKE).
# Solution :


# 5 : Quels sont les acteurs dont on ignore la date de naissance ? 
# (Attention : cela signifie que la valeur nexiste pas).
# Solution :


# 6 : Combien de fois Bruce Willis a-t-il joué le role de McLane ? 
# Solution :
SELECT count(*) 
FROM role
WHERE nom_acteur = 'Willis'
AND   nom_role = 'McLane';


#  Jointures


# 7. Qui a joué EDOUDOUA (nom et prénom) ?
# Solution :
SELECT prenom, nom_acteur 
FROM   role, artiste
WHERE nom_role = 'EDOUDOUA'
AND  nom_acteur = nom;

# 8 : Nom des acteurs de "La Déchirure" .
# Solution :


# 9 : Films dont le réalisateur est Athanase MVONDO, et un des acteurs avec Gervais MENDO ZE.
# Solution :
SELECT titre
FROM   film f, role r
WHERE  f.id_film = r.id_film
AND    nom_realisateur='MVONDO'
AND    nom_acteur='MENDO ZE';

# 10 : Quels films peut-on voir au WOURI, et à quelle heure ?
# Solution :
SELECT titre, heure_debut
FROM   seance s, film f
WHERE  s.id_film = f.id_film
AND    s.nom_cinema='WOURI';


# 11 : Titre des films dans lesquels a joué Bernard Fotsing. Donner aussi le rôle.
# Solution :



# 12 : Quel metteur en scène a tourné dans ses propres films ? Donner le nom, le rôle et le titre des films.
# Solution :



# 13 : Quel metteur en scène a tourné en tant quacteur ? Donner le nom, le rôle et le titre des films où le metteur en scène a joué.
# Solution :


# 14 : Où peut-on voir Shining ? (Nom et adresse du cinéma, horaire).
# Solution :


# 15 : Dans quels films le metteur-en-scène a-t-il le même prénom que lun des interprètes ? (titre, nom du metteur-en-scne, nom de l'inteprète). Le metteur-en-scène et l'interprète ne doivent pas être la même personne.
# Solution :


# 16 :Où peut-on voir un film avec Clint Eastwood ? (Nom et adresse du cinéma, horaire). 
# Solution :


# 17 : Quel film peut-on voir dans le 12e arrondissement, dans une salle climatisée ? 
# (Nom du cinéma, No de la salle, horaire, titre du film).
# Solution :
SELECT  f.titre, c.nom_cinema, salle.no_salle,  heure_debut, heure_fin
FROM  film f, seance s, cinema c, salle salle
WHERE salle.climatise = 'O'
AND   c.arrondissement = 12
AND   s.id_film = f.id_film
AND   s.nom_cinema = c.nom_cinema
AND   salle.nom_cinema = c.nom_cinema
AND   s.no_salle     =   salle.no_salle;

# 18 : Liste des cinémas (Adresse, Arrondissement) ayant une salle de plus de 150 places et passant un film avec Bruce Willis.
# Solution :


# 19 : Liste des cinémas (Nom, Adresse) dont TOUTES les salles ont plus de 100 places.
# Solution :



#  Négation

# 20 : Quels acteurs nont jamais mis en scène de film ?
# Solution :
SELECT nom
FROM artiste
MINUS
SELECT nom_realisateur
FROM  film;

# 21 : Les cinémas (nom, adresse) qui ne passent pas un film de Tarantino.
# Solution :


# Fonctions de groupe

# 22 : Total des places dans les salles du Rex.
# Solution :
SELECT sum (capacite)
FROM   salle
WHERE  nom_cinema = 'Rex';


# 23 : Année du film le plus ancien et du film le plus récent.
# Solution :


# 24 : Total des places offertes par cinéma.
# Solution :


# 25 : Nom et prénom des réalisateurs, et nombre de films quils ont tournés.
# Solution :


# 26 : Nom des cinémas ayant plus de 1 salle climatisée.
# Solution :
SELECT nom_cinema, count(*)
FROM   salle
WHERE  climatise = 'O'
GROUP BY nom_cinema
HAVING  count (*) > 1;
Résultat : le Rex 

# 27 : Les artistes (nom, prénom) ayant joué au moins dans trois films depuis 1985, dont au moins un passe a l'affiche a Paris (donner ausssi le nombre de films).
# Solution :
