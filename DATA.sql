CREATE TABLE Salle (
    ID_salle INT PRIMARY KEY,
    Nom_salle VARCHAR(255) NOT NULL,
    Nombre_Places INT NOT NULL,
    CHECK (Nombre_Places >= 1)
);

CREATE TABLE Concert (
    ID_concert INT PRIMARY KEY,
    Nom_concert VARCHAR(255) NOT NULL,
    ID_musicien INT,
    ID_organisateur INT,
    FOREIGN KEY (ID_musicien) REFERENCES Musicien(ID_musicien),
    FOREIGN KEY (ID_organisateur) REFERENCES Organisateur(ID_organisateur)
);

CREATE TABLE Seance (
    ID_concert INT,
    Date DATE,
    ID_salle INT,
    PRIMARY KEY (ID_concert, Date),
    FOREIGN KEY (ID_concert) REFERENCES Concert(ID_concert),
    FOREIGN KEY (ID_salle) REFERENCES Salle(ID_salle)
);

CREATE TABLE Client (
    ID_client INT PRIMARY KEY,
    Nom_client VARCHAR(255),
    Tel_client VARCHAR(20)
);

CREATE TABLE Musicien (
    ID_musicien INT PRIMARY KEY,
    Nom_musicien VARCHAR(255),
    Tel_musicien VARCHAR(20)
);

CREATE TABLE Morceau (
    ID_morceau INT PRIMARY KEY,
    Nom_morceau VARCHAR(255)
);

CREATE TABLE Organisateur (
    ID_organisateur INT PRIMARY KEY,
    Nom_organisateur VARCHAR(255),
    Tel_organisateur VARCHAR(20)
);

CREATE TABLE Reservation (
    ID_concert INT,
    Date DATE,
    ID_client INT,
    Num_place INT,
    Prix INT,
    CHECK (Prix >= 0)
    CHECK (Prix >= 0)
    PRIMARY KEY (ID_concert, Date, Num_place),
    FOREIGN KEY (ID_concert) REFERENCES Seance(ID_concert),
    FOREIGN KEY (ID_client) REFERENCES Client(ID_client)
);

CREATE TABLE Participation (
    ID_musicien INT,
    ID_concert INT,
    PRIMARY KEY (ID_musicien, ID_concert),
    FOREIGN KEY (ID_musicien) REFERENCES Musicien(ID_musicien),
    FOREIGN KEY (ID_concert) REFERENCES Concert(ID_concert)
);

CREATE TABLE Programme (
    ID_morceau INT,
    ID_concert INT,
    ID_arrangeur INT,
    PRIMARY KEY (ID_morceau, ID_concert),
    FOREIGN KEY (ID_morceau) REFERENCES Morceau(ID_morceau),
    FOREIGN KEY (ID_concert) REFERENCES Concert(ID_concert),
    FOREIGN KEY (ID_arrangeur) REFERENCES Musicien(ID_musicien)
);

CREATE TABLE Auteur (
    ID_musicien INT,
    ID_morceau INT,
    PRIMARY KEY (ID_musicien, ID_morceau),
    FOREIGN KEY (ID_musicien) REFERENCES Musicien(ID_musicien),
    FOREIGN KEY (ID_morceau) REFERENCES Morceau(ID_morceau)
);