--/****** Script for SelectTopNRows command from SSMS  ******/
--SELECT TOP (1000) [id_pdf]
--      ,[pdf]
--  FROM [sandbox].[dbo].[pdftester]

--  insert into pdftester(pdf)
--  select [Doc_Data].* from openrowset (bulk 'C:\Users\lrapp\Desktop\temp\666170_DMXDB-3.pdf', single_blob) [Doc_Data]


--  sp_configure 'show advanced options', 1;

--GO

--RECONFIGURE;

--GO

--sp_configure 'Ole Automation Procedures', 1;

--GO

--RECONFIGURE;

--GO

  DECLARE @outPutPath varchar(50) = 'C:\temp',

 @i bigint,
 @init int,
 @hr int,
 @fpath varchar(max),
 @src varchar(255),
  @desc varchar(255),
 @data varbinary(max);
   SELECT
   @data = pdf,
     @fpath = @outPutPath+'\test.pdf'
  FROM pdftester WHERE id_pdf = 2

EXEC sp_OACreate 'ADODB.Stream', @init OUTPUT; -- An instace created

EXEC sp_OASetProperty @init, 'Type', 1; 
EXEC sp_OAMethod @init, 'Open'; -- Calling a method
EXEC sp_OAMethod @init, 'Write', NULL, @data; -- Calling a method
EXEC sp_OAMethod @init, 'SaveToFile', NULL, @fpath, 2; -- Calling a method
EXEC sp_OAMethod @init, 'Close'; -- Calling a method
EXEC sp_OADestroy @init; -- Closed the resources

