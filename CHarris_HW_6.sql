-- 1.	Use a join to find a list of employeeNumber, firstName, lastName, and jobTitle of employees who do not have customers assigned to them. 
-- Store the query as a view. Take a screen shot of the view and include it with your answer. 

CREATE VIEW Independent_Employees AS

SELECT 
employees.employeeNumber,
concat(employees.firstName, ' ', employees.lastName) AS 'Employee Name',
employees.jobTitle
FROM employees
LEFT JOIN customers ON employees.employeeNumber = customers.salesRepEmployeeNumber
WHERE salesRepEmployeeNumber IS NULL;

SELECT *
FROM Independent_Employees;

-- 2.	Use a subquery to find list of employeeNumber, firstName, lastName, and jobTitle of employees who 
-- do not have customers assigned to them. The output should look identical to the view created in the previous question. Hint: Review Question 3 in the Hackathon #6. 

SELECT 
e.employeeNumber,
concat(e.firstName, ' ', e.lastName) AS 'Employee Name',
e.jobTitle
FROM employees e
WHERE NOT EXISTS
(SELECT null
FROM customers c 
WHERE c.salesRepEmployeeNumber = e.employeeNumber);

-- 3.	Use a join to write a query that returns the number of units sold per product line. 
-- Store the query as a view. Take a screen shot of the view and include it with your answer. 

CREATE VIEW ProductLineTotals AS

SELECT
p.productLine AS 'Product Line', 
SUM(od.quantityOrdered) AS 'Units Sold'
FROM orderdetails od
LEFT JOIN products p
ON od.productCode = p.productCode
GROUP BY  p.productLine
Order BY od.quantityOrdered DESC;

SELECT *
FROM ProductLineTotals;

-- 4.	Use a subquery to return the number of units sold per product line. 
-- The output should look identical to the view created in the previous question. Hint: Review Subquery as a Column example discussed in class. 

SELECT
p.productLine AS 'Product Line', 
SUM((SELECT
SUM(od.quantityOrdered) 
FROM orderdetails od 
WHERE od.productCode = p.productCode
GROUP BY p.productLine)) AS 'Units_Sold'
FROM products p
GROUP BY p.productLine;