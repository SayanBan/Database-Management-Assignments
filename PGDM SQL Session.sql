DROP DATABASE IF EXISTS `first database`;
CREATE DATABASE `first database`;
USE `first database`;

CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);


iNSERT INTO Persons ( PersonID, LastName, FirstName, Address, City)
VALUES ( 1234, 'Sharma', 'Ruchi', 'IMI', 'Kolkata');

iNSERT INTO Persons ( PersonID, LastName, FirstName, Address, City)
VALUES ( 1345, 'Verma', 'Happy', '2/4 C, judges court Road', 'Kolkata');

SELECT * FROM Persons;

CREATE TABLE TestTable AS
SELECT PersonID, City
FROM Persons;
SELECT * FROM TestTable;

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` char(2) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`customer_id`)
);
INSERT INTO `customer` VALUES (1,'Babara','MacCaffrey','1986-03-28','781-932-9754','0 Sage Terrace','Waltham','MA',2273);
INSERT INTO `customer` VALUES (2,'Ines','Brushfield','1986-04-13','804-427-9456','14187 Commercial Trail','Hampton','VA',947);
INSERT INTO `customer` VALUES (3,'Freddi','Boagey','1985-02-07','719-724-7869','251 Springs Junction','Colorado Springs','CO',2967);
INSERT INTO `customer` VALUES (4,'Ambur','Roseburgh','1974-04-14','407-231-8017','30 Arapahoe Terrace','Orlando','FL',457);
INSERT INTO `customer` VALUES (5,'Clemmie','Betchley','1973-11-07',NULL,'5 Spohn Circle','Arlington','TX',3675);
INSERT INTO `customer` VALUES (6,'Elka','Twiddell','1991-09-04','312-480-8498','7 Manley Drive','Chicago','IL',3073);
INSERT INTO `customer` VALUES (7,'Ilene','Dowson','1964-08-30','615-641-4759','50 Lillian Crossing','Nashville','TN',1672);
INSERT INTO `customer` VALUES (8,'Thacher','Naseby','1993-07-17','941-527-3977','538 Mosinee Center','Sarasota','FL',205);
INSERT INTO `customer` VALUES (9,'Romola','Rumgay','1992-05-23','559-181-3744','3520 Ohio Trail','Visalia','CA',1486);
INSERT INTO `customer` VALUES (10,'Levy','Mynett','1969-10-13','404-246-3370','68 Lawn Avenue','Atlanta','GA',796);

select * from customer;


/* IN and NOT IN */
/* Question: Fetch the details of the customers living in va, ma, or tn */

SELECT *
FROM customer
WHERE state IN  ('VA', 'MA', 'TN');

/* Question: Fetch the details of the customers living not in va, ma, or tn */

SELECT *
FROM customer
WHERE state NOT IN  ('VA', 'MA', 'TN');

/* Fetch the details of all the customers having points greater than 2000 and less than 3000 */

Select * 
from customer
where points between 2000 and 3000;

/* Using Order by */
Select * 
from customer
ORDER BY points DESC; 

/* Fetch the details of the most loyal customers, display only that name */
Select * 
from customer
ORDER BY points DESC LIMIT 1;

/* Fetch the details of the least loyal customers, display only that name */
Select * 
from customer
ORDER BY points ASC LIMIT 1;

/* Fetch the details of the second most loyal customers, display only that name */
Select * 
from customer
ORDER BY points DESC LIMIT 1,1; 

/* Fetch the details of the third to 6th loyal customers, display only that name */
Select * 
from customer
ORDER BY points DESC LIMIT 2,4; 
-- It means leave first two and display four rows

/* If there are any clashes for the first column for same data, system will take the second column name  to order for those specific rows */
Select * 
from customer
ORDER BY points, first_name; 


/* IS NULL operator*/
Select * 
from customer
where phone is null;

/* Suppose we want to match a few pattern, so in that case we can use regexp */
-- start of expression ^, END $, | Logical OR,
-- Fetch the details of customer where name is starting with A
Select * 
from customer
where first_name REGEXP '^a';

-- Fetch the details of customer where name is ending with R
Select * 
from customer
where first_name REGEXP 'a$';

-- Fetch the details of customer where name is starting with a and ending with R
Select * 
from customer
where first_name REGEXP '^a|r$';

