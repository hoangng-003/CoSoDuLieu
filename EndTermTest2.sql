-- Task 1:

  SELECT * FROM customers
  WHERE customerNumber NOT IN ( SELECT customerNumber FROM payments )

-- Task 2:

  SELECT c.customerNumber , c.customerName , 
		(SELECT SUM(p.amount)
        	FROM payments as p
        	WHERE p.customerNumber = c.customerNumber) AS tongTra,
            
        (SELECT SUM(od.quantityOrdered*od.priceEach)
        	FROM orderdetails AS od
        	WHERE od.orderNumber IN (SELECT o.orderNumber
                                    	FROM orders as o 
                                    	WHERE o.customerNumber = c.customerNumber)) AS tongMua,
        
        (SELECT tongMua - tongTra) AS tongNo,
        (SELECT COUNT(o.orderNumber) 
        FROM orderdetails AS od 
        INNER JOIN orders AS o ON o.orderNumber = od.orderNumber
        WHERE o.customerNumber = c.customerNumber) AS totalOrder
FROM customers as c
HAVING tongNo < 50000 && totalOrder >= 5

-- Task 3 : 
  UPDATE orders
  SET comments = "first order"
  WHERE MONTH(orderDate) = "01" && YEAR(orderDate) = "2003" 

-- Task 4 & Task 5 : ReWrite

