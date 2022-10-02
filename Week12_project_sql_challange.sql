1.Create new schema as alumni.
CREATE DATABASE alumni;

2.Import all .csv files into MySQL
Step1: right-click the alumni DB. 
Step2: select "table data import wizard"
Step3: select the csv file to import. 

USE alumni;
3.Run SQL command to see the structure of six tables
DESC college_a_hs;
DESC college_a_se;
DESC college_a_sj;
DESC college_b_hs;
DESC college_b_se;
DESC college_b_sj;

4.Display first 1000 rows of tables (College_A_HS, College_A_SE, College_A_SJ, College_B_HS, College_B_SE,
 College_B_SJ) with Python. 
import mysql.connector
testdb = mysql.connector.connect(host="localhost", user="root", password="root", database="alumni")
testcursor = testdb.cursor()

testcursor.execute("SELECT * FROM college_a_hs LIMIT 1000")
for i in testcursor:
    print(i)

testcursor.execute("SELECT * FROM college_a_se LIMIT 1000")
for i in testcursor:
    print(i)

testcursor.execute("SELECT * FROM college_a_sj LIMIT 1000")
for i in testcursor:
    print(i)

testcursor.execute("SELECT * FROM college_a_hs LIMIT 1000")
for i in testcursor:
    print(i)

testcursor.execute("SELECT * FROM college_a_se LIMIT 1000")
for i in testcursor:
    print(i)

testcursor.execute("SELECT * FROM college_a_sj LIMIT 1000")
for i in testcursor:
    print(i)
    
5.Import first 1500 rows of tables (College_A_HS, College_A_SE, College_A_SJ, College_B_HS, College_B_SE, 
College_B_SJ) into MS Excel.
STEP1: Double click the connect on msexcel right panel. Then select the sakila database and tableS College_A_HS, College_A_SE, College_A_SJ, College_B_HS, College_B_SE, 
College_B_SJ in alumni database to import. 
STEP2: click the Import MySQL Data button. The Import Data window will appear.
STEP3: make sure to check the box for limit 1500 row and start with 1. 
STEP4: then click on import after selecting the table.

6.Perform data cleaning on table College_A_HS and store cleaned data in view College_A_HS_V, Remove null values.
CREATE VIEW College_A_HS_V AS
SELECT * FROM college_a_hs WHERE (RollNo IS NOT NULL) AND (LastUpdate IS NOT NULL) AND (Name IS NOT NULL) AND
(FatherName IS NOT NULL) AND (MotherName IS NOT NULL) AND (Batch IS NOT NULL) AND (Degree IS NOT NULL) AND
(PresentStatus IS NOT NULL) AND (HSDegree IS NOT NULL) AND (EntranceExam IS NOT NULL) AND (Institute IS NOT NULL)
AND (Location IS NOT NULL);

7.Perform data cleaning on table College_A_SE and store cleaned data in view College_A_SE_V, Remove null values.
CREATE VIEW College_A_SE_V AS
SELECT * FROM college_a_se WHERE (RollNo IS NOT NULL) AND (LastUpdate IS NOT NULL) AND (Name IS NOT NULL) AND
(FatherName IS NOT NULL) AND (MotherName IS NOT NULL) AND (Batch IS NOT NULL) AND (Degree IS NOT NULL) AND
(PresentStatus IS NOT NULL) AND (Organization IS NOT NULL) AND (Location IS NOT NULL);

8.Perform data cleaning on table College_A_SJ and store cleaned data in view College_A_SJ_V, Remove null values.
CREATE VIEW College_A_SJ_V AS
SELECT * FROM college_a_sj WHERE (RollNo IS NOT NULL) AND (LastUpdate IS NOT NULL) AND (Name IS NOT NULL) AND
(FatherName IS NOT NULL) AND (MotherName IS NOT NULL) AND (Batch IS NOT NULL) AND (Degree IS NOT NULL) AND
(PresentStatus IS NOT NULL) AND (Organization IS NOT NULL) AND (Designation IS NOT NULL) AND (Location IS NOT NULL);

9.Perform data cleaning on table College_B_HS and store cleaned data in view College_B_HS_V, Remove null values.
CREATE VIEW College_B_HS_V AS
SELECT * FROM college_b_hs WHERE (RollNo IS NOT NULL) AND (LastUpdate IS NOT NULL) AND (Name IS NOT NULL) AND
(FatherName IS NOT NULL) AND (MotherName IS NOT NULL) AND (Branch IS NOT NULL) AND (Batch IS NOT NULL) AND 
(Degree IS NOT NULL) AND (PresentStatus IS NOT NULL) AND (HSDegree IS NOT NULL) AND (EntranceExam IS NOT NULL) AND 
(Institute IS NOT NULL) AND (Location IS NOT NULL);

10.Perform data cleaning on table College_B_SE and store cleaned data in view College_B_SE_V, Remove null values.
CREATE VIEW College_B_SE_V AS
SELECT * FROM college_b_se WHERE (RollNo IS NOT NULL) AND (LastUpdate IS NOT NULL) AND (Name IS NOT NULL) AND
(FatherName IS NOT NULL) AND (MotherName IS NOT NULL) AND (Branch IS NOT NULL) AND (Batch IS NOT NULL) AND 
(Degree IS NOT NULL) AND (PresentStatus IS NOT NULL) AND (Organization IS NOT NULL) AND (Location IS NOT NULL);

