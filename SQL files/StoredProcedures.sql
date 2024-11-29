/*CREATE PROCEDURE AddNewProduct
    @p_Name VARCHAR(100),
    @p_Description TEXT,
    @p_Price DECIMAL(10, 2),
    @p_CategoryID INT,
    @p_StockLevel INT
AS
BEGIN
    INSERT INTO Products (Name, Description, Price, CategoryID, StockLevel)
    VALUES (@p_Name, @p_Description, @p_Price, @p_CategoryID, @p_StockLevel);
END;


CREATE PROCEDURE PlaceOrder
    @p_CustomerID INT,
    @p_ProductID INT,
    @p_Quantity INT
AS
BEGIN
    DECLARE @product_price DECIMAL(10, 2);
    DECLARE @total_price DECIMAL(10, 2);
    DECLARE @orderID INT;

    -- Fetch product price
    SELECT @product_price = Price FROM Products WHERE ProductID = @p_ProductID;

    -- Calculate total price
    SET @total_price = @product_price * @p_Quantity;

    -- Create order
    INSERT INTO Orders (CustomerID, TotalAmount) 
    VALUES (@p_CustomerID, @total_price);

    -- Get the last inserted OrderID
    SET @orderID = SCOPE_IDENTITY();

    -- Insert into OrderDetails
    INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
    VALUES (@orderID, @p_ProductID, @p_Quantity, @product_price);

    -- Update stock level
    UPDATE Products
    SET StockLevel = StockLevel - @p_Quantity
    WHERE ProductID = @p_ProductID;
END;

CREATE PROCEDURE RestockInventory
    @p_ProductID INT,
    @p_SupplierID INT,
    @p_Quantity INT
AS
BEGIN
    -- Insert into Inventory
    INSERT INTO Inventory (ProductID, SupplierID, QuantityReceived, LastRestockDate)
    VALUES (@p_ProductID, @p_SupplierID, @p_Quantity, GETDATE());

    -- Update stock level
    UPDATE Products
    SET StockLevel = StockLevel + @p_Quantity
    WHERE ProductID = @p_ProductID;
END;

CREATE PROCEDURE GetCustomerOrderHistory
    @p_CustomerID INT
AS
BEGIN
    SELECT 
        O.OrderID,
        O.OrderDate,
        OD.ProductID,
        P.Name AS ProductName,
        OD.Quantity,
        OD.Price,
        O.TotalAmount
    FROM Orders O
    INNER JOIN OrderDetails OD ON O.OrderID = OD.OrderID
    INNER JOIN Products P ON OD.ProductID = P.ProductID
    WHERE O.CustomerID = @p_CustomerID;
END;*/

CREATE PROCEDURE GenerateSalesReport
AS
BEGIN
    SELECT 
        C.CategoryName,
        P.Name AS ProductName,
        SUM(OD.Quantity) AS TotalQuantitySold,
        SUM(OD.Quantity * OD.Price) AS TotalSales
    FROM OrderDetails OD
    INNER JOIN Products P ON OD.ProductID = P.ProductID
    INNER JOIN Categories C ON P.CategoryID = C.CategoryID
    GROUP BY C.CategoryName, P.Name
    ORDER BY TotalSales DESC;
END;



