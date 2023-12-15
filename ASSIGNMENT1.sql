--ASSIGNMENT1

CREATE DATABASE TECHSHOP1;
USE TECHSHOP1;

--CREATE CUSTOMER TABLE
CREATE TABLE CUSTOMERS
(
CUSTOMER_ID INT IDENTITY PRIMARY KEY,
FIRST_NAME VARCHAR(20) NOT NULL,
LAST_NAME VARCHAR(20) ,
EMAIL VARCHAR(30) NOT NULL,
PHONE VARCHAR(10) NOT NULL,
ADDRESS VARCHAR(30) NOT NULL,
)


--INSERT RECORDS IN CUSTOMER TABLE
INSERT INTO CUSTOMERS(FIRST_NAME,LAST_NAME,EMAIL ,PHONE,ADDRESS)
VALUES 
('John', 'Doe', 'john.doe@email.com', '5551223367', 'Main St City')

INSERT INTO CUSTOMERS(FIRST_NAME,LAST_NAME,EMAIL ,PHONE,ADDRESS)
VALUES 
('Alice', 'Smith', 'alice.smith@email.com', '558765443', '4Ave, Town'),
('Bob', 'Johnson', 'bob.johnson@email.com', '5554564890', '79 Pine Blvd, City'),
('Emily', 'Davis', 'emily.davis@email.com', '5552345678', '101 Elm St, Village');

INSERT INTO CUSTOMERS(FIRST_NAME,LAST_NAME,EMAIL ,PHONE,ADDRESS)
VALUES 
('Michael', 'White', 'michael.white@email.com', '5558765432', '202 Cedar Ln, Town'),
('Sarah', 'Miller', 'sarah.miller@email.com', '5553456789', '303 Maple Dr, City'),
('David', 'Wilson', 'david.wilson@email.com', '5556543210', '404 Birch Ave, Town'),
('Olivia', 'Brown', 'olivia.brown@email.com', '5557890123', '505 Oak St, Village'),
('Ethan', 'Lee', 'ethan.lee@email.com', '5550123456', '606 Pine Blvd, City'),
('Ava', 'Turner', 'ava.turner@email.com', '5552345678', '707 Elm Ave, Town');

--QUERY INTO CUSTOMER
SELECT * FROM CUSTOMERS;

--CREATE PRODUCT TABLE
CREATE TABLE PRODUCTS
(
PRODUCT_ID INT IDENTITY PRIMARY KEY,
PRODUCT_NAME VARCHAR(20) NOT NULL,
DESCRIPTION VARCHAR(30) ,
PROD_PRICE FLOAT NOT NULL,

)
--INSERT RECORDS
INSERT INTO PRODUCTS(PRODUCT_NAME,DESCRIPTION,PROD_PRICE)
VALUES
('Laptop', 'High-performance laptop', 999.99);

SELECT * FROM PRODUCTS;

INSERT INTO PRODUCTS(PRODUCT_NAME,DESCRIPTION,PROD_PRICE)
VALUES
('Smartphone', 'Latest model smartphone', 599.99),
('Tablet', 'Lightweight tablet', 299.99),
('Headphones', 'Noise-canceling headphones', 149.99),
('Smartwatch', 'Fitness tracking smartwatch', 199.99),
('Camera', 'DSLR camera with 24MP', 799.99)

INSERT INTO PRODUCTS(PRODUCT_NAME,DESCRIPTION,PROD_PRICE)
VALUES
('TV', '55-inch 4K smart TV', 1299.99),
('Printer', 'All-in-one wireless printer', 129.99),
('Gaming Console', 'Latest gaming console', 499.99),
('Wireless Router', 'High-speed wireless router', 79.99)

--ORDER TABLE
CREATE TABLE ORDERS
(

ORDER_ID INT IDENTITY PRIMARY KEY,
CUSTOMER_ID INT NOT NULL,
ORDER_DATE DATE NOT NULL ,
TOTAL_AMOUNT FLOAT NOT NULL,
FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID)
)
SELECT * FROM ORDERS;
--INSERT RECORDS
INSERT INTO Orders(CUSTOMER_ID,ORDER_DATE,TOTAL_AMOUNT)
VALUES
(3, '2023-11-01', 1299.99)

INSERT INTO Orders(CUSTOMER_ID,ORDER_DATE,TOTAL_AMOUNT)
VALUES

(5, '2023-11-02', 599.99),
(7, '2023-11-03', 799.99),
(2, '2023-11-04', 149.99),
(8, '2023-11-05', 299.99),
(1, '2023-11-06', 999.99),
(6, '2023-11-07', 79.99),
(4, '2023-11-08', 499.99),
(9, '2023-11-09', 129.99),
(10, '2023-11-10', 199.9)


