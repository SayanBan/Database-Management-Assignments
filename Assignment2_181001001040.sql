
/* 2.	Create the Student table again without the following columns: DeptName, CourseName, CurrentBatchName, StudentStatus */

create table dbo.Student
	( 
StudentId INT,
StName VARCHAR(100),
StAddress VARCHAR(200),
Phone NUMERIC(10,0),
Email VARCHAR(50),
DateOfBirth Date,
DateOfAdmission Date,
DateOfPassing Date
)

Select * from dbo.Student

/* OUTPUT 

StudentId	StName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing */


/* 3.	Alter the Student table to add a column named PresentAddress VARCHAR(200) */

ALTER TABLE dbo.Student
ADD PresentAddress VARCHAR(200);

select * from dbo.Student

/* OUTPUT 

StudentId	StName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	PresentAddress

*/

/* 4.	Create four master tables:
a.	Department (DeptId INT, DeptName VARCHAR(50))
b.	Course (CourseId INT, CourseName VARCHAR(50))
c.	Batch (BatchId INT, BatchName VARCHAR(50))
d.	StudentStatus (StatusId INT, StatusDesc VARCHAR(50)) */

CREATE TABLE dbo.Department
(
	DeptId INT, 
	DeptName VARCHAR(50)
)

SELECT * from dbo.Department

/* OUTPUT
DeptId	DeptName */

CREATE TABLE dbo.Course
(
	CourseId INT, 
	CourseName VARCHAR(50)
)

SELECT * from dbo.Course

/* OUTPUT

CourseId	CourseName 

*/

CREATE TABLE dbo.Batch
(
	BatchId INT, 
	BatchName VARCHAR(50)
)

SELECT * from dbo.Batch

/* OUTPUT
BatchId	BatchName
*/

CREATE TABLE dbo.StudentStatus
(
	StatusId INT, 
	StatusDesc VARCHAR(50)
)

SELECT * from dbo.StudentStatus

/* OUTPUT 
StatusId	StatusDesc
*/

/* 5.	Alter the Student table to include four new columns: DeptId, CourseId, BatchId, StatusId.*/

ALTER TABLE dbo.Student
ADD DeptId INT;

ALTER TABLE dbo.Student
ADD CourseId INT;

ALTER TABLE dbo.Student
ADD BatchId INT;

ALTER TABLE dbo.Student
ADD StatusId INT;

select * from dbo.Student

/* OUTPUT -

StudentId	StName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	PresentAddress	DeptId	CourseId	BatchId	StatusId  */

/* 6.	Insert 4 records in Department table.*/ 

insert into dbo.Department (DeptId, DeptName)
	VALUES(21, 'CSE'),
	(22, 'ECE'),
	(23, 'MECH'),
	(24, 'BCA')

SELECT * from dbo.Department

/* DeptId	DeptName
21	CSE
22	ECE
23	MECH
24	BCA
21	CSE
22	ECE
23	MECH
24	BCA

*/

/* 7.	Insert 4 records in Course table. */

insert into dbo.Course (CourseId, CourseName)
	VALUES(21, 'BTECH'),
	(22, 'MTech'),
	(23, 'BBA'),
	(24, 'MBA')

SELECT * from dbo.Course

/* OUTPUT 
CourseId	CourseName
21	BTECH
22	MTech
23	BBA
24	MBA
21	BTECH
22	MTech
23	BBA
24	MBA  */

/* 8.	Insert 4 records in Batch table. */

insert into dbo.Batch (BatchId, BatchName)
	VALUES(31, 'F1'),
	(32, 'F2'),
	(33, 'F3'),
	(34, 'F4')

SELECT * from dbo.Batch

/* OUTPUT 

BatchId	BatchName
31	F1
32	F2
33	F3
34	F4
31	F1
32	F2
33	F3
34	F4 */

/* 9.	Insert 4 records in StudentStatus table. */

