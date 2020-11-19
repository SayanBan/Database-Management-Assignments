/*Question 1 

(Create a table named StudentBkup having the same structure as Student. One identity primary key column to be added as studentBkupId. No other constraint needs to be created)*/

CREATE TABLE dbo.StudentBkup
(
	StudentBkupId INT IDENTITY(1,1),	
	StudentId INT NOT NULL,
	StName VARCHAR(100),
	StAddress VARCHAR(200),
	Phone NUMERIC(10,0),
	Email VARCHAR(50),
	DateOfBirth Date,
	DateOfAdmission Date,
	DateOfPassing Date,
	DeptID INT,
    CourseId INT,
    BatchId INT,
    StatusId INT,
	AadharId NUMERIC(16,0) NOT NULL,
	CONSTRAINT PK_stud_StudentBkupId PRIMARY KEY CLUSTERED (StudentBkupId)
)

select * from dbo.StudentBkup
/* 
Commands completed successfully.

Completion time: 2020-11-19T11:57:09.1359596+05:30
*/

/* Question 2 

(Create a table named ExamMarksNew having the same structure as ExamMarks. One identity primary key column to be added as examMarksNewId. No other constraint needs to be created)*/

CREATE TABLE ExamMarksNew
(
	ExamMarksNewId INT IDENTITY(1,1),
	ExamMarksId INT,
	ExamId INT, 
	StudentId INT,
	Marks INT,
	CONSTRAINT PK_ExamMarks_ExamMarksNewId PRIMARY KEY CLUSTERED (ExamMarksNewId)
)

/* Commands completed successfully.

Completion time: 2020-11-19T11:57:55.6563066+05:30
*/

SELECT *FROM ExamMarksNew

/*Question 3 

(Create a DML after trigger to insert the deleted/modified data from Student table to StudentBkup table every time a delete or update happen) */

IF OBJECT_ID('trigger1' ,'TR') IS NOT NULL
	DROP TRIGGER trigger1
GO

CREATE TRIGGER trigger1
ON dbo.Student 
AFTER  UPDATE, DELETE   
AS 
BEGIN
	SELECT 'Trigger called for student table data change'
	SELECT 'Data from the magic tables'
	INSERT INTO dbo.StudentBkup
	SELECT *FROM deleted
END
GO 

/* Commands completed successfully.

Completion time: 2020-11-19T12:01:31.3568613+05:30
*/

SELECT *FROM dbo.Student

/*Question 4 

(Create a DML instead of trigger to insert the data to be modified/added in ExamMarks table to ExamMarksNew table every time a update/insert happens on the table. There will be no change to the original table data)*/

IF OBJECT_ID('trigger2' ,'TR') IS NOT NULL
	DROP TRIGGER trigger2
GO

CREATE TRIGGER trigger2
ON dbo.ExamMarks
INSTEAD OF UPDATE, INSERT   
AS 
BEGIN
	INSERT INTO dbo.ExamMarksNew
	SELECT *FROM inserted
END
GO

/* Commands completed successfully.

Completion time: 2020-11-19T12:03:36.4646509+05:30
*/

sp_help 'ExamMarksNew'

/* OUTPUT
Name	Owner	Type	Created_datetime
ExamMarksNew	dbo	user table	2020-11-19 11:57:55.450

Column_name		Type	Computed	Length	Prec	Scale	Nullable	TrimTrailingBlanks	FixedLenNullInSource	Collation
ExamMarksNewId	int			no			4	10   		0    	no			(n/a)					(n/a)				NULL
ExamMarksId		int			no			4	10   		0    	yes			(n/a)					(n/a)				NULL
ExamId			int			no			4	10   		0    	yes			(n/a)					(n/a)				NULL
StudentId		int			no			4	10   		0    	yes			(n/a)					(n/a)				NULL
Marks			int			no			4	10   		0    	yes			(n/a)					(n/a)				NULL */


