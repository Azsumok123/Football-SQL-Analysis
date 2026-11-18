Football Match Data Analysis | SQL Server

 Overview

A personal SQL project analyzing football results, scoring patterns, and team performance. I imported a real-world dataset into Microsoft SQL Server, created relational tables, and wrote T-SQL queries for analysis and data validation.

 Dataset & Tools

- **Dataset:** 76,928 match records covering 91 competition codes across 41 countries
- **Tools:** SQL Server, SQL Server Management Studio (SSMS), Import and Export Wizard

 Database Structure

The database contains four tables:

- `RawData` — Original imported dataset
- `Leagues` — Competition and country information
- `Teams` — Team names and league references
- `Matches` — Fixtures, seasons, scores, and results

I created primary and foreign keys and documented the database structure in an ER diagram.

Analysis

My SQL queries explore:

- Home wins, away wins, and draws
- The 10 most common scorelines
- Total and average goals by season
- Highest-scoring matches in each season
- Matches scoring above their season average
- Team goal totals and league scoring averages

 Data Validation

I wrote checks for inconsistent goal totals, incorrect result labels, and potentially repeated match records. I also investigated differences between source records and transformed data.

 What I Learned

This project gave me practical experience importing and transforming data, working with relational tables, writing analytical queries, and checking data consistency in SQL Server.
