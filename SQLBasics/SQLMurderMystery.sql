/* SQL Murder Mystery - From Knight Lab

   Preface:
   Can you find out whodunnit?
   There's been a Murder in SQL City! The SQL Murder Mystery is designed to be both a self-directed lesson
   to learn SQL concepts and commands and a fun game for experienced SQL users to solve an intriguing crime.

   New to SQL?
   This exercise is meant more as a way to practice SQL skills than a full tutorial. If you've never used
   SQL at all, try the walkthrough. If you really want to learn a lot about SQL, you may prefer a complete
   tutorial like Select Star SQL.
   If you're comfortable with SQL, you can dive in below!

   Experienced SQL sleuths start here
   A crime has taken place and the detective needs your help. The detective gave you the crime scene report,
   but you somehow lost it. You vaguely remember that the crime was a ​murder​ that occurred sometime on
   ​Jan.15, 2018​ and that it took place in ​SQL City​. Start by retrieving the corresponding crime scene report
   from the police department’s database.
*/

-- Links to the SQL practice source:
-- https://mystery.knightlab.com/

-- Code done to solve the SQL Murder Mystery:

-- Finds all the tables (the table names) in the database
SELECT name 
FROM sqlite_master
WHERE type = 'table';

-- Query to find the structure of the specified table
SELECT sql 
FROM sqlite_master
WHERE name = 'crime_scene_report';

SELECT sql 
FROM sqlite_master
WHERE name = 'drivers_license';

SELECT sql 
FROM sqlite_master
WHERE name = 'facebook_event_checkin';

SELECT sql 
FROM sqlite_master
WHERE name = 'interview';

SELECT sql 
FROM sqlite_master
WHERE name = 'get_fit_now_member';

SELECT sql 
FROM sqlite_master
WHERE name = 'get_fit_now_check_in';

SELECT sql 
FROM sqlite_master
WHERE name = 'solution';

SELECT sql 
FROM sqlite_master
WHERE name = 'income';

SELECT sql 
FROM sqlite_master
WHERE name = 'person';


-- Finds the crime scene report for the crime we're trying to solve given the crime type = murder,
-- the date of the crime is January 15, 2018, and the city is SQL City
SELECT date, type, description, city
FROM crime_scene_report
WHERE (date = 20180115) AND (type = 'murder') AND (city = 'SQL City');

/* Returns this description from the crime_scene_report:
   Security footage shows that there were 2 witnesses.
   The first witness lives at the last house on "Northwestern Dr".
   The second witness, named Annabel, lives somewhere on "Franklin Ave".
*/


-- Finds the first witness based on the above information (first witness lives at the last house on "Northwestern Dr")
SELECT p.id, p.name, MAX(p.address_number), p.address_street_name, i.transcript
FROM interview AS i
INNER JOIN person AS p
  ON i.person_id = p.id
WHERE (p.address_street_name = 'Northwestern Dr');

/* Returns this transcript from the first witness:
   I heard a gunshot and then saw a man run out.
   He had a "Get Fit Now Gym" bag.
   The membership number on the bag started with "48Z".
   Only gold members have those bags.
   The man got into a car with a plate that included "H42W".
*/


-- Finds the second witness based on the above information (second witness, named Annabel, lives somewhere on "Franklin Ave")
SELECT p.id, p.name, p.address_number, p.address_street_name, i.transcript
FROM interview AS i
INNER JOIN person AS p
  ON i.person_id = p.id
WHERE (p.address_street_name = 'Franklin Ave') AND (p.name LIKE '%Annabel%');

/* Returns this transcript from the second witness:
   I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.
*/


-- Finds all the people that matches the first and second witness' testimony
SELECT gfnm.person_id, p.name, gfnm.id AS get_fit_now_id, gfnm.membership_start_date, gfnm.membership_status, gfnci.check_in_date, dl.plate_number
FROM get_fit_now_member AS gfnm
INNER JOIN person AS p
  ON gfnm.person_id = p.id
