

DROP TABLE IF EXISTS data_for_merge2

CREATE TABLE data_for_merge2
(Function_name nvarchar(50)
,Function_count INT);




MERGE data_for_merge2 target
USING data_for_merge source ON target.Function_name=source.Alex
WHEN NOT MATCHED BY TARGET
	THEN INSERT (Function_name, Function_count)
	VALUES (source.Alex, 1);

MERGE data_for_merge2 target
USING data_for_merge source ON target.Function_name=source.Carlos
WHEN MATCHED 
	THEN UPDATE SET target.Function_count = target.Function_count+1
WHEN NOT MATCHED BY TARGET AND source.Carlos IS NOT NULL
THEN INSERT (Function_name, Function_count)
VALUES (source.Carlos, 1);

MERGE data_for_merge2 target
USING data_for_merge source ON target.Function_name=source.Charles
WHEN MATCHED 
	THEN UPDATE SET target.Function_count = target.Function_count+1
WHEN NOT MATCHED BY TARGET AND source.Charles IS NOT NULL
THEN INSERT (Function_name, Function_count)
VALUES (source.Charles, 1);

MERGE data_for_merge2 target
USING data_for_merge source ON target.Function_name=source.Daniel
WHEN MATCHED 
	THEN UPDATE SET target.Function_count = target.Function_count+1
WHEN NOT MATCHED BY TARGET AND source.Daniel IS NOT NULL
THEN INSERT (Function_name, Function_count)
VALUES (source.Daniel, 1);

MERGE data_for_merge2 target
USING data_for_merge source ON target.Function_name=source.Esteban
WHEN MATCHED 
	THEN UPDATE SET target.Function_count = target.Function_count+1
WHEN NOT MATCHED BY TARGET AND source.Esteban IS NOT NULL
THEN INSERT (Function_name, Function_count)
VALUES (source.Esteban, 1);

MERGE data_for_merge2 target
USING data_for_merge source ON target.Function_name=source.Fred
WHEN MATCHED 
	THEN UPDATE SET target.Function_count = target.Function_count+1
WHEN NOT MATCHED BY TARGET  AND source.Fred IS NOT NULL
THEN INSERT (Function_name, Function_count)
VALUES (source.Fred, 1);

MERGE data_for_merge2 target
USING data_for_merge source ON target.Function_name=source.George
WHEN MATCHED 
	THEN UPDATE SET target.Function_count = target.Function_count+1
WHEN NOT MATCHED BY TARGET AND source.George IS NOT NULL
THEN INSERT (Function_name, Function_count)
VALUES (source.George, 1);

MERGE data_for_merge2 target
USING data_for_merge source ON target.Function_name=source.Lando
WHEN MATCHED
	THEN UPDATE SET target.Function_count = target.Function_count+1
WHEN NOT MATCHED BY TARGET AND source.Lando IS NOT NULL
THEN INSERT (Function_name, Function_count)
VALUES (source.Lando, 1);

MERGE data_for_merge2 target
USING data_for_merge source ON target.Function_name=source.Lewis
WHEN MATCHED
	THEN UPDATE SET target.Function_count = target.Function_count+1
WHEN NOT MATCHED BY TARGET AND source.Lewis IS NOT NULL
THEN INSERT (Function_name, Function_count)
VALUES (source.Lewis, 1);

SELECT * FROM data_for_merge
SELECT * FROM data_for_merge2