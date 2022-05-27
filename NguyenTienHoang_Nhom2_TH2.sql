CREATE DATABASE practiceweek2;

USE practiceweek2;

    -- White = no constraints
    -- Blue = has constraints
    -- Red = Foreign KEY
    -- Key = PRIMARY KEY

CREATE TABLE orders(
    -- Column-name Type(maxLength) [defaultValues] Column-Constraints 
    -- Example for constraints : PrimaryKey , ForeignKey , NOT NULL , Unique , Check , .... 
    -- AUTO_INCREMENT phải là INT và PRIMARY KEY
    orderId INT(11) NOT NULL AUTO_INCREMENT,
    orderNumber INT(11) NOT NULL PRIMARY KEY,
    orderDate DATETIME NOT NULL,
    shippedDate DATETIME NOT NULL,
    status VARCHAR(15) NOT NULL,
    comments TEXT NOT NULL,
    customerNumber INT(11) NOT NULL
    )ENGINE=InnoDB DEFAULT CHARSET=utf8; 
    
CREATE TABLE orderdetails(
    orderNumber INT(11) NOT NULL,
    productCode VARCHAR(15) NOT NULL,
    quantityOrdered INT(11) NOT NULL,
    priceEach DOUBLE NOT NULL,
    orderLineNumber SMALLINT(6) NOT NULL,

    -- Table constraints , FK must be Table constraints 
    -- PRIMARY KEY ( column1 , column2 ),
    -- IF ( PRIMARY KEY has >= 2 absolutes ){ must use Table constraints to add Primary key }
    PRIMARY KEY (orderNumber , productCode),
    )ENGINE=InnoDB DEFAULT CHARSET=utf8; 
    
CREATE TABLE products(
    productCode VARCHAR(15) NOT NULL PRIMARY KEY,
    productName VARCHAR(70) NOT NULL,
    productLine VARCHAR(50) NOT NULL,
    productScale VARCHAR(10) NOT NULL,
    productVendor VARCHAR(50) NOT NULL,
    productDescription TEXT NOT NULL,
    quantityInstock SMALLINT(6) NOT NULL,
    buyPrice DOUBLE NOT NULL

    -- FK constraints in TABLE , 2 absolutes what used to be FK must cùng kiểu dữ liệu ,
    -- dùng cách này sẽ buộc phải khai báo mảng cha trước mảng con , nên hơi khó khăn
    -- CONSTRAINT fk_products_orderdetails FOREIGN KEY (productCode) REFERENCES orderdetails (productCode) ON DELETE RESTRICT ON UPDATE CASCADE
    -- ON DELETE RESTRICT = ngăn k cho xóa cha khi con vẫn còn tham chiếu tới
    -- ON UPDATE CASCADE = tự động điền vào bảng con khi bảng cha có thay đổi ( phần được tham chiếu )

    )ENGINE=InnoDB DEFAULT CHARSET=utf8; 
    
CREATE TABLE productlines(
    productLine VARCHAR(50) NOT NULL PRIMARY KEY,
    textDescription VARCHAR(4000) NOT NULL,
    htmlDescription MEDIUMTEXT NOT NULL,
    image MEDIUMBLOB NOT NULL
    
    )ENGINE=InnoDB DEFAULT CHARSET=utf8; 
    
ALTER TABLE orderdetails  ADD CONSTRAINT fk_orderdetails_orders FOREIGN KEY (orderNumber) REFERENCES orders (orderNumber) ON DELETE RESTRICT ON UPDATE CASCADE ;
ALTER TABLE orderdetails  ADD CONSTRAINT fk_orderdetails_products FOREIGN KEY (productCode) REFERENCES products (productCode) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE products  ADD CONSTRAINT fk_products_productlines FOREIGN KEY (productLine) REFERENCES productlines (productLine) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE orderdetails  DROP CONSTRAINT fk_orderdetails_orders;

    