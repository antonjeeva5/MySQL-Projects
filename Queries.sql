# Database Creation
CREATE DATABASE StudentInformationSystem;
USE StudentInformationSystem;

# Table Creation
    # Student Table
			CREATE TABLE Students (
				Student_ID INT auto_increment primary key,
                FirstName varchar(50) NOT NULL,
                LastName VARCHAR(50) NOT NULL,
                DateOfBirth DATE,
                Email VARCHAR(100) UNIQUE,
                PhoneNumber varchar(20)
			);
            
	# Instructors table
			create table Instructors (
				Instructor_ID INT auto_increment PRIMARY key,
                FirstName varchar(50) NOT NULL,
                LastName varchar(50) NOT NULL,
                Email varchar(100) unique
                );
                
	# Course Table
			CREATE TABLE Courses (
				Course_ID varchar(10) PRIMARY KEY,
                CourseName varchar(100) NOT NULL,
                CourseDescription text,
                Credits INT,
                Instructor_ID int,
                foreign key(Instructor_ID) references Instructors(Instructor_ID)
                );
                
	# Enrollments Table
			create table Enrollments(
            EnrollmentID INT auto_increment PRIMARY KEY,
            Student_ID INT,
            Course_ID varchar(10),
            EnrollmentDate DATE,
            Grade varchar(2),
            foreign key(Student_ID) references students(Student_ID) ON DELETE cascade, -- If a student is deleted, their enrollments are also deleted
            foreign key(Course_ID) references Courses(Course_ID) ON DELETE cascade, -- If a course is deleted, enrollments in it are also deleted
            UNIQUE(Student_ID,Course_ID)
            );
		
# Inserting Students
	Insert INTO Students (FirstName,LastName,DateOfBirth, Email, PhoneNumber)
    VALUES ('John', 'Doe', '2003-05-15', 'john.doe@example.com', '555-1234'),
			('Jane', 'Roe', '2004-01-20', 'jane.roe.com', '555-5678'),
            ('Peter','Pan', '2002-11-30', 'peter.pan@example.com', '555-8765');
            
-- Inserting into Courses
	INSERT INTO Courses (Course_ID, CourseName, CourseDescription, Credits, Instructor_ID)
    VALUES ('CS101', 'Instruction to Programming', 'Basics of programming Concepts', 3, 1),
			('MATH202', 'Calculus II', 'Advanced calculus topics', 4, 2),
            ('HIST101', 'World History', 'An overview of world history.', 3, 1);
            
-- Inserting into Enrollments
	INSERT INTO Enrollments (Student_ID, Course_ID, EnrollmentDate, Grade)
	VALUES (1, 'CS101', '2024-09-01', 'A'),
			(1, 'MATH202', '2024-09-01', 'B+'),
            (2, 'CS101', '2024-09-01', 'A-'),
            (3, 'HIST101', '2024-09-01', NULL);
            
-- Inserting into Instructors
INSERT INTO Instructors (FirstName, LastName, Email) VALUES
('Alice', 'Smith', 'alice.smith@example.com'),
('Bob', 'Johnson', 'bob.johnson@example.com');
            
 DESC enrollments;
 SELECT * FROM enrollments;
 select * from students;
 SELECT * FROM courses;
 

SELECT
    e.EnrollmentID,
    s.Student_ID,
    s.FirstName AS StudentFirstName,
    s.LastName AS StudentLastName,
    s.Email AS StudentEmail,
    c.Course_ID,
    c.CourseName,
    c.Credits,
    e.EnrollmentDate,
    e.Grade
FROM
    Enrollments e
    INNER JOIN Students s ON e.Student_ID = s.Student_ID
    INNER JOIN Courses c ON e.Course_ID = c.Course_ID
ORDER BY
    s.LastName, s.FirstName, c.Course_ID;


                
                
                
		




