CREATE DATABASE uetPractice2;

USE uet-practice-2;

CREATE TABLE orders(
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
    PRIMARY KEY (orderNumber , productCode)
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
    )ENGINE=InnoDB DEFAULT CHARSET=utf8; 
    
CREATE TABLE productlines(
    productLine VARCHAR(50) NOT NULL PRIMARY KEY,
    textDescription VARCHAR(4000) NOT NULL,
    htmlDescription MEDIUMTEXT NOT NULL,
    image MEDIUMBLOB NOT NULL
    
    )ENGINE=InnoDB DEFAULT CHARSET=utf8; 

ALTER
    
    