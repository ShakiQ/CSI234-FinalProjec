CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL CHECK (Price > 0),
    CategoryID INT NOT NULL,
    StockLevel INT DEFAULT 0 CHECK (StockLevel >= 0),
    ReorderLevel INT DEFAULT 10 CHECK (ReorderLevel >= 0),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PhoneNumber CHAR(10) NOT NULL CHECK (LEN(PhoneNumber) = 10),
    Address TEXT
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10, 2) DEFAULT 0 CHECK (TotalAmount >= 0),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE OrderDetails (
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Price DECIMAL(10, 2) NOT NULL CHECK (Price > 0),
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL UNIQUE,
    ContactInfo TEXT
);

CREATE TABLE Inventory (
    ProductID INT NOT NULL,
    SupplierID INT NOT NULL,
    QuantityReceived INT DEFAULT 0 CHECK (QuantityReceived >= 0),
    LastRestockDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (ProductID, SupplierID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
        ON DELETE CASCADE ON UPDATE CASCADE
);




