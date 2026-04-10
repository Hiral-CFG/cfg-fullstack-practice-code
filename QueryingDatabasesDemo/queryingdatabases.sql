CREATE DATABASE cfg_demo;

USE cfg_demo;

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    course VARCHAR(50),
    grade INT
);

INSERT INTO students (name, age, course, grade) VALUES
('Sara', 22, 'Web Dev', 85),
('Ali', 25, '  Data Science', 90),
('John', 23, 'Web Dev   ', 78),
('Mona', 21, '              Cyber Security', 88),
('David', 24, 'Data Science', 92),
('Lina', 22, 'Web Dev  ', 85),
('Omar', 26, 'Cyber Security', 70);

#Clean the course names by removing extra spaces, temporarly, then perminantly.
SELECT TRIM(course) AS cleaned_course
FROM students;
-- or
UPDATE students
SET course = TRIM(course);

-- Selecting Data - Retrieve all students and display only their names and grades.
SELECT * FROM students;
SELECT name, grade FROM students;

-- Operators - Find all students with grades greater than 85, then those aged 22 or younger.
SELECT * FROM students WHERE grade > 85;
SELECT * FROM students WHERE age <= 22;

-- Filtering + Sorting - Retrieve students enrolled in Web Dev and sort them by grade from highest to lowest.
SELECT * FROM students 
WHERE course = 'Web Dev'
ORDER BY grade DESC;

-- Modifying Data - Update John’s grade to 95.
UPDATE students
SET grade = 95
WHERE name = 'John';

-- Aggregate Functions
-- Calculate the average grade of the class
-- Find the highest grade
-- Count the total number of students
SELECT AVG(grade) FROM students;
SELECT MAX(grade) FROM students;
SELECT COUNT(*) FROM students;

-- Grouping Data - Get the average grade for each course.
SELECT course, AVG(grade)
FROM students
GROUP BY course;

-- Using Distinct - Retrieve all unique courses available.
SELECT DISTINCT course FROM students;