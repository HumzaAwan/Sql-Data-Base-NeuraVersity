--Problem 1: Find the courses offered in the 'Spring' semester.
SELECT c.Course_Name
FROM Courses c
WHERE c.Semester_Number = 1;


-- Problem 2: Find the average age of students in each department.
SELECT d.Department_Name, AVG(s.Age) AS Average_Age
FROM Departments d
LEFT JOIN Students s ON d.Department_ID = s.Department_ID
GROUP BY d.Department_Name;

-- Problem 3: List all sessions with fees greater than 80,000.
SELECT * 
FROM Sessions 
WHERE Fees > 80000;

-- Problem 4: List first and last names of students who are older than 20 and less than 25.
SELECT First_Name, Last_Name 
FROM Students 
WHERE Age < 25 and Age >20;

-- Problem 5: Count the number of courses in each department.
SELECT d.Department_Name, COUNT(c.Course_Id) AS Course_Count
FROM Departments d
JOIN Courses c ON d.Department_ID = c.Department_Id
GROUP BY d.Department_Name;

-- Problem 6: Count the number of faculty members in each department.
SELECT d.Department_Name, COUNT(fm.Faculty_Id) AS Faculty_Count
FROM Departments d
LEFT JOIN Faculty_Members fm ON d.Department_ID = fm.Department_Id
GROUP BY d.Department_Name;

-- Problem 7: List course names and timings for courses taught by a faculty member with the last name 'Parker'.
SELECT c.Course_Name, c.Timings
FROM Courses c
JOIN Faculty_Members fm ON c.Department_Id = fm.Department_Id
WHERE fm.Last_Name = 'Parker';

-- Problem 8: List all courses along with the corresponding faculty members.
SELECT c.Course_Name, f.First_Name, f.Last_Name
FROM Courses c
JOIN Faculty_Members f ON c.Department_Id = f.Department_Id;