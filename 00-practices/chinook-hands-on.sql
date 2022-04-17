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