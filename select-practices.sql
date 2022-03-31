-- 1 - Find all the offices and display only their city, phone and country
SELECT city, phone, country FROM offices;

-- 2 - Find all rows in the orders table that mentions FedEx in the comments
SELECT * FROM orders where comments like "%FedEx%";

-- 3 - Show the contact first name and contact last name of all customers in descending order by the customer's name
SELECT contactFirstName, contactLastName FROM customers
ORDER BY customerName DESC;

-- 4 - Find all sales rep who are in office code 1, 2 or 3 and their first name or last name contains the substring 'son'
SELECT * FROM employees where (officeCode=1 or officeCode=2 or officeCode=3) 
   AND firstName like "%son%" or lastName like "%son%";

-- 5 - Display all the orders bought by the customer with the customer number 124,
-- along with the customer name, the contact's first name and contact's last name.
SELECT customerName, contactFirstName, contactLastName from customers right join orders
    ON customers.customerNumber = orders.customerNumber
 WHERE customers.customerNumber=124;

-- 6 - Show the name of the product, together with the order details, for each order line from the orderdetails table
SELECT productName, orderdetails.orderNumber, orderdetails.productCode, orderdetails.quantityOrdered, orderdetails.priceEach, orderdetails.orderLineNumber FROM products join orderdetails
	ON products.productCode = orderdetails.productCode;

-- -- -- -- -- -- -- 

-- 7 - Display all the payments made by each company from the USA. 
SELECT customerName, country, amount FROM customers right join payments
ON payments.customerNumber = customers.customerNumber
WHERE country="USA"
GROUP BY payments.customerNumber;

-- 8 - Show how many employees are there for each state in the USA.
-- ?????
SELECT employeeNumber, count(*) FROM employees join offices
ON employees.officeCode = offices.officeCode
WHERE country="USA"
GROUP BY state;

-- 9 - From the payments table, display the average amount spent by each customer.
-- Display the name of the customer as well.
SELECT customers.customerNumber, customers.customerName, avg(amount) FROM customers join payments
WHERE payments.customerNumber = customers.customerNumber
group by payments.customerNumber;

-- 10 - From the payments table, display the average amount spent by each customer but only if the customer has spent a minimum of 10,000 dollars.
SELECT customerNumber, avg(amount) FROM payments
group by customerNumber
having avg(amount) > 10000;

-- 11 - For each product, display how many times it was ordered, and display the results with the most orders first and only show the top ten.
SELECT products.productCode, count(*) FROM orderdetails join products
WHERE products.productCode = orderdetails.productCode
group by products.productCode
order by count(*) desc
limit 10;

-- 12 - Display all orders made between Jan 2003 and Dec 2003
SELECT * FROM orders where orderDate >= "2003-01-01" and orderDate <="2003-12-31"

-- 13 - Display all the number of orders made, per month, between Jan 2003 and Dec 2003
SELECT orderNumber, MONTH(orderDate), count(*) FROM orders where orderDate >= "2003-01-01" and orderDate <="2003-12-31"
group by MONTH(orderDate);

-- Chinook
-- 1 - Display all Sales Support Agents with their first name and last name
SELECT FirstName, LastName from Employee;

-- 2 - Display all employees hired between 2002 and 2003,
-- and display their first name and last name
SELECT FirstName, LastName from Employee where year(HireDate) >= 2002 and year(HireDate) <= 2003;

-- 3 - Display all artists that have the word 'Metal' in their name
SELECT * from Artist where Name like "%Metal%";

-- 4 - Display all employees who are in sales (sales manager, sales rep etc.)
SELECT * from Employee where Title like "%Sales%";

-- 5 - Display the titles of all tracks which has the genre "easy listening"
SELECT Track.Name, Genre.Name from Track join Genre
ON Track.GenreId = Genre.GenreId
WHERE Genre.Name = "Easy Listening";

-- 6 - Display all the tracks from all albums along with the genre of each track
SELECT Track.Name, Album.Title, Genre.Name from Album join Track
ON Album.AlbumId = Track.AlbumId
 join Genre
ON Track.GenreId = Genre.GenreId;

-- 7 - Using the Invoice table, show the average payment made for each country
SELECT BillingCountry, avg(Total) from Invoice
GROUP BY BillingCountry;

-- 8 - Using the Invoice table, show the average payment made for each country,
-- but only for countries that paid more than $5.50 in total average
SELECT BillingCountry, avg(Total) from Invoice
GROUP BY BillingCountry
having avg(Total) > 5.5;

-- 9 - Using the Invoice table, show the average payment made for each customer,
-- but only for customer reside in Germany and only if that customer has paid more than 10in total
SELECT CustomerId, avg(Total), sum(Total) from Invoice
where BillingCountry="Germany"
GROUP BY CustomerId
having sum(Total) > 10;

-- 10 - Display the average length of Jazz song (that is, the genre of the song is Jazz) for each album
SELECT Album.Title, Genre.Name , avg(Track.Milliseconds) from Album join Track
ON Album.AlbumId = Track.AlbumId
 JOIN Genre
ON Track.GenreId = Genre.GenreId
WHERE Genre.Name ="Jazz"
GROUP BY Album.Title;
