-- Création de la base de données
CREATE
    DATABASE guess_who;

-- Utilisation de la base de données
USE
    guess_who;

-- Création de la table des joueurs
CREATE TABLE players
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255)            NOT NULL,
    last_name  VARCHAR(255)            NOT NULL,
    gender     ENUM ('Male', 'Female') NOT NULL
);

-- Création de la table des caractéristiques
CREATE TABLE characteristics
(
    id    INT PRIMARY KEY AUTO_INCREMENT,
    name  varchar(255),
    value varchar(255)
);

-- Création de la table de liaison
CREATE TABLE player_characteristics
(
    player_id         INT,
    characteristic_id INT,
    PRIMARY KEY (player_id, characteristic_id),
    FOREIGN KEY (player_id) REFERENCES players (id),
    FOREIGN KEY (characteristic_id) REFERENCES characteristics (id)
);

-- Insertion de 10 joueurs avec caractéristiques aléatoires
INSERT INTO players (first_name, last_name, gender)
VALUES ('Emma', 'Jones', 'Female'),
       ('Sophia', 'Garcia', 'Female'),
       ('Mason', 'Taylor', 'Male'),
       ('Noah', 'Hernandez', 'Male'),
       ('Avery', 'Lee', 'Female'),
       ('Ethan', 'Lewis', 'Male'),
       ('Chloe', 'Martin', 'Female'),
       ('Isabella', 'Miller', 'Female'),
       ('William', 'Davis', 'Male'),
       ('Liam', 'Thomas', 'Male');

INSERT INTO characteristics (name, value)
VALUES ('eye color', 'Brown'),
       ('eye color', 'Blue'),
       ('eye color', 'Green'),
       ('hair color', 'Blonde'),
       ('hair color', 'Brown'),
       ('hair color', 'Black'),
       ('hair length', 'Short'),
       ('hair length', 'Medium'),
       ('hair length', 'Long'),
       ('beard', 'Shaved'),
       ('beard', 'Mustache'),
       ('beard', 'Goatee'),
       ('glasses', 'True'),
       ('glasses', 'False');

INSERT INTO player_characteristics (player_id, characteristic_id)
VALUES (1, 1),
       (1, 6),
       (1, 9),
       (2, 2),
       (2, 5),
       (2, 7),
       (3, 3),
       (3, 5),
       (3, 12),
       (4, 2),
       (4, 4),
       (4, 13),
       (5, 1),
       (5, 4),
       (5, 8),
       (6, 3),
       (6, 5),
       (6, 11),
       (7, 2),
       (7, 6),
       (7, 14),
       (8, 1),
       (8, 5),
       (8, 9),
       (9, 3),
       (9, 7),
       (9, 13),
       (10, 1),
       (10, 4),
       (10, 11);

/* Trouvez toutes les personnes ayant les yeux bleu */

/* Trouvez toutes les personnes ayant la lettre a dans leur prénom et avec des lunettes */

/* Trouvez toutes les personnes qui ont une moustache et dont le nom de famille contient la lettre "o".
   Triez les résultats par ordre alphabétique du nom de famille créer une colonne qui sera nommé count celle-ci mettra le nombre de personne ayant ses propriété commune */