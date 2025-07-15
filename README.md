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
    
   **ERD Diagram** ![**ERD Diagram**](https://github.com/antonjeeva5/MySQL-Projects/blob/main/University%20data%20base/Student%20Information%20System%20ERD.png)
   ---
<div align="center">

## Introduction & Project Objective

</div>

This project is a complete relational database for a university's Student Information System (SIS), built from the ground up using MySQL. The objective was to design a normalized and efficient database schema, implement it using SQL Data Definition Language (DDL), populate it with realistic sample data, and demonstrate data retrieval skills by writing a series of analytical queries.

This project showcases the ability to:
- Translate requirements into a logical and physical database design.
- Write clean, well-structured SQL code.
- Understand and implement relational concepts like primary keys, foreign keys, and normalization.
- Query a database to extract meaningful insights.
 
<div align="center">
   
## Database Schema & Design (The ERD)

</div>

* Students: Individuals enrolled in the institution, with attributes like student ID, name, date of birth, email, and phone number.
* Instructors: Faculty members who teach courses, identified by instructor ID, name, and email.
* Courses: Academic subjects offered, each with a unique course ID, name, description, credits, and a reference to the instructor teaching it.
* Enrollments: A junction entity that records which students are enrolled in which courses, including enrollment date and grade. This table uses foreign keys to link students and courses, modeling a many-to-many relationship

<div align="center">
   
## Technologies & Tools Used 

</div>

* Database : MySQL
* Schema Design & ERD : MySQL Workbench & Draw.io
* SQL Scripting : DDL, DML, DQL

<div align="center">
   
## Relationships 

</div>

     * A student can enroll in multiple courses, and a course can have multiple students (many-to-many, implemented via the Enrollments table).
     * Each course is taught by one instructor (one-to-many from Instructor to Course).
     
<div align="center">
   
## Example Queries & Insights

</div>
         Here are some examples of questions this database can answer.
         
   **Query 1: Which students are enrolled in 'Introduction to Programming'?**

                  SELECT c.CourseName, COUNT(e.Student_ID) AS NumberOfStudents
                  FROM Courses c
                  LEFT JOIN Enrollments e ON c.Course_ID = e.Course_ID
                  GROUP BY c.CourseName
                  ORDER BY NumberOfStudents DESC;
                  
   ## Other Questions
   * Which students have not enrolled in any courses?
   * What is the total number of credits a student is taking this semester?

 </details>

## Project 2: Invenstment Portfolio Database
      This project is a comprehensive relational database for a Personal Investment Portfolio Management System, built from 
      the ground up using MySQL.The goal was to design a normalized and scalable database schema that efficiently tracks 
      assets, transactions, accounts, and holdings. Using SQL Data Definition Language (DDL),the schema was implemented
      and populated with realistic hypothetical data to simulate actual investment activity.A series of analytical queries
      were developed to demonstrate data retrieval skills, including portfolio analysis, transaction history, and account 
      breakdowns.This project showcases the ability to architect, implement, and analyze a financial database system suitable 
      for personal or educational use.
<details>
  <summary><strong>➡️ View Project Details & Breakdown</strong></summary>
    <br>
   
 **ERD Diagram** ![**ERD Diagram**](https://github.com/antonjeeva5/MySQL-Projects/blob/main/Investment%20Database/InvenstmentPortfolioDatabase_ERD.png) 
---
<div align="center">

## Introduction & Project Objective

</div>

This project is a complete relational database for a personal investment portfolio management system, built from the ground up using MySQL. The objective was to design a normalized and efficient schema capable of accurately tracking assets, accounts, transactions, and holdings. The implementation utilized SQL Data Definition Language (DDL) to enforce data integrity, incorporate strict constraints, and support advanced audit features. The database is populated with representative sample data, and its analytical power is demonstrated through a suite of SQL queries aimed at extracting actionable insights.

This project showcases the ability to:
   - Translate real-world investment tracking requirements into a robust logical and physical database design.

   - Write clean, well-structured SQL code for table definitions, indexing, and constraints.

   - Understand and implement core relational concepts such as primary keys, foreign keys, unique constraints, and normalization principles.

   - Query a multi-table database to produce portfolio analytics, history reports, and account breakdowns.

   - Implement data integrity and auditing features—such as NOT NULL constraints, foreign key enforcement, and timestamp fields—to support reliable financial reporting and analysis.

<div align="center">
   
## Database Schema & Design (The ERD)

</div>

* Assets : Represents various financial instruments like stocks, bonds, ETFs, or cryptocurrencies that can be held in the portfolio.Key attributes are asset_id (Primary Key), name, type, ticker, sector, is_active.
* Accounts : Represents the investment accounts or brokerages where assets are held and transactions are executed.Key attributes are account_id (Primary Key), name, type, opened_date, closed_date, created_at, updated_at.
* Holdings : Represents the amount of a particular asset held in a specific account, serving as the bridge between accounts and assets.Key attributes are holding_id (Primary Key), account_id (Foreign Key), asset_id (Foreign Key), quantity, UNIQUE (account_id, asset_id).
* Transactions : Logs every buy or sell event for an asset within a specific account, including quantities, prices, and fees for precise tracking and analysis.Key attributes are txn_id (Primary Key), asset_id (Foreign Key), account_id (Foreign Key), txn_date,txn_type, quantity, price_per_unit, fees

<div align="center">

## Database Relationships

</div>

| Relationship                                       | Description                                         |
| :---------------------------------------------     | :------------------------------------------------   |
| `assets.asset_id` -> `transactions.asset_id`       | One asset can have many transactions (1-to-many)    |
| `assets.asset_id` -> `holdings.asset_id`           | One asset can be linked to many holdings (1-to-many)|
| `accounts.account_id` -> `holdings.account_id`     | One account can have many holdings (1-to-many)      |
| `accounts.account_id` -> `transactions.account_id` | One account can have many transactions (1-to-many)  |
| `holdings (account_id, asset_id)`                  | Uniqueness enforced per asset/account holding       |

<div align="center">
   
## Technologies & Tools Used 
</div>

* Database : MySQL
* Schema Design & ERD : MySQL Workbench & Draw.io
* SQL Scripting : DDL, DML, DQL

<div align="center">
   
## Example Queries & Insights

</div>
         Here are some examples of questions this database can answer.

   **Query 1: What assets are held in each account, and in what quantity?**
            SELECT 
            a.c.name AS account_name,
            a.name AS asset_name,
            h.quantity
            FROM Holdings h
            JOIN Accounts ac ON h.account_id = ac.account_id
            JOIN Assets a ON h.asset_id = a.asset_id;
            
   **Query 2: What assets are held in each account, and in what quantity?**





   
