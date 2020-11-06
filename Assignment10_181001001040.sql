--Question 1.Increase passmarks value by 10 in Exam table for the Subject Java.Then, increase the marks value by 10 in ExamMarks table for the Subject Java for all the students whose status is active.Both these statements should be written within a transaction. 

BEGIN TRY

	BEGIN TRANSACTION

		UPDATE Exam
		SET PassMarks = PassMarks + 10
		FROM 
			Exam e JOIN CourSub cs ON e.CourSubId = cs.CourSubId
			JOIN Subject sub ON cs.SubjectId = sub.SubjectId
		WHERE sub.SubjectName = 'Java';

		UPDATE ExamMarks
		SET Marks = Marks + 10
		FROM 
			ExamMarks em JOIN Student s ON em.StudentId = s.StudentId
			JOIN Exam e ON e.ExamId = em.ExamId
			JOIN CourSub cs ON e.CourSubId = cs.CourSubId
			JOIN Subject sub ON cs.SubjectId = sub.SubjectId
			JOIN StudentStatus ss ON ss.StatusId = s.StatusId
		WHERE sub.SubjectName = 'Java' AND ss.StatusDesc = 'ACTIVE';

	COMMIT TRANSACTION

END TRY

BEGIN CATCH
	SELECT 'Rollback'
	ROLLBACK TRANSACTION;
END CATCH

/*
(1 row affected)

(4 rows affected)

Completion time: 2020-11-05T12:31:22.6202490+05:30
*/

--Question 2.Select the relevant records from both the tables before and after the transaction.

--Before:

SELECT ExamId, CourSubId,PassMarks
FROM Exam
/*
ExamId	CourSubId	PassMarks
1	1	55
2	2	25
3	3	4
4	4	15
5	5	10
*/

SELECT ExamMarksId,ExamId,StudentId,Marks
FROM ExamMarks
/*
ExamMarksId	ExamId	StudentId	Marks
1	1	1055	90
2	2	1040	73
3	3	1023	10
4	4	1024	45
5	5	1025	45
*/

--After:

SELECT ExamId,CourSubId,PassMarks
FROM Exam
/*
ExamId	CourSubId	PassMarks
1	1	65
2	2	35
3	3	14
4	4	25
5	5	20
*/
SELECT ExamMarksId,ExamId,StudentId,Marks
FROM ExamMarks
/*
ExamMarksId	ExamId	StudentId	Marks
1	1	1055	95
2	2	1040	78
3	3	1023	15
4	4	1024	50
5	5	1025	50
*/

--Question 3.Open two new scripts and connect. Then, set the isolation level as Read Committed in both the sessions.

SET TRANSACTION ISOLATION LEVEL READ COMMITTED
GO

/* Commands completed successfully.

Completion time: 2020-11-05T12:00:07.2049516+05:30 */


--Question 4.Insert around 80 lacs records in ExamMarks table.

INSERT INTO dbo.ExamMarks(ExamId,StudentId,Marks)
SELECT ExamId,StudentId,Marks
FROM dbo.ExamMarks

SELECT COUNT(*) FROM dbo.ExamMarks

/* 
5242880
*/

--SESSION 1

--Question 3.Open two new scripts and connect. Then, set the isolation level as Read Committed in both the sessions.

--session 1

SET TRANSACTION ISOLATION LEVEL READ COMMITTED
GO


/* Question 5.In the first session write a transaction (within a tryůcatch block) to select the name of the student with studentid = 1005, 
then update marks value in ExamMarks table for all the records and then again, the select statement to retrieve the name of the student with studentid = 5 */

--session 1
BEGIN TRY

BEGIN TRANSACTION;
Select StudentName from Student where StudentID=1023
Update
ExamMarks set Marks= Marks + 5
Select StudentName from Student where StudentID=1023

COMMIT TRANSACTION;
END TRY

BEGIN CATCH
	SELECT 'Rollback'
	ROLLBACK TRANSACTION;
END CATCH

--Question 7.Execute the first script and immediately execute the second script. Record the output.
/* 

--Session 1

Before
Deep

After
Soham */



--SESSION 2

--Question 3.Open two new scripts and connect. Then, set the isolation level as Read Committed in both the sessions.

--Session 2

SET TRANSACTION ISOLATION LEVEL READ COMMITTED
GO

/* Commands completed successfully.

Completion time: 2020-11-05T12:00:07.2049516+05:30 */


--Question 6.	In the second session, write a transaction (within a tryůcatch block) to update the name of the student with studentid = 1023.

--Session 2

BEGIN TRY

BEGIN TRANSACTION;
Update 
dbo.Student set StudentName= 'Soham' where StudentID=1023


COMMIT TRANSACTION;
END TRY

BEGIN CATCH
	SELECT 'Rollback'
	ROLLBACK TRANSACTION;
END CATCH

/* 
(1 row affected)

Completion time: 2020-11-05T13:08:34.7518557+05:30 */
