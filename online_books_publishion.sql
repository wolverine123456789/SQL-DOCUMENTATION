create database Books_publishing_system; 

use Books_publishing_system;  

CREATE TABLE Publisher(
publisher_id int primary key,
name varchar(250) not null,
contact_details varchar(250)
);

CREATE TABLE Book(
book_id int primary key,
title varchar(250) not null,
ISBL varchar(100) not null,
edition int not null,
publication_year int,
price decimal(10, 2),
publisher_id int,
foreign key (publisher_id) references Publisher(publisher_id) on delete cascade
);


CREATE TABLE Genere(
genere_id int primary key,
genere_name varchar(250)not null
);


CREATE TABLE Book_genere(
book_id int,
genere_id int,
primary key(book_id, genere_id),
foreign key (book_id) references Book(book_id),
foreign key (genere_id) references Genere(genere_id)
);


CREATE TABLE Author(
author_id int primary key,
name varchar(250) not null,
biography text
);

CREATE TABLE Book_Author(
book_id int,
author_id int,
primary key (book_id, author_id),
foreign key (book_id) references Book(book_id),
foreign key (author_id) references Author(author_id)
 );
 
 CREATE TABLE Customer(
 customer_id int primary key,
 name varchar(250) not null
 );


CREATE TABLE Address(
address_id int primary key,
customer_id int,
street varchar(250),
city varchar(250),
state varchar(250),
country varchar(250),
foreign key (customer_id) references Customer(customer_id)
);


CREATE TABLE Wishlist(
customer_id int,
book_id int,
primary key (customer_id, book_id),
foreign key (customer_id) references Customer(customer_id),
foreign key (book_id) references Book(book_id)
);

CREATE TABLE Orderr(
order_id int primary key,
order_date date not null,
customer_id int,
payment_details varchar(250),
shipping_address_id int,
foreign key (customer_id) references Customer(customer_id),
foreign key (shipping_address_id) references Address(address_id)
);

CREATE TABLE Order_book(
Orderitem_id int primary key,
order_id int,
book_id int,
quantity int not null,
foreign key (order_id) references Orderr(order_id),
foreign key (book_id) references Book(book_id)
);



INSERT INTO Publisher (publisher_id, name, contact_details)
VALUES
  (1, 'Penguin Random House', 'contact@penguin.com'),
  (2, 'HarperCollins', 'support@harpercollins.com');


INSERT INTO Book (book_id, title, ISBL, edition, publication_year, price, publisher_id)
VALUES
  (1, 'The Silent Patient', '9781250301697', 1, 2019, 499.99, 1),
  (2, 'Atomic Habits', '9780735211292', 1, 2018, 399.50, 2),
  (3, 'Clean Code', '9780132350884', 2, 2008, 699.00, 1);


INSERT INTO Genere (genere_id, genere_name)
VALUES
  (1, 'Thriller'),
  (2, 'Self-help'),
  (3, 'Programming');


INSERT INTO Book_genere (book_id, genere_id)
VALUES
  (1, 1), -- The Silent Patient -> Thriller
  (2, 2), -- Atomic Habits -> Self-help
  (3, 3); -- Clean Code -> Programming


INSERT INTO Author (author_id, name, biography)
VALUES
  (1, 'Alex Michaelides', 'British-Cypriot author.'),
  (2, 'James Clear', 'Speaker and writer on habits.'),
  (3, 'Robert C. Martin', 'Also known as Uncle Bob, software engineer.');


INSERT INTO Book_Author (book_id, author_id)
VALUES
  (1, 1), -- The Silent Patient -> Alex
  (2, 2), -- Atomic Habits -> James
  (3, 3); -- Clean Code -> Robert


INSERT INTO Customer (customer_id, name)
VALUES
  (1, 'Rachel Green'),
  (2, 'Monica Geller');


INSERT INTO Address (address_id, customer_id, street, city, state, country)
VALUES
  (1, 1, '123 Park Ave', 'New York', 'NY', 'USA'),
  (2, 2, '456 Central Perk', 'New York', 'NY', 'USA');


INSERT INTO Wishlist (customer_id, book_id)
VALUES
  (1, 2), -- Rachel -> Atomic Habits
  (1, 3), -- Rachel -> Clean Code
  (2, 1); -- Monica -> The Silent Patient


INSERT INTO Orderr (order_id, order_date, customer_id, payment_details, shipping_address_id)
VALUES
  (1, '2025-06-01', 1, 'Credit Card', 1),
  (2, '2025-06-02', 2, 'PayPal', 2);


INSERT INTO Order_book (Orderitem_id, order_id, book_id, quantity)
VALUES
  (1, 1, 2, 1),  -- Rachel ordered Atomic Habits
  (2, 1, 3, 1),  -- Rachel also ordered Clean Code
  (3, 2, 1, 2);  -- Monica ordered 2 copies of The Silent Patient


select * from Order_book;

























