# 

# \# Job Market Analysis – Data Analytics Project

# 

# \## 1. Project Overview

# 

# This project focuses on analysing job market trends using a dataset containing 742 US job postings related to Data Science, Data Analytics, Data Engineering and other related roles.

# 

# The objective is to identify job-market trends, salary patterns, industry demand, company hiring activity, required technical skills, seniority differences and education-related salary variations.

# 

# The project uses MySQL for data exploration and analysis and Microsoft Power BI for interactive dashboard development and visualisation.

# 

# \## 2. Tools and Technologies

# 

# | Tool / Technology | Purpose |

# |---|---|

# | MySQL 5.7.43 | Database management and SQL analysis |

# | MySQL Workbench | SQL query execution and data exploration |

# | Power BI Desktop | Interactive dashboards and visualisations |

# | Power Query | Data cleaning and transformation |

# | DAX | Measures and statistical calculations |

# | Git and GitHub | Version control and project hosting |

# 

# \## 3. Dataset Information

# 

# The dataset contains 742 job postings and 42 attributes.

# 

# | Dataset Information | Details |

# |---|---:|

# | Total Job Postings | 742 |

# | Unique Companies | 343 |

# | Unique Industries | 60 |

# | Total Attributes | 42 |

# | Salary Currency | US Dollars (USD) |

# | Salary Unit | Thousands of USD (USD K) |

# 

# \### Important Dataset Attributes

# 

# \- Job\_Title – Original job title advertised by the employer.

# \- Salary\_Estimate – Original salary estimate.

# \- Avg\_SalaryK – Average salary calculated from the salary range.

# \- Lower\_Salary – Lower salary estimate.

# \- Upper\_Salary – Upper salary estimate.

# \- Company\_Name – Company name with rating information.

# \- company\_txt – Company name used for company-level analysis.

# \- Job\_Location – US state abbreviation.

# \- Industry – Industry associated with the job posting.

# \- Degree – Education-related indicator.

# \- Hourly – Identifies hourly compensation postings.

# \- Employer\_provided – Identifies employer-provided salary estimates.

# \- Python, SQL, Excel, AWS and other binary columns – Indicate whether a particular skill is recorded for a posting.

# \- job\_title\_sim – Normalized job-role category.

# \- seniority\_by\_title – Seniority classification such as junior, senior or unclassified.

# 

# \## 4. Project Objectives

# 

# 1\. Retrieve and analyse job market data from a MySQL database.

# 2\. Identify states with the highest number of job postings.

# 3\. Compare average minimum, maximum and overall salaries across states.

# 4\. Identify industries with the highest number of job postings.

# 5\. Identify companies with the highest number of job openings.

# 6\. Analyse exact job titles and normalized job-role categories.

# 7\. Identify the most frequently recorded technical skills.

# 8\. Analyse skills required across different job roles.

# 9\. Examine salary variations by seniority and education-related categories.

# 10\. Evaluate data quality, repeated records and salary outliers.

# 11\. Build interactive Power BI dashboards and derive business insights.

# 

# \## 5. Project Workflow

# 

# \### Step 1 – Database Connection

# 

# \- Connected to the MySQL database.

# \- Retrieved the Market table from the project\_job\_market\_analysis database.

# \- Verified the dataset structure using SQL queries.

# \- Confirmed that the dataset contained 742 records and 42 columns.

# 

# \### Step 2 – Data Exploration and Cleaning

# 

# Performed data-quality checks to identify:

# \- Missing values.

# \- Invalid placeholder values.

# \- Duplicate IDs.

# \- Repeated posting patterns.

# \- Empty columns.

# \- Salary calculation consistency.

# 

# The -1 placeholder values in Rating, Founded and Age were treated as unavailable values and converted to NULL during Power BI data preparation.

# 

# The original MySQL database was preserved.

# 

# The FIELD4 column was identified as completely empty and excluded from analytical use.

# 

# \### Step 3 – Exploratory Data Analysis using SQL

# 

# SQL queries were used to analyse:

# \- Job postings by state.

# \- Salary distribution by state.

# \- Top industries and companies.

# \- Exact job titles and normalized job roles.

# \- Skills required by job title.

# \- Salary differences by education and seniority.

# \- Hourly versus non-hourly compensation.

# \- Salary averages, medians and standard deviations.

