---- INSERT Queries



INSERT INTO office (officeCode,phone,addressLine1,addressLine2,city,province,postalCode,country)
VALUES (1, '+1 650 219 4782', '100 Market Street','Suite 300', 'Torronto', 'Ontario', 'L3S 4T8', 'Canada'),
	   (2, '+44 20 7877 2041', '25 Old Broad Street', 'Level 7', 'London', NULL, 'EC2N 1HN', 'UK'),
	   (3, '+1 212 555 3000', '523 East 53rd Street', 'Apt. 5A', 'Vancouver', 'BC','L6F 5Y7', 'Canada'),
	   (4, '+91 23 2345 2345', '4-1 Kioicho', NULL, 'Tokyo', NULL, '102-8578', 'Japan'),
	   (5, '+61 2 9264 2451', '5-11 Wentworth Avenue', 'Floor #2', 'Sydney', NULL, 'NSW 2010', 'Australia'),
	   (6, '+71 2345 5678', '273 William Park', NULL, 'Florida', NULL, '123 567', 'USA'); 

SELECT * FROM office


INSERT INTO employees (employeeID, employeeFirstName, employeeLastname, phone, email, 
						jobTitle,hireDate,salary,officeCode)
VALUES (2222, 'Patterson', 'Williams', '456-896-4567', 'pwilliams@fashionfiness.com', 'Manager','2023-03-10',7500,1),
       (2223, 'Bow', 'Anthony', '+1 233 456 2345', 'banthony@fashionfines.com', 'Sales Representative', '2023-03-15', 4500,1),
	   (2224, 'Firrelli','Julie','+44 23 4567 3456', 'fjulie@fashionfines.com', 'Sales Representative', '2023-02-10', 3500,2),
	   (2225, 'Jones', 'Barry', '+61 3 4567 2345', 'jbarry@fashionfines.com', 'Sales Representative', '2023-01-14',4550,5),
	   (2226, 'Kato', 'Yoshimi', '+91 34 9867 4567', 'kyoshimi@fashionfines.com', 'Sales Representative','2023-01-01',5000,4),
	   (2227,'Manto', 'Jackson', '+21 345 6789', 'mjackson@fashionfines.com', 'Sales Representataive','2021-04-01', 3000,6);

SELECT * FROM employees; 
   

INSERT INTO customers (customerID, customerFirstName, customerLastName, phone, email, addressLine1,
						addressLine2, city, province, postalCode, country, salesPerson)
VALUES (1010,'Nick','John','437-123-4567','nickjohn@gmail.com','436, Elson Street', 'Markville', 'Markham', 'Ontario','L3S 4T8','Canada',2223),
	   (1011,'Peter','Patrick','40-67-8555','peterpatrick@yahoo.com','54, Rue Royale',NULL, 'Nantes',NULL, '44000','France',NULL),
	   (1012,'Emily','Brown','7025551838','emily.brown@gmail.com','8489 Strong St.',NULL,'Las Vegas',NULL, '83030','USA',2227),
	   (1020,'Young','Jeff', '604-555-3392','youngjeff@yahoo.com','1900 Oak St.',NULL,'Vancouver','British Columbia', 'V3F 2K1', 'Canada', 2223),
	   (1030,'Chandra','Menon','989-598-0670','chandra.menon98@gmail.com','Y3, SBRA','Kalyanpur','Kanpur',NULL,'208016','India',NULL);


SELECT * FROM customers;



INSERT INTO prodcategories (categoryID, categoryName)
VALUES (1,'Ladies'),
		(2,'Gents'),
		(3,'Kids');

SELECT * FROM prodcategories;

		
INSERT INTO products (productID, productName, categoryID, productSize, productColour, quantityINStock, buyPrice, MSRP)
VALUES (10, 'Jeans', 1, 'S','Blue',50,75.99, 99.99),
		(12, 'Blazers', 2, 'XL', 'Black', 25,99.99, 120.99),
		(15, 'Trousers', 3 , 'NB', 'PINK',45, 32.89, 56.79),
		(16, 'Shirts', 2, 'L', 'Brown', 23,45.67, 67.89),
		(20, 'Tshirts', 1 , 'M', 'Red', 18, 23.99, 45.99),
		(11,  'Jeans', 2,'XXL', 'Black', 25, 80.00, 95.99),
		(13, 'Tshirts', 3, 'S', 'Green', 60, 25.49, 32.99);

SELECT * FROM products;


