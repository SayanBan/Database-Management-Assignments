/* 1.	Drop all the five tables created so far ie, Student, Department, Course, Batch, StudentStatus.*/

drop table dbo.Student
drop table dbo.Batch
drop table dbo.Course
drop table dbo.Department
drop table dbo.StudentStatus

/* OUTPUT 
Commands completed successfully.

Completion time: 2020-09-24T12:58:46.4809299+05:30 */



/*2.	Create the Student table again with a new column AadharId NUMERIC(16,0). 
		StudentId and AadharId should be declared as NOT NULL. Create Primary key on studentid column and unique key on AadharId column.*/

CREATE TABLE dbo.Student
(
	StudentId INT NOT NULL,
	StudentName VARCHAR(100),
	StudentAddress VARCHAR(200),
	Phone NUMERIC(10,0),
	Email VARCHAR(50),
	DateOfBirth Date,
	DateOfAdmission Date,
	DateOfPassing Date,
	PresentAddress VARCHAR(200),
	DeptId INT,
	CourseId INT,
	BatchId INT,
	StatusId INT,
	AadharId NUMERIC(16,0) NOT NULL,
	CONSTRAINT UK_Student_AadharId UNIQUE (AadharId),
	CONSTRAINT PK_Student_StudentID Primary Key CLUSTERED(StudentID)
)

select * from dbo.Student

/* OUTPUT
StudentId	StudentName	StudentAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	PresentAddress	DeptId	CourseId	BatchId	StatusId	AadharId */


/* 3.	Create the below four tables again with primary key constraint on the id columns: 
a.	Department – DeptId
b.	Course – CourseId
c.	Batch -- BatchId 
d.	StudentStatus -- StatusId */

CREATE TABLE dbo.Department
(
	DeptId INT,
	DeptName VARCHAR(50),
	CONSTRAINT PK_Department_DeptId Primary Key CLUSTERED(DeptId)
)

CREATE TABLE dbo.Course
(
	CourseId INT, 
	CourseName VARCHAR(50),
	CONSTRAINT PK_Course_CourseId Primary Key CLUSTERED(CourseId)
)

CREATE TABLE dbo.Batch
(
	BatchId INT, 
	BatchName VARCHAR(50),
	CONSTRAINT PK_Batch_BatchId Primary Key CLUSTERED(BatchId)
)

CREATE TABLE dbo.StudentStatus
(
	StatusId INT, 
	StatusDesc VARCHAR(50),
	CONSTRAINT PK_StudentStatus_StatusId Primary Key CLUSTERED(StatusId)
)

/* Commands completed successfully.

Completion time: 2020-09-24T12:59:53.2717189+05:30 */


/* 4.	Insert 4 records in each of the four tables. */

insert into dbo.Department (DeptId, DeptName)
	VALUES(21, 'CSE'),
	(22, 'ECE'),
	(23, 'MECH'),
	(24, 'BCA')

insert into dbo.Course (CourseId, CourseName)
	VALUES(21, 'CSE'),
	(22, 'MTech'),
	(23, 'BBA'),
	(24, 'MBA')

insert into dbo.Batch (BatchId, BatchName)
	VALUES(31, 'F1'),
	(32, 'F2'),
	(33, 'F3'),
	(34, 'BCS3B')

insert into dbo.StudentStatus (StatusId, StatusDesc)
	VALUES(41, 'Active'),
	(42, 'Sophomore'),
	(43, 'Third'),
	(44, 'Completed')
	
/* OUTPUT 


(4 rows affected)

(4 rows affected)

(4 rows affected)

(4 rows affected)

Completion time: 2020-09-24T12:19:43.9074005+05:30 */

/* 5.	Insert 10 records in Student table. */


INSERT INTO dbo.Student(StudentId,StudentName,StudentAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,DeptId,CourseId,BatchId,StatusId,AadharId) 
values(1040,'Sayan','Tollygaunge', 9007392877,'sayanbandyopadhyay9@gmail.com','2000-04-25','2018-04-20','2022-04-20',21, 25, 31, 20,1223987678675645 ),
(1039,'Avik','Barakpore', 9087396877,'avik@gmail.com','2000-07-15','2018-04-20','2022-04-20',22,27,32,42, 1526738261723636),
(1049,'Shirsha','Birati',6286826378,'shirsha@gmail.com','1999-12-14','2018-04-20','2022-04-20',23,21,31,42, 1720983657879878),
(1011,'Soumyadeep','Bali', 7482791076,'Soumya@gmail.com','2000-06-29','2018-04-20','2022-04-20',24,21,32,43, 4455665544778899),
(1009,'Debasree','Behala', 9089786756,'Debasree@gmail.com','2000-10-22','2018-04-20','2022-04-20',22,23,32,41, 7787996900761125),
(1094,'Debdip','Madhyamgram', 786756434,'tatz9@gmail.com','2000-08-04','2018-04-20','2022-04-20',21,21,34,44,5156787865431234),
(1041,'Rohit','Dalhousie', 9087392117,'rohit@gmail.com','2000-10-23','2016-04-20','2020-04-20',21,22,32,45,1240987658679989),
(1035,'Sharmistha','Barasat', 7392819567,'Sharmi@gmail.com','2000-08-22','2016-04-20','2020-04-20',21,22,32,41,0098998777656654),
(1090,'Suvam','Saltlake', 753672827,'Suvam9@gmail.com','2000-04-01','2015-04-20','2019-04-20', 21,20,32,44,1625384759680987),
(1048,'Soumita','Laketown', 8398469508,'Soumitapaul@gmail.com','2000-12-14','2018-04-20','2022-04-20',21,22,33,40,7615237856986565),
(1038,'Soham','Purulia', 9089786756,'soham@gmail.com','2000-02-05','2018-04-20','2022-04-20',22,21,34,41,7767565649678834)

/* OUTPUT

(11 rows affected)

Completion time: 2020-09-24T12:25:53.0646576+05:30 */

/* 6.	Alter the Student table to add a new column named studenttype CHAR(1). It should be Not NULL and default value is ‘R’. Possible values are ‘R’ , ‘P’ and ‘C’. */

Alter table dbo.student 
Add StudentType Char(1) NOT NULL Default('R');

/* OUTPUT

Commands completed successfully.

Completion time: 2020-09-24T12:46:28.0585039+05:30a */


/*7.	Create a Check constraint on studenttype column in Student table to restrict the values only to ‘R’ , ‘P’ and ‘C’.*/

alter table dbo.Student
ADD Constraint CHK_STudentType_Student
Check(StudentType='R' OR StudentType='P' OR StudentType='C');

/* OUTPUT 
Commands completed successfully.

Completion time: 2020-09-24T12:46:52.9669321+05:30
*/

select * from dbo.Student

sp_help 'dbo.Student' 