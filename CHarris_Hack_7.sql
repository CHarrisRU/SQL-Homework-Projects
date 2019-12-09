-- 1.	Create a procedure that will return information on all orders for a customer

DELIMITER $$
CREATE PROCEDURE Customer_Info (custNum INT)
BEGIN
SELECT
*
FROM orders
WHERE customerNumber = custNum;
END$$
DELIMITER ;
-- 2.	Invoke the procedure to get order information for customerNumber = 131. 
-- Did you notice any problem with the orders placed? Justify your answer. 

Call Customer_Info(131);

-- Yes. 3 out of the four seemed to show that the customer was being consistently difficult, from being hard to talk to,
-- to cancelling the order, and trying to reevaluate their agreement. 

-- 3.	Create a procedure that will return the order details for the cancelled order made by customerNumber = 131. 
-- What is the total amount of this cancelled order?

DELIMITER $$
CREATE PROCEDURE DeletedOrder (OrderNum INT)
BEGIN
SELECT
o.orderNumber,
SUM(od.quantityOrdered * od.priceEach) AS 'Order Amount'
FROM orders o
INNER JOIN orderdetails od
ON o.orderNumber = od.orderNumber
WHERE o.orderNumber = orderNum;
END$$
DELIMITER ;

Call DeletedOrder(10248);

DROP PROCEDURE DeletedOrder;

-- Total for the cancelled order is $41445.21