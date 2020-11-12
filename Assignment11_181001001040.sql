-- SESSION 1

/* 1.	Open two new scripts and connect. Then, set the isolation level as Repeatable Read in both the sessions. */

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ

-- Output
/*
Commands completed successfully.

Completion time: 2020-11-12T11:51:37.6597773+05:30
*/

/*From Assignment 10

Q5.	In the first session write a transaction (within a try…catch block) 
	to select the name of the student with studentid = 1024, 
	then update marks value in ExamMarks table for all the records and then again, 
	the select statement to retrieve the name of the student with studentid = 1024. */


BEGIN TRY
	BEGIN TRANSACTION

		SELECT StudentName
		FROM dbo.Student
		WHERE StudentId=1024;

		UPDATE dbo.ExamMarks
		SET marks = marks + 3;

		SELECT StudentName
		FROM dbo.Student
		WHERE StudentId=1024;

	COMMIT TRANSACTION
END TRY

BEGIN CATCH
	SELECT 'Rollback'
	ROLLBACK TRANSACTION;
END CATCH

/*
From Assignment 10

Q7.	Execute the first script and immediately execute the second script. Record the output.
*/

/* -- Before
StudentName
Maji

-- After
StudentName
Maji
*/

/*

3.	Create a stored procedure named usp_getStudentData. It should have an input 
	parameter for deptName and output parameter as student count. 
	The ouput parameter should be populated with the number of students in the department as 
	sent as the deptname parameter. Also, retrieve the details of the faculties of CSE department who teaches Java.
*/

GO
CREATE PROCEDURE usp_getStudentData @DeptName VARCHAR(20), @studentCount INT OUTPUT
AS
BEGIN
	SELECT @studentCount = COUNT(StudentId) FROM dbo.Student s JOIN dbo.Department d on d.DeptId = s.DeptId WHERE d.DeptName = @DeptName;

	SELECT f.facultyId , f.facultyname
	FROM dbo.Faculty f
	JOIN dbo.Subject sub ON f.facultyId = sub.facultyId1 OR f.facultyId = sub.facultyId2
	JOIN dbo.Department d ON d.DeptId = f.deptid
	WHERE d.DeptName = 'CSE' AND sub.subjectname = 'Java';

	RETURN 1
END

-- Output
/*
Commands completed successfully.

Completion time: 2020-11-12T12:11:33.8576984+05:30
*/

/*
4.	Execute the stored procedure and print the output parameter and return value after execution.
*/

DECLARE @dept VARCHAR(20) = 'CSE'
DECLARE @count INT
DECLARE @ret INT

EXECUTE @ret = dbo.usp_getStudentData @dept , @count OUTPUT

SELECT 'Return Value', @ret
SELECT 'Count of Student' + @dept,@count

-- Output
/*
facultyId	facultyname
1	AAA

(No column name)	(No column name)
Return Value	1

(No column name)	(No column name)
Count of StudentCSE	2
*/


--  SESSION 2


/*
1.	Open two new scripts and connect. Then, set the isolation level as Repeatable Read in both the sessions.
*/

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ

/*
Output

Commands completed successfully.

Completion time: 2020-11-12T11:52:10.4107762+05:30
*/

/*
From Assignment 10


Q6.	In the second session, write a transaction (within a try…catch block) to update the name of the student with studentid = 5.
*/

BEGIN TRY
	BEGIN TRANSACTION

		UPDATE dbo.Student
		SET StudentName = 'Maji'
		WHERE StudentId = 1024

	COMMIT TRANSACTION
END TRY

BEGIN CATCH
	SELECT 'Rollback'
	ROLLBACK TRANSACTION
END CATCH

/*
(1 row affected)

Completion time: 2020-11-12T12:06:06.9849006+05:30
*/
