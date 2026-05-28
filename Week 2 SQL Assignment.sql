SELECT current_database();
-------SECTION A - BUILDING THE DATABASE (DDL)--------

-- Q1. CREATING THE NAIROBI ACADEMY SCHEMA
CREATE SCHEMA nairobi_academy;

-- Q2. CREATING THE STUDENTS TABLE
CREATE TABLE nairobi_academy.students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(1),
    date_of_birth DATE,
    class VARCHAR(10),
    city VARCHAR(50)
);

-- Q3. CREATING THE SUBJECTS TABLE
CREATE TABLE nairobi_academy.subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL UNIQUE,
    department VARCHAR(50),
    teacher_name VARCHAR(100),
    credits INT
);

-- Q4. CREATING THE EXAM RESULTS TABLE
CREATE TABLE nairobi_academy.exam_results (
	result_id INT PRIMARY KEY,
	student_id INT NOT NULL,
	subject_id INT NOT NULL,
	marks INT NOT NULL,
	exam_date DATE,
	grade VARCHAR(2)
);

SELECT * FROM nairobi_academy.students;
SELECT * FROM nairobi_academy.subjects;
SELECT * FROM nairobi_academy.exam_results;

-- Q5. ADDING phone_numner COLUMNS TO STUDENTS TABLE
ALTER TABLE nairobi_academy.students
ADD COLUMN phone_number VARCHAR(20);

-- Q6. RENAME credits COLUMN IN SUBJECTS TABLE TO credit_hours
ALTER TABLE nairobi_academy.subjects
RENAME COLUMN credits TO credit_hours;

-- Q7. REMOVING COMPLETELY THE phone_number COLUMN ADDED IN Q5.
ALTER TABLE nairobi_academy.students 
DROP COLUMN phone_number;

SELECT * FROM nairobi_academy.students;
SELECT * FROM nairobi_academy.subjects;
SELECT * FROM nairobi_academy.exam_results;

------SECTION B - FILLING THE DATABASE (DML)---------
-- Q8. INSERTING ALL STUDENTS TO THE STUDENTS TABLE
INSERT INTO nairobi_academy.students 
(student_id, first_name, last_name, gender, date_of_birth, class, city)
VALUES
(1,'Amina', 'Wanjiku', 'F', '2008-03-12', 'Form 3', 'Nairobi'),
(2,'Brian', 'Ochieng', 'M', '2007-07-25', 'Form 4', 'Mombasa'),
(3,'Cynthia', 'Mutua', 'F', '2008-11-05', 'Form 3', 'Kisumu'),
(4,'David', 'Kamau', 'M', '2007-02-18', 'Form 4', 'Nairobi'),
(5,'Esther', 'Akinyi', 'F', '2009-06-30', 'Form 2', 'Nakuru'),
(6,'Felix', 'Otieno', 'M', '2009-09-14', 'Form 2', 'Eldoret'),
(7,'Grace', 'Mwangi', 'F', '2008-01-22', 'Form 3', 'Nairobi'),
(8,'Hassan', 'Abdi', 'M', '2007-04-09', 'Form 4', 'Mombasa'),
(9,'Ivy', 'Chebet', 'F', '2009-12-01', 'Form 2', 'Nakuru'),
(10,'James', 'Kariuki', 'M', '2008-08-17', 'Form 3', 'Nairobi');

-- Q9. INSERTING ALL 10 SUBJECTS INTO THE SUBJECTS TABLE
INSERT INTO nairobi_academy.subjects 
(subject_id, subject_name, department, teacher_name, credit_hours)
VALUES
(1,'Mathematics', 'Sciences', 'Mr. Njoroge',4),
(2,'English', 'Languages', 'Ms. Adhiambo', 3),
(3,'Biology', 'Sciences', 'Ms. Otieno', 4),
(4,'History', 'Humanities', 'Mr. Waweru', 3),
(5,'Kiswahili', 'Languages', 'Ms. Nduta',3),
(6,'Physics', 'Sciences', 'Mr. Kamande', 4),
(7,'Geography', 'Humanities', 'Ms. Chebet',3),
(8,'Chemistry', 'Sciences', 'Ms. Muthoni', 4),
(9,'Computer Studies', 'Sciences', 'Mr. Oduya', 3),
(10,'Business Studies', 'Humanities', 'Ms. Wangari',3);

-- Q10. INSERTING ALL 10 EXAM RESULTS INTO THE EXAM TABLE
INSERT INTO nairobi_academy.exam_results 
(result_id, student_id, subject_id, marks, exam_date, grade)
VALUES
(1, 1, 1, 78,'2024-03-15','B'),
(2, 1, 2, 85, '2024-03-16','A'),
(3, 2, 1, 92, '2024-03-15','A'),
(4, 2, 3, 55,'2024-03-17','C'),
(5, 3, 2, 49,'2024-03-16','D'),
(6, 3, 4, 71, '2024-03-18','B'),
(7, 4, 1, 88,'2024-03-15','A'),
(8, 4, 6, 63,'2024-03-19','C'),
(9, 5, 5, 39,'2024-03-20','F'),
(10, 6, 9, 95,'2024-03-21','A');

--Q11. RUNNING SELECT QUERY TO CONFIRM ALL ROWS
SELECT * FROM nairobi_academy.students;
SELECT * FROM nairobi_academy.subjects;
SELECT * FROM nairobi_academy.exam_results;

