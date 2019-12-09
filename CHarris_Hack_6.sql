-- 1.	Get a list of orderNumber where the order amount was more than $50,000. Hint: Use a subquery as a column

SELECT
o.orderNumber,
(SELECT
SUM(ods.quantityOrdered * ods.priceEach) 
FROM orderdetails ods
WHERE ods.orderNumber = o.orderNumber) AS "Total_Amount"
FROM orders o
HAVING Total_Amount > "50000"
ORDER BY Total_Amount ASC;

-- 2.	Get a list of customerName and orderNumber for orders of more than $50,000. Hint: Use a join with the query from #1. 

SELECT
c.customerName,
o.orderNumber,
(SELECT
SUM(ods.quantityOrdered * ods.priceEach) 
FROM orderdetails ods
WHERE ods.orderNumber = o.orderNumber) AS "Total_Amount"
FROM orders o
INNER JOIN customers c
ON o.customerNumber = c.customerNumber
HAVING Total_Amount > "50000"
ORDER BY Total_Amount ASC;

-- 3.	Which customers have not placed an order? Hint: Use a subquery to find customerName who are in both orders and customers table. Next, use a primary query with the WHERE NOT EXISTS keywords to find customerName who are in the customers table but not the subquery.

SELECT 
c.customerName AS "Non-Orderers"
FROM customers c
WHERE NOT EXISTS
(SELECT null
FROM orders o 
WHERE o.customerNumber = c.customerNumber);