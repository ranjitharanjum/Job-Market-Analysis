# phase-1 Database Connection and Exploration
USE project_job_market_analysis;
SHOW TABLES;
SELECT COUNT(*) AS total_records FROM Market;
DESCRIBE Market;

SELECT * FROM Market LIMIT 10;

# phase-2 Data quality analysis
DESCRIBE Market;

# check null values in field-4 
SELECT
    COUNT(*) AS total_records,
    COUNT(FIELD4) AS non_null_records,
    SUM(FIELD4 IS NULL) AS missing_records
FROM Market;     #All 742 records have NULL values in FIELD4.

# check blank values
SELECT COUNT(*) AS blank_records
FROM Market
WHERE TRIM(FIELD4) = '';      # There are no empty strings in FIELD4. All missing values are actual SQL NULL values.

# Understand FIELD4
SELECT DISTINCT FIELD4 FROM Market LIMIT 20;     # This confirms that FIELD4 contains no populated values.

# Check duplicate records
SELECT ID, COUNT(*) AS duplicate_count 
FROM Market
GROUP BY ID
HAVING COUNT(*) > 1;     # No duplicate IDs were found.

# Check invalid values (-1)
SELECT
    SUM(Rating = -1) AS invalid_rating,
    SUM(Founded = -1) AS invalid_founded,
    SUM(Lower_Salary = -1) AS invalid_lower_salary,
    SUM(Upper_Salary = -1) AS invalid_upper_salary,
    SUM(Avg_SalaryK = -1) AS invalid_avg_salary,
    SUM(Age = -1) AS invalid_age
FROM Market;    
/* Rating: 11 companies have unavailable ratings.
Founded: 50 records have unavailable founding-year information.
Age: 50 records have unavailable company-age information.
Salary: All three salary columns are free from -1 values. */

# Identify the affected records
SELECT ID, Company_Name, Rating, Founded, Age, Lower_Salary, Upper_Salary, Avg_SalaryK
FROM Market
WHERE Rating = -1 OR Founded = -1 OR Age = -1;

# Check the percentage of missing values
SELECT
    ROUND((SUM(Rating = -1) / COUNT(*)) * 100, 2) AS rating_missing_percent,
    ROUND((SUM(Founded = -1) / COUNT(*)) * 100, 2) AS founded_missing_percent,
    ROUND((SUM(Age = -1) / COUNT(*)) * 100, 2) AS age_missing_percent
FROM Market;

# Clean data directly using SELECT
SELECT ID, Job_Title, Company_Name,
	NULLIF(Rating, -1) AS Rating_Clean,
    NULLIF(Founded, -1) AS Founded_Clean,
    NULLIF(Age, -1) AS Age_Clean,
    Lower_Salary, Upper_Salary, Avg_SalaryK
FROM Market LIMIT 20;

# Verify the cleaned values
SELECT
    COUNT(*) AS total_records,
	SUM(NULLIF(Rating, -1) IS NULL) AS missing_rating,
    SUM(NULLIF(Founded, -1) IS NULL) AS missing_founded,
    SUM(NULLIF(Age, -1) IS NULL) AS missing_age
FROM Market;

SELECT AVG(NULLIF(Rating, -1)) AS average_rating FROM Market;

# verify that the records containing -1 are being converted correctly.
SELECT ID, Company_Name, Rating,
    NULLIF(Rating, -1) AS Rating_Clean, Founded,
    NULLIF(Founded, -1) AS Founded_Clean, Age,
    NULLIF(Age, -1) AS Age_Clean
FROM Market
WHERE Rating = -1 OR Founded = -1 OR Age = -1 LIMIT 20;

### Exploratory Data Analysis (EDA)
# Job titles that have the highest number of job openings
SELECT Job_Title, COUNT(*) AS total_jobs
FROM Market
GROUP BY Job_Title
ORDER BY total_jobs DESC
LIMIT 10;

# Average salary of the most common job titles
SELECT
    Job_Title,
    COUNT(*) AS total_jobs,
    ROUND(AVG(Avg_SalaryK), 2) AS average_salary,
    ROUND(AVG(Lower_Salary), 2) AS average_min_salary,
    ROUND(AVG(Upper_Salary), 2) AS average_max_salary
FROM Market
GROUP BY Job_Title
ORDER BY total_jobs DESC
LIMIT 10;

