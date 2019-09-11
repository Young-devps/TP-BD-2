# Requ�tes SQL
# Quand vous vous connectez � la base ``Officiel des spectacles'' dont le sch�ma a �t� pr�sent� pr�c�demment. 
# Cette base contient un petit jeu de donn�es plus ou moins r�aliste. 
# il faut concevoir, saisir et ex�cuter les ordres SQL correspondant aux requ�tes suivantes.


# S�lections simples

# 1. Les titres de films tri�s. 
# Solution : 
SELECT titre 
FROM film
ORDER BY titre;

# 2. Nom et ann�e de naissance des artistes n�s apr�s 1950.
# Solution :
SELECT nom, annee_naissance
FROM   artiste
WHERE annee_naissance >= 1950;

# 3 : Les cin�mas du 14�me arrondissement.
# Solution :
SELECT *
FROM   cinema
WHERE arrondissement = 14;

# 4 : Les artistes dont le nom commence par 'H' (commande LIKE).
# Solution :


# 5 : Quels sont les acteurs dont on ignore la date de naissance ? 
# (Attention : cela signifie que la valeur nexiste pas).
# Solution :


# 6 : Combien de fois Bruce Willis a-t-il jou� le role de McLane ? 
# Solution :
SELECT count(*) 
FROM role
WHERE nom_acteur = 'Willis'
AND   nom_role = 'McLane';


#  Jointures


# 7. Qui a jou� EDOUDOUA (nom et pr�nom) ?
# Solution :
SELECT prenom, nom_acteur 
FROM   role, artiste
WHERE nom_role = 'EDOUDOUA'
AND  nom_acteur = nom;

# 8 : Nom des acteurs de "La D�chirure" .
# Solution :


# 9 : Films dont le r�alisateur est Athanase MVONDO, et un des acteurs avec Gervais MENDO ZE.
# Solution :
SELECT titre
FROM   film f, role r
WHERE  f.id_film = r.id_film
AND    nom_realisateur='MVONDO'
AND    nom_acteur='MENDO ZE';

# 10 : Quels films peut-on voir au WOURI, et � quelle heure ?
# Solution :
SELECT titre, heure_debut
FROM   seance s, film f
WHERE  s.id_film = f.id_film
AND    s.nom_cinema='WOURI';


# 11 : Titre des films dans lesquels a jou� Bernard Fotsing. Donner aussi le r�le.
# Solution :



# 12 : Quel metteur en sc�ne a tourn� dans ses propres films ? Donner le nom, le r�le et le titre des films.
# Solution :



# 13 : Quel metteur en sc�ne a tourn� en tant quacteur ? Donner le nom, le r�le et le titre des films o� le metteur en sc�ne a jou�.
# Solution :


# 14 : O� peut-on voir Shining ? (Nom et adresse du cin�ma, horaire).
# Solution :


# 15 : Dans quels films le metteur-en-sc�ne a-t-il le m�me pr�nom que lun des interpr�tes ? (titre, nom du metteur-en-scne, nom de l'intepr�te). Le metteur-en-sc�ne et l'interpr�te ne doivent pas �tre la m�me personne.
# Solution :


# 16 :O� peut-on voir un film avec Clint Eastwood ? (Nom et adresse du cin�ma, horaire). 
# Solution :


# 17 : Quel film peut-on voir dans le 12e arrondissement, dans une salle climatis�e ? 
# (Nom du cin�ma, No de la salle, horaire, titre du film).
# Solution :
SELECT  f.titre, c.nom_cinema, salle.no_salle,  heure_debut, heure_fin
FROM  film f, seance s, cinema c, salle salle
WHERE salle.climatise = 'O'
AND   c.arrondissement = 12
AND   s.id_film = f.id_film
AND   s.nom_cinema = c.nom_cinema
AND   salle.nom_cinema = c.nom_cinema
AND   s.no_salle     =   salle.no_salle;

# 18 : Liste des cin�mas (Adresse, Arrondissement) ayant une salle de plus de 150 places et passant un film avec Bruce Willis.
# Solution :


# 19 : Liste des cin�mas (Nom, Adresse) dont TOUTES les salles ont plus de 100 places.
# Solution :



#  N�gation

# 20 : Quels acteurs nont jamais mis en sc�ne de film ?
# Solution :
SELECT nom
FROM artiste
MINUS
SELECT nom_realisateur
FROM  film;

# 21 : Les cin�mas (nom, adresse) qui ne passent pas un film de Tarantino.
# Solution :


# Fonctions de groupe

# 22 : Total des places dans les salles du Rex.
# Solution :
SELECT sum (capacite)
FROM   salle
WHERE  nom_cinema = 'Rex';


# 23 : Ann�e du film le plus ancien et du film le plus r�cent.
# Solution :


# 24 : Total des places offertes par cin�ma.
# Solution :


# 25 : Nom et pr�nom des r�alisateurs, et nombre de films quils ont tourn�s.
# Solution :


# 26 : Nom des cin�mas ayant plus de 1 salle climatis�e.
# Solution :
SELECT nom_cinema, count(*)
FROM   salle
WHERE  climatise = 'O'
GROUP BY nom_cinema
HAVING  count (*) > 1;
R�sultat : le Rex 

# 27 : Les artistes (nom, pr�nom) ayant jou� au moins dans trois films depuis 1985, dont au moins un passe a l'affiche a Paris (donner ausssi le nombre de films).
# Solution :
