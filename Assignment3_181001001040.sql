CREATE TABLE dbo.Student
(
	StudentId INT,
	StudentName VARCHAR(100),
	StudentAddress VARCHAR(200),
	Phone NUMERIC(10,0),
	Email VARCHAR(50),
	DateOfBirth Date,
	DateOfAdmission Date,
	DateOfPassing Date
)
SELECT * from dbo.Student

ALTER TABLE dbo.Student
	ADD PresentAddress VARCHAR(200);

CREATE TABLE dbo.Department
(
	DeptId INT,
	DeptName VARCHAR(50)
)

CREATE TABLE dbo.Course
(
	CourseId INT, 
	CourseName VARCHAR(50)
)

CREATE TABLE dbo.Batch
(
	BatchId INT, 
	BatchName VARCHAR(50)
)

CREATE TABLE dbo.StudentStatus
(
	StatusId INT, 
	StatusDesc VARCHAR(50)
)

ALTER TABLE dbo.Student
	ADD	DeptId INT,
		CourseId INT,
		BatchId INT,
		StatusId INT;

insert into dbo.Department (DeptId, DeptName)
	VALUES(21, 'CSE'),
	(22, 'ECE'),
	(23, 'MECH'),
	(24, 'BCA')
select * from dbo.Department

insert into dbo.Course (CourseId, CourseName)
	VALUES(21, 'CSE'),
	(22, 'MTech'),
	(23, 'BBA'),
	(24, 'MBA')
select * from dbo.Course
truncate table dbo.Course

insert into dbo.Batch (BatchId, BatchName)
	VALUES(31, 'F1'),
	(32, 'F2'),
	(33, 'F3'),
	(34, 'BCS3B')
select * from dbo.Batch
truncate table dbo.Batch

insert into dbo.StudentStatus (StatusId, StatusDesc)
	VALUES(41, 'Freshman'),
	(42, 'Sophomore'),
	(43, 'Third'),
	(44, 'Completed')
select * from dbo.StudentStatus
truncate table dbo.StudentStatus

INSERT INTO dbo.Student(StudentId,StudentName,StudentAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,DeptId,CourseId,BatchId,StatusId) 
values(1040,'Sayan','Tollygaunge', 9007392877,'sayanbandyopadhyay9@gmail.com','2000-04-25','2018-04-20','2022-04-20',21, 25, 31, 20 ),
(1039,'Avik','Barakpore', 9087396877,'avik@gmail.com','2000-07-15','2018-04-20','2022-04-20',22,27,32,42),
(1049,'Shirsha','Birati',6286826378,'shirsha@gmail.com','1999-12-14','2018-04-20','2022-04-20',23,21,31,42),
(1011,'Soumyadeep','Bali', 7482791076,'Soumya@gmail.com','2000-06-29','2018-04-20','2022-04-20',24,21,32,43),
(1009,'Debasree','Behala', 9089786756,'Debasree@gmail.com','2000-10-22','2018-04-20','2022-04-20',22,23,32,41),
(1094,'Debdip','Madhyamgram', 786756434,'tatz9@gmail.com','2000-08-04','2018-04-20','2022-04-20',21,21,34,44),
(1041,'Rohit','Dalhousie', 9087392117,'rohit@gmail.com','2000-10-23','2016-04-20','2020-04-20',21,22,32,45),
(1035,'Sharmistha','Barasat', 7392819567,'Sharmi@gmail.com','2000-08-22','2016-04-20','2020-04-20',21,22,32,43),
(1040,'Suvam','Saltlake', 753672827,'Suvam9@gmail.com','2000-04-01','2015-04-20','2019-04-20', 21,20,32,44),
(1040,'Soumita','Laketown', 8398469508,'Soumitapaul@gmail.com','2000-12-14','2018-04-20','2022-04-20',21,22,33,40),
(1009,'Soham','Purulia', 9089786756,'soham@gmail.com','2000-02-05','2018-04-20','2022-04-20',22,21,34,42)

select * from dbo.Student
truncate table dbo.student

/* START OF ASSIGNMENT 3 QUESTIONS */

/* 1.	Write a query to retrieve all the courses where there is no student. */ 

SELECT C.CourseId as C_CID, C.CourseName as C_CNAME, S.StudentId as S_SID, S.StudentName as S_SNAME, S.CourseId as S_CID
FROM dbo.Course as C
LEFT JOIN dbo.Student as S ON C.CourseId=S.CourseId
WHERE S.CourseId IS NULL

/* OUTPUT

C_CID	C_CNAME	S_SID	S_SNAME	S_CID
24	MBA	NULL	NULL	NULL

*/

/* 2.	Write a query to retrieve all the students having a status value not present in StudentStatus table. */

SELECT C.StatusId as C_StatusID, C.StatusDesc as C_StatusDesc, S.StudentId as S_SID, S.StudentName as S_SNAME, S.StatusId as S_CID
FROM dbo.Student as S
LEFT JOIN dbo.StudentStatus as C ON C.StatusId=S.StatusId
WHERE C.StatusId IS NULL

/* OUTPUT 
C_StatusID	C_StatusDesc	S_SID	S_SNAME	S_CID
NULL	NULL	1040	Sayan	20
NULL	NULL	1041	Rohit	45
NULL	NULL	1040	Soumita	40
*/

/* 3.	Select the student records with completed status for CSE Department and BCS3B batch */

SELECT S.StudentId as ID, S.StudentName as NAME, C.StatusDesc as StudentStatus, B.BatchName as BatchName, D.DeptName as Department
FROM dbo.Student as S
INNER JOIN dbo.Department as D ON D.DeptId = S.DeptId         --WHERE D.DeptName ='CSE'
INNER JOIN dbo.Batch as B ON B.BatchId = S.BatchId		      --WHERE B.BatchName = 'BCS3B'
INNER JOIN dbo.StudentStatus as C on C.StatusId = S.StatusId  --WHERE C.StatusDesc = 'Completed'
WHERE D.DeptName ='CSE' AND B.BatchName = 'BCS3B' AND C.StatusDesc = 'Completed'

/* OUTPUT 

ID	NAME	StudentStatus	BatchName	Department
1094	Debdip	Completed	BCS3B	CSE

*/