# Skills required for each job title
SELECT 'Python' AS skill, SUM(Python) AS job_count FROM Market
UNION ALL
SELECT 'SQL', SUM(sql_) FROM Market
UNION ALL
SELECT 'Excel', SUM(excel) FROM Market
UNION ALL
SELECT 'AWS', SUM(aws) FROM Market
UNION ALL
SELECT 'Spark', SUM(spark) FROM Market
UNION ALL
SELECT 'Tableau', SUM(tableau) FROM Market
UNION ALL
SELECT 'SAS', SUM(sas) FROM Market
UNION ALL
SELECT 'Power BI', SUM(bi) FROM Market
UNION ALL
SELECT 'TensorFlow', SUM(tensor) FROM Market
UNION ALL
SELECT 'PyTorch', SUM(pytorch) FROM Market
ORDER BY job_count DESC;

# Skills required for each job title
SELECT
    Job_Title,
    COUNT(*) AS total_jobs,
    SUM(Python) AS python_jobs,
    SUM(sql_) AS sql_jobs,
    SUM(excel) AS excel_jobs,
    SUM(aws) AS aws_jobs,
    SUM(spark) AS spark_jobs,
    SUM(tableau) AS tableau_jobs,
    SUM(tensor) AS tensorflow_jobs,
    SUM(pytorch) AS pytorch_jobs
FROM Market
WHERE Job_Title = 'Data Scientist'
GROUP BY Job_Title;

# Analyse Data Engineer skills
SELECT
    Job_Title,
    COUNT(*) AS total_jobs,
    SUM(Python) AS python_jobs,
    SUM(sql_) AS sql_jobs,
    SUM(excel) AS excel_jobs,
    SUM(aws) AS aws_jobs,
    SUM(spark) AS spark_jobs,
    SUM(tableau) AS tableau_jobs,
    SUM(tensor) AS tensorflow_jobs,
    SUM(pytorch) AS pytorch_jobs
FROM Market
WHERE Job_Title = 'Data Engineer'
GROUP BY Job_Title;

# Senior Data Scientist skills
SELECT
    Job_Title,
    COUNT(*) AS total_jobs,
    SUM(Python) AS python_jobs,
    SUM(sql_) AS sql_jobs,
    SUM(excel) AS excel_jobs,
    SUM(aws) AS aws_jobs,
    SUM(spark) AS spark_jobs,
    SUM(tableau) AS tableau_jobs,
    SUM(tensor) AS tensorflow_jobs,
    SUM(pytorch) AS pytorch_jobs
FROM Market
WHERE Job_Title = 'Senior Data Scientist'
GROUP BY Job_Title;

# Data Analyst skills
SELECT
    Job_Title,
    COUNT(*) AS total_jobs,
    SUM(Python) AS python_jobs,
    SUM(sql_) AS sql_jobs,
    SUM(excel) AS excel_jobs,
    SUM(aws) AS aws_jobs,
    SUM(spark) AS spark_jobs,
    SUM(tableau) AS tableau_jobs,
    SUM(tensor) AS tensorflow_jobs,
    SUM(pytorch) AS pytorch_jobs
FROM Market
WHERE Job_Title = 'Data Analyst'
GROUP BY Job_Title;

# Senior Data Engineer skills
SELECT
    Job_Title,
    COUNT(*) AS total_jobs,
    SUM(Python) AS python_jobs,
    SUM(sql_) AS sql_jobs,
    SUM(excel) AS excel_jobs,
    SUM(aws) AS aws_jobs,
    SUM(spark) AS spark_jobs,
    SUM(tableau) AS tableau_jobs,
    SUM(tensor) AS tensorflow_jobs,
    SUM(pytorch) AS pytorch_jobs
FROM Market
WHERE Job_Title = 'Senior Data Engineer'
GROUP BY Job_Title;

# Senior Data Analyst skills
SELECT
    Job_Title,
    COUNT(*) AS total_jobs,
    SUM(Python) AS python_jobs,
    SUM(sql_) AS sql_jobs,
    SUM(excel) AS excel_jobs,
    SUM(aws) AS aws_jobs,
    SUM(spark) AS spark_jobs,
    SUM(tableau) AS tableau_jobs,
    SUM(tensor) AS tensorflow_jobs,
    SUM(pytorch) AS pytorch_jobs
FROM Market
WHERE Job_Title = 'Senior Data Analyst'
GROUP BY Job_Title;

