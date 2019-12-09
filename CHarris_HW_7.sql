-- 1.	Assuming a sales commission of 5% on every order, calculate the sales commission due for all 
-- employees.  List the employee name and the sales commission each person is due. 
Select
concat(emp.firstName, ' ', emp.lastName) AS 'Employee Name',
sum((od.quantityOrdered*od.priceEach)*0.05) AS 'Commission'
FROM employees emp
INNER JOIN customers c
ON emp.employeeNumber = c.salesRepEmployeeNumber
INNER JOIN orders o
ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails od
ON o.orderNumber = od.orderNumber
GROUP BY employeeNumber
ORDER BY sum((od.quantityOrdered*od.priceEach)*0.05) DESC;

-- 2.	Create a list of customers and the amount they currently owe us.  
-- List the customer name and the amount due.  Create views to track the total amount ordered 
-- and the total amount paid.  Use these views to create your final query. 
-- Important – do not format interim numeric results.  If you need to round numbers use the round function.  
-- Don’t format your numbers until your final query.  
-- Having imbedded commas in numeric fields can cause math problems.

create view Order_Amount as
select
o.customerNumber,
od.orderNumber,
sum(od.quantityOrdered * od.priceEach) as 'Amount'
from orderdetails od
left join orders o
on od.orderNumber = o.orderNumber
group by o.customerNumber
order by o.customerNumber;


create view Payment_Amount as
select
p.customerNumber,
c.customerName,
p.amount
from payments p
left join customers c
on p.customerNumber = c.customerNumber
group by p.customerNumber;

select
o.customerNumber,
p.customerName,
concat('$', format(sum(o.Amount - p.amount), 2)) as 'Amount Due'
from Order_Amount o
left join Payment_Amount p
on o.customerNumber = p.customerNumber
group by o.customerNumber
order by concat('$', format(sum(o.Amount - p.amount), 2));

-- 3.	Using the classicmodels schema, find any product that has never been purchased. 
-- Create a new table that show the productCode, productName, productLine, 
-- and buyPrice for any product that has never been purchased. 
-- Update the table by reducing the buyPrice by 10%.  
CREATE TABLE Never_Purchased (
	ProductCode		varchar(15) not null,
    productName		varchar(70),
    productLine 	varchar(50),
    buyPrice		decimal(10,2)
);

INSERT INTO Never_Purchased
	(ProductCode, productName, productLine, buyPrice)
SELECT 
p.productCode,
p.productName,
p.productLine,
p.buyPrice
FROM products p
WHERE NOT EXISTS
(SELECT null
FROM orderdetails od
WHERE od.productCode = p.productCode);

SELECT *
FROM Never_Purchased;

SET SQL_SAFE_UPDATES = 0;
UPDATE Never_Purchased
	SET buyPrice = buyPrice*0.9;
SET SQL_SAFE_UPDATES = 1;

SELECT *
FROM Never_Purchased;