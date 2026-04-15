use cfg_demo;

select * from students;
select name from students;
-- Control Flow (IF) 
SELECT Name, 
    IF(grade > 90, 'Pass', 'Fail') as grade_status
FROM students;


-- Control Flow (CASE) 
SELECT Name, 
       CASE 
           WHEN age < 18 THEN 'Minor'
           WHEN Age BETWEEN 18 AND 65 THEN 'Adult'
           ELSE 'Senior'
       END AS AgeGroup
FROM students;
-- 
-- 
-- -- Functions and Delimiter 
DELIMITER //

CREATE FUNCTION get_grade_label(g INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(10);

    IF g >= 90 THEN
        SET result = 'A';
    ELSEIF g >= 80 THEN
        SET result = 'B';
    ELSE
        SET result = 'C';
    END IF;

    RETURN result;
END //

DELIMITER ;

-- -- Use the function
SELECT name, grade, get_grade_label(grade) AS grade_label
FROM students;
-- 
-- -- Procedure 1
DELIMITER //

CREATE PROCEDURE getStudentsByCourse(IN course_name VARCHAR(50))
BEGIN
    SELECT * FROM students WHERE course = course_name;
END //

DELIMITER ;

-- Use or Call the procedure 
CALL getStudentsByCourse('Web Dev');
-- 
-- -- Procedure 2
-- DELIMITER //
-- 
-- CREATE PROCEDURE bump_student_grade(IN student_name VARCHAR(50), IN bonus_points INT)
-- BEGIN
--     UPDATE students 
--     SET grade = grade + bonus_points 
--     WHERE name = student_name;
--     
--     SELECT CONCAT(student_name, '''s grade has been updated!') AS Message;
-- END //
-- 
-- DELIMITER ;
-- 
-- -- Call it
-- CALL bump_student_grade('David', 5);
-- 
-- 
-- -- Transaction(All or none): Transfer 5 grade points from Ali to Sara
BEGIN;
-- 
-- -- Step 1: Deduct from Ali
UPDATE students 
SET grade = grade - 5 
WHERE name = 'Ali';

-- Step 2: Add to Sara
UPDATE students 
SET grade = grade + 5 
WHERE name = 'Sara';

COMMIT;
-- 
-- 
-- 
-- -- Triggers 
ALTER TABLE students ADD updated_at DATETIME;
select * from students; 

DELIMITER //

CREATE TRIGGER before_update_student
BEFORE UPDATE ON students
FOR EACH ROW
BEGIN
    SET NEW.updated_at = NOW();
END //

DELIMITER ;

-- Test 
UPDATE students SET grade = 95 WHERE name = 'Ali';
-- 
-- 
-- -- Events 
SET GLOBAL event_scheduler = ON; -- It doesn't survive a server restart 
SHOW VARIABLES LIKE 'event_scheduler';

-- Example: Every year on July 1st, reset grades for the new semester
CREATE EVENT reset_grades_yearly
ON SCHEDULE EVERY 1 YEAR STARTS '2024-07-01 00:00:00'
DO
    UPDATE students SET grade = 0;


SELECT * FROM users 
WHERE username = '' OR '1'='1'; -- AND password = 'password';


-- '' OR '1'='1'; --
SELECT * FROM users 
WHERE username = '' OR '1'='1'; -- AND password = '';

-- 
-- 
-- -- SQL Injection
SELECT * FROM students WHERE name = 'Sara'; -- Works normally
-- User inserts  (Sara' OR '1'='1)  as input
SELECT * FROM students WHERE name = 'Sara' OR '1'='1'; 
-- User inserts (Sara'; DROP TABLE students;) as input 
SELECT * FROM students WHERE name = 'Sara'; DROP TABLE students; --';-- 
-- 











