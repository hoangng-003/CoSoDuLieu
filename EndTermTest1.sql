-- Task 1:

  SELECT * FROM customers
  WHERE customerNumber NOT IN ( SELECT customerNumber FROM payments )

-- Task 2:

  SELECT pl.productLine , pl.textDescription,

		(SELECT SUM(p.quantityInStock) 
      FROM products AS p 
      WHERE pl.productLine = p.productLine) AS Instock,

    (SELECT SUM(od.quantityOrdered) 
      FROM orderdetails AS od
      WHERE od.productCode IN (SELECT p.productCode 
                                FROM products AS p 
                                WHERE p.productLine = pl.productLine)) AS Sold,

		(SELECT Instock + Sold) AS Total

FROM productlines AS pl
HAVING Total > 50000
ORDER BY Total DESC

--  hoặc 

    (SELECT SUM(od.quantityOrdered*od.priceEach) 
      FROM orderdetails AS od
      INNER JOIN products AS p ON od.productCode = p.productCode
      WHERE p.productLine = pl.productLine ) AS Sold,

-- Task 3 :

  SELECT pl.productLine , pl.textDescription ,
		(SELECT SUM(od.quantityOrdered*od.priceEach) 
      FROM orderdetails AS od
      WHERE od.productCode IN (SELECT p.productCode 
                                FROM products AS p 
                                WHERE p.productLine = pl.productLine)) AS Sold,
	(SELECT IF(Sold > 3000000,'Best Buy',IF(Sold < 200000,'Worst Buy','Good'))) AS Note
FROM productlines as pl

-- Task 4 :

  SELECT p.productCode , 
		( SELECT COUNT(o.orderNumber)
        	FROM orders as o
         	WHERE o.status = 'Cancelled' && o.orderNumber IN (SELECT od.orderNumber
                                                              FROM orderdetails as od 
                                                              WHERE od.productCode = p.productCode )
        ) AS Cancel
FROM products as p

-- hoặc

  SELECT p.productCode , 
		( SELECT COUNT(o.orderNumber)
        	FROM orders as o INNER JOIN orderdetails AS od ON o.orderNumber = od.orderNumber
         	WHERE o.status = 'Cancelled' AND od.productCode = p.productCode
        ) AS Cancel
FROM products as p

-- Task 5 :

  USE classicmodels;
  CREATE TALBE offices_USA LIKE offices;

  INSERT INTO offices_USA
  SELECT *
  FROM classicmodels.offices
  WHERE country = 'USA';

  SELECT * FROM classicmodels.offices_USA;
