CREATE TABLE Linkedin (
	ID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Name NVARCHAR(MAX),
	Job_Title NVARCHAR(MAX),
	Location NVARCHAR(MAX),
	Skills NVARCHAR(MAX),
	URL NVARCHAR(MAX)
)
GO
-- Load the data from CSV file to SQL database
BULK INSERT Linkedin
FROM 'C:\Users\CuongHv\OneDrive\Applied-Semester-Project\output1.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = '","',
	ROWTERMINATOR = '0x0a',
	ERRORFILE = 'E:\ErrorRows.csv',
	TABLOCK
)
GO

-- Check the loaded data
SELECT * FROM Linkedin

-- Add new column ID 
ALTER TABLE Linkedin
ADD ID INT IDENTITY(1,1)
ALTER TABLE Linkedin ADD PRIMARY KEY (ID)

-- Clean data with some exceptions 
UPDATE Linkedin
SET Name = REPLACE(Name, '"', '')

UPDATE Linkedin
SET Name = REPLACE(Name, ' |', ',')

UPDATE Linkedin
SET Job_Title = REPLACE(Job_Title, '|', ',')

UPDATE Linkedin
SET Location = REPLACE(Location, ' |', ',')

UPDATE Linkedin
SET Skills = REPLACE(Skills, ' |', ',')

UPDATE Linkedin
SET URL = REPLACE(URL, '"', '')

DELETE FROM Linkedin WHERE Name='Name';
