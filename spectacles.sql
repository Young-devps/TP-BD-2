# Suppression des tables créées en ligne de commande pour des tests.
# NB: Supprimer dabord les tables qui comportent des clés étrangères


#DROP TABLE seance;
#DROP TABLE salle;
#DROP TABLE cinema;
#DROP TABLE role;
#DROP TABLE film;
#DROP TABLE artiste;

CREATE TABLE Artiste  (Nom VARCHAR (20) NOT NULL,
                       Prenom VARCHAR (15),
                       Annee_naissance DECIMAL(4,0) ,
                       CONSTRAINT PK_Artiste PRIMARY KEY (Nom));

CREATE TABLE film  (ID_film         DECIMAL(10,0) NOT NULL,
                    Titre           VARCHAR(30),
                    Annee           DECIMAL(4,0),
                    Nom_Realisateur VARCHAR(20),
                    CONSTRAINT PK_Film PRIMARY KEY (ID_film),
                    CONSTRAINT FK_Fiml_Artiste FOREIGN KEY (Nom_realisateur) REFERENCES Artiste(Nom));

CREATE TABLE Role  (Nom_role    VARCHAR2(20) NOT NULL, 
                    ID_film     DECIMAL(10,0) NOT NULL,
                    Nom_acteur  VARCHAR (20) NOT NULL,
                    CONSTRAINT PK_Role PRIMARY KEY (ID_film, nom_acteur),
                    CONSTRAINT FK_RoleFilm FOREIGN KEY (ID_film) REFERENCES Film (ID_Film) ON DELETE CASCADE,
                    CONSTRAINT FK_RoleArtiste FOREIGN KEY (Nom_acteur) REFERENCES Artiste (Nom) ON DELETE CASCADE);

CREATE TABLE cinema  (Nom_cinema     VARCHAR (10) NOT NULL,
                      Arrondissement DECIMAL (2,0),        
                      Adresse        VARCHAR (30),
                      CONSTRAINT PK_Cinema PRIMARY KEY (Nom_cinema));

CREATE TABLE salle  (Nom_cinema   VARCHAR(10) NOT NULL,
                     No_salle     DECIMAL(2,0) NOT NULL,
                     Climatise    CHAR(1),
                     Capacite     DECIMAL(4,0),
                     CONSTRAINT PK_Salle PRIMARY KEY (Nom_cinema, No_salle),
                     CONSTRAINT FK_SalleCinema FOREIGN KEY (Nom_cinema) REFERENCES cinema (Nom_cinema) ON DELETE CASCADE);

CREATE TABLE seance  (Nom_cinema   VARCHAR2(10) NOT NULL,
                      No_salle     DECIMAL(2,0) NOT NULL,
                      No_seance    DECIMAL(2,0) NOT NULL,
                      Heure_debut  DECIMAL (4,2),
                      Heure_fin    DECIMAL (4,2),
                      ID_film      DECIMAL(10,0)  NOT NULL,
                      CONSTRAINT PK_Seance PRIMARY KEY (Nom_cinema, No_salle, No_seance),
                      CONSTRAINT FK_SeanceSalle FOREIGN KEY (Nom_cinema, No_salle) REFERENCES salle
                      ON DELETE CASCADE);