insert into dbo.StudentStatus (StatusId, StatusDesc)
	VALUES(41, 'Freshman'),
	(42, 'Sophomore'),
	(43, 'Third'),
	(44, 'Senior')

SELECT * from dbo.StudentStatus

/* OUTPUT 

StatusId	StatusDesc
41	Freshman
42	Sophomore
43	Third
44	Senior
41	Freshman
42	Sophomore
43	Third
44	Senior */


/* 10.	Insert 10 records in the student table. DeptId, CourseId, BatchId, StatusId columns should have some data common with the master table data.
INSERT INTO <schema name.table name> (<column list>) 
VALUES (<value list>) */

INSERT INTO dbo.Student(StudentId,StName,StAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,DeptId,CourseId,BatchId,StatusId) 
values(1040,'Sayan','Tollygaunge', 9007392877,'sayanbandyopadhyay9@gmail.com','2000-04-25','2018-04-20','2022-04-20',21, 22, 31, 41 ),
(1039,'Avik','Barakpore', 9087396877,'avik@gmail.com','2000-07-15','2018-04-20','2022-04-20',22,23,32,42),
(1049,'Shirsha','Birati',6286826378,'shirsha@gmail.com','1999-12-14','2018-04-20','2022-04-20',23,21,31,42),
(1011,'Soumyadeep','Bali', 7482791076,'Soumya@gmail.com','2000-06-29','2018-04-20','2022-04-20',24,21,32,43),
(1009,'Debasree','Behala', 9089786756,'Debasree@gmail.com','2000-10-22','2018-04-20','2022-04-20',22,23,32,41),
(1094,'Debdip','Madhyamgram', 786756434,'tatz9@gmail.com','2000-08-04','2018-04-20','2022-04-20',21,21,32,44),
(1041,'Rohit','Dalhousie', 9087392117,'rohit@gmail.com','2000-10-23','2016-04-20','2020-04-20',21,22,32,43),
(1035,'Sharmistha','Barasat', 7392819567,'Sharmi@gmail.com','2000-08-22','2016-04-20','2020-04-20',21,22,32,43),
(1040,'Suvam','Saltlake', 753672827,'Suvam9@gmail.com','2000-04-01','2015-04-20','2019-04-20', 21,22,32,44),
(1040,'Soumita','Laketown', 8398469508,'Soumitapaul@gmail.com','2000-12-14','2018-04-20','2022-04-20',21,22,33,44),
(1009,'Soham','Purulia', 9089786756,'soham@gmail.com','2000-02-05','2018-04-20','2022-04-20',22,23,33,42)


select * from dbo.Student

