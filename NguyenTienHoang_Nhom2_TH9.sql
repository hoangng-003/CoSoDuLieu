--  Xử lý bảng dữ liệu
  -- Insert ( thêm ) , Delete ( Xóa) , Update ( Cập nhật )

-- 1. INSERT

-- INSERT INTO table_name
-- [(column_name,...)]
--  VALUES((expression | DEFAULT),...),(...),...

-- Kiểu 1 : Trải giá trị

  -- INSERT INTO classicmodels.offices
  --  (officeCode,city,phone,addressLine1,addressLine2,state,country,postalCode,territory )
  --  VALUES('8','Boston','+1 215 837 0825','1550 dummy street',NULL,'MA,'USA','02107','NA');

  -- Khi không cần sự thay đổi tên dữ liệu , có thể k cần khai báo . Trải thẳng VALUES ra là xong 

-- Kiểu 2 : SELECT từ bảng đã có 

  -- INSERT INTO table_name
  --  [(column_name,...)]
  --  <SELECT statement>;

  -- INSERT INTO temp_table
  -- SELECT *
  -- FROM classicmodels.offices
  -- WHERE country = 'USA';

  -- Hiển thị : SELECT * FROM classicmodels.temp_table;

-- Bonus : Khởi tạo bảng có những thuộc tính giống với bảng đã có

  -- USE classicmodels;
  -- CREATE TALBE temp_table LIKE offices;

-- 2. UPDATE 

  -- UPDATE employees
  -- SET email = 'diane-murphy@classicmodelcars.com'
  -- WHERE employeeNumber = 1002;

-- 3. DELETE

  -- DELETE
  -- FROM employees
  -- WHERE officeCode = 6;

-- Lỗi rằng buộc : "Cannot delete or update a parent row: a foreign key constraint fails(....)"
