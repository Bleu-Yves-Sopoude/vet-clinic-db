/* Populate database with sample data. */


INSERT INTO animals(name,date_of_birth, escape_attempts,neutered,weight_kg) 
VALUES('Agumon', '2020-02-03', 0, true,10.23),
     ('Gabumon', '2018-11-15', 2, true,8),
     ('Pikachu', '2021-01-07', 1, false,15.04),
     ('Devimon', '2017-05-12', 5, true,11);


-- Query and Update animals table


INSERT INTO animals(name,date_of_birth, escape_attempts,neutered,weight_kg,species) 
VALUES('Charmander', '2020-02-08', 0, false,-11,NULL),
     ('Plantmon', '2021-11-15', 2, true,-5.7,NULL),
     ('Squirtle', '1993-04-02', 3, false,-12.13,NULL),
     ('Angemon', '2005-06-12', 1, true,-45,NULL),
     ('Boarmon', '2005-06-07', 7, true,20.4,NULL),
     ('Blossom', '1998-10-13', 3, true,17,NULL),
     ('Ditto', '2022-05-14', 4, true,22,NULL);


-- Query multiple tables

INSERT INTO owners(full_name,age) 
VALUES('Sam Smith', 34),
     ('Jennifer Orwell', 19),
     ('BOB', 45),
     ('Melody Pond', 77),
     ('Dan Winchester', 14),
     ('Jodie Whittaker', 38);


     INSERT INTO species(name) 
VALUES('Pokemon'),
     ('Digimon');





UPDATE animals
SET species_id = (
    SELECT id FROM species
    WHERE name = 'Digimon'
)
WHERE name LIKE '%mon';

     
UPDATE animals
SET species_id = (
    SELECT id FROM species
    WHERE name = 'Pokemon'
)
WHERE species_id IS NULL;



UPDATE animals
SET owner_id = (
    SELECT id FROM owners
    WHERE full_name = 'Sam Smith'
)
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = (
    SELECT id FROM owners
    WHERE full_name = 'Jennifer Orwell'
)
WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals
SET owner_id = (
    SELECT id FROM owners
    WHERE full_name = 'Bob'
)
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals
SET owner_id = (
    SELECT id FROM owners
    WHERE full_name = 'Melody Pond'
)
WHERE name IN ('Charmaner', 'Squirtle', 'Blossom');

UPDATE animals
SET owner_id = (
    SELECT id FROM owners
    WHERE full_name = 'Dean Winchester'
)
WHERE name IN ('Angemon', 'Boarmon');
