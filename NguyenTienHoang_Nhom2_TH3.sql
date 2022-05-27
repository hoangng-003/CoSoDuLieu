
-- Tổng hợp bài học 
SELECT DISTINCT customerNumber, customerName
FROM customers
WHERE addressLine2 IS NOT NULL
LIMIT 5,10

-- ex1

SELECT *
FROM employees
WHERE reportTo IS NULL

-- ex2 
SELECT DISTINCT customerNumber
FROM payments

-- ex3
SELECT DISTINCT *
FROM orders
  -- String + Datetime , đưa vào ' ' 
WHERE shippedDate = '2003-01-18'

-- ex4
SELECT * FROM orders
WHERE orderDate >= '2005-04-01' and orderDate <= '2005-04-30' and status = 'Shipped';

--ex4 10đ

SELECT * FROM orders 
WHERE orderDate BETWEEN '2005-04-01' and '2005-04-30' AND status = 'Shipped';