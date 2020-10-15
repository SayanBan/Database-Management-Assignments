/* 1.	Drop and create Student and Department tables again. */


Drop table dbo.Student, dbo.Department
drop view vStudentDept


create table dbo.Student
(
    StudentID INT NOT NULL,
	StudentName VARCHAR(100),
	StAddress VARCHAR(200),
	Phone NUMERIC(10,0),
	Email VARCHAR(50),
	DateOfBirth Date,
	DateOfAdmission Date,
	DateOfPassing Date,
	AadharId NUMERIC(16,0) NOT NULL,
	DeptId INT,
	CourseId INT,
	BatchId INT,
	StatusId INT
	
)

create table Department 
(DeptId INT NOT NULL,
DeptName VARCHAR(50),
)

/* Commands completed successfully.

Completion time: 2020-10-15T12:16:44.2774156+05:30 */


/* 2.	Create Primary key on deptid column of Department and studentid column of Student table respectively. */

alter table dbo.Department
add constraint PK_Department_DeptId Primary KEY clustered (DeptId)

/* Commands completed successfully.

Completion time: 2020-10-15T12:17:09.2308467+05:30 */

alter table dbo.Student
add constraint PK_Student_StudentId Primary KEY clustered (StudentId)

/* alter table dbo.Student
add constraint PK_Student_StudentId Primary KEY clustered (StudentId) */


/*3.	Create the following tables with PK on the identity columns:
		a.	Faculty : facultyId INT IDENTITY, facultyname, deptid */

Create table dbo.Faculty
(
FacultyId INT IDENTITY (1,1) NOT NULL, 
FacultyName VARCHAR(50),
DeptId INT,
CONSTRAINT PK_Faculty_FacultyId PRIMARY KEY CLUSTERED (FacultyId)
)

/* Commands completed successfully.

Completion time: 2020-10-15T12:22:34.8100840+05:30 */

/* 
b.	Subject: subjectId INT IDENTITY, subjectname, facultyid1, facultyid2 */

Create table dbo.Subject
(
SubjectId INT IDENTITY (1,1) NOT NULL, 
SubjectName VARCHAR(50),
Facultyid1 INT,
Facultyid2 INT,
CONSTRAINT PK_Subject_SubjectId PRIMARY KEY CLUSTERED (SubjectId)
)

/* Command completed successfully

Completion time: 2020-10-15T12:29:35.9980577+05:30 */

/* c.	CourSub: courSubId INT IDENTITY, courseId INT, subjectId INT */

Create table dbo.CourSub
(
CourSubId INT IDENTITY (1,1) NOT NULL, 
CourseId INT,
SubjectId INT,
CONSTRAINT PK_CourSub_CourSubId PRIMARY KEY CLUSTERED (CourSubId)
)

/*  Commands completed successfully.

Completion time: 2020-10-15T12:30:21.0968559+05:30 */


/* d.	Exam: examId INT IDENTITY, courSubId, exam-date, batchId, totalmarks, passmarks */

Create table dbo.Exam
(
ExamId INT IDENTITY (1,1) NOT NULL, 
CourSubId INT, 
ExamDate date,
BatchId INT,
TotalMarks INT,
PassMarks INT,
CONSTRAINT PK_Exam_ExamId PRIMARY KEY CLUSTERED (ExamId)
)

/* Commands completed successfully.

Completion time: 2020-10-15T12:32:16.1820345+05:30 */

/* e.	ExamMarks: exammarksId INT IDENTITY, examId, studentId, marks */

Create table dbo.ExamMarks
(
ExamMarksId INT IDENTITY (1,1) NOT NULL, 
ExamId INT, 
StudentId INT,
Marks INT,
CONSTRAINT PK_ExamMarks_ExamMarksId PRIMARY KEY CLUSTERED (ExamMarksId)
)

/* Commands completed successfully.

Completion time: 2020-10-15T12:33:00.6453653+05:30 */


/* 4.	Add a new column deptId for Course table. */

ALTER TABLE dbo.Course
ADD DeptId INT

/*Commands completed successfully.

Completion time: 2020-10-15T12:41:07.5223652+05:30 */

/* 5.	Create the following relationships
a.	Course to Department */

