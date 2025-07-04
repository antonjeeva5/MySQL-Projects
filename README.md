<p align="center">

*This repository contains my portfolio of MySQL projects, showcasing my end-to-end skills from database design and data modeling to analytical querying*

## 🚀 My Projects  
*Here are some of the projects I've worked on. Each project includes a detailed breakdown of the process, from data sourcing to final insights.*

   ## Project 1: Student Information System – University Database
        This project is a complete relational database for a university's Student Information System (SIS), 
        built from the ground up using MySQL. The objective was to design a normalized and efficient database schema,
        implement it using SQL Data Definition Language (DDL), populate it with realistic sample data, 
        and demonstrate my data retrieval skills by writing a series of analytical queries.
 <details>
  <summary><strong>➡️ View Project Details & Breakdown</strong></summary>
    <br>
    
   **ERD Diagram** ![**ERD Diagram**](https://github.com/antonjeeva5/MySQL-Projects/blob/main/Student%20Information%20System%20ERD.png)
   ---
## 1. Introduction & Project Objective

This project is a complete relational database for a university's Student Information System (SIS), built from the ground up using MySQL. The objective was to design a normalized and efficient database schema, implement it using SQL Data Definition Language (DDL), populate it with realistic sample data, and demonstrate data retrieval skills by writing a series of analytical queries.

This project showcases the ability to:
- Translate requirements into a logical and physical database design.
- Write clean, well-structured SQL code.
- Understand and implement relational concepts like primary keys, foreign keys, and normalization.
- Query a database to extract meaningful insights.
---   
## 2. Database Schema & Design (The ERD)
* Students: Individuals enrolled in the institution, with attributes like student ID, name, date of birth, email, and phone number.
* Instructors: Faculty members who teach courses, identified by instructor ID, name, and email.
* Courses: Academic subjects offered, each with a unique course ID, name, description, credits, and a reference to the instructor teaching it.
* Enrollments: A junction entity that records which students are enrolled in which courses, including enrollment date and grade. This table uses foreign keys to link students and courses, modeling a many-to-many relationship

   Relationships :
     * A student can enroll in multiple courses, and a course can have multiple students (many-to-many, implemented via the Enrollments table).
     * Each course is taught by one instructor (one-to-many from Instructor to Course).


   
