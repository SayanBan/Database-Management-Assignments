--1.Create a Database "UNIVERSITY"
--2. Create a Table “Student” in Database “UNIVERSITY”

create table dbo.Student
	( 
StudentId INT,
StName VARCHAR(100),
StAddress VARCHAR(200),
Phone NUMERIC(10,0),
Email VARCHAR(50),
DateOfBirth Date,
DateOfAdmission Date,
DateOfPassing Date,
DeptName VARCHAR(50),
CourseName VARCHAR(50),
BatchName VARCHAR(10),
StudentStatus VARCHAR(10) -- StudentStatus possible values are: active, left, incomplete.
)

/*output:
Commands completed successfully
Completion time: 2020-08-20T17:58:37.3629232+05:30 */

--3.Display the content of the table


select * from dbo.Student

/*output:
StudentID		StudentName		StAddress	Phone		Email		DateOfBirth			DateOfAdmission			DateOfPassing			DeptName		CourseName		BatchName	StudentStatus
*/

--4.Insert Values into the table 

INSERT INTO dbo.Student(StudentId,StName,StAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,DeptName,CourseName,BatchName,StudentStatus) values(1040,'Sayan','Tollygaunge', 9007392877,'sayanbandyopadhyay9@gmail.com','2000-04-25','2018-04-20','2022-04-20','cse','cse','bcs3a','active'),
(1039,'Avik','Barakpore', 9087396877,'avik@gmail.com','2000-07-15','2018-04-20','2022-04-20','cse','cse','bcs3a','incomplete'),
(1049,'Shirsha','Birati',6286826378,'shirsha@gmail.com','1999-12-14','2018-04-20','2022-04-20','cse','cse','bcs3a','incomplete'),
(1011,'Soumyadeep','Bali', 7482791076,'Soumya@gmail.com','2000-06-29','2018-04-20','2022-04-20','cse','cse','bcs3a','incomplete'),
(1009,'Debasree','Behala', 9089786756,'Debasree@gmail.com','2000-10-22','2018-04-20','2022-04-20','cse','cse','bcs3a','incomplete'),
(1094,'Debdip','Madhyamgram', 786756434,'tatz9@gmail.com','2000-08-04','2018-04-20','2022-04-20','cse','cse','bcs3a','incomplete'),
(1041,'Rohit','Dalhousie', 9087392117,'rohit@gmail.com','2000-10-23','2016-04-20','2020-04-20','cse','cse','bcs3a','completed'),
(1035,'Sharmistha','Barasat', 7392819567,'Sharmi@gmail.com','2000-08-22','2016-04-20','2020-04-20','cse','cse','bcs3a','completed'),
(1040,'Suvam','Saltlake', 753672827,'Suvam9@gmail.com','2000-04-01','2015-04-20','2019-04-20','cse','cse','bcs3a','completed'),
(1040,'Soumita','Laketown', 8398469508,'Soumitapaul@gmail.com','2000-12-14','2018-04-20','2022-04-20','cse','cse','bcs3a','incomplete'),
(1009,'Soham','Purulia', 9089786756,'soham@gmail.com','2000-02-05','2018-04-20','2022-04-20','cse','cse','bcs3a','incomplete')

/*output: 
(11 rows affected)

Completion time: 2020-08-20T18:23:37.7899250+05:30
*/
select * from dbo.Student

--5.Update all the records set StudentStatus as completed where BatchName = 'BCS3A'

UPDATE dbo.Student
SET StudentStatus= 'Completed'
WHERE BatchName = 'bcs3a'

/*
(10 rows affected)

Completion time: 2020-08-20T18:25:53.2454604+05:30
*/

--6.Delete the records from Student table where StudentId = ' '

DELETE FROM dbo.Student
WHERE StudentId = 1039

/*(1 row affected)

Completion time: 2020-08-20T18:27:13.5371236+05:30
*/


--7.Select all the records from the Student Table

SELECT Phone
FROM dbo.Student

/*
Phone
9007392877
6286826378
7482791076
9089786756
786756434
9087392117
7392819567
753672827
8398469508
9089786756
*/

--8.Select the records from the student table where StudentStatus is not completed

SELECT StudentId
FROM dbo.Student
WHERE StudentStatus != 'completed'

/*
StudentId
1040
1049
1011
1009
1094
1040
1009
*/

--9.	Truncate the table and select all the records from the table.

TRUNCATE TABLE dbo.Student
select * from dbo.Student

/* StudentId	StName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	DeptName	CourseName	BatchName	StudentStatus */

--10. Drop the Student table
drop table dbo.Student
/*Commands completed successfully.

Completion time: 2020-08-20T18:44:25.8930742+05:30
*/
