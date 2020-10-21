/* 1.	Execute sp_helpconstraint on all the 10 tables and retrieve the foreign key details. */

EXECUTE sp_helpconstraint 'dbo.Student'

/* constraint_type	constraint_name	delete_action	update_action	status_enabled	status_for_replication	constraint_keys
FOREIGN KEY	FK_Student_Batch	No Action	No Action	Enabled	Is_For_Replication	BatchId
 	 	 	 	 	 	REFERENCES University.dbo.Batch (BatchId)
FOREIGN KEY	FK_Student_Course	No Action	No Action	Enabled	Is_For_Replication	CourseId
 	 	 	 	 	 	REFERENCES University.dbo.Course (CourseId)
FOREIGN KEY	FK_Student_Department	No Action	No Action	Enabled	Is_For_Replication	DeptId
 	 	 	 	 	 	REFERENCES University.dbo.Department (DeptId)
FOREIGN KEY	FK_Student_StudentStatus	No Action	No Action	Enabled	Is_For_Replication	StatusId
 	 	 	 	 	 	REFERENCES University.dbo.StudentStatus (StatusId) */

EXECUTE sp_helpconstraint 'dbo.Department'

/* Table is referenced by foreign key
University.dbo.Course: FK_Course_Department
University.dbo.Faculty: FK_Faculty_Department
University.dbo.Student: FK_Student_Department */

EXECUTE sp_helpconstraint 'dbo.Course'

/* Table is referenced by foreign key
University.dbo.CourSub: FK_CourSub_Course
University.dbo.Student: FK_Student_Course */ 

EXECUTE sp_helpconstraint 'dbo.Batch'

/* Table is referenced by foreign key
University.dbo.Exam: FK_Exam_Batch
University.dbo.Student: FK_Student_Batch */

EXECUTE sp_helpconstraint 'dbo.StudentStatus'

/* Table is referenced by foreign key
University.dbo.Student: FK_Student_StudentStatus */

EXECUTE sp_helpconstraint 'dbo.Faculty'

/* Table is referenced by foreign key
University.dbo.Subject: FK_Subject_Facultyid1
University.dbo.Subject: FK_Subject_Facultyid2 */

EXECUTE sp_helpconstraint 'dbo.Subject'

/* Table is referenced by foreign key
University.dbo.CourSub: FK_CourseSub_Subject */

EXECUTE sp_helpconstraint 'dbo.CourSub'

/* Table is referenced by foreign key
University.dbo.Exam: FK_Exam_CourSub */

EXECUTE sp_helpconstraint 'dbo.Exam'

/* Table is referenced by foreign key
University.dbo.ExamMarks: FK_ExamMarks_Exam */

EXECUTE sp_helpconstraint 'dbo.ExamMarks'

/* Table is referenced by foreign key
University.dbo.ExamMarks: FK_ExamMarks_Student */

/* 2.	Insert 5 records in each of the following tables: Student, Department, Course, Batch, Studentstatus, Faculty, Subject, CourSub , Exam, ExamMarks. */

	insert into dbo.Department (DeptId, DeptName)
	VALUES(101, 'CSE'),
	(102, 'ECE'),
	(103, 'MECH'),
	(104, 'BCA'),
	(105,'EE')

	/* 
(5 rows affected)

Completion time: 2020-10-20T12:23:15.6093412+05:30 */

insert into dbo.Course (CourseId, CourseName, DeptId)
	VALUES(201, 'CSE',101),
	(202, 'MTech',102),
	(203, 'BBA',103),
	(204, 'MBA',104),
	(205, 'BCA',105)


/* 
(5 rows affected)

Completion time: 2020-10-20T12:32:29.4938005+05:30 */

insert into dbo.Batch (BatchId, BatchName)
	VALUES(301, 'F1'),
	(302, 'F2'),
	(303, 'F3'),
	(304, 'BCS3B'),
	(305, 'BCS3A')

/* 
(5 rows affected)

Completion time: 2020-10-20T12:33:56.6738278+05:30 */

insert into dbo.StudentStatus (StatusId, StatusDesc)
	VALUES(401, 'Active'),
	(402, 'Sophomore'),
	(403, 'Third'),
	(404, 'Completed'),
	(405, 'Completed')

/* 
(5 rows affected)

Completion time: 2020-10-20T12:34:46.0490438+05:30 */

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

	/* 
(11 rows affected)

Completion time: 2020-10-20T12:39:25.7124983+05:30 */

insert into dbo.Faculty (FacultyName,DeptId)
values ('AAA', 101),
('BBB', 102),
('CCC', 103),
('DDD', 104),
('EEE', 105)

/* 
(5 rows affected)

Completion time: 2020-10-20T12:44:09.4178236+05:30 */

insert into dbo.Subject(SubjectName,Facultyid1,Facultyid2)
values
('Java', 1,1),
('C', 2,2),
('JavaScript', 2, 3),
('Ruby', 2, 3),
('Python', 5, 5)

/* 
(5 rows affected)

Completion time: 2020-10-20T12:47:47.4422749+05:30 */

insert into dbo.CourSub(CourseId,SubjectId)
	values(201,1),
	(202,2),
	(203,3),
	(204,4),
	(205,5)

select * from dbo.CourSub

/* CourSubId	CourseId	SubjectId
1	201	1
2	202	2
3	203	3
4	204	4
5	205	5 */

insert into dbo.Exam(CourSubId,ExamDate,BatchId,TotalMarks,PassMarks)
	values(1,'2020-11-03',301,100,45),
	(2,'2020-10-09',302,70,25),
	(3,'2020-12-20',303,20,4),
	(4,'2020-11-23',304,50,15),
	(5,'2020-10-10',305,40,10)


select * from dbo.Exam

/* 1	1	2020-11-03	301	100	45
2	2	2020-10-09	302	70	25
3	3	2020-12-20	303	20	4
4	4	2020-11-23	304	50	15
5	5	2020-10-10	305	40	10 */


insert into dbo.ExamMarks(ExamId, StudentID, Marks)
	values(1,1055, 85),
	(2,1040, 68),
	(3,1023, 5),
	(4,1024, 40),
	(5,1025, 40)

select * from dbo.ExamMarks

/* ExamMarksId	ExamId	StudentId	Marks
1	1	1055	85
2	2	1040	68
3	3	1023	5
4	4	1024	40
5	5	1025	40 */