/* OUTPUT 

StudentId	StName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	PresentAddress	DeptId	CourseId	BatchId	StatusId
1040	Sayan	Tollygaunge	9007392877	sayanbandyopadhyay9@gmail.com	2000-04-25	2018-04-20	2022-04-20	NULL	21	22	31	41
1039	Avik	Barakpore	9087396877	avik@gmail.com	2000-07-15	2018-04-20	2022-04-20	NULL	22	23	32	42
1049	Shirsha	Birati	6286826378	shirsha@gmail.com	1999-12-14	2018-04-20	2022-04-20	NULL	23	21	31	42
1011	Soumyadeep	Bali	7482791076	Soumya@gmail.com	2000-06-29	2018-04-20	2022-04-20	NULL	24	21	32	43
1009	Debasree	Behala	9089786756	Debasree@gmail.com	2000-10-22	2018-04-20	2022-04-20	NULL	22	23	32	41
1094	Debdip	Madhyamgram	786756434	tatz9@gmail.com	2000-08-04	2018-04-20	2022-04-20	NULL	21	21	32	44
1041	Rohit	Dalhousie	9087392117	rohit@gmail.com	2000-10-23	2016-04-20	2020-04-20	NULL	21	22	32	43
1035	Sharmistha	Barasat	7392819567	Sharmi@gmail.com	2000-08-22	2016-04-20	2020-04-20	NULL	21	22	32	43
1040	Suvam	Saltlake	753672827	Suvam9@gmail.com	2000-04-01	2015-04-20	2019-04-20	NULL	21	22	32	44
1040	Soumita	Laketown	8398469508	Soumitapaul@gmail.com	2000-12-14	2018-04-20	2022-04-20	NULL	21	22	33	44
1009	Soham	Purulia	9089786756	soham@gmail.com	2000-02-05	2018-04-20	2022-04-20	NULL	22	23	33	42
1040	Sayan	Tollygaunge	9007392877	sayanbandyopadhyay9@gmail.com	2000-04-25	2018-04-20	2022-04-20	NULL	21	22	31	41
1039	Avik	Barakpore	9087396877	avik@gmail.com	2000-07-15	2018-04-20	2022-04-20	NULL	22	23	32	42
1049	Shirsha	Birati	6286826378	shirsha@gmail.com	1999-12-14	2018-04-20	2022-04-20	NULL	23	21	31	42
1011	Soumyadeep	Bali	7482791076	Soumya@gmail.com	2000-06-29	2018-04-20	2022-04-20	NULL	24	21	32	43
1009	Debasree	Behala	9089786756	Debasree@gmail.com	2000-10-22	2018-04-20	2022-04-20	NULL	22	23	32	41
1094	Debdip	Madhyamgram	786756434	tatz9@gmail.com	2000-08-04	2018-04-20	2022-04-20	NULL	21	21	32	44
1041	Rohit	Dalhousie	9087392117	rohit@gmail.com	2000-10-23	2016-04-20	2020-04-20	NULL	21	22	32	43
1035	Sharmistha	Barasat	7392819567	Sharmi@gmail.com	2000-08-22	2016-04-20	2020-04-20	NULL	21	22	32	43
1040	Suvam	Saltlake	753672827	Suvam9@gmail.com	2000-04-01	2015-04-20	2019-04-20	NULL	21	22	32	44
1040	Soumita	Laketown	8398469508	Soumitapaul@gmail.com	2000-12-14	2018-04-20	2022-04-20	NULL	21	22	33	44
1009	Soham	Purulia	9089786756	soham@gmail.com	2000-02-05	2018-04-20	2022-04-20	NULL	22	23	33	42
1040	Sayan	Tollygaunge	9007392877	sayanbandyopadhyay9@gmail.com	2000-04-25	2018-04-20	2022-04-20	NULL	21	22	31	41
1039	Avik	Barakpore	9087396877	avik@gmail.com	2000-07-15	2018-04-20	2022-04-20	NULL	22	23	32	42
1049	Shirsha	Birati	6286826378	shirsha@gmail.com	1999-12-14	2018-04-20	2022-04-20	NULL	23	21	31	42
1011	Soumyadeep	Bali	7482791076	Soumya@gmail.com	2000-06-29	2018-04-20	2022-04-20	NULL	24	21	32	43
1009	Debasree	Behala	9089786756	Debasree@gmail.com	2000-10-22	2018-04-20	2022-04-20	NULL	22	23	32	41
1094	Debdip	Madhyamgram	786756434	tatz9@gmail.com	2000-08-04	2018-04-20	2022-04-20	NULL	21	21	32	44
1041	Rohit	Dalhousie	9087392117	rohit@gmail.com	2000-10-23	2016-04-20	2020-04-20	NULL	21	22	32	43
1035	Sharmistha	Barasat	7392819567	Sharmi@gmail.com	2000-08-22	2016-04-20	2020-04-20	NULL	21	22	32	43
1040	Suvam	Saltlake	753672827	Suvam9@gmail.com	2000-04-01	2015-04-20	2019-04-20	NULL	21	22	32	44
1040	Soumita	Laketown	8398469508	Soumitapaul@gmail.com	2000-12-14	2018-04-20	2022-04-20	NULL	21	22	33	44
1009	Soham	Purulia	9089786756	soham@gmail.com	2000-02-05	2018-04-20	2022-04-20	NULL	22	23	33	42
1040	Sayan	Tollygaunge	9007392877	sayanbandyopadhyay9@gmail.com	2000-04-25	2018-04-20	2022-04-20	NULL	21	22	31	41
1039	Avik	Barakpore	9087396877	avik@gmail.com	2000-07-15	2018-04-20	2022-04-20	NULL	22	23	32	42
1049	Shirsha	Birati	6286826378	shirsha@gmail.com	1999-12-14	2018-04-20	2022-04-20	NULL	23	21	31	42
1011	Soumyadeep	Bali	7482791076	Soumya@gmail.com	2000-06-29	2018-04-20	2022-04-20	NULL	24	21	32	43
1009	Debasree	Behala	9089786756	Debasree@gmail.com	2000-10-22	2018-04-20	2022-04-20	NULL	22	23	32	41
1094	Debdip	Madhyamgram	786756434	tatz9@gmail.com	2000-08-04	2018-04-20	2022-04-20	NULL	21	21	32	44
1041	Rohit	Dalhousie	9087392117	rohit@gmail.com	2000-10-23	2016-04-20	2020-04-20	NULL	21	22	32	43
1035	Sharmistha	Barasat	7392819567	Sharmi@gmail.com	2000-08-22	2016-04-20	2020-04-20	NULL	21	22	32	43
1040	Suvam	Saltlake	753672827	Suvam9@gmail.com	2000-04-01	2015-04-20	2019-04-20	NULL	21	22	32	44
1040	Soumita	Laketown	8398469508	Soumitapaul@gmail.com	2000-12-14	2018-04-20	2022-04-20	NULL	21	22	33	44
1009	Soham	Purulia	9089786756	soham@gmail.com	2000-02-05	2018-04-20	2022-04-20	NULL	22	23	33	42
1040	Sayan	Tollygaunge	9007392877	sayanbandyopadhyay9@gmail.com	2000-04-25	2018-04-20	2022-04-20	NULL	21	22	31	41
1039	Avik	Barakpore	9087396877	avik@gmail.com	2000-07-15	2018-04-20	2022-04-20	NULL	22	23	32	42
1049	Shirsha	Birati	6286826378	shirsha@gmail.com	1999-12-14	2018-04-20	2022-04-20	NULL	23	21	31	42
1011	Soumyadeep	Bali	7482791076	Soumya@gmail.com	2000-06-29	2018-04-20	2022-04-20	NULL	24	21	32	43
1009	Debasree	Behala	9089786756	Debasree@gmail.com	2000-10-22	2018-04-20	2022-04-20	NULL	22	23	32	41
1094	Debdip	Madhyamgram	786756434	tatz9@gmail.com	2000-08-04	2018-04-20	2022-04-20	NULL	21	21	32	44
1041	Rohit	Dalhousie	9087392117	rohit@gmail.com	2000-10-23	2016-04-20	2020-04-20	NULL	21	22	32	43
1035	Sharmistha	Barasat	7392819567	Sharmi@gmail.com	2000-08-22	2016-04-20	2020-04-20	NULL	21	22	32	43
1040	Suvam	Saltlake	753672827	Suvam9@gmail.com	2000-04-01	2015-04-20	2019-04-20	NULL	21	22	32	44
1040	Soumita	Laketown	8398469508	Soumitapaul@gmail.com	2000-12-14	2018-04-20	2022-04-20	NULL	21	22	33	44
1009	Soham	Purulia	9089786756	soham@gmail.com	2000-02-05	2018-04-20	2022-04-20	NULL	22	23	33	42   */



/* 11.	Write an inner join between Student and Department to retrieve the department name for all the students */

SELECT D.DeptName
FROM dbo.Student as S
INNER JOIN dbo.Department as D
ON S.DeptId=D.DeptId

/* 
DeptName
CSE
ECE
MECH
BCA
ECE
CSE
CSE
CSE
CSE
CSE
ECE
*/