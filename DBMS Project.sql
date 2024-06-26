CREATE DATABASE Online_Book_Store_;
USE Online_Book_Store_;



CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY IDENTITY(1,1),
    AuthorName VARCHAR(255)
);
CREATE TABLE Genres (
    GenreID INT PRIMARY KEY IDENTITY(1,1),
    GenreName VARCHAR(255)
);


CREATE TABLE Books (
    BookID INT PRIMARY KEY IDENTITY(1,1),
    Title VARCHAR(255),
    Price DECIMAL(10, 2),
    PublishedYear INT,
    Quantity INT,
	Author_Id INT NOT NULL FOREIGN KEY REFERENCES Authors(AuthorID),
	Genre_Id INT NOT NULL FOREIGN KEY REFERENCES Genres(GenreID)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    OrderDate DATE,
	Customer_Id INT NOT NULL FOREIGN KEY REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    Quantity INT,
	Order_Id INT NOT NULL FOREIGN KEY REFERENCES Orders(OrderID),
    Book_Id INT NOT NULL FOREIGN KEY REFERENCES Books(BookID)
);


CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY IDENTITY(1,1),
    Rating INT,
    ReviewText VARCHAR(1000),
    Book_Id INT NOT NULL FOREIGN KEY REFERENCES Books(BookID),
	Customer_Id INT NOT NULL FOREIGN KEY REFERENCES Customers(CustomerID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
	Order_Id INT NOT NULL FOREIGN KEY REFERENCES Orders(OrderID)
);

CREATE TABLE Promotions (
    PromotionID INT PRIMARY KEY IDENTITY(1,1),
    Discount DECIMAL(5, 2),
    StartDate DATE,
    EndDate DATE,
    Book_Id INT NOT NULL FOREIGN KEY REFERENCES Books(BookID)
);
CREATE TABLE Coupons (
    CouponID INT PRIMARY KEY IDENTITY(1,1),
    CouponCode VARCHAR(50),
    Discount DECIMAL(5, 2),
    ExpirationDate DATE
);

CREATE TABLE OrderCoupons (
    Order_Id INT NOT NULL FOREIGN KEY REFERENCES Orders(OrderID),
    Coupon_Id INT NOT NULL FOREIGN KEY REFERENCES Coupons(CouponID),
    PRIMARY KEY (Order_Id, Coupon_Id)
);



INSERT INTO Authors (AuthorName) VALUES 
('Agatha Christie'),
('Stephen King'),
('Harper Lee'),
('F. Scott Fitzgerald'),
('Emily Bronte'),
('Charles Dickens'),
('Jane Austen'),
('Leo Tolstoy'),
('Mark Twain'),
('J.R.R. Tolkien');


SELECT * FROM Authors;


INSERT INTO Books (Title, Price, PublishedYear, Quantity, Author_Id, Genre_Id)
VALUES 
('The Great Gatsby', 10.99, 1925, 50, 1, 1),
('To Kill a Mockingbird', 7.99, 1960, 100, 2, 2),
('1984', 8.99, 1949, 200, 3, 3),
('Pride and Prejudice', 6.99, 1813, 150, 4, 4),
('The Catcher in the Rye', 9.99, 1951, 80, 5, 5),
('The Hobbit', 12.99, 1937, 70, 6, 6),
('Fahrenheit 451', 7.49, 1953, 60, 7, 8),
('Jane Eyre', 8.49, 1847, 90, 8, 7),
('Moby-Dick', 11.99, 1851, 120, 9, 9),
('War and Peace', 13.99, 1869, 30, 10, 10);


SELECT * FROM Books;


INSERT INTO Customers (FirstName, LastName, Email) VALUES 
('Samiul', 'Hasan', 'Samiulhasan226@gmail.com'),
('Tanvir', 'Ahmed', 'Tanvir88@gmail.com'),
('Israq', 'Rion', 'Rion34@gmai.com'),
('Mahmudul', 'Haque', 'Prio45@gmail.com'),
('Anserul', 'Haque', 'Ovi22@gmail.com'),
('Ahmed', 'Shorif', 'Shorif36@gmail.com'),
('Saiful', 'Islam', 'Saiful11@gmail.com'),
('Tarek', 'Emou', 'emou26@gmail.com'),
('Mohammad', 'Pamel', 'pamel66@gmail.com'),
('Rifatul', 'Islam', 'Rifat88@gmail.com');


SELECT * FROM Customers;


INSERT INTO Orders (Customer_Id, OrderDate) VALUES 
(3, '2024-04-01'),
(4, '2024-04-05'),
(5, '2024-04-10'),
(6, '2024-04-15'),
(1, '2024-04-20'),
(2, '2024-04-25'),
(7, '2024-05-02'),
(8, '2024-05-10'),
(9, '2024-05-15'),
(10, '2024-05-20');


