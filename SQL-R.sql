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

/*Queries */
