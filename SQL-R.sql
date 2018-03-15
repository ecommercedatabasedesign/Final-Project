CREATE TABLE "Store" (
  "StoreID" INTEGER PRIMARY KEY NOT NULL,
  "Store Name" CHAR(20) UNIQUE NOT NULL,
  "Contact" CHAR(30) NOT NULL
);

CREATE TABLE "Product"(
  "ProductID" CHAR(10) NOT NULL,
  "StoreID" INTEGER,
   "OrderID"
)
