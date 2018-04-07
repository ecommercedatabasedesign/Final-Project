CREATE TABLE "Store" (
  "StoreID" INTEGER PRIMARY KEY NOT NULL,
  "Store Name" VARCHAR(20) UNIQUE NOT NULL,
  "Contact" VARCHAR(30) NOT NULL
);

CREATE TABLE `Buyer` (
	`Name`	VARCHAR (20),
	`BuyerID`	INTEGER NOT NULL,
	`UserName`	VARCHAR(20) NOT NULL,
	`Password`  VARCHAR (20) NOT NULL,
	PRIMARY KEY(`BuyerID`)
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

CREATE TABLE "OrderINFO"(
  'OrderID' INTEGER PRIMARY KEY,
	'BuyerID' INTEGER NOT NULL,
	'Price' NUMBER NOT NULL,
	'Order_time' TEXT NOT NULL,
	'Status' TEXT NOT NULL,
	FOREIGN KEY(BuyerID) REFERENCES Buyer (BuyerID)
);

CREATE TABLE "Shipment"(
  'TrankingNo' INTEGER PRIMARY KEY,
	'OrderID' INTEGER NOT NULL,
	'Address_ID' INTEGER NOT NULL,
	'Vendor' VARCHAR (20) NOT NULL,
	'Status' TEXT NOT NULL,
	'Create_time' TEXT NOT NULL,
	FOREIGN KEY(OrderID) REFERENCES OrderINFO (OrderID),
	FOREIGN KEY(Address_ID) REFERENCES Address (Address_ID)
);

CREATE TABLE "TransactionINFO"(
  "TransID" INTEGER PRIMARY KEY NOT NULL,
  "ProductID" CHAR(10) NOT NULL,
  "StoreID" INTEGER NOT NULL,
  "OrderID" INTEGER NOT NULL,
  "Price" NUMBER NOT NULL,
  "Time" TIME NOT NULL,
  "Purchase_amount" NUMBER NOT NULL,
  FOREIGN KEY(ProductID, StoreID) REFERENCES Product,
  FOREIGN KEY(OrderID) REFERENCES OrderINFO (OrderID)
);

CREATE TABLE `Address` (
	`Address_ID`	INTEGER NOT NULL UNIQUE,
	`Address`	 VARCHAR(255),
	`ZipCode`	VARCHAR(20),
	`City`	VARCHAR(20),
	`State`	 VARCHAR(20),
	`BuyerID`	INTEGER NOT NULL,
	 FOREIGN KEY(BuyerID) REFERENCES Buyer(BuyerID),
	 PRIMARY KEY(`Address_ID`,`BuyerID`)
);

CREATE TABLE `Payment_Method` (
`PayID` INTEGER NOT NULL,
 `Card_number` INTEGER NOT NULL,
 `Hold_name` TEXT NOT NULL,
 `BuyerID` INTEGER NOT NULL ,
 PRIMARY KEY (`PayID`,`BuyerID`)
);

CREATE TABLE `PAYMENT` (
 `PaymentID` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
 `OrderID` INTEGER NOT NULL,
 `PayID` INTEGER NOT NULL,
 `Amount` INTEGER NOT NULL,
 `Status` TEXT NOT NULL,
 `Payment_time` TEXT NOT NULL,
 `BuyerID` INTEGER NOT NULL,
 FOREIGN KEY(BuyerID) REFERENCES Buyer(BuyerID),
 FOREIGN KEY(OrderID) REFERENCES OrderINFO(OrderID)
);


INSERT INTO Store(StoreID, 'Store Name', Contact)
VALUES(1,"Indigo",1234567890),
(2,"sports",1234567892),
(3,"nba",1234567893),
(4,"sun glasses",1234567894),
(5,"Choclate factory",1234567895),
(6,"water factory",1234567896),
(7,"drink factory",1234567897),
(8,"garden",1234567898),
(9,"Computers",1234567899),
(10,"DIY computers",1234567800);

INSERT INTO Product(ID, StoreID, Price, Description, Inventory, Name)
VALUES(1,1,10, 'a book',	10, 'story book'),
(2,	2,	20,	'shoes',	20, 'Nike'),
(3,	3,	50,	'basketball',	100, 'Spalding'),
(4,	4,	100,	"glasses",	160, 'Ray-Ban'),
(5,	5,	300,	"food",	300, 'Godiva'),
(6,	6,	30,	"water",	60, 'smartwater'),
(7,	7,	60,	"drink",	3, 'Coke'),
(8,	8,	80,	"flowers",	60, 'rose'),
(9,	9,	880,	"laptop",	90, 'acer'),
(10,	10, 160,	"CPU",	10, 'intel');





INSERT INTO Buyer (Name, BuyerID, UserName, Password)
VALUES("Mary Shelley", 1, "MaryShelley0527", "mslove253812"),
			("Karry Wu", 2, "s11218wu", "wukairui0701"),
			("Ziqian Huang", 3, "huangziqian1888", "hzq1628888"),
			("Minyi Ma", 4, "Minyi2899", "Mym5201314"),
			("Robert S", 5, "robbbbby188", "8765423rll");

INSERT INTO OrderINFO (OrderID, BuyerID, Price, Order_time, Status)
VALUES(1, 1, 10.00, "18/3/15 18:35", "completed"),
			(2, 2, 20.00, "18/3/16 18:35", "pending"),
			(3, 3, 50.00, "18/3/17 18:35", "completed"),
			(4, 3, 900.00, "18/3/18 18:35", "completed"),
			(5, 5, 2700.00, "18/3/19 18:35", "completed"),
			(6, 1, 120.00, "18/3/20 18:35", "completed"),
			(7, 3, 1500.00, "18/3/21 18:35", "completed"),
			(8, 4, 2880.00, "18/3/22 18:35", "pending"),
			(9, 2, 880.00, "18/3/23 18:35", "completed"),
			(10, 1, 160.00, "18/3/24 18:35", "pending");

INSERT INTO TransactionINFO (TransID, ProductID, StoreID, OrderID, Price, Time, Purchase_amount)
VALUES(20,1,1,1,10,'3/16/2018 18:35',1),
      (21,2,2,2,20,'3/17/2018 18:35',1),
      (22,3,3,3,50,'3/18/2018 18:35',1),
      (23,4,4,4,300,'3/19/2018 18:35',3),
      (24,5,5,5,900,'3/20/2018 18:35',3),
      (25,6,6,6,60,'3/21/2018 18:35',2),
      (26,7,7,7,300,'3/22/2018 18:35',5),
      (27,8,8,8,480,'3/23/2018 18:35',6),
      (28,9,9,9,880,'3/24/2018 18:35',1),
      (29,10,10,10,160,'3/25/2018 18:35',1);

INSERT INTO Address( Address_ID, Address, ZipCode, City, State, BuyerID)
VALUES(1, "736 Bay Street, Unit 1903", "M5G 2M4", "Toronto", "Ontario", 2),
			(2, "5566 Center Street, APT 3", "Q2D J1R", "Mississauga", "Ontario", 5),
			(3, "5 Horbart Street, APT 11", "P2D G8Q", "Winnipeg", "Manitoba", 5),
			(4, "234 Wellington Street, APT 1", "G8G 2H1", "Ottawa", "Ontario",1),
			(5, "Carlton Street, APT 1", "M5G Q1G", "Montreal", "Québec", 4);

INSERT INTO Shipment (TrankingNo, OrderID, Address_ID, Vendor, Status, Create_time)
VALUES(1, 1, 4, "UPS", "pending", "18/3/16 19:35"),
      (3, 4, 5, "CanadaPost", "pending", "18/3/19 19:35"),
      (4, 5, 3, "Fedex", "pending", "18/3/20 19:35");

insert into PAYMENT (PaymentID, OrderID, PayID, Amount, Status, Payment_time, BuyerID)
VALUES (1, 1, 1, 10.00, "completed", "18/3/16 18:35", 1),
			 (2, 2, 2, 20.00, "pending", "18/3/17 18:35", 2),
			 (3, 3, 3, 50.00, "completed", "18/3/18 18:35", 3),
		   (4, 4, 3, 900.00, "completed", "18/3/19 18:35", 3),
		   (5, 5, 5, 2700.00, "completed", "18/3/20 18:35", 5),
			 (6, 6, 6, 120.00, "completed", "18/3/21 18:35", 1),
			 (7, 7, 3, 1500.00, "completed", "18/3/22 18:35", 3),
			 (8, 8, 8, 2880.00, "pending", "18/3/23 18:35", 4),
			 (9, 9, 9, 880.00, "completed", "18/3/24 18:35", 2),
		   (10, 10, 1, 160.00, "pending", "18/3/25 18:35", 1);

INSERT INTO Payment_Method (PayID, BuyerID, Card_number, Hold_name)
values (1, 1, 472409009120, "Ziqian Huang"),
       (2, 2, 472409009121, "Minyi Ma"),
       (3, 3, 472409009122, "Karry Wu"),
       (4, 4, 472409009123, "Robber S"),
       (5, 5, 472409009124, "MaryShelley"),
       (6, 1, 472409009125, "Ziqian Huang"),
       (7, 2, 472409009126, "Minyi Ma"),
       (8, 4, 472409009127, "Robber S"),
       (9, 2, 472409009128, "Minyi Ma"),
       (10, 2, 472409009129, "Minyi Ma");
