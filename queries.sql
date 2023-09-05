/*Queries that provide answers to the questions from all projects.*/


SELECT * FROM animals WHERE name like '%mon'

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name From animals WHERE neutered=true AND (escape_attempts < 3);

SELECT date_of_birth FROM animals WHERE (name='Agumon' Or name='Pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered=true;

SELECT * FROM animals WHERE name NOT IN ('Gabumon');

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.13 ;