# \- Quartiles, interquartile ranges and potential outliers.

# 

# \### Step 4 – Skill Data Transformation

# 

# The dataset contained 16 binary skill indicator columns.

# 

# Power Query was used to:

# 1\. Duplicate the original Market query.

# 2\. Select the 16 skill columns.

# 3\. Unpivot the selected columns.

# 4\. Retain only TRUE values.

# 5\. Rename Attribute to Skill.

# 6\. Remove the unnecessary Value column.

# 

# This transformed the skill indicators into a structured format suitable for skill-demand analysis.

# 

# The transformation also enabled comparisons of skill requirements across job roles.

# 

# \### Step 5 – Statistical Analysis

# 

# Additional statistical analysis was performed using SQL and DAX.

# 

# The following measures were calculated:

# 

# \- Average salary.

# \- Median salary.

# \- Standard deviation.

# \- First quartile (Q1).

# \- Third quartile (Q3).

# \- Interquartile range (IQR).

# \- Number of salary observations.

# 

# The 1.5 × IQR method was used to identify potential salary outliers.

# 

# \### Step 6 – Power BI Dashboard Development

# 

# Four interactive dashboard pages were developed using KPI cards, bar charts, column charts, matrices, tables and synchronized slicers.

# 

# \## 6. Key Project Findings

# 

# \### 6.1 Job Market Overview

# 

# \- Total job postings: 742.

# \- Unique companies: 343.

# \- Unique industries: 60.

# \- Overall average salary: $101.48K.

# \- Overall median salary: $97.50K.

# 

# \### 6.2 Job Titles

# 

# The exact job title Data Scientist recorded the highest number of postings, with 131, followed by Data Engineer with 53 postings and Senior Data Scientist with 34 postings.

# 

# Normalized job-role analysis produced different counts because related exact titles were grouped together.

# 

# | Normalized Job Role | Postings | Distinct Exact Titles | Average Salary (USD K) |

# |---|---:|---:|---:|

# | Data Scientist | 313 | 85 | 118.29 |

# | Other Scientist | 143 | 69 | 88.06 |

# | Data Engineer | 119 | 29 | 105.40 |

# | Analyst | 101 | 46 | 66.11 |

# | Machine Learning Engineer | 22 | 9 | 126.43 |

# | Data Scientist Project Manager | 16 | 8 | 73.22 |

# | Unclassified | 10 | 6 | 91.45 |

# | Data Analytics | 8 | 5 | 69.25 |

# | Director | 5 | 3 | 130.80 |

# | Data Modeler | 5 | 4 | 77.50 |

# 

# Exact job titles and normalized job roles are reported separately because they represent different levels of classification.

# 

# \### 6.3 State-wise Job Market Analysis

# 

# California had the highest number of job postings, with 152, followed by Massachusetts with 103 and New York with 72.

# 

# California also recorded the highest average salary among the ten states with the most postings, at $123.51K.

# 

# | State | Job Postings | Average Salary (USD K) |

# |---|---:|---:|

# | CA | 152 | 123.51 |

# | MA | 103 | 107.50 |

# | NY | 72 | 98.65 |

# | VA | 41 | 95.62 |

# | IL | 40 | 116.66 |

# | MD | 35 | 97.36 |

# | PA | 33 | 93.86 |

# | TX | 28 | 92.68 |

# | WA | 21 | 93.19 |

# | NC | 21 | 98.45 |

# 

# Salary comparisons were expanded to include median salary, standard deviation, quartiles and sample sizes.

# 

# \### 6.4 Industry Analysis

# 

# The five industries with the highest number of job postings were:

# 

# | Industry | Job Postings |

# |---|---:|

# | Biotech \& Pharmaceuticals | 112 |

# | Insurance Carriers | 63 |

# | Computer Hardware \& Software | 59 |

# | IT Services | 50 |

# | Health Care Services \& Hospitals | 49 |

# 

# Biotech \& Pharmaceuticals was the leading industry in the dataset.

# 

# \### 6.5 Technical Skill Demand

# 

# The most frequently recorded technical skills were:

# 

# | Rank | Skill | Job Postings |

# |---:|---|---:|

# | 1 | Python | 392 |

# | 2 | Excel | 388 |

# | 3 | SQL | 380 |

