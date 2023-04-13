/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
  id INT,
  name VARCHAR(100),
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg DECIMAL
);
-- add species column
ALTER TABLE animals ADD COLUMN species VARCHAR(50);
-- create owners table
CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(255),
  age INTEGER
);
-- create species table
CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

ALTER TABLE animals ADD COLUMN species_id INTEGER REFERENCES species(id);

ALTER TABLE animals ADD COLUMN owner_id INTEGER REFERENCES owners(id);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD PRIMARY KEY (id);