SELECT * FROM Orders;


INSERT INTO OrderDetails (Order_Id, Book_Id, Quantity) VALUES 
(3, 11, 30),
(4, 4, 22),
(5, 12, 25),
(6, 5, 50),
(1, 6, 10),
(2, 7, 25),
(7, 13, 2),
(8, 8, 1),
(9, 9, 3),
(10, 10, 1);


SELECT * FROM OrderDetails;


INSERT INTO Genres (GenreName) VALUES 
('Mystery'),
('Horror'),
('Classic'),
('Romance'),
('Historical Fiction'),
('Adventure'),
('Science Fiction'),
('Thriller'),
('Fantasy'),
('Biography');


SELECT * FROM Genres;


INSERT INTO Reviews (Book_Id, Customer_Id, Rating, ReviewText) VALUES 
(4, 3, 4, 'Captivating story!'),
(5, 4, 5, 'Sei vai sei.'),
(7, 5, 4, 'Enjoyed the characters.'),
(6, 6, 5, 'A timeless classic.'),
(11, 1, 4, 'Spine-chilling!'),
(12, 2, 5, 'Heartwarming and thought-provoking.'),
(13, 7, 4, 'Loved the romance plot.'),
(8, 8, 4, 'Epic historical novel.'),
(9, 9, 3, 'Interesting adventure story.'),
(10, 10, 5, 'Magical journey!');



SELECT * FROM Reviews;


INSERT INTO Payments (Order_Id, Amount, PaymentDate) VALUES 
(3, 11.49, '2024-04-02'),
(4, 17.58, '2024-04-06'),
(5, 23.97, '2024-04-11'),
(6, 6.49, '2024-04-16'),
(1, 12.98, '2024-04-21'),
(2, 10.99, '2024-04-26'),
(7, 21.98, '2024-05-03'),
(8, 14.99, '2024-05-11'),
(9, 17.97, '2024-05-16'),
(10, 11.79, '2024-05-21');

SELECT * FROM Payments;


INSERT INTO Promotions (Book_Id, Discount, StartDate, EndDate) VALUES 
(4, 0.15, '2024-05-01', '2024-05-15'), 
(5, 0.1, '2024-05-10', '2024-06-10'),   
(11, 0.2, '2024-05-15', '2024-06-15'),  
(6, 0.25, '2024-06-01', '2024-06-30'), 
(7, 0.1, '2024-06-05', '2024-06-30'), 
(12, 0.15, '2024-07-01', '2024-07-31'), 
(13, 0.12, '2024-07-10', '2024-07-20'), 
(8, 0.2, '2024-08-01', '2024-08-15'),   
(9, 0.15, '2024-08-10', '2024-08-30'),   
(10, 0.1, '2024-09-01', '2024-09-30'); 

SELECT * FROM Promotions;


INSERT INTO Coupons (CouponCode, Discount, ExpirationDate) VALUES 
('SUMMER20', 20.00, '2024-07-01'),   
('WELCOME10', 10.00, '2024-08-01'), 
('FALL15', 15.00, '2024-09-30'),     
('HOLIDAY25', 25.00, '2024-12-31'),
('SPRING5', 5.00, '2024-04-30'), 
('NEWYEAR10', 10.00, '2025-01-01'), 
('FLASHSALE30', 30.00, '2024-06-25'),
('WINTER20', 20.00, '2025-02-28'), 
('VIP40', 40.00, '2024-11-01'), 
('BLACKFRIDAY50', 50.00, '2024-11-30');

SELECT * FROM Coupons;



INSERT INTO OrderCoupons (Order_Id, Coupon_Id) VALUES 
(1, 1),  
(1, 2),  
(2, 1), 
(2, 3),
(3, 4),
(3, 5), 
(4, 6),  
(4, 7),  
(5, 8), 
(5, 9), 
(6, 10), 
(6, 1), 
(7, 2),
(7, 3), 
(8, 4), 
(8, 5), 
(9, 6), 
(9, 7), 
(10, 8), 
(10, 9);


SELECT * FROM OrderCoupons;



SELECT * FROM Customers
WHERE Email = 'Samiulhasan226@gmail.com';

SELECT * FROM Books
WHERE BookID = 7;

SELECT Books.Title, Genres.GenreName
FROM Books
INNER JOIN Genres ON Books.BookID = Genres.GenreID;
								
								--All Reference with join--
SELECT 
    Orders.OrderID,
    Customers.FirstName + ' ' + Customers.LastName AS CustomerName,
    Orders.OrderDate,
    OrderDetails.Quantity,
    Books.Title AS BookTitle,
    Authors.AuthorName,
    Genres.GenreName,
    Reviews.Rating,
    Reviews.ReviewText
