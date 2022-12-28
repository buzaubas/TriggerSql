--CREATE TABLE Products
--(
--    Id INT IDENTITY PRIMARY KEY,
--    ProductName NVARCHAR(30) NOT NULL,
--    Manufacturer NVARCHAR(20) NOT NULL,
--    ProductCount INT DEFAULT 0,
--    Price MONEY NOT NULL
--);

--CREATE TRIGGER Products_INSERT_UPDATE
--ON Products
--AFTER INSERT, UPDATE
--AS
--UPDATE Products
--SET Price = Price + Price * 0.38
--WHERE Id = (SELECT Id FROM inserted)

--INSERT INTO Products (ProductName, Manufacturer, ProductCount, Price)
--VALUES('S22', 'Samsung', 5, 22000)

--DISABLE TRIGGER Products_INSERT_UPDATE ON Products;

--INSERT INTO Products (ProductName, Manufacturer, ProductCount, Price)
--VALUES('Redmi 10', 'Xiaomi', 5, 22000)

--ENABLE TRIGGER Products_INSERT_UPDATE ON Products;

--ALTER TRIGGER Products_INSERT_UPDATE               --ALTER TRIGGER
--ON Products
--AFTER INSERT, UPDATE
--AS
--UPDATE Products
--SET Price = Price + Price * 0.5
--WHERE Id = (SELECT Id FROM inserted)

--DROP TRIGGER Products_INSERT_UPDATE ON Products;   --Удаляет триггер

--CREATE TABLE History 
--(
--    Id INT IDENTITY PRIMARY KEY,
--    ProductId INT NOT NULL,
--    Operation NVARCHAR(200) NOT NULL,
--    CreateAt DATETIME NOT NULL DEFAULT GETDATE(),
--);

--Триггер который при добавлений в Products будет вести журнал в History

--CREATE TRIGGER Products_History
--ON Products
--AFTER INSERT
--AS
--INSERT 
--INTO History (ProductId, Operation)
--VALUES((SELECT Id FROM inserted), 'Product inserted')

--INSERT INTO Products (ProductName, Manufacturer, ProductCount, Price)
--VALUES('P50', 'Huawei', 6, 40000)

--ALTER TRIGGER Products_History
--ON Products
--AFTER INSERT
--AS
--INSERT 
--INTO History (ProductId, Operation)
--SELECT Id, 'Product' + ProductName + 'inserted' 
--FROM inserted

--INSERT INTO Products (ProductName, Manufacturer, ProductCount, Price)
--VALUES('Edge 30 Ultra', 'Motorolla', 1, 50000)

--CREATE TRIGGER Products_History_DELETED
--ON Products
--AFTER DELETE
--AS
--INSERT 
--INTO History (ProductId, Operation)
--SELECT Id, 'Product ' + ProductName + ' deleted' 
--FROM deleted

--DELETE FROM Products WHERE Id=6

--CREATE TRIGGER Products_History_UPDATE
--ON Products
--AFTER UPDATE
--AS
--INSERT 
--INTO History (ProductId, Operation)
--SELECT Id, 'Product ' + ProductName + ' updated' 
--FROM inserted											-- для insert и update используется таблица inserted

--UPDATE Products SET Price = 30000 WHERE Id = 4

--ALTER TABLE Products
--ADD IsDeleted BIT NULL;
	

--CREATE TRIGGER Products_Instead_Delete
--ON Products
--INSTEAD OF DELETE
--AS
--UPDATE Products
--SET IsDeleted = 1
--WHERE Id = (SELECT Id FROM deleted)

--delete from Products where ProductName = 'P50';

--create view CategoryProducts as  -- представления/витрина		разграничивание прав
--select c.CategoryName,
--		count(1) as ProductCount 
--from Categories c 
--join Products p on c.CategoryID = p.CategoryId 
--group by p.CategoryId, c.CategoryName

--select * from CategoryProducts


--DECLARE @... - переменная которая хранится в опеативке можем обращаться только в одном окне

--CREATE TABLE #...  - временная таблица существующая только в одном окне, используется также как и пременная 

--CREATE TABLE ##...  - глобальная таблица существующая во всех окнах, сущесвтует в опреативке, во время соединения или во время выполнения скрипта 

