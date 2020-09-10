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
	VALUES(41, 'Active'),
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
(1035,'Sharmistha','Barasat', 7392819567,'Sharmi@gmail.com','2000-08-22','2016-04-20','2020-04-20',21,22,32,41),
(1040,'Suvam','Saltlake', 753672827,'Suvam9@gmail.com','2000-04-01','2015-04-20','2019-04-20', 21,20,32,44),
(1040,'Soumita','Laketown', 8398469508,'Soumitapaul@gmail.com','2000-12-14','2018-04-20','2022-04-20',21,22,33,40),
(1038,'Soham','Purulia', 9089786756,'soham@gmail.com','2000-02-05','2018-04-20','2022-04-20',22,21,34,41)

select * from dbo.Student
truncate table dbo.student

/* 1.	Select all the students who are active, sorted by studentid in descending order */

SELECT S.StudentId, S.StudentName, SS.StatusDesc
from dbo.Student as S
INNER JOIN dbo.StudentStatus as SS
ON S.StatusId = SS.StatusId
Where SS.StatusDesc='Active'
ORDER BY StudentId DESC;

/* StudentId	StudentName	StatusDesc
1038	Soham	Active
1035	Sharmistha	Active
1009	Debasree	Active */


/* 2.	Create a copy of the student table named student_copy only having records for CSE department students using SELECT INTO clause */

Select S.StudentId as StudentId, StudentName , D.DeptName as Department, StudentAddress, Phone, Email, DateOfBirth, DateOfAdmission, DateOfPassing, CourseId, BatchId, StatusId into Student_copy
from dbo.Student as S
inner join dbo.Department as D On D.DeptId=S.DeptId
where D.DeptName='CSE'

select * from dbo.Student_copy
DROP TABLE Student_copy


/* SStudentId	StudentName	Department	StudentAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	CourseId	BatchId	StatusId
1040	Sayan	CSE	Tollygaunge	9007392877	sayanbandyopadhyay9@gmail.com	2000-04-25	2018-04-20	2022-04-20	25	31	20
1094	Debdip	CSE	Madhyamgram	786756434	tatz9@gmail.com	2000-08-04	2018-04-20	2022-04-20	21	34	44
1041	Rohit	CSE	Dalhousie	9087392117	rohit@gmail.com	2000-10-23	2016-04-20	2020-04-20	22	32	45
1035	Sharmistha	CSE	Barasat	7392819567	Sharmi@gmail.com	2000-08-22	2016-04-20	2020-04-20	22	32	41
1040	Suvam	CSE	Saltlake	753672827	Suvam9@gmail.com	2000-04-01	2015-04-20	2019-04-20	20	32	44
1040	Soumita	CSE	Laketown	8398469508	Soumitapaul@gmail.com	2000-12-14	2018-04-20	2022-04-20	22	33	40 */

/* 3.	Select the count of students in each department only when the count is more than 2. */

select count(S.StudentId), D.DeptId
from dbo.Student as S
INNER JOIN dbo.Department as D
on S.DeptId=D.DeptId
Group by D.DeptId
having count(S.StudentId)>2

/* OUTPUT 

(No column name)	DeptId
6	21
3	22

*/

/* 4.	Insert two different sets of records in student and student_copy table. */

INSERT INTO dbo.Student(StudentId,StudentName,StudentAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,DeptId,CourseId,BatchId,StatusId)
VALUES (1111,'Arzanish','Matiaburuj', 7291672867,'nadeem@gmail.com','2000-09-30','2018-04-27','2022-04-29',22,23,31,42),
(1039,'Rupam','Sodhpur', 9287567567,'rups@gmail.com','1999-07-15','2017-04-20','2021-04-20',21,22,34,41)

INSERT INTO dbo.Student_copy(StudentId,StudentName,StudentAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,CourseId,BatchId,StatusId)
VALUES (1067,'Ratul','Durgapur', 7878098987,'rat@gmail.com','2000-03-10','2018-04-27','2022-04-29',24,30,43),
(1069,'Arif','Saltlake', 9897067892,'Arif@gmail.com','2000-06-05','2017-05-27','2021-05-29',25,34,43)

select * from dbo.Student_copy


/*  5.	Select the records from student table which are not present in student_copy table. */

select StudentId,StudentName,StudentAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,CourseId,BatchId,StatusId
from dbo.Student 
EXCEPT
select StudentId, StudentName, StudentAddress, Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,CourseId, BatchId,StatusId
FROM dbo.student_copy 

/* StudentId	StudentName	StudentAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	CourseId	BatchId	StatusId
1009	Debasree	Behala	9089786756	Debasree@gmail.com	2000-10-22	2018-04-20	2022-04-20	23	32	41
1011	Soumyadeep	Bali	7482791076	Soumya@gmail.com	2000-06-29	2018-04-20	2022-04-20	21	32	43
1038	Soham	Purulia	9089786756	soham@gmail.com	2000-02-05	2018-04-20	2022-04-20	21	34	41
1039	Avik	Barakpore	9087396877	avik@gmail.com	2000-07-15	2018-04-20	2022-04-20	27	32	42
1039	Rupam	Sodhpur	9287567567	rups@gmail.com	1999-07-15	2017-04-20	2021-04-20	22	34	41
1049	Shirsha	Birati	6286826378	shirsha@gmail.com	1999-12-14	2018-04-20	2022-04-20	21	31	42
1111	Arzanish	Matiaburuj	7291672867	nadeem@gmail.com	2000-09-30	2018-04-27	2022-04-29	23	31	42 */