# Lead Data Scientist skills
SELECT
    Job_Title,
    COUNT(*) AS total_jobs,
    SUM(Python) AS python_jobs,
    SUM(sql_) AS sql_jobs,
    SUM(excel) AS excel_jobs,
    SUM(aws) AS aws_jobs,
    SUM(spark) AS spark_jobs,
    SUM(tableau) AS tableau_jobs,
    SUM(tensor) AS tensorflow_jobs,
    SUM(pytorch) AS pytorch_jobs
FROM Market
WHERE Job_Title = 'Lead Data Scientist'
GROUP BY Job_Title;

# Senior Data Engineer skills
SELECT
    Job_Title,
    COUNT(*) AS total_jobs,
    SUM(Python) AS python_jobs,
    SUM(sql_) AS sql_jobs,
    SUM(excel) AS excel_jobs,
    SUM(aws) AS aws_jobs,
    SUM(spark) AS spark_jobs,
    SUM(tableau) AS tableau_jobs,
    SUM(tensor) AS tensorflow_jobs,
    SUM(pytorch) AS pytorch_jobs
FROM Market
WHERE Job_Title = 'Sr. Data Engineer'
GROUP BY Job_Title;

# Marketing Data Analyst skills
SELECT
    Job_Title,
    COUNT(*) AS total_jobs,
    SUM(Python) AS python_jobs,
    SUM(sql_) AS sql_jobs,
    SUM(excel) AS excel_jobs,
    SUM(aws) AS aws_jobs,
    SUM(spark) AS spark_jobs,
    SUM(tableau) AS tableau_jobs,
    SUM(tensor) AS tensorflow_jobs,
    SUM(pytorch) AS pytorch_jobs
FROM Market
WHERE Job_Title = 'Marketing Data Analyst'
GROUP BY Job_Title;

# Machine Learning Engineer
SELECT
    Job_Title,
    COUNT(*) AS total_jobs,
    SUM(Python) AS python_jobs,
    SUM(sql_) AS sql_jobs,
    SUM(excel) AS excel_jobs,
    SUM(aws) AS aws_jobs,
    SUM(spark) AS spark_jobs,
    SUM(tableau) AS tableau_jobs,
    SUM(tensor) AS tensorflow_jobs,
    SUM(pytorch) AS pytorch_jobs
FROM Market
WHERE Job_Title = 'Machine Learning Engineer'
GROUP BY Job_Title;

### Relationship between salary and education

# Analyze the relationship between average salary and education.
SELECT
    Degree,
    COUNT(*) AS total_jobs,
    ROUND(AVG(Avg_SalaryK), 2) AS average_salary
FROM Market
GROUP BY Degree
ORDER BY total_jobs DESC;

# Verify the education categories
SELECT
    Degree, Job_Title,
    COUNT(*) AS total_jobs,
    ROUND(AVG(Avg_SalaryK), 2) AS average_salary
FROM Market
GROUP BY Degree, Job_Title
ORDER BY Degree, total_jobs DESC;

# states with the highest number of job postings.
SELECT
    Job_Location AS state,
    COUNT(*) AS total_jobs
FROM Market
GROUP BY Job_Location
ORDER BY total_jobs DESC
LIMIT 10;

# Average minimum and maximum salaries by state
SELECT
    Job_Location AS state,
    COUNT(*) AS total_jobs,
    ROUND(AVG(Lower_Salary), 2) AS average_min_salary,
    ROUND(AVG(Upper_Salary), 2) AS average_max_salary
FROM Market
GROUP BY Job_Location
ORDER BY total_jobs DESC
LIMIT 10;

# Average salary by state
SELECT
    Job_Location AS state,
    COUNT(*) AS total_jobs,
    ROUND(AVG(Avg_SalaryK), 2) AS average_salary
FROM Market
GROUP BY Job_Location
ORDER BY average_salary DESC
LIMIT 10;

# Top 5 industries with the most job postings
SELECT
    Industry,
    COUNT(*) AS total_jobs
FROM Market
WHERE Industry IS NOT NULL
GROUP BY Industry
ORDER BY total_jobs DESC
LIMIT 5;

# Companies with the maximum number of job openings
SELECT
    Company_Name,
    COUNT(*) AS total_jobs
FROM Market
GROUP BY Company_Name
ORDER BY total_jobs DESC
LIMIT 10;