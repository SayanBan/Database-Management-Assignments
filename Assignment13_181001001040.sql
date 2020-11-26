/*
	1.	Write a stored procedure named usp_getData to retrieve all the records from the four tables: Student, StudentBkup, ExamMarks, ExamMarksNew.
	Execute the procedure.
*/

IF OBJECT_ID('usp_getData','P') IS NOT NULL
DROP PROCEDURE dbo.usp_getData
GO

CREATE PROCEDURE dbo.usp_getData
AS
BEGIN

	SELECT *FROM dbo.Student
	SELECT *FROM dbo.StudentBkup
	SELECT TOP 10 *FROM dbo.ExamMarks
	SELECT *FROM dbo.ExamMarksNew

RETURN 1
END

DECLARE @ret INT
EXECUTE @ret = dbo.usp_getData 

/* Commands completed successfully.

Completion time: 2020-11-26T11:50:19.8597790+05:30

StudentID	StudentName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	AadharId	DeptId	CourseId	BatchId	StatusId
1020	Soumita	kolkata	9830044578	r@gmail.com	1999-05-11	2018-09-22	2022-05-30	12	103	201	303	403
1023	Soham	bihar	9090890989	jdfbs@nf.in	2001-09-11	2018-09-23	2022-07-30	55	103	203	303	403
1024	Maji	mumbai	9939449499	shuba@jdi.com	1998-11-27	2018-04-22	2022-08-29	8	104	204	304	404
1025	Samiran	kolkata	8947583904	kfnksd@nfg.vn	1999-08-11	2018-04-22	2022-08-29	5	104	201	303	404
1026	Sulagna	kolkata	9090890989	jdfbs@nf.in	2001-09-11	2018-09-23	2022-07-30	6	103	201	302	401
1027	Sharmistha	kolkata	9090890989	jdfbs@nf.in	2001-09-11	2018-09-23	2022-07-30	7	101	201	301	402
1028	Arzanish	midnapore	9939449499	shuba@jdi.com	1998-11-27	2018-04-22	2022-08-29	9	103	203	301	402
1029	debdip	kolkata	8947583904	kfnksd@nfg.vn	1999-08-11	2018-04-22	2022-08-29	10	103	203	304	402
1030	Joyeeta	kolkata	9090890989	jdfbs@nf.in	2001-09-11	2018-09-23	2022-07-30	11	103	201	303	402
1040	Sayan	kolkata	8947583904	kfnksd@nfg.vn	1999-08-11	2018-04-22	2022-08-29	111	102	202	302	402
1055	Debasree	delhi	9939449499	chand@jdi.com	1998-11-27	2018-04-22	2022-08-29	88	101	201	301	401


StudentBkupId	StudentId	StName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	DeptID	CourseId	BatchId	StatusId	AadharId
1	1023	Soham	bihar	9090890989	jdfbs@nf.in	2001-09-11	2018-09-23	2022-07-30	55	103	203	303	403
2	1023	A	bihar	9090890989	jdfbs@nf.in	2001-09-11	2018-09-23	2022-07-30	55	103	203	303	403
3	1023	A	bihar	9090890989	jdfbs@nf.in	2001-09-11	2018-09-23	2022-07-30	55	103	203	303	403
4	1023	A	bihar	9090890989	jdfbs@nf.in	2001-09-11	2018-09-23	2022-07-30	55	103	203	303	403
5	1025	Samiran	kolkata	8947583904	kfnksd@nfg.vn	1999-08-11	2018-04-22	2022-08-29	5	104	201	303	404
6	1023	A	bihar	9090890989	jdfbs@nf.in	2001-09-11	2018-09-23	2022-07-30	55	103	203	303	403
7	1023	A	bihar	9090890989	jdfbs@nf.in	2001-09-11	2018-09-23	2022-07-30	55	103	203	303	403

ExamMarksId	ExamId	StudentId	Marks
1	1	1055	113
2	2	1040	86
3	3	1023	23
4	4	1024	58
5	5	1025	58
6	1	1055	113
7	2	1040	86
8	3	1023	23
9	4	1024	58
10	5	1025	58


ExamMarksNewId	ExamMarksId	ExamId	StudentId	Marks
1	0	1	2019	50
2	0	1	2019	50
3	0	1	2019	50
4	0	1	2019	50
5	0	1	2019	50
6	0	1	2019	50
7	0	1	2019	50
*/

