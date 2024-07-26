-- From Pluralsight practice: SQL: Using Joins, Constraints, Normalization, and Subqueries (Interactive)
-- Link: https://app.pluralsight.com/library/courses/sql-joins-constraints-normalization-subqueries/table-of-contents

-- Part 1
-- Practice 1.1 - Challenge: Actor Pay Rates 
SELECT max(salary)
FROM Actors;

-- Practice 1.2 - Challenge: Counting Actors
SELECT COUNT(*)
FROM Actors
WHERE country = 'USA';

-- Practice 1.3 - Challenge: Adding Numeric Values
SELECT sum(salary)
FROM Actors;

-- Practice 1.4 - Challenge: Average Salary
SELECT avg(salary)
FROM Actors
WHERE country = 'USA';

-- Practice 1.5 - Challenge: Filtering Aggregates
SELECT country, sum(salary)
FROM Actors
  WHERE role = 'supporting'
GROUP BY country
HAVING COUNT(*) > 1;


-- Part 2
-- Practice 2.1 - Challenge: Adding Constraints
CREATE TABLE Actors (
  name varchar(50) NOT NULL UNIQUE,
  country varchar(50)
);

-- Practice 2.2 - Challenge: Unique Table Constraint
CREATE TABLE Movies (
  name varchar(50) NOT NULL,
  language varchar(50),
  CONSTRAINT name_lang UNIQUE (name, language)
);

-- Practice 2.3 - Challenge: Primary Key Constraint
CREATE TABLE Actors (
  id int PRIMARY KEY UNIQUE NOT NULL,
  name varchar(50) NOT NULL UNIQUE,
  country varchar(50)
);

-- Practice 2.4 - Challenge: Foreign Key Constraint
CREATE TABLE Actors (
  id int PRIMARY KEY,
  name varchar(50) UNIQUE NOT NULL,
  country_id int REFERENCES Countries(id)
);

-- Practice 2.5 - Challenge: Foreign Key Table Constraint
CREATE TABLE Actors (
  id int PRIMARY KEY,
  name varchar(50) NOT NULL UNIQUE,
  country_id int,
  FOREIGN KEY (country_id) REFERENCES Countries(id)
);

-- Practice 2.6 - Challenge: Dropping Tables with Foreign Key
DROP TABLE Actors;
DROP TABLE Countries;

-- Practice 2.7 - Challenge: CHECK Constraints
CREATE TABLE Actors (
  id int PRIMARY KEY,
  name varchar(50) NOT NULL UNIQUE,
  salary integer CHECK (salary >= 500),
  bonus integer CHECK (bonus < salary),
  country_id int REFERENCES Countries(id)
);


-- Part 3
-- Practice 3.1 - Challenge: Join Table Creation SQL
CREATE TABLE Actors_Movies (
  actor_id int REFERENCES Actors,
  movie_id int REFERENCES Movies
);

-- Practice 3.2 - Challenge: Inserting a Join Row
INSERT INTO Actors_Movies (actor_id, movie_id)
  VALUES (2, 5);

-- Practice 3.3 - Challenge: Creating a Relationship
CREATE TABLE Rooms (
  id int PRIMARY KEY,
  seats int,
  movie_id int UNIQUE,
  FOREIGN KEY (movie_id) REFERENCES Movies
);


-- Part 4
-- Practice 4.1 - Challenge: Your First Inner Join
SELECT Movies.title, Rooms.id, Rooms.seats
FROM Movies
INNER JOIN Rooms
ON Movies.id = Rooms.movie_id
WHERE Rooms.seats > 75
ORDER BY Rooms.seats DESC;

-- Practice 4.2 - Challenge: Two Inner Joins
SELECT *
FROM Actors
INNER JOIN Actors_Movies
ON Actors.id = Actors_Movies.actor_id;
-- Practice 4.3 - Challenge: Column and Table Aliases
-- Practice 4.4 - Challenge: Three Table Aliases
-- Practice 4.5 - Challenge: Your First Outer Join
-- Practice 4.6 - Challenge: On the Other Hand


-- Part 5
-- Practice 5.1 - Challenge: Our First Subquery
-- Practice 5.2 - Challenge: An Agregate Subquery
-- Practice 5.3 - Challenge: Thinking Outer of the Box