INSERT INTO suppliers (supplierID, supplierName, contactFirstName, contactLastName, emailId, phone)
VALUES (101, 'Weave World', 'Petersen', 'Jytte ', 'pjytte@weaveworld.com', '314 125 3555'),
		(105,'Ethnic Weaves', 'Franco', 'Keith', 'fkeith@ethnicweaves.com', '203 555 7845'),
		(108, 'Weavers Loop', 'Kentary', 'Mory', 'kmory@weaversloop.com', '617 555 5555'),
		(110, 'Fashion Fabrics', 'Young', 'Julie', 'yjulie@fashionfabrics.com', '886 015 5534'),
		(115, 'Cloth World', 'Lincoln', 'Elizabeth ', 'lelizabeth@clothworld.com', '123 432 4567');


SELECT * FROM suppliers;


INSERT INTO supplier_product(supplierID, productID, dateLastDelivered, quantityDelivered)
VALUES ( 101, 10, '2023-04-01',30),
		(105, 10, '2023-02-15',10),
		(108, 12, '2023-02-10',5),
		(110, 20, '2023-03-11',10),
		(115, 16, '2023-04-04',15),
		(105,11,'2023-04-10',25),
		(110, 13, '2023-04-06',30);


SELECT * FROM supplier_product;


INSERT INTO orders (orderID, customerID, orderDate, shippedDate, orderStatus)
VALUES (10500, 1010, '2023-03-30' ,'2023-04-01', 'Shipped'),
		(10555, 1010, '2023-04-01', '2023-04-04', 'Shipped'),
		(10570, 1012, '2023-03-28', '2023-03-31', 'Shipped'),
		(10580,1020, '2023-04-05', NULL, 'In Process'),
		(10600,1020, '2023-03-25', '2023-03-27', 'Shipped');

SELECT * FROM orders;

INSERT INTO orderdetails ( orderID, productID, quantityOrdered, priceEach)
VALUES (10500, 10, 2, 95.00),
		(10500,12,1,110.99),
		(10555,15,3,45.89),
		(10570,16,1,65.00),
		(10570,10,2,95.00),
		(10570,12,1,110.99),
		(10580,20,2,95.00),
		(10600,15,1,110.99),
		(10600,20,3,95.00);

SELECT * FROM orderdetails;


INSERT INTO payments (referenceID, customerID, paymentDate,amount)
VALUES('LN373447', 1010,'2023-03-30', 300.99),
	('FD317790', 1020,'2023-04-05',190.00),
	('HQ336336', 1020, '2023-03-25', 110.99),
	('GG31455', 1012,'2023-03-28',365.99),
	('CQ287967', 1010,'2023-04-01', 137.67);



SELECT * FROM payments;

INSERT INTO productrating ( customerID, productID, rating, comment,ratingDate)
VALUES (1010,10,5,'Good quality. Highly recommended', '2023-04-05'),
       (1010,12,3,'Not recommended due to fitting issues', '2023-04-08'),
	   (1020, 20, 1, 'Worst Quality. Returned.', '2023-04-10'),
	   (1012, 16, 4, 'Decent product.', '2023-04-03'),
	   (1020, 15, 5, 'Excellent Quality.', '2023-04-01');

SELECT * FROM productrating;

INSERT INTO customerlogin (customerLoginID, customerID, username, custpassword,lastlogin)
VALUES('Nick_1010', 1010, 'nickjohn', 'nick1234', '2023-04-09 15:30:00'),
	('Peter_1011', 1011, 'peterpatrick','peter1234', '2023-04-08 14:00:09'),
	('Emily_1012', 1012, 'emilybrown', 'emily1234', '2023-04-01 10:00:00'),
	('Young_1020', 1020, 'youngjeff', 'young1234', '2023-04-05 12:00:00'),
	('Chandra_1030', 1030 ,'chandramenon', 'chandra1234' ,'2023-04-06 11:00:00');

SELECT * FROM customerlogin;


INSERT INTO employeelogin (employeeLoginID, employeeID, username, empassword, lastlogin)
VALUES('Patterson_2222',2222,'pattersonwilliams', 'patterson1234', '2023-04-09 15:00:54'),
	   ('Bow_2223', 2223 , 'bowanthony', 'bow1234', '2023-04-08 18:00:00'),
	   ('Firrelli_2224', 2224, 'firrellijulie', 'firrelli1234', '2023-04-07 17:34:45'),
	   ('Jones_2225', 2225, 'jonesbarry', 'jones1234', '2023-04-09 14:41:23'),
	   ('Kato_2226', 2226,'katoyoshimi', 'kato1234' ,'2023-04-08 18:41:23'),
	   ('Manto_2227', 2227, 'mantojackson', 'manto1234', '2023-04-05 09:45:34');



SELECT * FROM employeelogin;