/*
	2.	Write a stored procedure named usp_setData to update and delete records from Student table. There will be insert and update of records in ExamMarks as well. 
	Execute the procedure.
*/

IF OBJECT_ID('usp_setData','P') IS NOT NULL
DROP PROCEDURE dbo.usp_setData
GO

CREATE PROCEDURE dbo.usp_setData
AS
BEGIN
update dbo.Student
set StudentName='A'
where StudentId=1023

delete from dbo.ExamMarks
where StudentId=1025

delete from dbo.Student
where StudentId=1025

insert into dbo.ExamMarks(ExamId,StudentId,Marks)
	values(1,2019,50)

update dbo.ExamMarks
set Marks=50
where StudentId=1026

RETURN 1
END

DECLARE @ret INT
EXECUTE @ret = dbo.usp_setData 

/* Commands completed successfully.

Completion time: 2020-11-26T12:56:40.6988243+05:30
*/

/*
	3.	Execute the procedure named usp_getData again and save the output.
*/

DECLARE @ret2 INT
EXECUTE @ret2 = dbo.usp_getData 

/* StudentID	StudentName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	AadharId	DeptId	CourseId	BatchId	StatusId
1020	Soumita	kolkata	9830044578	r@gmail.com	1999-05-11	2018-09-22	2022-05-30	12	103	201	303	403
1023	A	bihar	9090890989	jdfbs@nf.in	2001-09-11	2018-09-23	2022-07-30	55	103	203	303	403
1024	Maji	mumbai	9939449499	shuba@jdi.com	1998-11-27	2018-04-22	2022-08-29	8	104	204	304	404
1025	Samiran	kolkata	8947583904	kfnksd@nfg.vn	1999-08-11	2018-04-22	2022-08-29	5	104	201	303	404
1026	Sulagna	kolkata	9090890989	jdfbs@nf.in	2001-09-11	2018-09-23	2022-07-30	6	103	201	302	401
1027	Sharmistha	kolkata	9090890989	jdfbs@nf.in	2001-09-11	2018-09-23	2022-07-30	7	101	201	301	402
1028	Arzanish	midnapore	9939449499	shuba@jdi.com	1998-11-27	2018-04-22	2022-08-29	9	103	203	301	402
1029	debdip	kolkata	8947583904	kfnksd@nfg.vn	1999-08-11	2018-04-22	2022-08-29	10	103	203	304	402
1030	Joyeeta	kolkata	9090890989	jdfbs@nf.in	2001-09-11	2018-09-23	2022-07-30	11	103	201	303	402
1040	Sayan	kolkata	8947583904	kfnksd@nfg.vn	1999-08-11	2018-04-22	2022-08-29	111	102	202	302	402
1055	Debasree	delhi	9939449499	chand@jdi.com	1998-11-27	2018-04-22	2022-08-29	88	101	201	301	401

StudentBkupId	StudentId	StName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	DeptID	CourseId	BatchId	StatusId	AadharId
1	1023	Soham	bihar	9090890989	jdfbs@nf.in	2001-09-11	2018-09-23	2022-07-30	55	103	203	303	403
2	1023	A	bihar	9090890989	jdfbs@nf.in	2001-09-11	2018-09-23	2022-07-30	55	103	203	303	403
3	1023	A	bihar	9090890989	jdfbs@nf.in	2001-09-11	2018-09-23	2022-07-30	55	103	203	303	403
4	1023	A	bihar	9090890989	jdfbs@nf.in	2001-09-11	2018-09-23	2022-07-30	55	103	203	303	403
5	1025	Samiran	kolkata	8947583904	kfnksd@nfg.vn	1999-08-11	2018-04-22	2022-08-29	5	104	201	303	404
6	1023	A	bihar	9090890989	jdfbs@nf.in	2001-09-11	2018-09-23	2022-07-30	55	103	203	303	403
7	1023	A	bihar	9090890989	jdfbs@nf.in	2001-09-11	2018-09-23	2022-07-30	55	103	203	303	403

ExamMarksId	ExamId	StudentId	Marks
1	1	1055	113
2	2	1040	86
3	3	1023	23
6	1	1055	113
7	2	1040	86
8	3	1023	23
11	1	1055	113
12	2	1040	86
13	3	1023	23
16	1	1055	113

ExamMarksNewId	ExamMarksId	ExamId	StudentId	Marks
1	0	1	2019	50
2	0	1	2019	50
3	0	1	2019	50
4	0	1	2019	50
5	0	1	2019	50
6	0	1	2019	50
7	0	1	2019	50 */

