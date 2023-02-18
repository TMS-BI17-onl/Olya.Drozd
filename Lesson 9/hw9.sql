DROP TABLE IF EXISTS [People];
CREATE TABLE [People]
	(
	[ID]			[int] IDENTITY(1,1) NOT NULL,
	[FirstName]		[nvarchar](50),
	[ParentName]	[nvarchar](50),
	[LastName]		[nvarchar](50),
	[ID_Father]		[int],
	[ID_Mother]		[int],

	CONSTRAINT [PK_People_ID] PRIMARY KEY ([ID])
	);


INSERT INTO [People]
VALUES
(N'Дмитрий',N'Николаевич',N'Иванов',5,6),
(N'Татьяна',N'Николаевна',N'Петрова',10,4),
(N'Глеб',N'Дмитриевич',N'Воронин',7,8),
(N'Максим',N'Николаевич',N'Верник',4,3),
(N'Николай',N'Дмитриевич',N'Иванов',3,10),
(N'Дмитрий',N'Максимович',N'Верник',4,5)

;
SELECT * FROM [People]

SELECT
	CONCAT(LEFT(SON.[FirstName],1),' ',LEFT(SON.[ParentName],1),' ',LEFT(SON.[LastName],1)) AS FIO_SON,
	CONCAT(LEFT(FATHER.[FirstName],1),' ',LEFT(FATHER.[ParentName],1),' ',LEFT(FATHER.[LastName],1)) AS FIO_FATHER
FROM [People] SON
	LEFT JOIN [People] FATHER
	ON SON.[ID_Father] = FATHER.[ID]
WHERE SON.[FirstName] = N'Дмитрий'