SELECT * FROM ORDERS;
--TABLE ORDER_DETAILS
CREATE TABLE ORDER_DETAILS
(

ORDERDETAIL_ID INT IDENTITY PRIMARY KEY,
ORDER_ID INT NOT NULL,
PRODUCT_ID INT NOT NULL ,
QUANTITY INT NOT NULL,
FOREIGN KEY(ORDER_ID) REFERENCES ORDERS(ORDER_ID),
FOREIGN KEY(PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID)
)
--INSERT RECORDS
INSERT INTO ORDER_DETAILS(ORDER_ID,PRODUCT_ID,QUANTITY)
VALUES
(1, 7, 1)

SELECT * FROM ORDER_DETAILS;
INSERT INTO ORDER_DETAILS(ORDER_ID,PRODUCT_ID,QUANTITY)
VALUES
(2, 2, 2),
(3, 6, 1),
(4, 4, 3),
(5, 3, 2),
(6, 1, 1),
(7, 10, 1),
(8, 9, 1),
(9, 8, 2),
(10, 5, 1);
--INVENTORY TABLE
CREATE TABLE INVENTORY
(
INVENTORY_ID INT IDENTITY PRIMARY KEY,
PRODUCT_ID INT NOT NULL ,
QUANTITY_INSTOCK INT NOT NULL,
LAST_STOCK_UPDATE DATE NOT NULL,
FOREIGN KEY(PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID)
)

INSERT INTO INVENTORY(PRODUCT_ID,QUANTITY_INSTOCK,LAST_STOCK_UPDATE)
VALUES
(1, 20, '2023-11-25'),
(2, 15, '2023-11-26'),
(3, 30, '2023-11-20'),
(4, 25, '2023-11-22'),
(5, 18, '2023-11-25'),
( 6, 10, '2023-10-25'),
( 7, 12, '2023-11-21'),
(8, 22, '2023-11-25'),
(9, 8, '2023-11-25'),
(10, 40, '2023-11-18');
SELECT * FROM INVENTORY;


--1. Write an SQL query to retrieve the names and emails of all customers. 
SELECT FIRST_NAME,LAST_NAME,EMAIL FROM CUSTOMERS;

--2. Write an SQL query to list all orders with their order dates and corresponding customer names.
SELECT Orders.ORDER_ID,Orders.CUSTOMER_ID,Orders.ORDER_DATE,Customers.FIRST_NAME,Customers.LAST_NAME FROM ORDERS JOIN CUSTOMERS ON Orders.CUSTOMER_ID =Customers.CUSTOMER_ID;


--3.Write an SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address.

INSERT INTO CUSTOMERS(FIRST_NAME,LAST_NAME,EMAIL ,PHONE,ADDRESS) VALUES
('Nidhi','singh','ns@gmail.com','5263748464','fkhffwkbfkjwbfkjf');

--4. Write an SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%.

--Adding a new column named 'gadget_type'
ALTER TABLE PRODUCTS
ADD GADGET_TYPE VARCHAR(20) ;
SELECT * FROM PRODUCTS;
UPDATE PRODUCTS SET GADGET_TYPE='Electronic' where PRODUCT_ID BETWEEN 1 AND 10;


INSERT INTO Products (PRODUCT_NAME,DESCRIPTION,PROD_PRICE,GADGET_TYPE) VALUES
('Book', 'Classic literature', 19.99,'Non-electrical'),
('Coffee Maker', 'Automatic drip coffee maker', 49.99,'Non-electrical'),
('Backpack', 'Durable hiking backpack', 39.99,'Non-electrical'),
('Running Shoes', 'High-performance running shoes', 79.99,'Non-electrical'),
('Cookware Set', 'Stainless steel cookware set', 129.99,'Non-electrical');

UPDATE PRODUCTS 
SET PROD_PRICE=PROD_PRICE*1.1  WHERE GADGET_TYPE='ELECTRONIC';


--5. Write an SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables. Allow users to input 
--the order ID as a parameter.
DECLARE @DELOrderID INT = 5;

DELETE FROM ORDER_DETAILS WHERE ORDER_ID = @DELOrderID;
DELETE FROM ORDERS WHERE ORDER_ID = @DELOrderID;
SELECT * FROM ORDERS;
SELECT * FROM ORDER_DETAILS;


