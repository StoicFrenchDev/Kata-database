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


/* Affichez tous les joueurs et leurs caractéristiques, y compris ceux qui n'ont pas de caractéristiques assignées.
 Affichez le prénom, le nom de famille et le nom de la caractéristique. */

SELECT p.first_name, p.last_name, c.name
FROM players p
LEFT JOIN player_characteristics pc ON p.id = pc.player_id
LEFT JOIN characteristics c ON pc.characteristic_id = c.id;

SELECT p.first_name, p.last_name,
    GROUP_CONCAT(CONCAT(c.name, ': ', c.value) 
    ORDER BY c.name SEPARATOR ', ') as characteristics
FROM players p
LEFT JOIN player_characteristics pc ON p.id = pc.player_id
LEFT JOIN characteristics c ON pc.characteristic_id = c.id
GROUP BY p.first_name, p.last_name;

/* Listez tous les joueurs, en indiquant si chacun a des 'glasses' ou non. Utilisez 'Yes' pour indiquer qu'ils ont des lunettes, 'No' si ce n'est pas le cas.
 Affichez le prénom, le nom de famille et le statut des lunettes. */

 SELECT p.first_name, p.last_name,
    CASE
        WHEN c.value = 'True' THEN 'Yes'
        ELSE 'No'
    END as has_glasses
FROM players p
LEFT JOIN player_characteristics pc ON p.id = pc.player_id AND pc.characteristic_id IN (
    SELECT id FROM characteristics WHERE name = 'glasses'
)
LEFT JOIN characteristics c ON pc.characteristic_id = c.id;