--#1 Which company's product price is greater than the average product price - using subquery
SELECT ProductType, Price
FROM tblProduct
WHERE Price >
	(SELECT AVG(Price) FROM tblProduct)

--#2 Give a listing of distinct Zip codes in which you have companies.
SELECT DISTINCT Zip
FROM tblCompany

--#3 Create a query to display the current price of all products from Midwest Lightning
-- also show what the new price would be if price increased by 15%
SELECT * FROM tblCompany

SELECT ProductID, tblProduct.ProductType, Price, Price * 1.15 AS 'New Price'
FROM tblProduct JOIN tblCompany
	ON tblProduct.CompanyID = tblCompany.CompanyID
WHERE tblCompany.CompanyID = 'MID312'

--#4 Show max, min, avg prices by Zip
SELECT Zip, MAX(Price) AS 'MAX', MIN(Price) AS 'MIN', AVG(Price) AS 'AVG'
FROM tblProduct JOIN tblCompany
	ON tblProduct.CompanyID = tblCompany.CompanyID
GROUP BY Zip

--#5 How many invoices Does CompanyID MIC268 Have?
SELECT COUNT(InvoiceID) AS 'Number of Invoices'
FROM tblInvoice
WHERE CompanyID = 'MIC268'

--#6 Which companies have no products
SELECT DISTINCT tblCompany.CompanyID, CompanyName
FROM tblCompany LEFT JOIN tblProduct
	ON tblCompany.CompanyID = tblProduct.CompanyID
WHERE ProductID IS NULL

SELECT * FROM tblProduct
WHERE CompanyID = 'CHE802'

--#7 Insert a new company with your name as the companyname into the company table
SELECT * FROM tblCompany
INSERT INTO tblCompany
VALUES('JAR510','ReisingerCorpToo', 'Computer Equipment', 'POBox 1901', 'Louisville', 'KY', '48752', '8882221212', 'Jennifer', 'Reisinger Jr', '2023-05-12 00:00:00.000', 'All of the brains')

--#8 Create a new table tblcompanybackup that only contains companies from Grand Rapids
SELECT * INTO tblCompanyBackup
FROM tblCompany
WHERE City = 'Grand Rapids'

SELECT * FROM tblCompanyBackup

--#9 Using an update statement, add 250 to all credit lines
SELECT * FROM tblCompanyCreditLine

UPDATE tblCompanyCreditLine
SET CreditLine = CreditLine + 250

--#10 Delete a product
SELECT * FROM tblProduct

DELETE tblProduct
WHERE ProductID = '5630'