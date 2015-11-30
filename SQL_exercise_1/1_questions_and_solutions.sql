-- LINK: https://en.wikibooks.org/wiki/SQL_Exercises/The_computer_store



-- Select the names of all the products in the store.
SELECT name
FROM Products;

# Select the names and the prices of all the products in the store.
SELECT name, Price
FROM Products;

# Select the name of the products with a price less than or equal to $200.
SELECT name
FROM Products
WHERE Price <= 200;

-- Select all the products with a price between $60 and $120.
SELECT *
FROM Products
WHERE Price >= 60
AND Price <= 120;

-- Select the name and price in cents (i.e., the price must be multiplied by 100).
SELECT name, Price * 100 AS PriceInCents
FROM Products;



-- Compute the average price of all the products.
SELECT AVG(Price)
FROM Products;
 
-- Compute the average price of all products with manufacturer code equal to 2.
SELECT AVG(Price)
FROM Products
WHERE Manufacturer = 2;

-- Compute the number of products with a price larger than or equal to $180.
SELECT COUNT(*)
FROM Products
WHERE Price >= 180;

-- Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
SELECT name, Price
FROM Products
WHERE Price >= 180
ORDER BY Price DESC, name ASC;

-- Select all the data from the products, including all the data for each product's manufacturer.
SELECT *
FROM Products
LEFT OUTER JOIN Manufacturers ON Products.Manufacturer = Manufacturers.code;

-- Select the product name, price, and manufacturer name of all the products.
SELECT name, price, manufacturer
FROM Products;


-- Select the average price of each manufacturer's products, showing only the manufacturer's code.
SELECT AVG(price), Manufacturer
FROM Products
GROUP BY manufacturer;


-- Select the average price of each manufacturer's products, showing the manufacturer's name.
SELECT AVG(Products.price), Manufacturers.name
FROM Products
INNER JOIN Manufacturers ON Manufacturers.code = Products.manufacturer
GROUP BY Products.manufacturer;

-- Select the names of manufacturer whose products have an average price larger than or equal to $150.
SELECT Manufacturers.name, AVG(Products.price)
FROM Products
INNER JOIN Manufacturers ON Manufacturers.code = Products.manufacturer
GROUP BY Products.manufacturer
HAVING AVG(Products.price) >= 150;
   
-- Select the name and price of the cheapest product.
SELECT name, price
FROM Products
ORDER BY price ASC
LIMIT 1;

-- Select the name of each manufacturer along with the name and price of its most expensive product.
SELECT Manufacturers.name, Products.name, Products.price
FROM Products
INNER JOIN Manufacturers ON Manufacturers.code = Products.manufacturer
ORDER BY Products.price DESC
LIMIT 1;

-- Add a new product: Loudspeakers, $70, manufacturer 2.
INSERT INTO Products (code, name, price, manufacturer)
VALUES (11, 'Loudspeaker', 70, 2);


-- Update the name of product 8 to "Laser Printer".
UPDATE Products
SET name = 'Laser Printer'
WHERE code = 8;

-- Apply a 10% discount to all products.
UPDATE Products
SET price = price * 0.9;


-- Apply a 10% discount to all products with a price larger than or equal to $120.
UPDATE Products
SET price = price * 0.9
WHERE price >= 120;

