/*Queries that provide answers to the questions from all projects.*/


SELECT * FROM animals WHERE name like '%mon'

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name From animals WHERE neutered=true AND (escape_attempts < 3);

SELECT date_of_birth FROM animals WHERE (name='Agumon' Or name='Pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered=true;

SELECT * FROM animals WHERE name NOT IN ('Gabumon');

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.13 ;


-- Query and Update animals table

BEGIN;

UPDATE animals SET species='unspecified';

ROLLBACK;


BEGIN;

UPDATE animals
SET species ='digimon'
WHERE name like '%mon';


UPDATE animals
SET species ='pokemon'
WHERE name NOT like '%mon';

COMMIT;

BEGIN;

DELETE FROM animals;

ROLLBACK;


BEGIN;

SAVEPOINT SP1;

DELETE FROM animals WHERE date_of_birth > '2022-01-01';

SAVEPOINT SP2;

UPDATE animals SET weight_kg=weight_kg * (-1);

ROLLBACK TO SP1;

UPDATE animals SET weight_kg * (-1) WHERE weight_kg < 0;

COMMIT;




SELECT COUNT(id) FROM animals;

SELECT COUNT(id) FROM animals WHERE escape_attempts=0;

SELECT AVG(weight_kg) as Average FROM animals;

SELECT neutered, AVG(escape_attempts) FROM animals GROUP BY neutered;

SELECT species , MIN(weight_kg),MAX(weight_kg) FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;