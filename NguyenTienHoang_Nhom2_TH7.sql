------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Task 1:
  SELECT e.employeeNumber , concat(e.firstName , ' ' , e.lastName) as fullName , e.email , e.jobTitle,
        concat_ws (' ' , o.addressLine1 , o.addressLine2 , o.city , o.country , o.territory) as address , o.postalCode
  FROM employees AS e
  INNER JOIN offices AS o ON e.officeCode = o.officeCode

-- Task 2:
  SELECT * FROM products
  WHERE productCode NOT IN ( SELECT DISTINCT(productCode) FROM orderdetails )     

-- Task 3:
  SELECT o.orderDate , o.requiredDate , o.status , SUM(od.quantityOrdered*od.priceEach) as totalValues
  FROM orders as o
  INNER JOIN orderdetails as od ON o.orderNumber = od.orderNumber
  GROUP BY o.orderNumber

-- Task 4:
  SELECT pl.productLine , pl.textDescription , p.quantityInStock
  FROM productLines as pl 
  INNER JOIN products as p ON pl.productLine = p.productLine
  GROUP BY p.productLine
  ORDER BY p.quantityInStock DESC

-- Task 5:
  SELECT c.customerNumber , c.customerName , SUM(p.amount)
  FROM customers as c
  INNER JOIN payments as p ON c.customerNumber = p.customerNumber
  GROUP BY p.customerNumber

--------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Processing Datas with many TALBES by FKey
-- INNER JOIN , LEFT / RIGHT JOIN , SELF JOIN , NEGATIVE ( ! ) , .....

-- 1. INNER JOIN ( nối trong )
  -- *> Syntax :

    -- SELECT column_list
    -- FROM table1
    -- INNER JOIN table2 ON join_condition1 ( FK )
    -- INNER JOIN table3 ON join_condition2...
    -- WHERE conditions;

  -- *> For Example :
    -- SELECT products.productCode, products.productName,orderDetails.orderNumber 
    -- INNER JOIN orderDetails on products.productCode = orderDetails.productCode;

    --> Finding data Fields in Talbe A , B , that satisfy join_condition and join them

  -- *> Rename for table :
    -- SELECT p.productCode , o.*  , SUM(o.quantityOrdered * o.priceEach)
    -- FROM products as p
    -- INNER JOIN orderDetails as o on p.productCode = o.productCode;
    -- Group BY p.productCode

  -- *> INNER JOIN using WHERE ( only INNER JOIN ) :
    -- SELECT p.productCode, p.productName, o.orderNumber
    -- FROM products p, orderDetails o 
    -- WHERE p.productCode = o.productCode;

-- 2. LEFT JOIN 
  -- Show all data fiels in the left TALBE and the joined table enriches it with additional information
  -- The Additional informations which isn't satisfy join_condition , will be NULL
  -- *> Nếu có sự lệch số lượng bản ghi của 2 cột , phải sử dụng Left Join , không thì sẽ mất mát dữ liệu 
        --  Khi đó bản ghi bị lệch = null 

  -- *> For example :
    -- SELECT c.customerNumber, customerName,orderNUmber, o.status
    -- FROM customers c
    -- LEFT JOIN orders o ON c.customerNumber = o.customerNumber;
    -- WHERE orderNumber is NULL;

-- 3. SELF JOIN
  -- Bản thân mảng dữ liệu phải có trạng thái tự nối thì mới sử dụng self join đc
  -- ý nghĩa : nối đến bản copy của chính nó

  -- *> For example : 
    -- SELECT concat (e1.lastName ," ",e1.firstName) as fullname, e1.email,
    --        concat (e2.lastName ," ",e2.firstName) as manager, e2.email
    -- FROM employees e1, employees e2 
    -- WHERE e1.reportsTo = e2.employeeNumber;



