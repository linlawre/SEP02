1.
SELECT COUNT(*)
FROM Production.Product

504

2.
SELECT COUNT(*)
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL

295

3.
SELECT ProductSubcategoryID, COUNT(ProductSubcategoryID) [CountedProducts]
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL
GROUP BY ProductSubcategoryID

4.
SELECT COUNT(1)
FROM Production.Product
WHERE ProductSubcategoryID IS NULL

209

5.
SELECT SUM(Quantity)
FROM Production.ProductInventory

6.
SELECT ProductID, SUM(Quantity) [TheSum]
FROM Production.ProductInventory
WHERE LocationID = 40 AND Quantity < 100
GROUP BY ProductID

7.
SELECT Shelf, ProductID, SUM(Quantity) [TheSum]
FROM Production.ProductInventory
WHERE LocationID = 40 AND Quantity < 100
GROUP BY ProductID, Shelf

8.
SELECT ProductID, AVG(Quantity) [TheSum]
FROM Production.ProductInventory
WHERE LocationID = 10
GROUP BY ProductID

9.
SELECT ProductID, Shelf, AVG(Quantity) [TheAvg]
FROM Production.ProductInventory
GROUP BY ProductID, Shelf

10.
SELECT ProductID, Shelf, AVG(Quantity) [TheAvg]
FROM Production.ProductInventory
WHERE Shelf <> 'N/A'
GROUP BY ProductID, Shelf

11.
SELECT Color, Class, COUNT(1) [TheCount], AVG(ListPrice) [AvgPrice]
FROM Production.Product
WHERE Color IS NOT NULL AND Class IS NOT NULL
GROUP BY Color, Class

12.
SELECT c.Name, s.Name
FROM Person.StateProvince s
JOIN person.CountryRegion c ON s.CountryRegionCode = c.CountryRegionCode
ORDER BY c.Name

13.
SELECT c.Name, s.Name
FROM Person.StateProvince s
JOIN person.CountryRegion c ON s.CountryRegionCode = c.CountryRegionCode
WHERE c.Name = 'Germany' OR c.Name = 'Canada'
ORDER BY c.Name

14.
SELECT *
FROM dbo.Orders
WHERE OrderDate < '1997-12-30'

15.
SELECT Top 5 o.shipPostalCode, Sum(od.Quantity) [Sum ]
FROM Orders o Join [Order Details] od On o.orderId = od.OrderId
WHERE o.ShipPostalCode IS NOT NULL
GROUP BY o.ShipPostalCode
ORDER BY 2 DESC


16.
SELECT Top 5 o.shipPostalCode, Sum(od.Quantity) [Sum ]
FROM Orders o Join [Order Details] od On o.orderId = od.OrderId
WHERE o.ShipPostalCode IS NOT NULL AND DATEDIFF(year, o.OrderDate, GETDATE())< 25
GROUP BY o.ShipPostalCode
ORDER BY 2 DESC

17.
SELECT City, COUNT(1) [Number of Customer]
FROM Customers
GROUP BY City

18.
SELECT City, COUNT(City) [Number of Customer]
FROM Customers
GROUP BY City
HAVING COUNT(City) > 2

19.
SELECT DISTINCT c.ContactName
FROM dbo.Orders o
Join Customers c ON o.CustomerID = c.CustomerID
WHERE OrderDate > '1998-01-01'

20.
SELECT c.ContactName, o.OrderDate
FROM dbo.Orders o
Join Customers c ON o.CustomerID = c.CustomerID
ORDER BY OrderDate DESC

21.
With
ddd(OIDm, Num)
AS(
SELECT OrderID, SUM(Quantity)
FROM [Order Details]
GROUP BY OrderID),
otc(cc, OIDm)
AS(
SELECT c.ContactName, o.OrderID
FROM dbo.Orders o
Join Customers c ON o.CustomerID = c.CustomerID
)
SELECT SUM(Num) [Num], cc [Name] FROM ddd d JOIN otc o ON d.OIDm = o.OIDm
GROUP BY cc

22.
With
ddd(OIDm, Num)
AS(
SELECT OrderID, SUM(Quantity)
FROM [Order Details]
GROUP BY OrderID),
otc(cc, OIDm)
AS(
SELECT c.ContactName, o.OrderID
FROM dbo.Orders o
Join Customers c ON o.CustomerID = c.CustomerID
)
SELECT SUM(Num) [Numm], cc [Name] FROM ddd d JOIN otc o ON d.OIDm = o.OIDm
GROUP BY cc
HAVING SUM(Num) > 100

23.
SELECT CompanyName
FROM Suppliers

SELECT CompanyName
FROM Shippers

24.
With
ddd(pname, OIDm)
AS(
SELECT p.ProductName, od.OrderID
FROM Products p
Join [Order Details] od ON p.ProductID = od.ProductID
),
ccc(OIDm, ODD)
AS(
SELECT OrderID, OrderDate
FROM Orders
)
SELECT d.pname, c.ODD
FROM ddd d JOIN ccc c ON d.OIDm = c.OIDm
ORDER BY ODD DESC

25.
WITH 
ddd (f, t) AS (
SELECT FirstName, Title
FROM Employees
),
ccc (f, t) AS
(
SELECT FirstName, Title
FROM Employees
)
SELECT d.f, c.f
FROM ddd d JOIN ccc c ON d.t = c.t AND d.f <> c.f

26.