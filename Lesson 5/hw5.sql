
-- task 6

CREATE TABLE Patients
(ID          int identity (1,1) ,
first_name    NVARCHAR (100),
last_name     NVARCHAR (100),
SSN          UNIQUEIDENTIFIER DEFAULT NEWID(),
Email  AS CONCAT(UPPER(LEFT(first_name,1)),LOWER(LEFT(last_name,3)),'@mail.com'),
Temp         DECIMAL(3,1),
CreatedDate   DATE)
-- task 7
INSERT INTO Patients (first_name, last_name, SSN,Temp,CreatedDate)
VALUES ('Masha','Gessen',newid(),36.7,'2023-01-04'),
       ('Viktor','Panfilov',newid(),37.3,'2023-01-05'),
	   ('Sam','Smith',newid(),37.5,'2023-01-08')

	   SELECT * 
	   FROM dbo.Patients
 
 -- task 8
  ALTER table [dbo].[Patients]
  ADD TempType AS 
  CASE WHEN Temp> 37.0 then 'temp>37'
	   WHEN Temp<37.0 then 'temp<37'
  END
   SELECT * 
	   FROM dbo.Patients

-- task 9
CREATE VIEW Patients_v 
AS 
SELECT Temp as C, (Temp*9/5+32) as F
FROM [dbo].[Patients]

 SELECT C,F
 FROM [dbo].[Patients_v]

-- task 10
CREATE FUNCTION dbo.temperatura
(@temp_C DEC(3,1))
RETURNS DEC(5,2)
AS 
BEGIN
RETURN @temp_C*9/5+32;
END;
		
SELECT dbo.temperatura (40.3) TEMP_F;
		
--	 task 11

DECLARE @first_day_month DATETIME
SET  @first_day_month =DATEADD(m,DATEDIFF(m,0,GETDATE()),0)
SELECT @first_day_month AS first_day_of_month,
CASE WHEN DATEPART(dw,@first_day_month) = 6 THEN @first_day_month +2
WHEN DATEPART(dw,@first_day_month) = 7 THEN @first_day_month + 1
ELSE @first_day_month
END AS first_working_day;


