
# Job Market Analysis – Data Analytics Project

## Project Overview

This project analyses a dataset containing 742 US job postings related to data science and analytics. The objective is to identify job-market trends, salary patterns, industry demand, company hiring activity, technical skills and education-related salary differences.

## Tools and Technologies

- MySQL – Database management and SQL analysis
- Power BI Desktop – Interactive dashboards and visualisation
- Power Query – Data cleaning and transformation
- DAX – Measures and interactive reporting

## Dataset Information

- Total job postings: 742
- Companies: 343
- Industries: 60
- Dataset contains 42 columns
- Salary values are represented in thousands of US dollars (USD K).

## Project Workflow

1. Connected to the MySQL database.
2. Explored the dataset using SQL queries.
3. Identified missing and invalid placeholder values.
4. Converted -1 placeholders to NULL in Rating, Founded and Age for analysis.
5. Analysed job postings by job title, state, company and industry.
6. Compared minimum, maximum and average salaries.
7. Analysed 16 skill indicator columns.
8. Used Power Query to unpivot skill columns and identify required skills.
9. Built interactive Power BI dashboards with KPI cards, charts, matrices and slicers.

## Key Findings

- Data Scientist is the most common job title, with 131 postings.
- California has the highest job-posting count, with 152 postings.
- California also has the highest average salary among the states analysed, at $123.51K.
- Biotech & Pharmaceuticals is the leading industry, with 112 postings.
- Python appears in 392 postings.
- Excel appears in 388 postings.
- SQL appears in 380 postings.
- The overall average salary is approximately $101.48K.

## Power BI Dashboard Pages

### 1. Job Market Overview
- Total job postings
- Average salary
- Total companies and industries
- Top job titles
- Top industries
- Top companies

### 2. State-wise Job and Salary Analysis
- Top states by job postings
- Average salary by state
- Average minimum and maximum salary comparisons

### 3. Skills and Job Roles
- Top 10 demanded skills
- Skill requirements by job role
- Average salary by job role

### 4. Salary and Education Analysis
- Average salary by education category
- Job postings by education category
- Salary comparison by job role and education category

## Education Category Note

The dataset uses the categories M, P and na. According to the assignment documentation, M refers to a master's-degree experience-credit mention and P refers to a Ph.D. experience-credit mention in the job description. These should not be interpreted as universally mandatory degree requirements.

## Conclusion

The analysis highlights the demand for data science and engineering roles, frequently recorded technical skills, geographical salary differences and industry hiring patterns.

This project demonstrates practical skills in SQL, data preparation, exploratory data analysis and Power BI dashboard development.

## Repository Structure

- powerbi/ – Power BI dashboard
- sql/ – SQL analysis queries
- reports/ – Project reports
- presentation/ – Project presentation
- Powerbi Screenshots/ – Dashboard screenshots
