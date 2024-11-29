--Adding Data to everything
INSERT INTO Categories (CategoryName)
VALUES 
('Keys'),
('Machines'),
('Tools'),
('Safes'),
('Padlocks');
---------------------------------------------------------------------------------------------------------------------------

INSERT INTO Products (Name, Description, Price, CategoryID, StockLevel, ReorderLevel)
VALUES 
('House Key', 'Standard house key', 2.50, 1, 100, 20),
('Car Key', 'Standard car key', 10.00, 1, 50, 10),
('Key Cutting Machine', 'High-quality key cutting machine', 2500.00, 2, 5, 1),
('Lock Picking Set', 'Professional lock picking tool set', 75.00, 3, 20, 5),
('Fireproof Safe', 'Small fireproof safe', 150.00, 4, 10, 2),
('Combination Padlock', 'Secure padlock with combination', 12.00, 5, 25, 5);
---------------------------------------------------------------------------------------------------------------------------

INSERT INTO Customers (Name, Email, PhoneNumber, Address)
VALUES 
('John Doe', 'johndoe@example.com', '1234567890', '123 Elm Street'),
('Jane Smith', 'janesmith@example.com', '0987654321', '456 Oak Avenue'),
('Alice Johnson', 'alicej@example.com', '1112223333', '789 Pine Road');
---------------------------------------------------------------------------------------------------------------------------
INSERT INTO Suppliers (Name, ContactInfo)
VALUES 
('Key Supplies Inc.', 'keysupplies@example.com'),
('Locksmith Tools Co.', 'tools@example.com'),
('Secure Solutions Ltd.', 'secure@example.com');
---------------------------------------------------------------------------------------------------------------------------

INSERT INTO Inventory (ProductID, SupplierID, QuantityReceived, LastRestockDate)
VALUES 
(1, 1, 100, GETDATE()),
(2, 1, 50, GETDATE()),
(3, 2, 5, GETDATE()),
(4, 2, 20, GETDATE()),
(5, 3, 10, GETDATE()),
(6, 3, 25, GETDATE());

---------------------------------------------------------------------------------------------------------------------------
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES 
(1, GETDATE(), 50.00),
(2, GETDATE(), 100.00),
(3, GETDATE(), 250.00);
---------------------------------------------------------------------------------------------------------------------------
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
VALUES 
(1, 1, 10, 2.50),
(1, 6, 2, 12.00),
(2, 3, 1, 2500.00),
(3, 4, 2, 75.00),
(3, 5, 1, 150.00);










