/* 
1.	Truncate data from all the five tables: Student, Department, Course, Batch, StudentStatus.
*/

truncate table dbo.Student
truncate table dbo.Batch
truncate table dbo.Course
truncate table dbo.Department
truncate table dbo.StudentStatus

/* OUTPUT 

Commands completed successfully.

Completion time: 2020-10-01T12:00:14.9357508+05:30 */


/* 2.	Create foreign key constraints on the following columns of Student table:
a.	DeptId -- references to DeptId of Department with ON DELETE CASCADE option
b.	CourseId -- references to CourseId of Course with ON UPDATE SET NULL option
c.	BatchId -- references to BatchId of Batch
d.	StatusId -- references to StatusId of Status */

alter table dbo.Student
add constraint FK_Student_DeptId FOREIGN KEY (DeptId)
References Department(DeptId) ON DELETE CASCADE;

alter table dbo.Student
add constraint FK_Student_CourseId FOREIGN KEY (CourseId)
References Course(CourseId) ON UPDATE SET NULL;

alter table dbo.Student
add constraint FK_Student_BatchId FOREIGN KEY (BatchId)
References Batch(BatchId) 

alter table dbo.Student
add constraint FK_Student_StatusId FOREIGN KEY (StatusId)
References StudentStatus(StatusId) 

/* OUTPUT 

Commands completed successfully.

Completion time: 2020-10-01T12:11:26.9317450+05:30 */


/* 3.	Insert 4 records in each of the four tables.
a.	DeptId values: 101,102,103,104
b.	CourseId values: 201,202,203,204
c.	BatchId values: 301,302,303,304
d.	StatusId values: 401,402,403,404 */

insert into dbo.Department (DeptId, DeptName)
	VALUES(101, 'CSE'),
	(102, 'ECE'),
	(103, 'MECH'),
	(104, 'BCA')


insert into dbo.Course (CourseId, CourseName)
	VALUES(201, 'BTECH'),
	(202, 'MTech'),
	(203, 'BBA'),
	(204, 'MBA')


insert into dbo.Batch (BatchId, BatchName)
	VALUES(301, 'F1'),
	(302, 'F2'),
	(303, 'F3'),
	(304, 'F4')


insert into dbo.StudentStatus (StatusId, StatusDesc)
	VALUES(401, 'Freshman'),
	(402, 'Sophomore'),
	(403, 'Third'),
	(404, 'Senior')

	/* OUTPUT 

	
(4 rows affected)

(4 rows affected)

(4 rows affected)

(4 rows affected)

Completion time: 2020-10-01T12:39:36.7545485+05:30

*/


/*4.	Insert 10 records in Student table. */

insert into dbo.Student
   (StudentID,StudentName,StudentAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,AadharId,DeptId,CourseId,BatchId,StatusId)
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

	   select * from dbo.Student
/*
(11 rows affected) */


/* 5.	Select records from Department and Student where DeptId = 101 */

select StudentID,StudentName,StudentAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,AadharId,DeptId,CourseId,BatchId,StatusId
from dbo.Student
where DeptId=101 

/* OUTPUT 

StudentID	StudentName	StudentAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	AadharId	DeptId	CourseId	BatchId	StatusId
1055	Debasree	delhi	9939449499	chand@jdi.com	1998-11-27	2018-04-22	2022-08-29	88	101	201	301	401
1027	Sharmistha	kolkata	9090890989	jdfbs@nf.in	2001-09-11	2018-09-23	2022-07-30	7	101	201	301	402 */

select DeptId,DeptName from dbo.Department
where DeptId=101

/* DeptId	DeptName
101	CSE */

/* 6.	Delete records from Department where DeptId = 101 and execute Select from Q.5 */

Delete from dbo.Department
where DeptId=101

/* 
(1 row affected)

Completion time: 2020-10-01T12:48:58.5778797+05:30 */

select StudentID,StudentName,StudentAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,AadharId,DeptId,CourseId,BatchId,StatusId
from dbo.Student
where DeptId=101

/* StudentID	StudentName	StudentAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	AadharId	DeptId	CourseId	BatchId	StatusId */


select DeptId,DeptName from dbo.Department
where DeptId=101

/* DeptId	DeptName */


/* 7.	Select records from Course and Student where CourseId = 201 */

select StudentID,StudentName,StudentAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,AadharId,DeptId,CourseId,BatchId,StatusId
from dbo.Student
where CourseId=201

/* StudentID	StudentName	StudentAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	AadharId	DeptId	CourseId	BatchId	StatusId
1025	Samiran	kolkata	8947583904	kfnksd@nfg.vn	1999-08-11	2018-04-22	2022-08-29	5	104	201	303	404
1026	Sulagna	kolkata	9090890989	jdfbs@nf.in	2001-09-11	2018-09-23	2022-07-30	6	103	201	302	401
1030	Joyeeta	kolkata	9090890989	jdfbs@nf.in	2001-09-11	2018-09-23	2022-07-30	11	103	201	303	402
1020	Soumita	kolkata	9830044578	r@gmail.com	1999-05-11	2018-09-22	2022-05-30	12	103	201	303	403 */


select CourseId,CourseName from dbo.Course
where CourseId=201

/* CourseId	CourseName
201	BTECH */

/* 8.	Update CourseId from 201 to 210 in Course table and execute Select from Q.7 */

Update dbo.Course
Set CourseId=210
Where CourseId=201

/* 
(1 row affected)

Completion time: 2020-10-01T13:02:44.5211680+05:30
 */

/* 9.	Select records from Batch and Student where BatchId = 301 */

select StudentID,StudentName,StudentAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,AadharId,DeptId,CourseId,BatchId,StatusId
from dbo.Student
where BatchId = 301

/* StudentID	StudentName	StudentAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	AadharId	DeptId	CourseId	BatchId	StatusId
1028	Arzanish	midnapore	9939449499	shuba@jdi.com	1998-11-27	2018-04-22	2022-08-29	9	103	203	301	402 */

select BatchId,BatchName from dbo.Batch
where BatchId=301

/* BatchId	BatchName
301	F1 */

/* 10.	Delete records from Batch where BatchId = 301 and execute Select from Q.9 */

Delete from dbo.Batch
where BatchId=301

/* Msg 547, Level 16, State 0, Line 207
The DELETE statement conflicted with the REFERENCE constraint "FK_Student_BatchId". The conflict occurred in database "University", table "dbo.Student", column 'BatchId'.
The statement has been terminated.

Completion time: 2020-10-01T13:06:22.4063416+05:30 */

select StudentID,StudentName,StudentAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,AadharId,DeptId,CourseId,BatchId,StatusId
from dbo.Student
where BatchId = 301

/* StudentID	StudentName	StudentAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	AadharId	DeptId	CourseId	BatchId	StatusId
1028	Arzanish	midnapore	9939449499	shuba@jdi.com	1998-11-27	2018-04-22	2022-08-29	9	103	203	301	402 */

select BatchId,BatchName from dbo.Batch
where BatchId=301
 
 /* BatchId	BatchName
301	F1 */