--6. Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information.
INSERT INTO Orders(CUSTOMER_ID,ORDER_DATE,TOTAL_AMOUNT)
VALUES
(9, '2023-11-11', 1555.99)
SELECT * FROM ORDERS;

--7. Write an SQL query to update the contact information (e.g., email and address) of a specificcustomer in the "Customers" table. 
--Allow users to input the customer ID and new contact information.
UPDATE CUSTOMERS 
SET EMAIL='DUMMY@GMAI.COM',ADDRESS='DUMMYDUMMY' WHERE CUSTOMER_ID=4;
SELECT * FROM CUSTOMERS;

--8. Write an SQL query to recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities
--in the "OrderDetails" table.
--SELECT * FROM ORDER_details;
--SELECT * FROM ORDERS;
--Select * from products;


update ORDERS
set TOTAL_AMOUNT=COALESCE(
(
SELECT sum(order_details.quantity*PRODUCTS.prod_price) from order_details join products
on order_details.product_id=products.product_id 
where ORDER_DETAILS.ORDER_ID=orders.ORDER_ID),0);



--9. Write an SQL query to delete all orders and their associated order details for a specific customer from the "Orders" and "OrderDetails" tables.
--Allow users to input the customer ID as a parameter.
DECLARE @DELCUSTOMER INT=4;
DELETE FROM ORDER_DETAILS WHERE ORDER_ID IN (SELECT ORDER_ID FROM ORDERS WHERE CUSTOMER_ID= @DELCUSTOMER);
DELETE FROM ORDERS WHERE CUSTOMER_ID= @DELCUSTOMER;
use techshop1;
SELECT * FROM ORDER_details;
Select * from products;
SELECT * FROM ORDER_DETAILS;

--10. Write an SQL query to insert a new electronic gadget product into the "Products" table, 
--including product name, category, price, and any other relevant details.

INSERT INTO PRODUCTS(PRODUCT_NAME,DESCRIPTION,PROD_PRICE,GADGET_TYPE)
VALUES
('MIXER', 'HIGH END', 599.99,'ELECTRONIC');
SELECT * FROM PRODUCTS;

--11. Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from 
--"Pending" to "Shipped"). Allow users to input the order ID and the new status.
ALTER TABLE ORDERS
ADD Status VARCHAR(10);
SELECT * FROM ORDERS;

UPDATE ORDERS
SET Status='Pending';

UPDATE ORDERS
SET Status='Shipped' WHERE CUSTOMER_ID=9 OR TOTAL_AMOUNT>600.0;

--12. Write an SQL query to calculate and update the number of orders placed by 
--each customer in the "Customers" table based on 
--the data in the "Orders" table.
ALTER TABLE CUSTOMERS ADD no_Of_Orders INT;

UPDATE Customers
SET no_Of_Orders = (
SELECT COUNT(*)
FROM Orders
WHERE Orders.Customer_ID = Customers.CUSTOMER_ID
);
--without adding the column
--SELECT Customers.CUSTOMER_ID,COUNT(*) AS NO_OF_ORDERS
--FROM Orders JOIN CUSTOMERS
--ON Orders.Customer_ID = Customers.CUSTOMER_ID
--GROUP BY Customers.CUSTOMER_ID


Select * from CUSTOMERS;

--# Aggregate Functions
--1.Write an SQL query to find out which customers have not placed any orders.
select Customers.*, Orders.* from Customers
  left JOIN Orders  on customers.CUSTOMER_ID=ORDERS.CUSTOMER_ID where orders.ORDER_ID is Null;


--2. Write an SQL query to find the total number of products available for sale. 
SELECT COUNT(*) AS TotProdForSale FROM Products;


--3. Write an SQL query to calculate the total revenue generated by TechShop. 
Select sum(total_amount)as revenue from Orders;
--4. Write an SQL query to calculate the average quantity ordered for products in a specific category. 
--Allow users to input the category name as a parameter.
DECLARE @GIVENCATEGORY VARCHAR(20) ='Non-electrical'
SELECT AVG(ORDER_DETAILS.QUANTITY) AS AVERAGE FROM ORDER_DETAILS JOIN PRODUCTS ON ORDER_DETAILS.PRODUCT_ID=PRODUCTS.PRODUCT_ID WHERE PRODUCTS.GADGET_TYPE=@GIVENCATEGORY;


---5. Write an SQL query to calculate the total revenue generated by a specific customer. Allow users 
--to input the customer ID as a parameter.
DECLARE @CUSTID INT=3
SELECT TOTAL_AMOUNT FROM ORDERS WHERE CUSTOMER_ID=@CUSTID;

