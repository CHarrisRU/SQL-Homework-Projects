-- 1.	Write a query that calculates the total amount of each orderNumber.

SELECT
orderNumber AS 'Order Number', 
Sum(quantityOrdered*priceEach) AS 'Total Dollar Amount'
FROM orderdetails 
GROUP BY orderNumber 
Order BY orderNumber ASC;


-- 2.	Create a view to store the query you created in #1. 

CREATE VIEW order_totals AS

SELECT
orderNumber AS 'Order Number', 
Sum(quantityOrdered*priceEach) AS 'Total Dollar Amount'
FROM orderdetails 
GROUP BY orderNumber 
Order BY orderNumber ASC;

SHOW TABLES;

SELECT *
FROM order_totals;


-- 3.	Write a query to retrieve the orderNumber and total amount for each order made by 
-- ‘Land of Toys Inc.’. HINTS: 1) You should think about how you can use the view created in #2 in your query; 2) Land of Toys Inc. made four orders. 

SELECT 
cust.customerName,
cust.customerNumber,
o.orderNumber AS "Order Number",
sum(d.quantityOrdered*d.priceEach) AS 'Total Dollar Amount'
FROM customers cust
LEFT JOIN orders o
ON cust.customerNumber = o.customerNumber
LEFT JOIN orderdetails d
ON d.orderNumber = o.orderNumber
WHERE cust.customerNumber = 131
GROUP BY d.orderNumber;