INNER JOIN drivers_license AS dl
  ON p.license_id = dl.id
INNER JOIN get_fit_now_check_in AS gfnci
  ON gfnm.id = gfnci.membership_id
WHERE (gfnm.membership_start_date < 20180110)  -- Based on second witness
  AND (gfnci.check_in_date == 20180109)  -- Based on second witness
  AND (gfnm.membership_status = 'gold')  -- Based on first witness
  AND (gfnm.id LIKE '48Z%')  -- Based on first witness
  AND (plate_number LIKE '%H42W%');  -- Based on first witness

/* Returns this person/suspect's details:
   person_id: 67318
   name: Jermy Bowers
   get_fit_now_id: 48Z55
   membership_start_date: 20160101
   membership_status: gold
   check_in_date: 20180109
   plate_number: 0H42W2
*/


-- SQL code/query to check my solution
-- Used this format given:
-- INSERT INTO solution VALUES (1, 'Insert the name of the person you found here');
--   SELECT value FROM solution;
INSERT INTO solution VALUES (1, 'Jeremy Bowers');
  SELECT value FROM solution;

/* Returns this:
   Congrats, you found the murderer! But wait, there's more...
   If you think you're up for a challenge, try querying the interview transcript of the murderer to find the
   real villain behind this crime. If you feel especially confident in your SQL skills, try to complete this final
   step with no more than 2 queries. Use this same INSERT statement with your new suspect to check your answer.
*/


-- Finds the culprit Jeremy Bowers' interview transcript:
SELECT p.id, p.name, i.transcript
FROM person AS p
INNER JOIN interview AS i
  ON p.id = i.person_id
WHERE p.name = 'Jeremy Bowers';

/* Returns this transcript from the culprit:
   I was hired by a woman with a lot of money.
   I don't know her name but I know she's around 5'5" (65") or 5'7" (67").
   She has red hair and she drives a Tesla Model S.
   I know that she attended the SQL Symphony Concert 3 times in December 2017.
*/


-- This query below does the same thing as the above query, but is more shorthand
-- (It returns only the transcript which is the same as above)
SELECT i.transcript
FROM interview AS i
WHERE i.person_id = 67318;


-- Finds the real culprit who paid off Jeremy Bowers based on Jeremy Bowers' transcript information:
SELECT p.id, p.name, i.annual_income, fbec.event_name, fbec.date, dl.height, dl.hair_color, dl.gender, dl.car_make, dl.car_model
FROM person AS p
INNER JOIN drivers_license as dl
	ON p.license_id = dl.id
INNER JOIN income AS i
	ON p.ssn = i.ssn
INNER JOIN facebook_event_checkin AS fbec
	ON p.id = fbec.person_id
WHERE (dl.gender = 'female')
	AND (dl.hair_color = 'red')
	AND (dl.height >= 65)
	AND (dl.height <= 67)
	AND (dl.car_make = 'Tesla')
	AND (dl.car_model = 'Model S')
	AND (fbec.event_name = 'SQL Symphony Concert');

/* Returns the real culprit's name and information 3 times (since she went to the SQL Symphony Concert 3 times).
   The real culprit's name is: Miranda Priestly
*/


-- Finds Miranda Priestly's interview transcript
SELECT i.transcript
FROM interview AS i
WHERE i.person_id = 99716;  -- Miranda's id

-- Returns nothing since Miranda might not have been interviewed.


-- SQL code/query to check my solution for the REAL culprit behind everything
-- Used this format given:
-- INSERT INTO solution VALUES (1, 'Insert the name of the person you found here');
--   SELECT value FROM solution;
INSERT INTO solution VALUES (1, 'Miranda Priestly');
	SELECT value FROM solution;

/* Returns this:
   Congrats, you found the brains behind the murder!
   Everyone in SQL City hails you as the greatest SQL detective of all time.
   Time to break out the champagne!
*/
