/* Database schema to keep the structure of entire database. */

 CREATE TABLE animals (
id INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR(100),
date_of_birth date,
escape_attempts INT,
neutered BOOLEAN ,
 weight_kg DECIMAL(5,2),
 PRIMARY KEY (id)
);

-- Query and Update animals table

ALTER TABLE animals
ADD species varchar(255);



-- Query multiple tables
CREATE TABLE owners (

id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
full_name VARCHAR(255),
age INT,

PRIMARY KEY (id)


);


CREATE TABLE species (

id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
name VARCHAR(255),
PRIMARY KEY (id)


);


ALTER TABLE animals  
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INT;

ALTER TABLE animals
ADD CONSTRAINT fk_species
FOREIGN KEY (species_id)
REFERENCES species(id);

ALTER TABLE animals
ADD COLUMN owner_id INT;

ALTER TABLE animals
ADD CONSTRAINT fk_owner
FOREIGN KEY (owner_id)
REFERENCES owners(id);
