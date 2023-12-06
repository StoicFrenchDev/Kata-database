/* Trouvez toutes les personnes ayant les yeux bleu */
SELECT p.first_name, p.last_name
FROM players p
         JOIN player_characteristics pc ON p.id = pc.player_id
         JOIN characteristics c ON c.id = pc.characteristic_id
WHERE c.name = 'eye color' AND c.value = 'Blue';


/* Trouvez toutes les personnes ayant la lettre a dans leur prénom et avec des lunettes */
SELECT p.first_name, p.last_name
FROM players p
         JOIN player_characteristics pc ON p.id = pc.player_id
         JOIN characteristics c ON c.id = pc.characteristic_id
WHERE p.first_name LIKE '%a%' AND c.name = 'glasses' AND c.value = 'True';


/* Trouvez toutes les personnes qui ont une moustache et dont le nom de famille contient la lettre "o".
   Triez les résultats par ordre alphabétique du nom de famille créer une colonne qui sera nommé count celle-ci mettra le nombre de personne ayant ses propriété commune */
SELECT p.last_name, COUNT(*) as count
FROM players p
         JOIN player_characteristics pc ON p.id = pc.player_id
         JOIN characteristics c ON c.id = pc.characteristic_id
WHERE c.name = 'beard' AND c.value = 'Mustache' AND p.last_name LIKE '%o%'
GROUP BY p.last_name;