ALTER TABLE dbo.Course
ADD CONSTRAINT FK_Course_Department FOREIGN KEY(DeptId)
REFERENCES dbo.Department(DeptId)

/* Commands completed successfully.

Completion time: 2020-10-15T12:42:40.4989132+05:30  */

/* b.	Student to Department, Course, Batch, StudentStatus */

ALTER TABLE dbo.Student
ADD CONSTRAINT FK_Student_Department FOREIGN KEY(DeptId)
REFERENCES dbo.Department(DeptId) 

/* Commands completed successfully.

Completion time: 2020-10-15T12:48:58.3263210+05:30 */

ALTER TABLE dbo.Student
ADD CONSTRAINT FK_Student_Course FOREIGN KEY(CourseId)
REFERENCES dbo.Course(CourseId)

/* Commands completed successfully.

Completion time: 2020-10-15T12:48:58.3263210+05:30 */

ALTER TABLE dbo.Student
ADD CONSTRAINT FK_Student_Batch FOREIGN KEY(BatchId)
REFERENCES dbo.Batch(BatchId)

/* Commands completed successfully.

Completion time: 2020-10-15T12:50:03.1921067+05:30 */

ALTER TABLE dbo.Student
ADD CONSTRAINT FK_Student_StudentStatus FOREIGN KEY(StatusId)
REFERENCES dbo.StudentStatus(StatusId)

/* Commands completed successfully.

Completion time: 2020-10-15T12:50:51.1105632+05:30 */


/* c.	Faculty to Department */

ALTER TABLE dbo.Faculty
ADD CONSTRAINT FK_Faculty_Department FOREIGN KEY(DeptId)
REFERENCES dbo.Department(DeptId)

/* Commands completed successfully.

Completion time: 2020-10-15T12:54:27.9014763+05:30*/

/*d.	Subject to Faculty */

ALTER TABLE dbo.Subject
ADD CONSTRAINT FK_Subject_Facultyid1 FOREIGN KEY(Facultyid1)
REFERENCES dbo.Faculty(FacultyId)

ALTER TABLE dbo.Subject
ADD CONSTRAINT FK_Subject_Facultyid2 FOREIGN KEY(Facultyid2)
REFERENCES dbo.Faculty(FacultyId)

/* Commands completed successfully.

Completion time: 2020-10-15T12:55:07.2784867+05:30 */


/* e.	CourSub to Course, Subject */

ALTER TABLE dbo.CourSub
ADD CONSTRAINT FK_CourSub_Course FOREIGN KEY(CourseId)
REFERENCES dbo.Course(CourseId)

ALTER TABLE dbo.CourSub
ADD CONSTRAINT FK_CourseSub_Subject FOREIGN KEY(SubjectId)
REFERENCES dbo.Subject(SubjectId)

/* Commands completed successfully.

Completion time: 2020-10-15T12:55:51.4362398+05:30 */


/* f.	Exam to CourSub, batch */

ALTER TABLE dbo.Exam
ADD CONSTRAINT FK_Exam_CourSub FOREIGN KEY(CourSubId)
REFERENCES dbo.CourSub(CourSubId)

ALTER TABLE dbo.Exam
ADD CONSTRAINT FK_Exam_Batch FOREIGN KEY(BatchId)
REFERENCES dbo.Batch(BatchId)

/*Commands completed successfully.

Completion time: 2020-10-15T12:57:00.2362907+05:30 */


/* g.	ExamMarks to Exam, Student*/

ALTER TABLE dbo.ExamMarks
ADD CONSTRAINT FK_ExamMarks_Exam FOREIGN KEY(ExamId)
REFERENCES dbo.Exam(ExamId)

ALTER TABLE dbo.ExamMarks
ADD CONSTRAINT FK_ExamMarks_Student FOREIGN KEY(StudentId)
REFERENCES dbo.Student(StudentId)

/* ALTER TABLE dbo.ExamMarks
ADD CONSTRAINT FK_ExamMarks_Exam FOREIGN KEY(ExamId)
REFERENCES dbo.Exam(ExamId)

ALTER TABLE dbo.ExamMarks
ADD CONSTRAINT FK_ExamMarks_Student FOREIGN KEY(StudentId)
REFERENCES dbo.Student(StudentId) */


EXECUTE sp_help 'dbo.Student'