FROM 
    Orders
JOIN 
    Customers ON Orders.Customer_Id = Customers.CustomerID
JOIN 
    OrderDetails ON Orders.OrderID = OrderDetails.Order_Id
JOIN 
    Books ON OrderDetails.Book_Id = Books.BookID
JOIN 
    Authors ON Books.Author_Id = Authors.AuthorID
JOIN 
    Genres ON Books.BookID = Genres.GenreID
LEFT JOIN 
    Reviews ON Books.BookID = Reviews.Book_Id;
									

									--Date search wise--
SELECT 
    Orders.OrderID,
    Customers.FirstName + ' ' + Customers.LastName AS CustomerName,
    Orders.OrderDate,
    OrderDetails.Quantity,
    Books.Title AS BookTitle,
    Authors.AuthorName,
    Genres.GenreName,
    Reviews.Rating,
    Reviews.ReviewText
FROM 
    Orders
JOIN 
    Customers ON Orders.Customer_Id = Customers.CustomerID
JOIN 
    OrderDetails ON Orders.OrderID = OrderDetails.Order_Id
JOIN 
    Books ON OrderDetails.Book_Id = Books.BookID
JOIN 
    Authors ON Books.Author_Id = Authors.AuthorID
JOIN 
    Genres ON Books.BookID = Genres.GenreID
LEFT JOIN 
    Reviews ON Books.BookID = Reviews.Book_Id
WHERE 
    Orders.OrderDate >= '2024-05-01' AND Orders.OrderDate <= '2024-05-31';
											
											--Total search wise--

SELECT 
    Orders.OrderID,
    Customers.FirstName + ' ' + Customers.LastName AS CustomerName,
    SUM(OrderDetails.Quantity * Books.Price) AS TotalAmount
FROM 
    Orders
JOIN 
    Customers ON Orders.Customer_Id = Customers.CustomerID
JOIN 
    OrderDetails ON Orders.OrderID = OrderDetails.Order_Id
JOIN 
    Books ON OrderDetails.Book_Id = Books.BookID
GROUP BY 
    Orders.OrderID, Customers.FirstName, Customers.LastName
HAVING 
    SUM(OrderDetails.Quantity * Books.Price) > 100;

										--Date and Amount wise search--

SELECT 
    Orders.OrderID,
    Customers.FirstName + ' ' + Customers.LastName AS CustomerName,
    Orders.OrderDate,
    SUM(OrderDetails.Quantity * Books.Price) AS TotalAmount
FROM 
    Orders
JOIN 
    Customers ON Orders.Customer_Id = Customers.CustomerID
JOIN 
    OrderDetails ON Orders.OrderID = OrderDetails.Order_Id
JOIN 
    Books ON OrderDetails.Book_Id = Books.BookID
WHERE 
    Orders.OrderDate BETWEEN '2024-05-01' AND '2024-05-31' 
GROUP BY 
    Orders.OrderID, Customers.FirstName, Customers.LastName, Orders.OrderDate
HAVING 
    SUM(OrderDetails.Quantity * Books.Price) > 1; 


SELECT COUNT(*) AS TotalRows
FROM Customers;


SELECT *
FROM Authors
WHERE AuthorName LIKE 'Charles Dickens';


									--Data Update with join table--
UPDATE Books
SET Books.Quantity = NewQuantity.TotalOrdered
FROM Books
JOIN (
    SELECT Book_Id, SUM(Quantity) AS TotalOrdered
    FROM OrderDetails
    GROUP BY Book_Id
) AS NewQuantity ON Books.BookID = NewQuantity.Book_Id;


SELECT SUM(Price) AS TotalPriceSum
FROM Books;


SELECT AVG(Price) AS AveragePrice
FROM Books;


                            --Check Applied Coupons for a Specific Order--
SELECT 
    Orders.OrderID, 
    Orders.OrderDate, 
    Coupons.CouponCode, 
    Coupons.Discount
FROM 
    OrderCoupons
JOIN 
    Orders ON OrderCoupons.Order_Id = Orders.OrderID
JOIN 
    Coupons ON OrderCoupons.Coupon_Id = Coupons.CouponID
WHERE 
    Orders.OrderID = 1;



	                              --Retrieve Orders with Applied Coupons--
SELECT 
    Orders.OrderID, 
    Orders.OrderDate, 
    Coupons.CouponCode, 
    Coupons.Discount
FROM 
    OrderCoupons
JOIN 
    Orders ON OrderCoupons.Order_Id = Orders.OrderID
JOIN 
    Coupons ON OrderCoupons.Coupon_Id = Coupons.CouponID;













