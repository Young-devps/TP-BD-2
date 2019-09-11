# INSERTION DES DONNEES DANS LA BASE DE DONNEES DES SPECTACLES.

# Insertion dans la table Artiste
INSERT INTO Artiste (Nom,Prenom,Annee_naissance) VALUES ('MBASSEK BAKOBIO','',1976);
INSERT INTO Artiste (Nom, Prenom, Annee_naissance) VALUES ('MVONDO','Athanase', 1972);

# Insertion dans la table des fimls
INSERT INTO Film (ID_film,Titre,Annee,Nom_Realisateur) VALUES (1,'Qui cherche trouve',2005,'MVONDO');

# Insertion des Rôles 
INSERT INTO Role VALUES ('EDOUDOUA', 1, 'MVONDO');

# Insertion des cinemas :
INSERT INTO Cinema (Nom_cinema,Arrondissement,Adresse) VALUES ('WOURI',10,'1250 Douala');

# Insertion des salles de cinema
INSERT INTO salle (Nom_cinema, No_salle,Climatise,Capacite) VALUES ('WOURI',4,'O',200);

# Insertion des séances 
INSERT INTO Seance (Nom_Cinema, No_salle, No_seance, Heure_debut,Heure_fin,Id_film) VALUES ('WOURI',4,2,10.30,14.30,1);


COMMIT;