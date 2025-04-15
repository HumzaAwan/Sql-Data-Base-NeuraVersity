-- Create NeuraVersity (university management system) Database
CREATE DATABASE NeuraVersity;

-- 1. Departments Table
CREATE TABLE Departments
( 
	Department_ID INT PRIMARY KEY,
	Department_Name VARCHAR(50) NOT NULL,
	Department_Address VARCHAR(200) NOT NULL, -- Combining city, area, street, and block no into a single column
	City VARCHAR(50) NOT NULL,
	Area VARCHAR(50) NOT NULL,
	Street VARCHAR(50) NOT NULL,
	Block_No VARCHAR(10) NOT NULL
);

-- 2. Session Table
CREATE TABLE Sessions
( 
	Session_ID VARCHAR(50) PRIMARY KEY,
	Department_ID INT NOT NULL,
	Fees INT NOT NULL,
	FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
);

-- 3. Accounts Table
CREATE TABLE Accounts
(
	Login_ID VARCHAR(50) PRIMARY KEY,
	Login_Pass VARCHAR(20) NOT NULL DEFAULT 'UMS-U70M70S',
	Assigned_Date DATE
);

-- 4. Students Table
CREATE TABLE Students
(
	Pupil_ID VARCHAR(50),
	Full_Name VARCHAR(50) NOT NULL,
	Last_Name VARCHAR(50),
	Date_Of_Birth DATE NOT NULL,
	CNIC NUMERIC NOT NULL PRIMARY KEY,
	Age INT NOT NULL,
	Email VARCHAR(50) NOT NULL,
	Department_ID INT NOT NULL,
	Login_ID VARCHAR(50),
	Section_U VARCHAR(3),
	FOREIGN KEY (Login_ID) REFERENCES Accounts(Login_ID),
	FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
);

-- 5. Faculty_Members Table
CREATE TABLE Faculty_Members
(   
	Faculty_Id VARCHAR(50) PRIMARY KEY,
	Full_Name VARCHAR(50) NOT NULL,
	Last_Name VARCHAR(50),
	Date_Of_Birth DATE NOT NULL,
	CNIC VARCHAR(20) NOT NULL,
	Age INT,
	Mailing_Address VARCHAR(20) NOT NULL,
	Department_Id INT NOT NULL,
	Login_ID VARCHAR(50),
	FOREIGN KEY (Department_Id) REFERENCES Departments(Department_Id),
	FOREIGN KEY (Login_ID) REFERENCES Accounts(Login_ID)
);

-- 6. Courses Table
CREATE TABLE Courses
(
	Course_Id INT PRIMARY KEY,
	Semester_Number INT NOT NULL,
	Course_Name VARCHAR(20) NOT NULL,
	Timings VARCHAR(20) NOT NULL,
	Department_Id INT,
	FOREIGN KEY (Department_Id) REFERENCES Departments(Department_Id)
);

-- 7. Subjects Table
CREATE TABLE Subjects
(
	Subject_Id INT PRIMARY KEY,
	Title VARCHAR(50) NOT NULL,
	Course_Id INT,
	CreditHours INT,
	FOREIGN KEY (Course_Id) REFERENCES Courses(Course_Id)
);

-- 8. Time_Table Table
CREATE TABLE Time_Table
(
	Time_Table_Id INT PRIMARY KEY,
	Course_Id INT,
	Timings VARCHAR(100),
	FOREIGN KEY (Course_Id) REFERENCES Courses(Course_Id)
);