--Q12. UPDATING ESTHER AKINYI'S CITY
UPDATE nairobi_academy.students
SET city = 'Nairobi'
WHERE student_id = 5;

--Q13. UPDATING MARKS
UPDATE nairobi_academy.exam_results
SET marks = 59
WHERE result_id = 5;

--Q14. DELETING A RESULT USING THE DELETE STATEMENT
DELETE FROM nairobi_academy.exam_results
WHERE result_id = 9;

--------SECTION C QUERYING THE DATA (DQL)-------
--Q15. STUDENTS IN FORM 4
SELECT * FROM nairobi_academy.students
WHERE class = 'Form 4';
		--- All students in form 4 = 3 students: Brian Ochieng, David Kamau, and  Hassan Abdi.

--Q16. ALL SUBJECTS IN THE SCIENCES DEPARTMENT
SELECT * FROM nairobi_academy.subjects
WHERE department =  'Sciences';
		--- Subjects in sciences department = 5 subjects: Mathematics, Biology, Physics, Chemistry, and Computer Studies.

--Q17. EXAM RESULTS WHERE MARKS ARE GREATER THAN OR EQUAL TO 70
SELECT * FROM nairobi_academy.exam_results
WHERE marks >= 70;
		--- Exam Results where marks are greater >= 70 are six: 1,2,3,6,7,10.

--Q18. ALL FEMALE STUDENTS ONLY
SELECT * FROM nairobi_academy.students
WHERE gender = 'F';
		--- There are 5 female students


--Q19. STUDENTS IN FORM 3 AND IN NAIROBI
SELECT * FROM nairobi_academy.students
WHERE CLASS = 'Form 3' AND city = 'Nairobi';
		---Students in form 3 and in Nairobi = 3: Amina Wanjiku, Grace Mwangi, and James Kariuki.

--Q20. STUDENTS IN FORM 2 OR FORM 4
SELECT * FROM nairobi_academy.students
WHERE CLASS = 'Form 2' OR CLASS = 'Form 4';
		---Students in form 2 or form 3 = 6 Students

SELECT * FROM nairobi_academy.students;
SELECT * FROM nairobi_academy.subjects;
SELECT * FROM nairobi_academy.exam_results;

-------PART 2 - BETWEEN, IN/NOT IN, LIKE, COUNT, and CASE WHEN--------
--------------SECTION A - RANGE, MEMBERSHIP & SEACRH OPERATORS----
--Q1. EXAM RESULTS WHERE MARKS ARE BETWEEN 50 AND 80
SELECT * FROM nairobi_academy.exam_results
WHERE marks BETWEEN 50 AND 80;
		--- Exam results where marks are between 50 and 80 are 5 results.

--Q2. EXAMS THAT TOOK PLACE BETWEEN 15TH MARCH 2024 AND 18TH MARCH 2024
SELECT * FROM nairobi_academy.exam_results
WHERE exam_date BETWEEN '2024-03-15' AND '2024-03-18';
		--- Exams between 15th March 2024 annd 18th March 2024 are 7 Exams.

--Q3. ALL STUDENTS LIVING IN NAIROBI, MOMBASA, OR KISUMU USING IN.
SELECT * FROM nairobi_academy.students
WHERE city IN ('Nairobi', 'Mombasa', 'Kisumu');
		--- 8 Students
--Q4. ALL STUDENTS NOT IN FORM 2 OR FORM 3 USING NOT IN
SELECT * FROM nairobi_academy.students
WHERE CLASS  NOT IN ('Form 2', 'Form 3');
		--- 3 Students

--Q5. ALL STUDENTS WHOSE FIRST NAME STARTS WITH THE LETTER A OR E - USE LIKE
SELECT * FROM nairobi_academy.students
WHERE first_name LIKE 'A%' OR first_name LIKE 'E%';
		--- 2 Students: Amina Wanjiku and Esther Akinyi

--Q6. SUBJECTS WHOSE SUBJECT NAME CONTAINS THE WORD 'Studies'
SELECT * FROM nairobi_academy.subjects
WHERE subject_name LIKE '%Studies%';
		--- 2 Subjects: Computer Studies and Business Studies.

--------SECTION B - COUNT
--Q7. HOW MANY STUDENTS ARE CURRENTLY IN FORM 3?
SELECT COUNT(*) AS total_students_in_form_3
FROM nairobi_academy.students
WHERE class = 'Form 3';
		--- 4 Students

--Q8. HOW MANY EXAM RESULTS HAVE A MARK OF 70 OR ABOVE?
SELECT COUNT(*) AS Exam_results_70_or_above
FROM nairobi_academy.exam_results
WHERE marks >= 70;
		--- 6 Exam Results

-------SECTION C - CASE WHEN
--Q9. LABEL EACH EXAM WITH GRADE DESCRIPTION
SELECT *,
    CASE
        WHEN marks >= 80 THEN 'Distinction'
        WHEN marks >= 60 THEN 'Merit'
        WHEN marks >= 40 THEN 'Pass'
        WHEN marks < 40 THEN 'Fail'
    END AS performance
FROM nairobi_academy.exam_results;

--Q10. LABEL EACH STUDENT AS SENIOR OR JUNIOR
SELECT *,
    CASE
        WHEN class = 'Form 3' OR class = 'Form 4' THEN 'Senior'
        WHEN class = 'Form 1' OR class = 'Form 2' THEN 'Junior'
    END AS student_level
FROM nairobi_academy.students;





