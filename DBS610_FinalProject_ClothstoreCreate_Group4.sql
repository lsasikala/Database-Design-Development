---SQL query to create all the required tables----

Use ClothStore

---Customers table to store customer data--
CREATE TABLE customers(
customerID INT PRIMARY KEY,
customerFirstName VARCHAR(50) NOT NULL,
customerLastName VARCHAR(50) NOT NULL,
phone VARCHAR(20) NOT NULL,
email VARCHAR(50) NOT NULL,
addressLine1 VARCHAR(50) NOT NULL,
addressLine2 VARCHAR(50),
city VARCHAR(20) NOT NULL,
province VARCHAR(20) ,
postalCode VARCHAR(15) NOT NUlL,
country VARCHAR(20) NOT NULL,
salesPerson INT,
CONSTRAINT customers_employees_fk FOREIGN KEY(salesPerson)  REFERENCES employees(employeeID)
);



---Employees table for storing employee data---
CREATE TABLE employees(
employeeID INT PRIMARY KEY,
employeeFirstName VARCHAR(50) NOT NULL,
employeeLastname VARCHAR(50) NOT NULL,
phone VARCHAR(20) NOT NULL,
email VARCHAR(50) NOT NULL,
jobTitle VARCHAR(50) NOT NULL,
hireDate DATE NOT NULL,
salary INT NOT NULL,
officeCode  VARCHAR(20) NOT NULL,
CONSTRAINT employees_office_fk FOREIGN KEY(officeCode) REFERENCES office(officeCode)

);

---Office table for office data---
CREATE TABLE office(
officeCode VARCHAR(20) PRIMARY KEY,
phone VARCHAR(20) NOT NULL,
addressLine1 VARCHAR(50) NOT NULL,
addressLine2 VARCHAR(50),
city VARCHAR(20) NOT NULL,
province VARCHAR(20) ,
postalCode VARCHAR(15) NOT NUlL,
country VARCHAR(20) NOT NULL
);


---A lookup table for product categories---
CREATE TABLE prodcategories(
categoryID INT PRIMARY KEY,
categoryName varchar(50) NOT NULL
);


---Products table for product information---
CREATE TABLE products(
productID INT PRIMARY KEY,
productName VARCHAR(50) NOT NULL,
categoryID INT NOT NULL,
productSize VARCHAR(10) NOT NULL,
productColour VARCHAR(50) NOT NULL,
quantityInStock INT NOT NULL,
buyPrice DECIMAL(10,2) NOT NULL,
MSRP DECIMAL(10,2) NOT NULL,
CONSTRAINT product_category_fk FOREIGN KEY(categoryID) REFERENCES prodcategories(categoryID)
);


---Suppliers table for supplier details---
CREATE TABLE suppliers(
supplierID INT PRIMARY KEY,
supplierName VARCHAR(50) NOT NULL,
contactFirstName VARCHAR(50) NOT NULL,
contactLastName  VARCHAR(50) NULL,
emailId VARCHAR(50) NOT NULL,
phone VARCHAR(50) NOT NULL,
);


---A bridge table connecting products and suppliers---
CREATE TABLE supplier_product(
supplierID INT,
productID INT,
dateLastDelivered DATE NOT NULL,
quantityDelivered INT NOT NULL,
PRIMARY KEY (supplierID,productID),
CONSTRAINT suppliers_products_suppliers_fk FOREIGN KEY (supplierID) REFERENCES suppliers (supplierID),
CONSTRAINT suppliers_products_products_fk FOREIGN KEY (productID) REFERENCES products (productID)
);


---Order table for order data---
CREATE TABLE orders(
orderID INT PRIMARY KEY,
customerID INT NOT NULL, 
orderDate DATE NOT NULL,
shippedDate DATE  NULL,
orderStatus VARCHAR(20) NOT NULL,
CONSTRAINT order_customer_fk FOREIGN KEY (customerID ) REFERENCES customers(customerID),
);


---Orderedetials table which is a bridge table connecting products and orders---
CREATE TABLE orderdetails(
orderID  INT,
productID INT,
quantityOrdered INT NOT NULL,
priceEach DECIMAL(10,2) NOT NULL,
PRIMARY KEY (orderID, productID),
CONSTRAINT orderdetails_orders_fk FOREIGN KEY (orderID) REFERENCES orders (orderID),
CONSTRAINT orderdetails_products_fk FOREIGN KEY (productID) REFERENCES products(productID)
);



---Payment table for customer's payment information---

CREATE TABLE payments(
referenceID VARCHAR(20) PRIMARY KEY,
customerID INT ,
paymentDate DATE NOT NULL,
amount DECIMAL(10,2) NOT NULL
CONSTRAINT payments_customers_fk FOREIGN KEY (customerID) REFERENCES customers (customerID)
);



---A product rating table, this is an interface where the customers can rate a product in the range of 0 to 5---
CREATE TABLE productrating(
customerID INT, 
productID INT ,
rating INT NOT NULL,
comment VARCHAR(1000),
ratingDate DATE NOT NULL
PRIMARY KEY (customerID, productID),
CONSTRAINT productrating_customer_fk FOREIGN KEY (customerID) REFERENCES customers (customerID),
CONSTRAINT productrating_products_fk FOREIGN KEY (productID) REFERENCES products (productID),
CONSTRAINT rating_chk CHECK (rating BETWEEN 0 AND 5)
);

---An interface for the customer to login---
CREATE TABLE customerlogin(
customerLoginID VARCHAR(30) PRIMARY KEY,
customerID INT,
username VARCHAR(30) NOT NULL,
custpassword VARCHAR(30) NOT NULL,
lastlogin DATETIME NOT NULL,
CONSTRAINT customerlogin_customers_fk FOREIGN KEY (customerID) REFERENCES customers(customerID)
);

---An interface for the employee to log in---

CREATE TABLE employeelogin(
employeeLoginID VARCHAR(30) PRIMARY KEY,
employeeID INT,
username VARCHAR(30) NOT NULL,
empassword VARCHAR(30) NOT NULL,
lastlogin DATETIME NOT NULL,
CONSTRAINT employeelogin_customers_fk FOREIGN KEY (employeeID) REFERENCES employees(employeeID)

);


