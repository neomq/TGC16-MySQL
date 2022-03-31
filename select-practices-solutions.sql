-- Q1: Find all the offices and display only their city, phone and country
select city, phone, country from offices;

-- Q2:  Find all rows in the orders table that mentions FedEx in the comments
select * from orders where comments like "%fedex%";

-- Q3: 3 - Show the contact first name and contact last name of all customers in descending order by the customer's name
select contactFirstName, contactLastName from customers
 order by contactFirstName desc

 -- Q4: 4 - Find all sales rep who are in office code 1, 2 or 3 and their first name or last name contains the substring 'son'
 select firstName, lastName from employees where officeCode IN (1,2,3) and (lastName like "%son%" or firstName like "%son%") and
 jobTitle like "sales rep";

 -- Q5: Display all the orders bought by the customer with the customer number 124, along with the customer name, the contact's first name and contact's last name.
 select orders.*, customerName, contactLastName, contactFirstName
 from orders join customers on orders.customerNumber = customers.customerNumber
 where orders.customerNumber = 124;

 -- Q6: Show the name of the product, together with the order details,  for each order line from the orderdetails table
 SELECT orderdetails.*, products.productName  FROM products JOIN orderdetails
ON products.productCode = orderdetails.productCode;

-- Q8
select customerName, amount from customers join payments
on customers.customerNumber = payments.customerNumber
where country="USA"

-- or to display the sum per customer from USA
select sum(amount), customerName from 
  payments join customers
  on payments.customerNumber = customers.customerNumber
  where country="USA"
  group by customers.customerNumber, customerName

-- Q8
select count(*), state from offices join employees
on offices.officeCode = employees.officeCode
where offices.country = "USA"
group by state

-- Q9
select avg(amount), customerName from 
  payments join customers
  on payments.customerNumber = customers.customerNumber
  group by customers.customerNumber, customerName

-- Q10
select customerName, avg(amount), sum(amount) from customers
 join payments on customers.customerNumber = payments.customerNumber
group by customers.customerNumber
having sum(amount) >= 10000
order by avg(amount)

-- Q11
select sum(quantityOrdered), orderdetails.productCode, productName from orderdetails join products
 on orderdetails.productCode = products.productCode
 group by orderdetails.productCode, productName
 order by sum(quantityOrdered) DESC
 limit 10

-- Q12
select * from orders where orderDate BETWEEN "2003-01-01" AND "2003-12-31"
select * from orders where year(orderDate) =  "2003"

-- Q13
select MONTH(orderDate), COUNT(*) from orders join orderdetails
 ON orders.orderNumber = orderdetails.orderNumber
 WHERE YEAR(orderDate) = 2003
 GROUP BY MONTH(orderDate)

-- Q13B
select YEAR(orderDate), MONTH(orderDate), COUNT(*) from orders join orderdetails
 ON orders.orderNumber = orderdetails.orderNumber
 WHERE YEAR(orderDate) >= 2003 AND YEAR(orderDate) <=2004
 GROUP BY YEAR(orderDate), MONTH(orderDate)

 -- SUB QUERIES
 -- ex:1 find all customers whose credit limit above the average
 select * from customers where creditLimit > (select avg(creditLimit) from customers);

-- ex:2 find all products that have not been ordered before
 select * from products where productCode not in (select distinct(productCode) from orderdetails)

 -- ex:3 use a subquery to find all customers with no sales rep employee number
 select * from customers where customerNumber NOT IN (
select customerNumber from customers where salesRepEmployeeNumber IS NOT NULL);
