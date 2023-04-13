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