# | 4 | AWS | 176 |

# | 5 | Spark | 167 |

# | 6 | Tableau | 148 |

# | 7 | Hadoop | 124 |

# | 8 | TensorFlow | 72 |

# | 9 | SAS | 66 |

# | 10 | Power BI | 56 |

# 

# The analysis indicates strong demand for foundational skills such as Python, Excel and SQL.

# 

# Skill counts are not mutually exclusive because one job posting can contain multiple skill indicators.

# 

# Of the 742 postings, 647 contained at least one of the 16 recorded skill indicators, while 95 had no recorded skill flags.

# 

# \### 6.6 Skills Required by Job Role

# 

# The project examined skill requirements across normalized job-role categories.

# 

# Examples of observed patterns include:

# 

# \- Data Scientists: Python, SQL, Excel, AWS and machine-learning-related tools.

# \- Data Engineers: SQL, Spark, Python and AWS.

# \- Analysts: Excel, SQL, Python, Tableau and Power BI.

# 

# These findings can help candidates identify foundational and role-specific technical skills.

# 

# \### 6.7 Salary Analysis by Education Category

# 

# The dataset uses three education-related categories: M, P and na.

# 

# | Education Category | Job Postings | Average Salary (USD K) | Median Salary (USD K) | Standard Deviation |

# |---|---:|---:|---:|---:|

# | M | 252 | 105.63 | 102.50 | 37.10 |

# | na | 383 | 94.70 | 89.00 | 36.63 |

# | P | 107 | 115.98 | 120.00 | 36.16 |

# | Total | 742 | 101.48 | 97.50 | 37.48 |

# 

# According to the assignment documentation:

# \- M refers to a master's-degree experience-credit mention.

# \- P refers to a Ph.D. experience-credit mention.

# \- na represents an unclassified or unavailable education indicator.

# 

# These categories should not be interpreted as proof that a particular degree was mandatory for every job.

# 

# \## 7. Additional Statistical Analysis

# 

# \### 7.1 Hourly and Employer-Provided Salary Analysis

# 

# Salary postings were examined separately using the Hourly and Employer\_provided indicators.

# 

# | Salary Basis | Salary Source | Records | Average Salary (USD K) | Median (USD K) |

# |---|---|---:|---:|---:|

# | Non-hourly | Not Employer Provided | 704 | 102.42 | 98.00 |

# | Non-hourly | Employer Provided | 14 | 140.00 | 125.00 |

# | Hourly | Not Employer Provided | 21 | 51.05 | 51.50 |

# | Hourly | Employer Provided | 3 | 55.00 | 55.00 |

# 

# The dataset contains 718 non-hourly postings and 24 hourly postings.

# 

# Inspection of all 24 hourly records showed that Salary\_Estimate contains hourly pay ranges, while Lower\_Salary, Upper\_Salary and Avg\_SalaryK contain corresponding annualized salary values.

# 

# The values suggest an annualization convention of approximately 2,080 working hours per year, although the exact conversion procedure is not explicitly documented.

# 

# These annualized figures should be interpreted as estimated compensation equivalents rather than guaranteed annual earnings.

# 

# \### 7.2 Salary Distribution and Variability

# 

# Salary distribution was analysed using mean, median, standard deviation, Q1, Q3 and IQR.

# 

# For non-hourly and non-employer-provided postings:

# \- Records: 704.

# \- Average salary: $102.42K.

# \- Median salary: $98K.

# \- Standard deviation: $36.50K.

# \- Q1: $75.50K.

# \- Q3: $123.50K.

# \- IQR: $48K.

# 

# These measures provide additional information about salary variation beyond the average alone.

# 

# \### 7.3 Seniority and Salary Analysis

# 

# Seniority was examined using the seniority\_by\_title attribute.

# 

# | Seniority Category | Postings | Average Salary (USD K) |

# |---|---:|---:|

# | Unclassified (na) | 519 | 93.10 |

# | Senior (sr) | 220 | 121.69 |

# | Junior (jr) | 3 | 71.00 |

# 

# The analysis was further stratified by normalized job role and state.

# 

# For example:

# \- Senior Data Scientist postings in California averaged $162.40K, compared with $130.80K for unclassified Data Scientist postings.

# \- Senior Data Engineer postings in California averaged $149.58K, compared with $107.83K for unclassified postings.

