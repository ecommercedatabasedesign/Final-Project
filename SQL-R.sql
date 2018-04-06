/*Create tables*/
CREATE TABLE "Store" (
  "StoreID" INTEGER PRIMARY KEY NOT NULL,
  "Store Name" CHAR(20) UNIQUE NOT NULL,
  "Contact" CHAR(30) NOT NULL
);

CREATE TABLE "Product"(
  "ID" CHAR(10) NOT NULL,
  "StoreID" INTEGER NOT NULL,
   "Price" NUMBER NOT NULL,
   "Description" TEXT,
   "Inventory" NUMBER,
   "Name" CHAR(30),
   FOREIGN KEY(StoreID) REFERENCES Store(StoreID),
   CONSTRAINT ProductID PRIMARY KEY(ID, StoreID)
);

CREATE TABLE "Order"(
  "OrderID" INTEGER PRIMARY KEY
);
CREATE TABLE "Transaction"(
  "TransID" INTEGER PRIMARY KEY NOT NULL,
  "ProductID" CHAR(10) NOT NULL,
  "StoreID" INTEGER NOT NULL,
  "OrderID" INTEGER NOT NULL,
  "Price" NUMBER NOT NULL,
  "Time" TIME NOT NULL,
  "Purchase_amount" NUMBER NOT NULL,
  FOREIGN KEY(ProductID, StoreID) REFERENCES Product,
  FOREIGN KEY(OrderID) REFERENCES 'Order'(OrderID)
);

/*Queries 2*/
SELECT* FROM 'Product'
WHERE 'Name' = 'Q'

/*Queries 8*/
INSERT INTO 'Product' VALUES('15', '8', '8', 'Test15', '10', 'Pen');

/*Queries
For Buyer that has used all the payment method under the buyer's name
 */

 SELECT B.BuyerID, B.Username
 FROM Buyer B
 WHERE NOT EXISTS (SELECT PayID FROM Payment_Method PM WHERE PM.BuyerID = B.BuyerID EXCEPT
   SELECT P.PayID FROM Payment P
     WHERE P.PayerID = B.BuyerID)

/*Queries
For Buyer that has not used all the payment method under the buyer's name(Noncorrelated)
*/
SELECT B.BuyerID, B.Username
FROM Buyer B
WHERE EXISTS (SELECT PayID FROM Payment_Method PM WHERE PM.BuyerID = B.BuyerID EXCEPT
  SELECT P.PayID FROM Payment P)

/*Queries
Select payment method has not been used (Noncorrelated)
*/
SELECT PayID FROM Payment_Method PM EXCEPT
  SELECT P.PayID FROM Payment P


/*Queries
Select product that has been ordered by customer 1
*/
SELECT ProductID, StoreID FROM 'Transaction' WHERE OrderID IN (SELECT OrderID FROM 'ORDER' WHERE BuyerID =  1)

/*Queries
Select Transactions that has been shipped
*/
SELECT TransID FROM 'Transaction' T WHERE OrderID IN (Select OrderID FROM 'Order' WHERE BuyerID = 1 INTERSECT SELECT OrderID FROM Shipment S WHERE S.OrderID = T.OrderID)  
