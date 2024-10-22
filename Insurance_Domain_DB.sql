create database Library;
use Library;

create table Author(
author_id int primary key,
first_name varchar(20),
last_name varchar(20),
date_of_birth date,
nationality varchar(20)
);
INSERT INTO Author(author_id, first_name, last_name, date_of_birth, nationality)
VALUES
    (1, 'Jane', 'Austen', '1775-12-16', 'British'),
    (2, 'Mark', 'Twain', '1835-11-30', 'American'),
    (3, 'George', 'Orwell', '1903-06-25', 'British'),
    (4, 'J.K.', 'Rowling', '1965-07-31', 'British'),
    (5, 'Agatha', 'Christie', '1890-09-15', 'British');
    
select*from Author;

create table Books(
book_id int primary key,
title varchar(50),
author_id int,
publication_year int,
genre varchar(50),
isbn varchar(50),
available_copies int,
foreign key(author_id)references Authors(author_id)
);

INSERT INTO Books (book_id, title, author_id, publication_year, genre, isbn, available_copies)
VALUES
    (101, 'Pride and Prejudice', 1, 1913, 'Fiction', '9781111111111', 4),
    (102, 'Adventures of Huckleberry Finn', 2, 1984, 'Fiction', '9782222222222', 3),
    (103, '1984', 3, 1949, 'Dystopian', '9783333333333', 5),
    (104, 'Harry Potter and the Sorcerer''s Stone', 4, 1997, 'Fantasy', '9784444444444', 6),
    (105, 'Murder on the Orient Express', 5, 1934, 'Mystery', '9785555555555', 2);


create table Members(
member_id int primary key,
first_name varchar(50),
last_name varchar(50),
date_of_birth date,
contact_number varchar(20),
email varchar(50),
membership_date date
);

INSERT INTO Members (member_id, first_name, last_name, date_of_birth, contact_number, email, membership_date)
VALUES
    (1, 'Alice', 'Johnson', '1990-02-15', '1234567890', 'alice@example.com', '2023-01-01'),
    (2, 'Bob', 'Smith', '1985-07-20', '2345678901', 'bob@example.com', '2022-06-15'),
    (3, 'Charlie', 'Brown', '1992-03-10', '3456789012', 'charlie@example.com', '2023-03-22'),
    (4, 'David', 'Wilson', '2000-09-30', '4567890123', 'david@example.com', '2023-08-05'),
    (5, 'Emma', 'Davis', '1988-11-22', '5678901234', 'emma@example.com', '2021-11-12');


create table Loans(
loan_id int,
book_id int,
member_id int,
loan_date date,
return_date date,
actual_return_date date
);

INSERT INTO Loans (loan_id, book_id, member_id, loan_date, return_date, actual_return_date)
VALUES
    (201, 101, 1, '2023-09-01', '2023-09-15', '2023-09-14'),
    (202, 102, 2, '2023-09-05', '2023-09-20', NULL),
    (203, 103, 3, '2023-09-10', '2023-09-25', '2023-09-23'),
    (204, 104, 4, '2023-09-12', '2023-09-27', NULL),
    (205, 105, 5, '2023-09-15', '2023-09-30', '2023-09-29');


create table Staff(
staff_id int,
first_name varchar(20),
last_name varchar(20),
position varchar(20),
contact_number varchar(20),
email varchar(30),
hire_date date
);


INSERT INTO Staff (staff_id, first_name, last_name, position, contact_number, email, hire_date)
VALUES
    (301, 'Sophia', 'Martinez', 'Librarian', '6789012345', 'sophia@example.com', '2020-01-10'),
    (302, 'Liam', 'Johnson', 'Assistant', '7890123456', 'liam@example.com', '2021-07-15'),
    (303, 'Olivia', 'Brown', 'Manager', '8901234567', 'olivia@example.com', '2019-03-22'),
    (304, 'Noah', 'Davis', 'Receptionist', '9012345678', 'noah@example.com', '2022-09-05'),
    (305, 'Emma', 'Wilson', 'Clerk', '1234567899', 'emma.wilson@example.com', '2020-05-18');
    

-- DDL queries
-- adding new coloumn to books table
alter table Books add column language varchar(50);
select* from Books;

-- Rename the position coloumn in the staff table to job_title
alter table Staff rename column position to job_title;
select*from Staff;

-- Drop the email coloumn from the members table
alter table Members drop column email;
select*from Members;

-- DML queries 
-- Adding new coloumn to Books table
insert into Author(author_id, first_name, last_name, date_of_birth, nationality)
values(6,'Jay','Shetty','1988-02-13','Indian');
select*from Author;

insert into Books (book_id, title, author_id, publication_year, genre, isbn, available_copies,language) 
values(106,'Think Like A Monk',6,2020,'Non-Fiction',9718222222222,8,null);
select*from Books;

-- Update member's contact number
update Members set contact_number='8237125133' where member_id=1;
select*from Members;

-- Delete a specific loan record 
delete from Loans where member_id=4;
select*from Loans;

-- Insert a new loan record
insert into Loans (loan_id, book_id, member_id, loan_date, return_date, actual_return_date)
VALUES (206,106,6,'2023-10-11','2023-11-11',null);
select*from Loans;

-- Join Queries
-- Retrieve all books along with their authors
 select Books.title, Author.first_name, Author.last_name from Books
 join Author on Books.author_id=Author.author_id;
 
 -- Find all staff members who are librarians and their hire dates
select first_name, last_name, hire_date from Staff where job_title = 'Librarian';

-- Get the total number of books and the total available copies for each genre
SELECT genre, COUNT(book_id) AS total_books, SUM(available_copies) AS total_available_copies
FROM Books
GROUP BY genre;

