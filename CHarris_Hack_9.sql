-- 1.	Create a schema (i.e. database) that will hold two tables: Persons and Orders. 
-- Make it the default schema.

CREATE SCHEMA New_Schema;

SHOW SCHEMAS;

USE New_Schema;

-- 2.	Create a table Persons with these columns:
-- PersonID is an integer 
-- Lastname is a variable character of 2555 and is not null 
-- FirstName is a variable character of length 255
-- Age is an integer
-- Make the primary key a composite of PersonID and LastName
-- Describe the table Persons and copy the output for grading.

CREATE TABLE Persons (
	PersonID	integer auto_increment,
    LastName	varchar(255) not null,
    FirstName 	varchar(255),
    Age			int,
    Constraint Primary Key (PersonID, LastName)
);

DESCRIBE Persons;


-- 3.	Fill the Persons table with this information:

INSERT INTO Persons
	(LastName, FirstName, Age)
VALUES
	('Hansen', 'Ola', 30),
    ('Svendson', 'Tove', 23),
    ('Pettersen', 'Kari', 20);
    
    SELECT *
    FROM Persons;

-- 4.	Create an Orders table with these columns:
-- OrderID int not null
-- OrderNumber integer and not null
-- PersonID integer
-- Make the OrderID the primary key
-- Make the PersonID the foreign key
-- Describe the table Orders and copy the output for grading.

CREATE TABLE Orders (
	OrderID	integer auto_increment,
    OrderNumber	int not null,
    PersonID 	int,
    Primary Key (OrderID),
    Foreign Key (PersonID) References Persons(PersonID)
);

DESCRIBE Orders;

-- 5.	Fill the Orders table with this information:

INSERT INTO Orders
	(OrderNumber, PersonId)
VALUES
	(77895, 3),
    (44678, 3),
    (22456, 2),
    (24562, 1);
    
    SELECT *
    FROM Orders;
-- 6.	Join the Persons and Orders tables and print output for grading.

SELECT *
FROM Persons
LEFT JOIN Orders
ON Persons.PersonID = Orders.PersonID
Order By Persons.PersonID;