-- Task 1 

SELECT *
FROM customers
WHERE city IN ('Nantes' , 'Lyon' );

SELECT *
FROM customers
WHERE city = 'Nantes' OR city = 'Lyon';

-- Task 2

SELECT *
FROM orders
  -- >= and <= 
WHERE shippedDate BETWEEN '2003-01-10' AND '2003-03-10';

SELECT *
FROM orders
WHERE ( shippedDate >= '2003-01-10' ) AND ( shippedDate <= '2003-03-10' );

--  Task 3

SELECT *
FROM productlines
  -- % : có gì đó hoặc k . _ : phải là 1 kí tự 
  -- Nếu muốn tìm dấu '_' , thì phải thêm \ : ' \ _ '
WHERE productLine LIKE '%CARS%';

-- Task 4 

SELECT *
FROM products 
-- DESC = lớn đến bé , ASC = bé đến lớn 
ORDER BY quantityInStock DESC
LIMIT 10;

--  Gộp 2 cột , xử lí , và đặt tên mới cho cột 
SELECT orderNumber, (priceEach*quantityInStock) as lineTotal
FROM orderdetails;

--  Nối 2 bảng , default = distinct : loại bỏ bản ghi trùng lặp , nếu thích thì thêm ALL : không loại bỏ  
-- phải có cùng số cột , kiểu dữ liệu trong cột phải truyển đổi đc cho nhau

SELECT customerNumber id, contactLastname 
name
FROM customers
UNION 
SELECT employeeNumber id, firstname 
name
FROM employees;