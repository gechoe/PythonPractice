-- From W3Schools practice: SQL Joins, SQL Inner Join, SQL Left Join, SQL Right Join, SQL Full Join, & SQL Self Join
-- Links:
-- https://www.w3schools.com/sql/sql_join.asp
-- https://www.w3schools.com/sql/sql_join_inner.asp
-- https://www.w3schools.com/sql/sql_join_left.asp
-- https://www.w3schools.com/sql/sql_join_right.asp
-- https://www.w3schools.com/sql/sql_join_full.asp
-- https://www.w3schools.com/sql/sql_join_self.asp

-- SQL Joins
-- Exercise 1
SELECT *
FROM Orders
LEFT JOIN Customers
ON Orders.CustomerID = Customers.CustomerID;

-- Exercise 2
SELECT *
FROM Orders
INNER JOIN Customers
ON Orders.CustomerID=Customers.CustomerID;

-- Exercise 3
SELECT *
FROM Orders
RIGHT JOIN Customers
ON Orders.CustomerID=Customers.CustomerID;
