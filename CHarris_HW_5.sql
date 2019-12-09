-- 1.	Find all the customers that have orders that haven’t shipped yet (shippedDate is null). Display the customer name and the order number.

SELECT 
customers.customerName,
orders.orderNumber
FROM customers
LEFT JOIN orders ON customers.customerNumber = orders.customerNumber
WHERE orders.shippedDate IS NULL
AND orders.orderNumber IS NOT NULL;

-- 2.	Find all the products that haven’t been ordered by anyone. Display the product code, name, and description.

SELECT 
products.productCode, 
products.productName,
products.productDescription
FROM products
LEFT JOIN orderdetails ON products.productCode = orderdetails.productCode
WHERE orderdetails.quantityOrdered IS NULL;

-- 3.	Find all the employees that don’t have customers assigned to them. Display the employee name.

SELECT 
concat(employees.firstName, ' ', employees.lastName) AS 'Employee Name'
FROM employees
LEFT JOIN customers ON employees.employeeNumber = customers.salesRepEmployeeNumber
WHERE salesRepEmployeeNumber IS NULL;

-- 4.	Find the total number of orders per customer for all customers. Display the customer name and the number of orders.

SELECT
customers.customerName,
count(orders.orderNumber) AS "Number of Orders"
FROM customers
LEFT JOIN orders 
ON customers.customerNumber = orders.customerNumber
GROUP BY customers.customerName;