/* 4.	Create a function to retrieve the student details of CSE department in BTech course and BCS3 batch who has obtained more 
		than 50 marks in the DBMS exam held between August 2020 and December 2020.*/

update dbo.Exam
set ExamDate = '2020-08-01'
where ExamId=1026

update dbo.Exam
set ExamDate = '2020-09-30'
where ExamId=1026

delete from dbo.ExamMarks
where ExamMarksId>10

IF OBJECT_ID('func1' ,'IF') IS NOT NULL
	DROP FUNCTION func1
GO

CREATE FUNCTION dbo.func1 (@cnt INT)
RETURNS TABLE
AS
RETURN
			--Declare @count INT
			SELECT st.StudentId,st.StudentName, DeptName, CourseName, Marks  
			from dbo.Student AS st
			JOIN ExamMarks em ON em.StudentId = st.StudentId
			JOIN Exam e ON e.ExamId = em.ExamId
			JOIN Course c ON c.CourseId = st.CourseId
			JOIN Department dp ON dp.DeptId = c.DeptId
			JOIN CourSub cs ON e.CourSubId = cs.CourSubId
			JOIN Subject sub ON cs.SubjectId = sub.SubjectId
		WHERE sub.SubjectName = 'Java' AND c.CourseName = 'CSE' AND dp.DeptName='CSE' AND em.Marks>=50 AND e.ExamDate>='2020-08-01' AND e.ExamDate<='2020-09-30'
GO

/* 

(1 row affected)

(1 row affected)

(0 rows affected)

Completion time: 2020-11-26T12:44:58.7239380+05:30*/ 


/*5.	Execute the function to retrieve the student details. */

SELECT StudentId,StudentName, DeptName, CourseName, Marks FROM dbo.func1(1)

/* StudentId	StudentName	DeptName	CourseName	Marks
	1055		Debasree		CSE			CSE		113		*/

/*6.	Create a function to find the total number of passed out students for a particular department and course. 
		Take department and course as input parameters. */

UPDATE dbo.Student
set StatusId=405
where StudentId=1020

IF OBJECT_ID('func2' ,'FN') IS NOT NULL
	DROP FUNCTION func2
GO

CREATE FUNCTION dbo.func2 (@course VARCHAR(10), @dept VARCHAR(10))
RETURNS INT
AS
BEGIN
	
	DECLARE @count INT
	
	SELECT @count = COUNT(StudentId) from dbo.Student AS st
			JOIN StudentStatus ss ON ss.StatusId=st.StatusId
			JOIN Course c ON c.CourseId = st.CourseId
			JOIN Department dp ON dp.DeptId = c.DeptId
		WHERE c.CourseName = @course AND dp.DeptName=@dept AND ss.StatusDesc='Completed'

	RETURN @count
END
GO

/*
Output:
		Commands completed successfully.
		Completion time: 2020-11-26T22:06:57.2772739+05:30
*/

/*7.	Execute the function from a SELECT statement. */

DECLARE @ret INT
EXECUTE @ret = dbo.func2 'CSE','CSE' 
SELECT @ret

SELECT dbo.func2('CSE','CSE')

/* (No column name)
		1	*/