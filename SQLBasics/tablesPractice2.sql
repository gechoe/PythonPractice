-- From Pluralsight practice: SQL: Creating Tables, Selecting, Inserting, and Deleting Data (Interactive)
-- Link: https://app.pluralsight.com/library/courses/sql-tables-selecting-inserting-deleting-data/table-of-contents

-- Part 1
-- Practice 1.1 - Challenge: Fix SELECT
SELECT id, title
FROM movies;

-- Practice 1.2 - Challenge: Introducing SELECT
SELECT title, duration
FROM movies
WHERE genre = 'Adventure';

-- Practice 1.3 - Challenge: Returning Title
SELECT title
FROM movies
WHERE genre = 'Sci-Fi';

-- Practice 1.4 - Challenge: Adding to SELECT
SELECT item, price, size
FROM concessions
WHERE (item = 'Popcorn') OR (item = 'Soda')
ORDER BY price DESC;

-- Practice 1.5 - Challenge: Adjusting to SELECT
SELECT id, title
FROM movies
WHERE (duration >= 86) AND (genre = 'Horror')
ORDER BY duration;


-- Part 2
-- Practice 2.1 - Challenge: Adding Films
INSERT INTO movies(title, genre, duration)
VALUES ('The Wind', 'Romance', 95);

-- Practice 2.2 - Challenge: Not All Info
INSERT INTO concessions(item, size)
VALUES ('Nachos', 'Regular');

INSERT INTO concessions(item, price, id)
VALUES ('Pizza', 2.00, 8);

-- Practice 2.3 - Challenge: Updating Genre
UPDATE movies
SET genre = 'Comedy'
where id = 1;

-- Practice 2.4 - Challenge: Multiple Updates
UPDATE concessions
SET item = 'Hamburger'
WHERE item = 'Pizza';

UPDATE concessions
SET price = 1.00
WHERE (item = 'Popcorn') OR (item = 'Candy');

-- Practice 2.5 - Challenge: Removing Movies
DELETE FROM movies
WHERE (genre = 'Comedy') OR (duration > 120) OR (title = 'Nosferatu');


-- Part 3
-- Practice 3.1 - Challenge: Create Advertisements
CREATE TABLE advertisements
(
  id int,
  type varchar(20),
  category varchar(20),
  cost int
);

INSERT INTO advertisements
VALUES (1, 'Poster', 'Paper', 20);

-- Practice 3.2 - Challenge: Structured Data
UPDATE advertisements
SET category = 'Television'
WHERE id = 4;

DROP TABLE advertisements;
