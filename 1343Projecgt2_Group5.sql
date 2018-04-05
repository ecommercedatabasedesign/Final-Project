CREATE TABLE "Store" (
  "StoreID" INTEGER PRIMARY KEY NOT NULL,
  "Store Name" VARCHAR(20) UNIQUE NOT NULL,
  "Contact" VARCHAR(30) NOT NULL
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
  'OrderID' INTEGER PRIMARY KEY,
	'BuyerID' INTEGER NOT NULL,
	'Price' NUMBER NOT NULL,
	'Order_time' TEXT NOT NULL,
	'Status' TEXT NOT NULL,
	FOREIGN KEY(BuyerID) REFERENCES 'Buyer'('BuyerID')
);

CREATE TABLE "Shipment"(
  'TrankingNo' INTEGER PRIMARY KEY,
	'OrderID' INTEGER NOT NULL,
	'Address_ID' INTEGER NOT NULL,
	'Vendor' VARCHAR (20) NOT NULL,
	'Status' TEXT NOT NULL,
	'Create_time' TEXT NOT NULL,
	FOREIGN KEY(OrderID) REFERENCES 'Order'('OrderID'),
	FOREIGN KEY(Address_ID) REFERENCES 'Address'('Address_ID')
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

CREATE TABLE `Buyer` (
	`Name`	VARCHAR (20),
	`BuyerID`	INTEGER NOT NULL,
	`UserName`	VARCHAR(20) NOT NULL,
	`Password`  VARCHAR (20) NOT NULL,
	PRIMARY KEY(`BuyerID`)
);

CREATE TABLE `Address` (
	`Address_ID`	INTEGER NOT NULL UNIQUE,
	`Address`	 VARCHAR(255),
	`ZipCode`	VARCHAR(20),
	`City`	VARCHAR(20),
	`State`	 VARCHAR(20),
	`BuyerID`	INTEGER NOT NULL,
	 FOREIGN KEY(`BuyerID`) REFERENCES `Buyer`(`BuyerID`),
	 PRIMARY KEY(`Address_ID`,`BuyerID`)
);

CREATE TABLE `PAYMENT` (
 `PaymentID` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
 `OrderID` INTEGER NOT NULL,
 `PayID` INTEGER NOT NULL,
 `Amount` INTEGER NOT NULL,
 `Status` TEXT NOT NULL,
 `Payment_time` TEXT NOT NULL,
 `PayerID` INTEGER NOT NULL
);

CREATE TABLE `Payment_Method` (
`PayID` INTEGER NOT NULL,
 `Card_number` INTEGER NOT NULL,
 `Hold_name` TEXT NOT NULL,
 `BuyerID` INTEGER NOT NULL ,
 PRIMARY KEY (`PayID`,`BuyerID`)
);

INSERT INTO Order (OrderID, BuyerID, Price, Order_time, Status)
VALUES(1, 1, 10.00, "18/3/15 18:35", "completed"),
			(2, 2, 20.00, "18/3/16 18:35", "pending"),
			(3, 3, 50.00, "18/3/17 18:35", "completed"),
			(4, 4, 900.00, "18/3/18 18:35", "completed"),
			(5, 5, 2700.00, "18/3/19 18:35", "completed"),
			(6, 6, 120.00, "18/3/20 18:35", "completed"),
			(7, 7, 1500.00, "18/3/21 18:35", "completed"),
			(8, 8, 2880.00, "18/3/22 18:35", "pending"),
			(9, 9, 880.00, "18/3/23 18:35", "completed"),
			(10, 10, 160.00, "18/3/24 18:35", "pending");

INSERT INTO Shipment (TrankingNo, OrderID, Address_ID, Vendor, Status, Create_time)
VALUES(1, 1, 4, "UPS", "pending", "18/3/16 19:35"),
			(3, 4, 5, "CanadaPost", "pending", "18/3/19 19:35"),
			(4, 5, 3, "Fedex", "pending", "18/3/20 19:35"),

INSERT INTO Buyer (Name, BuyerID, UserName, Password)
VALUES("Mary Shelley", 1, "MaryShelley0527", "mslove253812"),
			("Karry Wu", 2, "s11218wu", "wukairui0701"),
			("Ziqian Huang", 3, "huangziqian1888", "hzq1628888"),
			("Minyi Ma", 4, "Minyi2899", "Mym5201314"),
			("Robby Liu", 5, "robbbbby188", "8765423rll");

INSERT INTO Address( Address_ID, Address, ZipCode, City, State, BuyerID)
VALUES(1, "736 Bay Street, Unit 1903", "M5G 2M4", "Toronto", "Ontario", 2),
			(2, "5566 Center Street, APT 3", "Q2D J1R", "Mississauga", "Ontario", 5),
			(3, "5 Horbart Street, APT 11", "P2D G8Q", "Winnipeg", "Manitoba", 5),
			(4, "234 Wellington Street, APT 1", "G8G 2H1", "Ottawa", "Ontario",1),
			(5, "Carlton Street, APT 1", "M5G Q1G", "Montreal", "Québec", 4);

insert into PAYMENT (PaymentID, OrderID, PayID, Amount, Status, Payment_time, PayerID)
values (1, 1, 1, 10.00, "completed", "18/3/16 18:35", 1),
			 (2, 2, 2, 20.00, "pending", "18/3/17 18:35", 2),
			 (3, 3, 3, 50.00, "completed", "18/3/18 18:35", 3),
		   (4, 4, 4, 900.00, "completed", "18/3/19 18:35", 4),
		   (5, 5, 5, 2700.00, "completed", "18/3/20 18:35", 5),
			 (6, 6, 6, 120.00, "completed", "18/3/21 18:35", 6),
			 (7, 7, 7, 1500.00, "completed", "18/3/22 18:35", 7),
			 (8, 8, 8, 2880.00, "pending", "18/3/23 18:35", 8),
			 (9, 9, 9, 880.00, "completed", "18/3/24 18:35", 9),
		   (10, 10, 10, 160.00, "pending", "18/3/25 18:35", 10);

INSERT INTO Payment_Method (PayID, BuyerID, Card_number, Hold_name)
values (1, 1, 472409009120, "Ziqian"),
			 (2, 2, 472409009121, "Mingyi"),
			 (3, 3, 472409009122, "Kairui"),
			 (4, 4, 472409009123, "Robbie"),
			 (5, 5, 472409009124, "Zhuoran"),
			 (6, 6, 472409009125, "Lulu"),
			 (7, 7, 472409009126, "Sam"),
			 (8, 8, 472409009127, "Mike"),
			 (9, 9, 472409009128, "Allen"),
			 (10, 10, 472409009129, "Amber");
