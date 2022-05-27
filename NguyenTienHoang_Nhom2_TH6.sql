-- Xử lý SỐ + Gom nhóm Group By + Having
  -- Xử lý số ( SUM , MAX , MIN , COUNT , AVG)

  -- tính tổng tất cả bản ghi khác null trong cột

  SELECT SUM(quantityInstock) as quantity 
  FROM products

    -- tính bản ghi max / min trong cột

  SELECT Max(quantityInstock) as maxQuantity
  FROM products

  SELECT Min(quantityInstock) as minQuantity
  FROM products

  -- AVG = trung bình cộng các bản ghi khác null

  SELECT avg(quantityInstock) as avgQuantity
  FROM products

  -- đếm số lượng bản ghi khác null

  SELECT count(quantityInstock) as countQuantity
  FROM products

-------------------------------------------------------------------------------------

-- Gom nhóm GROUP BY

SELECT status , COUNT(*)
FROM orders
GROUP BY status;

-- -> trả về dữ liệu của cột status đã được gom nhóm , không trùng lặp
-- lệnh count được thực thi trên từng nhóm và hiển thị , thay vì count cả cột

-- Thứ tự quy trình triển khai truy vấn

SELECT col1, col_2, ... col_n,group_function(expressions)
FROM tablename
WHERE condition
GROUP BY col_1, col_2, ... col_n
HAVING ....
ORDER BY column list
LIMIT position , num  

----------------------------------------------------------------------------------------

-- Having 

SELECT ordernumber,
SUM(quantityOrdered) AS itemsCount,
SUM(priceEach * quantityOrdered) AS total
FROM orderdetails
GROUP BY ordernumber
HAVING total > 1000;

-- Vì total là thuộc tính suy diễn sau ghi gom nhóm GROUP BY nên ta phải sử dụng HAVING
-- Vì WHERE chỉ xử lý các cột dữ liệu có sẵn trong bảng , không xử lý thuộc tính suy diễn