--6. Write an SQL query to find the customers who have placed the most orders. List their names 
--and the number of orders they've placed.
SELECT TOP 1 FIRST_NAME,no_Of_Orders FROM CUSTOMERS ORDER BY no_Of_Orders DESC;

USE TECHSHOP1
--7. Write an SQL query to find the most popular product category, which is the one with the highest 
--total quantity ordered across all orders.
SELECT * FROM ORDER_DETAILS
SELECT TOP 1 GADGET_TYPE AS POPULAR_CATEGORY,SUM(ORDER_DETAILS.QUANTITY) AS TOTAL_QANITITY
FROM PRODUCTS JOIN ORDER_DETAILS 
ON PRODUCTS.PRODUCT_ID=ORDER_DETAILS.PRODUCT_ID 
GROUP BY PRODUCTS.GADGET_TYPE 
ORDER BY TOTAL_QANITITY DESC;

--8. Write an SQL query to find the customer who has spent the most money (highest total revenue) 
--on electronic gadgets. List their name and total spending

SELECT TOP 1
c.First_Name AS CustomerName,
SUM(od.Quantity * p.PROD_Price) AS TotalSpending
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
JOIN Order_Details od ON o.Order_ID = od.Order_ID
JOIN Products p ON od.Product_ID = p.Product_ID
WHERE
p.GADGET_TYPE = 'Electronic'
GROUP BY
c.Customer_ID, c.First_Name, c.Last_Name
ORDER BY
TotalSpending DESC;


--9. Write an SQL query to calculate the average order value (total revenue divided by the number of 
--orders) for all customers.
SELECT AVG(TOTAL_AMOUNT) AS AverageOrderValue
FROM Orders;


--10. Write an SQL query to find the total number of orders placed by each customer and list their 
--names along with the order count
SELECT C.CUSTOMER_ID,c.FIRST_NAME , c.LAST_NAME, COUNT(o.ORDER_ID) AS OrderCount
FROM Customers c
LEFT JOIN Orders o
ON c.CUSTOMER_ID = o.CUSTOMER_ID
GROUP BY c.CUSTOMER_ID, c.FIRST_NAME,c.LAST_NAME



--# Joins
--Joins:
--1. Write an SQL query to retrieve a list of all orders along with customer information (e.g., 
--customer name) for each order.
--cust_id,name,order id,prod name

--customers,orders,order details,prod id,name

SELECT C.CUSTOMER_ID,C.FIRST_NAME CUSTOMER_NAME,O.ORDER_ID,OD.PRODUCT_ID,P.PRODUCT_NAME
FROM CUSTOMERS C JOIN ORDERS O  ON C.CUSTOMER_ID=O.CUSTOMER_ID
JOIN ORDER_DETAILS OD           ON O.ORDER_ID=OD.ORDER_ID
JOIN PRODUCTS P                 ON OD.PRODUCT_ID =P.PRODUCT_ID;

--2. Write an SQL query to find the total revenue generated by each electronic gadget product. 
--Include the product name and the total revenue.
--prodname,total rev=cost*overall quantity of each 
--to know the  total number of each PRODUCT_ID ordered: SELECT PRODUCT_ID,SUM(QUANTITY) FROM ORDER_DETAILS GROUP BY PRODUCT_ID 
  
SELECT P.PRODUCT_NAME,SUM(P.PROD_PRICE*OD.QUANTITY) AS TOTAL_REVENUE
FROM PRODUCTS P JOIN ORDER_DETAILS OD     ON P.PRODUCT_ID=OD.PRODUCT_ID 
WHERE P.GADGET_TYPE='ELECTRONIC'
GROUP BY P.PRODUCT_NAME


--3. Write an SQL query to list all customers who have made at least one purchase. Include their 
--names and contact information.

-- CUSTNAME,EMAIL,PHONE NO,MIN ORDER=1
-- CUSTOMERS,  ORDERS,   

SELECT  C.CUSTOMER_ID,  C.FIRST_NAME ,C.PHONE , C.EMAIL  
FROM CUSTOMERS C JOIN ORDERS O
ON C.CUSTOMER_ID= O.CUSTOMER_ID



--4. Write an SQL query to find the most popular electronic gadget, which is the one with the highest 
--total quantity ordered. Include the product name and the total quantity ordered.

