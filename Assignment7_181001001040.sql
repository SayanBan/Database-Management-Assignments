/* 1. Drop and create Student and Department tables. Don’t create Primary key, unique key or foreign key constraints on the tables now. */

DROP TABLE dbo.Student, dbo.Department

/* Commands completed successfully.

Completion time: 2020-10-06T12:33:02.0566224+05:30 */


create table dbo.Student
(
    StudentID INT ,
	StudentName VARCHAR(100),
	StAddress VARCHAR(200),
	Phone NUMERIC(10,0),
	Email VARCHAR(50),
	DateOfBirth Date,
	DateOfAdmission Date,
	DateOfPassing Date,
	AadharId NUMERIC(16,0),
	DeptId INT,
	CourseId INT,
	BatchId INT,
	StatusId INT
	
)

create table Department 
(DeptId INT,
DeptName VARCHAR(50),
)

/* Commands completed successfully.

Completion time: 2020-10-06T12:14:59.3351515+05:30 */


/* 2.	Create clustered index on studentId column of Student table */

CREATE CLUSTERED INDEX IX_Student_StudentId ON dbo.Student(StudentId)

/* Commands completed successfully.

Completion time: 2020-10-06T12:16:05.0447054+05:30 */


/* 3.	Create unique clustered index on deptId column of Department table */

CREATE UNIQUE CLUSTERED INDEX II_DeptID_Department ON dbo.Department(DeptId)

/* Commands completed successfully.

Completion time: 2020-10-06T12:16:34.9363305+05:30 */



/* 4.	Create a nonclustered index on name, address columns of Student table only for the students whose address is Kolkata. */

CREATE NONCLUSTERED INDEX II_Student_StudentName_StudentAddress on dbo.Student(StudentName,StAddress)
where StAddress = 'Kolkata'

/*Commands completed successfully.

Completion time: 2020-10-06T12:22:49.4945499+05:30 */


/*5.	Drop and recreate the nonclustered index. Email and phone columns should be added as included columns. */

Drop index II_Student_StudentName_StudentAddress on dbo.Student
CREATE NONCLUSTERED INDEX II_Student_StudentName_StudentAddress on dbo.Student(StudentName,StAddress) include(Email,Phone)

/* Commands completed successfully.

Completion time: 2020-10-06T12:25:47.8182660+05:30 */


/* 6.	Insert 10 records in Student table and 4 records in Department table. */

insert into dbo.Student
   (StudentID,StudentName,StAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,AadharId,DeptId,CourseId,BatchId,StatusId)
 values(1055,'Debasree','delhi',9939449499,'chand@jdi.com','1998/11/27','2018/04/22','2022/08/29',88,101,201,301,401), 
       (1040,'Sayan','kolkata', 08947583904,'kfnksd@nfg.vn','1999/08/11','2018/04/22','2022/08/29',111,102,202,302,402), 
	   (1023,'Soham','bihar', 9090890989, 'jdfbs@nf.in',  '2001/09/11','2018/09/23','2022/07/30',55,103,203,303,403), 
	   (1024,'Soumya','mumbai',9939449499,'shuba@jdi.com','1998/11/27','2018/04/22','2022/08/29',8,104,204,304,404), 
	   (1025,'Samiran','kolkata',08947583904,'kfnksd@nfg.vn','1999/08/11','2018/04/22','2022/08/29',5,104,201,303,404), 
	   (1026,'Sulagna','kolkata',9090890989,'jdfbs@nf.in','2001/09/11','2018/09/23','2022/07/30',6,103,201,302,401), 
	   (1027,'Sharmistha','kolkata',9090890989,'jdfbs@nf.in','2001/09/11','2018/09/23','2022/07/30',7,101,201,301,402), 
	   (1028,'Arzanish','midnapore',9939449499,'shuba@jdi.com','1998/11/27','2018/04/22','2022/08/29',9,103,203,301,402), 
	   (1029,'debdip','kolkata',08947583904,'kfnksd@nfg.vn','1999/08/11','2018/04/22','2022/08/29',10,103,203,304,402), 
	   (1030,'Joyeeta','kolkata',9090890989,'jdfbs@nf.in','2001/09/11','2018/09/23','2022/07/30',11,103,201,303,402),
       (1020,'Soumita','kolkata',9830044578,'r@gmail.com','1999/05/11','2018/09/22','2022/05/30',12,103,201,303,403)


/* (11 rows affected)

Completion time: 2020-10-06T12:48:17.9284122+05:30 */


insert into dbo.Department (DeptId, DeptName)
	VALUES(101, 'CSE'),
	(102, 'ECE'),
	(103, 'MECH'),
	(104, 'BCA')

	/* 

(11 rows affected)

(4 rows affected)

Completion time: 2020-10-06T12:34:44.9723553+05:30 */


/* 7.	Create a view named vStudentDept to retrieve student id, studentname and departname by joining both the tables. WITH SCHEMABINDING option should be added. */

create view dbo.vStudentDept
with SCHEMABINDING as
SELECT S.StudentId, S.StudentName, D.DeptName
From dbo.Student As S
INNER JOIN dbo.Department AS D ON S.DeptId = D.DeptId
GO

/* Commands completed successfully.

Completion time: 2020-10-06T12:41:44.9447447+05:30 */


/* 8.	Retrieve Studentname and departname from vStudentDept view only for CSE department. */

SELECT StudentName,DeptName
FROM dbo.vStudentDept
WHERE DeptName='CSE'

/*  Sharmistha	CSE
	Debasree	CSE */

/* 9.	Create a unique clustered index on student id column of vStudentDept view.*/

Create UNIQUE CLUSTERED INDEX IX_VStudentDept_StudentId ON dbo.vStudentDept(StudentId)

/* Commands completed successfully.

Completion time: 2020-10-06T12:50:04.9082382+05:30 */


/* 10.	Create a nonclustered index on departname column of vStudentDept view.*/

CREATE NONCLUSTERED INDEX IX_vStudentDept_DeptName ON dbo.vStudentDept(DeptName)

/* Commands completed successfully.

Completion time: 2020-10-06T12:50:38.8981732+05:30 */

EXECUTE sp_help 'dbo.Student'
EXECUTE sp_help 'dbo.Department'
EXECUTE sp_help 'dbo.vStudentDept'