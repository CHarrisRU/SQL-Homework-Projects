-- 1.	Create a table to use for the remainder of the questions. Include the following 
-- columns: StudentID, LastName, FirstName, MiddleInitial, and DateOfBirth. Insert the following students. 

CREATE TABLE StudentTable (
	StudentID	integer auto_increment primary key,
    FirstName	varchar(30) not null,
    MiddleInitial		varchar(1),
    LastName 	varchar(30) not null,
    DateOfBirth date
);

SELECT *
FROM StudentTable;

INSERT INTO StudentTable
	(FirstName,  MiddleInitial, LastName, DateOfBirth)
VALUES 
	('Mary', 'L','Reed', '2000-5-2'),
    ('Joanne', 'M', 'Stephens', '1988-1-17'),
    ('Stephen', 'J', 'Dawkins', '1980-2-25'),
    ('Louis', 'B', 'Fitch', '2005-3-16'),
    ('Jason', 'R', 'Smith', '1974-2-1'),
    ('Leslie', 'Q', 'Downing', '1994-12-15'),
    ('Marie', 'S', 'Jones', '2001-4-4');

SELECT *
FROM StudentTable;

-- 2.	Joanne gets married and becomes Joanne Riley. Update the appropriate row. 
SET SQL_SAFE_UPDATES = 0;
UPDATE StudentTable
	SET LastName = 'Riley'
    WHERE StudentID = 2;
SET SQL_SAFE_UPDATES = 1;
    
SELECT *
FROM StudentTable;

-- 3.	Stephen’s name was misspelled originally. The proper spelling is Steven. 
-- Update appropriately but don’t use an ID field in the where clause. 

SET SQL_SAFE_UPDATES = 0;
UPDATE StudentTable
	SET FirstName = 'Steven'
    WHERE FirstName = 'Stephen';
SET SQL_SAFE_UPDATES = 1;
    
SELECT *
FROM StudentTable;

-- 4.	Jason’s middle initial and date of birth are incorrect. 
-- Middle initial should be ‘Z’ and date of birth should be 2/1/1984. Update appropriately. 

SET SQL_SAFE_UPDATES = 0;
UPDATE StudentTable
	SET MiddleInitial = 'Z',
    DateOfBirth = '1984-2-1'
    WHERE FirstName = 'Jason';
SET SQL_SAFE_UPDATES = 1;
    
SELECT *
FROM StudentTable;

-- 5.	Leslie is no longer with the school so delete her record. 

SET SQL_SAFE_UPDATES = 0;
DELETE FROM StudentTable
WHERE StudentID = 6;
SET SQL_SAFE_UPDATES = 1;

SELECT *
FROM StudentTable;

-- 6.	Delete records for all students who were born after 2000.

SET SQL_SAFE_UPDATES = 0;
DELETE FROM StudentTable
WHERE Year(DateOfBirth) >= '2000';
SET SQL_SAFE_UPDATES = 1;

SELECT *
FROM StudentTable;