# \- Senior Data Scientist postings in Massachusetts averaged $135.86K, compared with $94.08K for unclassified postings.

# 

# The results indicate salary associations with seniority classifications, but they do not establish causation. Junior-level comparisons are particularly limited by small sample sizes.

# 

# \### 7.4 Salary Outlier Analysis

# 

# Potential salary outliers were identified separately for hourly and non-hourly records using the 1.5 × IQR method.

# 

# | Metric | Non-hourly | Hourly |

# |---|---:|---:|

# | Records | 718 | 24 |

# | Q1 | 76.50 | 44.50 |

# | Q3 | 124.00 | 56.50 |

# | IQR | 47.50 | 12.00 |

# | Lower Boundary | 5.25 | 26.50 |

# | Upper Boundary | 195.25 | 74.50 |

# | Potential Outliers | 11 | 1 |

# 

# Twelve observations were flagged in total.

# 

# These observations were inspected and retained because statistical outliers are not necessarily erroneous records.

# 

# \### 7.5 Salary Calculation Validation

# 

# The Avg\_SalaryK field was compared with the arithmetic midpoint of Lower\_Salary and Upper\_Salary.

# 

# | Validation | Result |

# |---|---:|

# | Total Records | 742 |

# | Matching Midpoints | 742 |

# | Non-matching Midpoints | 0 |

# 

# All 742 records matched the calculated midpoint, confirming 100% consistency.

# 

# \### 7.6 Duplicate and Repeated-Content Validation

# 

# The dataset contained 742 unique IDs and zero duplicate primary-key values.

# 

# A full-record comparison using all 41 non-ID attributes identified:

# 

# \- 221 repeated full-row content groups.

# \- 496 records within those groups.

# \- 275 excess records beyond one record per identical-content group.

# \- 246 records outside the repeated groups.

# 

# These were treated as repeated-content patterns rather than automatically confirmed duplicate advertisements. No records were automatically deleted.

# 

# \## 8. Data Quality and Validation

# 

# A comprehensive missing-value assessment was conducted across important analytical fields.

# 

# | Column | Missing or Invalid Records | Percentage |

# |---|---:|---:|

# | Job\_Title | 0 | 0% |

# | Job\_Location | 0 | 0% |

# | Industry | 0 | 0% |

# | Company\_Name | 0 | 0% |

# | Avg\_SalaryK | 0 | 0% |

# | Lower\_Salary | 0 | 0% |

# | Upper\_Salary | 0 | 0% |

# | Degree (SQL NULL or blank) | 0 | 0% |

# | Rating (-1 or NULL) | 11 | 1.48% |

# | Founded (-1 or NULL) | 50 | 6.74% |

# | Age (-1 or NULL) | 50 | 6.74% |

# | FIELD4 | 742 | 100% |

# 

# The Degree column had no SQL NULL or blank records, but 383 postings contained the category na.

# 

# The FIELD4 column was entirely empty and was excluded from analytical use.

# 

# \## 9. Power BI Dashboard Pages

# 

# The project contains four interactive dashboard pages.

# 

# \### Page 1 – Job Market Overview

# 

# \- Total job postings KPI.

# \- Average salary KPI.

# \- Total companies KPI.

# \- Total industries KPI.

# \- Top 10 job titles by postings.

# \- Top 5 industries by postings.

# \- Top 10 companies by postings.

# 

# \### Page 2 – State-wise Job \& Salary Analysis

# 

# \- Top 10 states by job postings.

# \- Top 10 states by average salary.

# \- Average minimum versus maximum salary by state.

# \- State-wise salary statistics, including average, median, sample size and standard deviation.

# 

# \### Page 3 – Skills \& Job Roles

# 

# \- Top 10 most demanded skills.

# \- Skill requirements by normalized job role.

# \- Average salary by job role.

# \- Salary statistics by job role, including average, median, posting count and standard deviation.

# \- Average versus median salary comparison by job role.

# 

# \### Page 4 – Salary \& Education Analysis

# 

# \- Average salary by education category.

# \- Job postings by education category.

# \- Average salary by job role and education category.

# \- Salary statistics by education category, including mean, median, sample size and standard deviation.

# 

# \### Interactive Features

# 

# Synchronized dropdown slicers allow users to filter dashboard pages by:

