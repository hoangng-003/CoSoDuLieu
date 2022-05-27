-- *> For example :

  -- SELECT * 
  -- FROM orders
  -- WHERE orderDate = (SELECT MAX(orderDate) FROM orders)

-- *> Với không tương quan : Select trong truy vấn con thích lấy gì cx được k cần liên quan đến truy vấn chính 
  -- Truy vấn con thực hiện trước , truy vấn bên ngoài xử lý sau

-- *> Với truy vấn con tương quan : Truy vấn bên ngoài thực hiện trước , truy vấn con có xử dụng truy vấn ngoài để làm việc sau mỗi lần run
-- *> For example :

  -- SELECT * FROM products p
  -- WHERE quantityInStock > (SELECt avg(quantityInStock) FROM productsWHERE productLine = p.productLine);

-- Truy vấn con trong select và truy vấn con trong from ( nối trong )
-- EX :

  -- SELECT productName, totalQuantityOrderd
  -- FROM products, (SELECT productCode, SUM(quantityOrdered) as totalQuantityOrderd FROM  orderdetails group by productCode) AS productOrder
  -- WHERE products.productCode = productOrder.productCode;

  