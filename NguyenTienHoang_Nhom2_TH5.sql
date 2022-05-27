-- Xử lý String && xử lý time 

-- 1. Xử lý String 

  -- a.  lấy substring để xử lý
  substring( string , position , len );
  substring( string FROM position FOR len );
  -- in MySQL , position start = 1 
SELECT substring ('MYSQL Substring',7);
  -- substr()

  -- b. nối 2 string 
  CONCAT(str1 , str2);
  SELECT CONCAT(contactLastname,', ',contactFirstname) 
  fullname
  FROM customers;

  CONCAT_WS(seperator, str1, str2,...)
  SELECT CONCAT_WS(';', contactLastname, contactFirstname)
  fullname
  FROM customers;

  -- c. thay thế REPLACE

  REPLACE(originstring, search string, replacement string);
  SELECT REPLACE('MySQL Replace', 'MySQL', 'MariaDB');

  UPDATE <table name>
  SET column name= REPLACE(column name, search string replacement string) 
  WHERE <conditions>;

  UPDATE products
  SET productDescription = REPLACE(productDescription,'abuot','about');

  -- d. IF hàm điều kiện 

  IF(expr, if_true_expr, if_false_expr)
  SELECT IF(1 = 2,'true','false');

  SELECT customerNumber, customerName, IF(state IS NULL,'N/A',state) as state , country,
  FROM customers;

  SELECT SUM(IF(status = 'Shipped',1,0))   AS Shipped,
  SUM(IF(status = 'Cancelled',1,0)) AS Cancelled
  FROM orders;

  SELECT SUM(IF(substring(checkNumber,1,1) = 'D' , amount , 0)) as summ
  FROM payments


-- Task 1

UPDATE products
SET productDescription = REPLACE(productDescription,substring(productDescription,1,50),'Title of products');

-- Task 2

SELECT CONCAT(lastName , ' ' , firstName) as fullname , jobTitle ,
FROM employees
  
-- Task 3 

UPDATE employees
SET jobTitle = REPLACE(jobTitle,'Sales Rep','Sales Representative')

---------------------------------------------------------------------------------------------------------------------------------------

-- 2. Xử lý time

  -- a. Khoảng cách giữa 2 mốc thời gian ( DATEDIFF )
  DATEDIFF(expr1,expr2)

  SELECT DATEDIFF('2011-08-17','2011-08-08');
  --  Result: 9 days
  SELECT DATEDIFF('2011-08-08','2011-08-17');
  --  Result: -9 days

  SELECT orderNumber , DATEDIFF(requiredDate,shippedDate) AS daysLeft
  FROM orders
  ORDER BY daysLeft DESC;

  -- b. Thêm ngày vào ngày cho trước ( ADDDATE )

  SELECT ADDDATE(NOW(), INTERVAL 30 DAY);

  SELECT * 
  FROM orders
  WHERE orderDate>= '2005-5-1' AND orderDate < ADDDATE('2005-5-1', INTERVAL 30 DAY); 

  -- c. Extract ( lấy ra các thành phần của 1 ngày)

  SELECT EXTRACT(MONTH FROM '2004-12-31 23:59:59');

  SELECT *
   FROM orders
  WHERE EXTRACT(YEAR FROM orderDate) = 2005;
  
  -- Task 4

  SELECT *
  FROM orders 
  WHERE shippedDate < requiredDate 
  LIMIT 5

  -- Task 5 

 SELECT *
 FROM orders
 WHERE orderDate BETWEEN '2005-05-01' AND '2005-05-31' AND shippedDate IS NULL