11.Perform data cleaning on table College_B_SJ and store cleaned data in view College_B_SJ_V.
CREATE VIEW College_B_SJ_V AS
SELECT * FROM college_b_sj WHERE (RollNo IS NOT NULL) AND (LastUpdate IS NOT NULL) AND (Name IS NOT NULL) AND
(FatherName IS NOT NULL) AND (MotherName IS NOT NULL) AND (Branch IS NOT NULL) AND (Batch IS NOT NULL) AND 
(Degree IS NOT NULL) AND (PresentStatus IS NOT NULL) AND (Organization IS NOT NULL) AND (Designation IS NOT NULL)
AND (Location IS NOT NULL);

12.Make procedure to use string function/s for converting record of Name, FatherName, MotherName into lower case for 
views (College_A_HS_V, College_A_SE_V, College_A_SJ_V, College_B_HS_V, College_B_SE_V, College_B_SJ_V) 

DELIMITER $$
CREATE PROCEDURE lower_case_College_A_HS_V()
BEGIN
UPDATE College_A_HS_V SET Name = LOWER(Name), FatherName =LOWER(FatherName), MotherName=LOWER(MotherName);
END $$
DELIMITER ;
CALL lower_case_College_A_HS_V();
SELECT * FROM College_A_HS_V;

DELIMITER $$
CREATE PROCEDURE lower_case_College_A_SE_V()
BEGIN
UPDATE College_A_SE_V SET Name = LOWER(Name), FatherName =LOWER(FatherName), MotherName=LOWER(MotherName);
END $$
DELIMITER ;
CALL lower_case_College_A_SE_V();
SELECT * FROM College_A_SE_V;

DELIMITER $$
CREATE PROCEDURE lower_case_College_A_SJ_V()
BEGIN
UPDATE College_A_SJ_V SET Name = LOWER(Name), FatherName =LOWER(FatherName), MotherName=LOWER(MotherName);
END $$
DELIMITER ;
CALL lower_case_College_A_SJ_V();
SELECT * FROM College_A_SJ_V;

DELIMITER $$
CREATE PROCEDURE lower_case_College_B_HS_V()
BEGIN
UPDATE College_B_HS_V SET Name = LOWER(Name), FatherName =LOWER(FatherName), MotherName=LOWER(MotherName);
END $$
DELIMITER ;
CALL lower_case_College_B_HS_V();
SELECT * FROM College_B_HS_V;

DELIMITER $$
CREATE PROCEDURE lower_case_College_B_SE_V()
BEGIN
UPDATE College_B_SE_V SET Name = LOWER(Name), FatherName =LOWER(FatherName), MotherName=LOWER(MotherName);
END $$
DELIMITER ;
CALL lower_case_College_B_SE_V();
SELECT * FROM College_B_SE_V;

DELIMITER $$
CREATE PROCEDURE lower_case_College_B_SJ_V()
BEGIN
UPDATE College_B_SJ_V SET Name = LOWER(Name), FatherName =LOWER(FatherName), MotherName=LOWER(MotherName);
END $$
DELIMITER ;
CALL lower_case_College_B_SJ_V();
SELECT * FROM College_B_SJ_V;

13.Import the created views (College_A_HS_V, College_A_SE_V, College_A_SJ_V, College_B_HS_V, College_B_SE_V, College_B_SJ_V) into MS Excel and make pivot chart for location of Alumni. 
STEP1: Double click the connect on msexcel right panel. Then select the alumni database and views College_A_HS_V, 
College_A_SE_V, College_A_SJ_V, College_B_HS_V, College_B_SE_V, College_B_SJ_V in alumni database to import. 
STEP2: click the Import MySQL Data button. The Import Data window will appear.
STEP3: make sure to check the box for CREATE A PIVIOT TABLE WITH THE.
STEP4: select location column for column label, row label, values. 
STEP5: then click on import after selecting the view.

14.Write a query to create procedure get_name using the cursor to fetch names of all students from college A.
CREATE TABLE names_collegeA(Name VARCHAR(16000));

DELIMITER $$
CREATE PROCEDURE getname_collegeA()
BEGIN 
DECLARE finished INT DEFAULT 0;
DECLARE namelist VARCHAR(400) DEFAULT "";
DECLARE namedetail CURSOR FOR SELECT NAME FROM College_A_HS_V UNION ALL
SELECT NAME FROM College_A_SE_V UNION ALL
SELECT NAME FROM College_A_SJ_V; 
DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished=1;
OPEN namedetail;
collegeAloop:
LOOP
FETCH namedetail INTO namelist;
IF finished = 1 THEN LEAVE collegeAloop;
END IF;
INSERT INTO names_collegeA(Name) VALUES(namelist);
END LOOP collegeAloop;
CLOSE namedetail;
END $$
DELIMITER ;

CALL getname_collegeA();
SELECT COUNT(*) FROM names_collegeA;


15.Write a query to create procedure get_name using the cursor to fetch names of all students from college B
CREATE TABLE names_collegeB(Name VARCHAR(16000));
DELIMITER $$
CREATE PROCEDURE getname_collegeB()
BEGIN 
DECLARE finished INT DEFAULT 0;
DECLARE namelist VARCHAR(400) DEFAULT "";
DECLARE namedetail CURSOR FOR SELECT NAME FROM College_B_HS_V UNION ALL
SELECT NAME FROM College_B_SE_V UNION ALL
SELECT NAME FROM College_B_SJ_V;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished=1;
OPEN namedetail;
collegeBloop:
LOOP
FETCH namedetail INTO namelist;
IF finished = 1 THEN LEAVE collegeBloop;
END IF;
INSERT INTO names_collegeB(Name) VALUES(namelist);
END LOOP collegeBloop;
CLOSE namedetail;
END $$
DELIMITER ;

CALL getname_collegeB();
SELECT * FROM names_collegeB;


