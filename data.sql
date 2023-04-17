/* Populate database with sample data. */

INSERT INTO animals(name,date_of_birth,weight_kg,neutered,  escape_atempts) VALUES(
  'Agumon',DATE '2020-2-3',10.23, TRUE,0
);
INSERT INTO animals(name,date_of_birth,weight_kg,neutered,  escape_atempts) VALUES(
  'Gabumon',DATE '2018-11-15',8, TRUE,2
);
INSERT INTO animals(name,date_of_birth,weight_kg,neutered,  escape_atempts) VALUES(
  'Pikachu',DATE '2021-1-7',15.04, FALSE,1
);
INSERT INTO animals(name,date_of_birth,weight_kg,neutered,  escape_atempts) VALUES(
  'Devimon',DATE '2017-5-12',11, TRUE,5
);


INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Charmander',  DATE'2020-02-08', -11, false, 0);


INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Plantmon',  DATE'2021-11-15', -5.7, true, 2);


INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Squirtle',  DATE'1993-04-02', -12.13, false, 3);


INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Angemon',  DATE'2005-06-12', -45, true, 1);


INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Boarmon',  DATE'2005-06-07', 20.4, true, 7);


INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Blossom',  DATE'1998-10-13', 17, true, 3);


INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Ditto',  DATE'2022-05-14', 22, true, 4);

INSERT INTO owners (full_name, age) 
VALUES ('Sam Smith', 34), 
       ('Jennifer Orwell', 19), 
       ('Bob', 45), 
       ('Melody Pond', 77), 
       ('Dean Winchester', 14), 
       ('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES ('Pokemon'), ('Digimon');

UPDATE animals
SET species_id = CASE WHEN name LIKE '%mon' THEN 2 ELSE 1 END;

UPDATE animals SET owner_id = 1 WHERE name IN ('Agumon');

UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle','Blossom');

UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon');

INSERT INTO vets (name, age, date_of_graduation) VALUES
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');


INSERT INTO specializations (vet_id, species_id) VALUES
  ((SELECT id FROM vets WHERE name = 'William Tatcher'), (SELECT id FROM species WHERE name = 'Pokemon')),
  ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name = 'Digimon')),
  ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name = 'Pokemon')),
  ((SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM species WHERE name = 'Digimon'));

INSERT INTO visits (animal_id, vet_id, visit_date) VALUES
(1, 1, '2020-05-24'),
(1, 3, '2020-07-22'),
(2, 4, '2021-02-02'),
(3, 2, '2020-01-05'),
(3, 2, '2020-03-08'),
(3, 2, '2020-05-14'),
(4, 3, '2021-05-04'),
(5, 4, '2021-02-24'),
(6, 2, '2019-12-21'),
(6, 1, '2020-08-10'),
(6, 2, '2021-04-07'),
(7, 3, '2019-09-29'),
(8, 4, '2020-10-03'),
(8, 4, '2020-11-04'),
(9, 2, '2019-01-24'),
(9, 2, '2019-05-15'),
(9, 2, '2020-02-27'),
(9, 2, '2020-08-03'),
(10, 3, '2020-05-24'),
(10, 1, '2021-01-11');



-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';