-----VIEW Query-------


/*  
1.A view table  that lists all orders of all customers with details such as 
customerid,customerFirstName, customerLastName,
orderid, productid, productName, categoryName,productSize,productColour,priceeach, total Price of each product  */




CREATE VIEW vwCustomerOrder AS
SELECT c.customerID, c.customerFirstName, c.customerLastName,o.orderID, od.productID, 
		p.productName, pc.categoryName, p.productSize,p.productColour, od.priceEach,od.quantityOrdered,
		(od.priceEach * od.quantityOrdered) AS 'total Price'
FROM customers c
				INNER JOIN orders o ON  c.customerID = o.customerID
				INNER JOIN orderdetails od ON o.orderID = od.orderID
				INNER JOIN products p ON od.productID = p.productID
				INNER JOIN prodcategories pc ON p.categoryID = pc.categoryID;


SELECT * FROM vwCustomerOrder;







/*2.A view table that lists the products delivered by all suppliers with details such as
supplierName, contactFirstName, contactLastName,phone,productName,productcategoryName,quantityDelivered
and dateLastDelivered

*/

CREATE VIEW vwProductSupplierDetails AS
SELECT p.productName, pc.categoryName, p.productSize, p.productColour, s.supplierName, s.contactFirstName, s.contactLastName,
		s.phone, sp.quantityDelivered, sp.dateLastDelivered
FROM products p INNER JOIN  supplier_product sp ON p.productID = sp.productID
				LEFT OUTER JOIN prodcategories pc ON p.categoryID = pc.categoryID
				LEFT OUTER JOIN suppliers s ON sp.supplierID = s.supplierID;



SELECT * FROM vwProductSupplierDetails;	



/*3. A view table that lists alll the rating made by customer with customerID 1010
with details such as customerID,customerName, productName , categoryName, productRating , comment and ratingDate 
*/
CREATE VIEW vwCustomerProductRating AS
SELECT c.customerID, (c.customerFirstName + ' ' +  c.customerLastName) AS 'Name', p.productName, pc.categoryName,
		pr.rating, pr.comment, pr.ratingDate
FROM customers c INNER JOIN productrating pr ON c.customerID = pr.customerID
				  INNER JOIN products p ON pr.productID = p.productID
				  INNER JOIN prodcategories pc ON p.categoryID = pc.categoryID
WHERE c.customerID = 1010;


SELECT * FROM vwCustomerProductRating;


/* A view table that connects  the customer, employee, office of the employee with details such as 
customerId,customerName,employeeID,emploeeName,office Location  in which office is located*/
CREATE VIEW vwEmployeeCustomer AS
SELECT c.customerID, (c.customerFirstName + ' ' + c.customerLastName) AS 'customerName', e.employeeID, (e.employeeFirstName + ' '+ e.employeeLastName) AS employeeName, 
e.officeCode, o.city AS 'Office Location'
FROM employees e INNER JOIN customers c ON e.employeeID = c.salesPerson
				 INNER JOIN office o ON e.officeCode = o.officeCode;


SELECT * FROM vwEmployeeCustomer;



/*A view table to calculate the total no:of products sold on a particular day*/

CREATE VIEW vwProductSold AS
SELECT SUM(od.quantityordered) AS totalProductsSold
FROM orderdetails od
WHERE od.orderID IN (
    SELECT o.orderID
    FROM orders o
    WHERE o.orderDate = '2023-04-01'
);



SELECT * FROM vwProductSold;