--AFTER INSERT on Orders
/*CREATE TRIGGER AfterOrderInsert
ON Orders
AFTER INSERT
AS
BEGIN
    PRINT 'Order created successfully.';
END;*/

--AFTER UPDATE on Products
CREATE TRIGGER AfterProductUpdate
ON Products
AFTER UPDATE
AS
BEGIN
    INSERT INTO ProductHistory (ProductID, ChangeDate, OldStockLevel, NewStockLevel)
    SELECT 
        I.ProductID,
        GETDATE(),
        D.StockLevel,
        I.StockLevel
    FROM Inserted I
    INNER JOIN Deleted D ON I.ProductID = D.ProductID;
END;
