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


UPDATE animals SET weight_kg=weight_kg * (-1) WHERE weight_kg < 0;


COMMIT;




SELECT COUNT(id) FROM animals;

SELECT COUNT(id) FROM animals WHERE escape_attempts=0;

SELECT AVG(weight_kg) as Average FROM animals;

SELECT neutered, AVG(escape_attempts) FROM animals GROUP BY neutered;

SELECT species , MIN(weight_kg),MAX(weight_kg) FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;

-- Query multiple tables


SELECT name FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE full_name = 'Melody Pond';

SELECT animals.name FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT owners.full_name, animals.name FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;

SELECT species.name, COUNT(animals.id) FROM animals
JOIN species ON animals.species_id = species.id
GROUP BY species.name;

SELECT animals.name FROM animals
JOIN owners ON animals.owner_id = owners.id
JOIN species ON animals.species_id = species.id
WHERE owners.full_name = 'Jennifer Orwell'
AND species.name = 'Digimon';

SELECT animals.name FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester'
AND animals.escape_attempts = 0;

SELECT owners.full_name FROM animals
JOIN owners ON animals.owner_id = owners.id
GROUP BY owners.full_name
ORDER BY COUNT(animals.id) DESC
LIMIT 1;



-- JOIN Table Queries

SELECT animals.name FROM visits
JOIN vets ON vet_id = vets.id
JOIN animals ON animal_id = animals.id
where vets.name = 'William Tatcher'
ORDER BY date_of_visit DESC
LIMIT 1;

SELECT COUNT(date_of_visit) FROM visits
JOIN vets ON vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez';

SELECT vets.name, species.name FROM vets
LEFT JOIN specializations ON vets.id = vet_id
LEFT JOIN species ON species.id = species_id;

SELECT animals.name FROM visits
JOIN animals ON animal_id = animals.id
JOIN vets ON vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez'
AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animals.name FROM visits
JOIN animals ON animal_id = animals.id
GROUP BY animals.name
ORDER BY COUNT(animals.id) DESC
LIMIT 1;

SELECT animals.name FROM visits
JOIN animals ON animal_id = animals.id
JOIN vets ON vet_id = vets.id
WHERE vets.name = 'Maisy Smith'
ORDER BY date_of_visit
LIMIT 1;

SELECT animals.name, vets.name, date_of_visit FROM visits
JOIN animals ON animal_id = animals.id
JOIN vets ON vet_id = vets.id
ORDER BY date_of_visit DESC
LIMIT 1;

SELECT COUNT(*) FROM visits
JOIN animals ON animal_id = animals.id
JOIN vets ON vet_id = vets.id
JOIN specializations ON vets.id = specializations.vet_id
WHERE animals.species_id != specializations.species_id;

SELECT species.name FROM visits
JOIN animals ON animal_id = animals.id
JOIN species ON animals.species_id = species.id
JOIN vets ON vet_id = vets.id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name
ORDER BY COUNT(species.id) DESC
LIMIT 1;



