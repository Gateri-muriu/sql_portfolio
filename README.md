# Introduction
Dive into the data job market! Focusing on data scientist roles, this project explores top paying jobs, in-demand skills, and where high demand meets high salary data scientists.
SQL queries? Check them out here: [project_sql folder](/project_sql/).
# Background
Driven by a quest to navicate the data scientist job market more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills, streamlining other work to find optimal jobs.
Data hails from my [SQL Course](https://luebarousse.com/sql). It's packed with insights on job titles, salaries, locations, and essential skills.
### The questions I want to answer through my SQL queries were:
1. What are the top-paying data scientist jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data scientists?
4.Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?
# Tools I Used
- **SQL:** To query the database and unearth critical insights.
- **PostgreSQL:** For database management system, ideal for handling the job posting data.
- **Visual Studio Code:** For database management and executing SQL queries.
- **Git & GitHub:** For Version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.
# The Analysis
### 1. Top paying Data Scientist jobs
To identify the highest-paying roles I filtered data scientist positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.

```sql
SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact AS j
    LEFT JOIN company_dim AS c ON j.company_id = c.company_id
WHERE 
    job_title = 'Data Scientist' AND 
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL 
ORDER BY 
    salary_year_avg DESC
LIMIT 10
```

Here's the breakdown of the top data scientist jobs in 2023:
    - **Close Salary Range:** The salary range of top 10 data scientist ranged from $185,000 to $375,000
    - **Diverse Employers:** Companies like Aglo Capital Group, Smith Hanley Associates, Grammarly, and Cisco showing a broad interest across different industries.

### 2. What are the top-paying Data Scientist jobs?
To identify the skills for the top paying skills in Data Scientist I joined job posting fact table with skills dim and skills job dim table.
``` sql
WITH top_paying_jobs AS (
   SELECT 
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact AS j
        LEFT JOIN company_dim AS c ON j.company_id = c.company_id
    WHERE 
        job_title = 'Data Scientist' AND 
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL 
    ORDER BY 
        salary_year_avg DESC
    LIMIT 10
)
SELECT  
    job_title,
    salary_year_avg,
    skills
FROM    
    top_paying_jobs AS t
    INNER JOIN skills_job_dim AS s ON t.job_id = s.job_id
    INNER JOIN skills_dim AS sd ON s.skill_id = sd.skill_id
 ORDER BY 
    salary_year_avg DESC
LIMIT 10; 
 ```   
Here is the breakdown of the finding:
SQL, Python, and Java were leading each with a count of 2 in 10 skills, followed by Cassandra, Spark, Hadoop, and Tableau each with a count of 1 in Data Scientist which are highest paid.

### 3. Top demanded skills ###
- **Python**, **SQL** and **R** are leading Data Scientist skills

| Skills  | Demand Count  |
|---------|---------------|
| Python  | 114016        |
| SQL     | 79174         |
| R       | 59754         |
| SAS     | 29642         |
Tableau   | 29513         |
*Table of the demand for the top 5 skills in the data scientist job postings*

### 4. Top paying skills ###
Exploring the average salaries associated with the top paying skills in Data Scientists role 2023.
| Skills  | Average Salary |
|---------|----------------|
| Asana   | 215477         |
| Airtable| 201143         |
| Redhat  | 189500         |
| Watson  | 187417         |
| Elixir  | 170824         |

### 5. Optimal skills
The most optimal skill in data scientist role is python with a demand count of 763, SQL second and third R with a demand count of 591 and 394 respectifully. 

```sql
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_counts,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_sal
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Scientist'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY 
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id)> 10
ORDER BY
    demand_counts DESC,
    avg_sal DESC   
LIMIT 25;
```
# What I Learned
- Mastered the art of advance SQL.
- Advanced solving skills, turning questions into actionable, insightful queries.

# Conclusions
### Insights 
1. **Top paying Data Scientists Jobs**: 
The top paying Data Scientist job that allow remote work offer a wide range of salaries, the highest at $375000.
2. **Top paying Data Scientist Skills**:
Some of the top paying skills in Data Scientist role require SQL, Python, Jave Cassandra, Spark, Hadoop, and Tableau to earn top salaries.
3. **Top demanding skills**:
Python is the most demanded skills in Data Science role seconded by SQL thus making it essential for job seekers.
4. **Top paying skills**:
The most paying skill in Data Scientist is Asana followed closely by Airtable which are associated with the highest average salary.
5. **Optimal skills**:
The optimal skill in the market is Pthon with highest demand counts for the Data Scientist.
### Findings
This project enhanced my skills and provided valuable insights into the data scientist job market. The findings from the analysis guide to prioritizing skills development and search efforts. Aspiring data scientist can position themselves in a competitive job market by focusing on high demand, high salaries skills. 

