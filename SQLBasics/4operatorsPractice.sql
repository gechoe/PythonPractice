/* From W3Schools practice: SQL Wildcards, SQL In, SQL Between, SQL Aliases,
   the SQL joins (see 3joinsPractice.sql for more depth), SQL Union, SQL Group By,
   SQL Having, SQL Exists, SQL Any/All, SQL Select Into, SQL Insert Into Select,
   SQL Case, SQL Null Functions, SQL Stored Procedures, SQL Comments, & SQL Operators
*/

-- Links to lessons/workbook sources:
-- https://www.w3schools.com/sql/sql_wildcards.asp
-- https://www.w3schools.com/sql/sql_in.asp
-- https://www.w3schools.com/sql/sql_between.asp
-- https://www.w3schools.com/sql/sql_alias.asp

-- https://www.w3schools.com/sql/sql_join_inner.asp
-- https://www.w3schools.com/sql/sql_join_left.asp
-- https://www.w3schools.com/sql/sql_join_right.asp
-- https://www.w3schools.com/sql/sql_join_full.asp
-- https://www.w3schools.com/sql/sql_join_self.asp

-- https://www.w3schools.com/sql/sql_union.asp
-- https://www.w3schools.com/sql/sql_groupby.asp
-- https://www.w3schools.com/sql/sql_having.asp
-- https://www.w3schools.com/sql/sql_exists.asp
-- https://www.w3schools.com/sql/sql_any_all.asp
-- https://www.w3schools.com/sql/sql_select_into.asp
-- https://www.w3schools.com/sql/sql_insert_into_select.asp
-- https://www.w3schools.com/sql/sql_case.asp
-- https://www.w3schools.com/sql/sql_isnull.asp
-- https://www.w3schools.com/sql/sql_stored_procedures.asp
-- https://www.w3schools.com/sql/sql_comments.asp
-- https://www.w3schools.com/sql/sql_operators.asp

  
-- SQL Wildcards
-- Exercise 1
SELECT * FROM Customers
WHERE City LIKE '_a%';

-- Exercise 2
SELECT * FROM Customers
WHERE City LIKE '[acs]%';

-- Exercise 3
SELECT * FROM Customers
WHERE City LIKE '[a-f]%';

-- Exercise 4
SELECT * FROM Customers
WHERE City LIKE '[!acf]%';


-- SQL In
-- Exercise 1
SELECT * FROM Customers
WHERE Country IN ('Norway', 'France');

-- Exercise 2
SELECT * FROM Customers
WHERE Country NOT IN ('Norway', 'France');


-- SQL Between
-- Exercise 1
SELECT * FROM Products
WHERE Price BETWEEN 10 AND 20;

-- Exercise 2
SELECT * FROM Products
WHERE Price NOT BETWEEN 10 AND 20;

-- Exercise 3
SELECT * FROM Products
WHERE ProductName BETWEEN 'Geitost' AND 'Pavlova';


-- SQL Alias
-- Exercise 1
SELECT CustomerName, Address, PostalCode AS Pno
FROM Customers;

-- Exercise 2
SELECT *
FROM Customers AS Consumers;


-- SQL Group By
-- Exercise 1
SELECT COUNT(CustomerID),
Country
FROM Customers
GROUP BY Country;

-- Exercise 2
SELECT COUNT(CustomerID),
Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC;