--      PROD NAME  TOT_QUANTITY     -> DESC QUANITY TOP 1
SELECT    TOP 1 P.PRODUCT_NAME AS POPULAR_GADGET , SUM ( QUANTITY) AS TOTAL_QUANTITY_ORDERED 
FROM PRODUCTS P JOIN ORDER_DETAILS OD 
ON P.PRODUCT_ID  = OD.pRODUCT_ID
WHERE  P.GADGET_TYPE ='ELECTRONIC'
GROUP BY PRODUCT_NAME
ORDER BY SUM ( QUANTITY) DESC 



--5  Write an SQL query to retrieve a list of electronic gadgets along with their corresponding categories.
--prod_name, gadget type

select PRODUCT_NAME ,GADGET_TYPE FROM PRODUCTS
where GADGET_TYPE = 'Electronic'


--7. Write an SQL query to find the order with the highest total revenue. Include the order ID, 
--customer information, and the total revenue.
--grp by orderid


SELECT TOP 1 O.ORDER_ID ,O.CUSTOMER_ID, SUM(P.PROD_PRICE* OD.QUANTITY) AS HIGHEST_TOTAL_REVENEU
FROM ORDERS O JOIN ORDER_DETAILS OD ON O.ORDER_ID=OD.ORDER_ID
JOIN PRODUCTS P                    ON  OD.PRODUCT_ID=P.PRODUCT_ID
GROUP BY O.ORDER_ID,O.CUSTOMER_ID ORDER BY SUM(P.PROD_PRICE* OD.QUANTITY)  DESC ;



--8. Write an SQL query to list electronic gadgets and the number of times each product has been 
--ordered.

--considerinf onlt the times it has been ordered,not quanitty
SELECT P.PRODUCT_ID, P.PRODUCT_NAME ,COUNT(*) as TIMES_ITS_ORDERED
FROM PRODUCTS P JOIN ORDER_DETAILS OD  ON P.PRODUCT_ID=OD.PRODUCT_ID
WHERE GADGET_TYPE='ELECTRONIC'
GROUP BY P.PRODUCT_ID, P.PRODUCT_NAME 

----CONSIDERING THE QUANITYT TOO
--SELECT P.PRODUCT_ID, P.PRODUCT_NAME ,SUM(OD.QUANTITY) as TIMES_ITS_ORDERED
--FROM PRODUCTS P JOIN ORDER_DETAILS OD  ON P.PRODUCT_ID=OD.PRODUCT_ID
--WHERE GADGET_TYPE='ELECTRONIC'
--GROUP BY P.PRODUCT_ID, P.PRODUCT_NAME 

--9 Write an SQL query to find customers who have purchased a specific electronic gadget product. 
--Allow users to input the product name as a parameter.

--PRD-ID->ORDRDETAIL->ORDR_ID->CUST-ID
DECLARE @GADGET VARCHAR(20)= 'TV'
SELECT P.PRODUCT_ID ,C.CUSTOMER_ID,C.FIRST_NAME,C.LAST_NAME
FROM PRODUCTS P JOIN ORDER_DETAILS OD ON P.PRODUCT_ID=OD.PRODUCT_ID
JOIN ORDERS O ON O.ORDER_ID=OD.ORDER_ID
JOIN CUSTOMERS C ON C.CUSTOMER_ID=O.CUSTOMER_ID
WHERE PRODUCT_NAME=@GADGET AND GADGET_TYPE='ELECTRONIC'


--10. Write an SQL query to calculate the total revenue generated by all orders placed within a 
--specific time period. Allow users to input the start and end dates as parameters.

--SELECT * FROM ORDERS WHERE ORDER_DATE BETWEEN @START AND @END
--DATE->ORDERID->QUANTITY->PRODID->PRODPRICE
DECLARE @START DATE='2023-11-01'
DECLARE @END  DATE='2023-11-07'

SELECT  SUM(OD.QUANTITY*P.PROD_PRICE) AS TOTAL_REVENUE
FROM ORDERS O JOIN ORDER_DETAILS OD ON O.ORDER_ID=OD.ORDER_ID
JOIN PRODUCTS P                      ON P.PRODUCT_ID=OD.PRODUCT_ID
WHERE O.ORDER_DATE BETWEEN @START AND @END


--6. Write an SQL query to calculate the average order value for each customer. Include their 
--names and contact information.
--CUSTNAME ,EMAIL,PHONE, AVG



SELECT C.CUSTOMER_ID ,C.FIRST_NAME,C.EMAIL,C.PHONE ,avg(O.TOTAL_AMOUNT) AS AVG_ORDER_FOR_eACH_CUST
FROM 
CUSTOMERS C  JOIN ORDERS O ON C.CUSTOMER_ID =O.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID,C.FIRST_NAME,C.EMAIL,C.PHONE