# \- State.

# \- Industry.

# \- Job Role.

# 

# \## 10. Career-Oriented Insights and Recommendations

# 

# \### Data Analyst

# 

# Recommended skills:

# \- Excel.

# \- SQL.

# \- Python.

# \- Tableau.

# \- Power BI.

# 

# Suggested portfolio evidence:

# \- SQL-based business analysis.

# \- Interactive Power BI dashboard.

# \- Excel reporting and data-cleaning project.

# 

# \### Data Scientist

# 

# Recommended skills:

# \- Python.

# \- SQL.

# \- AWS.

# \- TensorFlow.

# \- PyTorch.

# 

# Suggested portfolio evidence:

# \- Exploratory data analysis.

# \- Predictive modelling project.

# \- Machine-learning classification or regression project.

# 

# \### Data Engineer

# 

# Recommended skills:

# \- Python.

# \- SQL.

# \- Spark.

# \- AWS.

# 

# Suggested portfolio evidence:

# \- Data extraction and transformation pipeline.

# \- SQL database project.

# \- Data processing and ETL workflow.

# 

# \### Recommendations for Employers

# 

# \- Clearly distinguish essential skills from preferred skills.

# \- Publish salary ranges and compensation basis.

# \- Clarify education requirements in job descriptions.

# \- Standardize job titles and company names.

# \- Review salary bands across locations and seniority levels.

# \- Track skill requirements alongside hiring outcomes.

# 

# These recommendations describe potential actions based on observed job-posting patterns; frequently recorded skills do not automatically guarantee employability or higher salaries.

# 

# \## 11. Project Limitations

# 

# \- The dataset is a supplied US job-postings snapshot, not a live job-market survey.

# \- The findings should not be interpreted as current market salary benchmarks.

# \- Salary values are estimates and may differ from actual employee compensation.

# \- Hourly records appear to use annualized salary equivalents.

# \- Employer-provided salary groups contain relatively few observations.

# \- Some state and job-role comparisons have small sample sizes.

# \- Skill indicators are binary and may not capture proficiency levels.

# \- A job posting may contain multiple skill flags, so skill counts overlap.

# \- Education categories indicate experience-credit mentions, not necessarily mandatory qualifications.

# \- Seniority, education and salary relationships are descriptive and do not establish causation.

# \- Repeated-content records were identified but not automatically removed.

# \- The dataset does not provide hiring outcomes or information about whether a posting resulted in an actual hire.

# 

# \## 12. Conclusion

# 

# This project demonstrates an end-to-end data analytics workflow involving MySQL, SQL analysis, data cleaning, Power Query transformations, DAX measures and Power BI dashboard development.

# 

# The analysis highlights the demand for Data Scientist and Data Engineer roles, frequently recorded technical skills, geographical salary differences, industry hiring patterns and salary associations with seniority and education-related indicators.

# 

# The additional statistical analysis strengthens the project by moving beyond averages to include medians, standard deviations, quartiles, outlier screening, salary validation and repeated-content checks.

# 

# The project demonstrates practical skills in database analysis, exploratory data analysis, statistical reasoning, business intelligence and data storytelling.

# 

# \## 13. Repository Structure

# 

# ```text

# Job-Market-Analysis/

# │

# ├── powerbi/

# │   └── Job Market Analysis.pbix

# │

# ├── presentation/

# │   └── Capstone\_Presentation\_Job\_Market\_Analysis.pptx

# │

# ├── reports/

# │   ├── Capstone\_Project\_Report\_Job\_Market\_Analysis.docx

# │   └── Capstone\_Project\_Report\_Job\_Market\_Analysis.pdf

# │

# ├── Screenshots/

# │   └── Powerbi Screenshots/

# │       ├── Job Market Overview

# │       ├── State-wise Analysis

# │       ├── Skills \& Job Roles

# │       └── Salary \& Education Analysis

# │

# ├── sql/

# │   └── Job Market Analysis.sql

# │

# ├── README.md

# └── .gitignore

# ```

# 

# \## 14. Author

# 

# \*\*Ranjitha M R\*\*

# 

# Data Analytics Project

# 

# GitHub: https://github.com/ranjitharanjum

# 

# \---

# 

# \*This project was completed as part of the CDA / PRDA-04 Data Analytics project work.\*

