/*
Question: What are the top-paying Data Scientist jobs?
-Identify the top 10 highest-paying Data Scientist roles that are available remotely.
-Focuses on job postings with specified salaries (remove nulls).
-Why? Highlight the top-paying opportunities for Data Scientists, offering insights into employments
-helping job seekers understand which skills to develop that align with top salaries
*/
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
    



/*
[
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "skills": "sql"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "skills": "python"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "skills": "java"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "skills": "cassandra"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "skills": "spark"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "skills": "hadoop"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "skills": "tableau"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "275000.0",
    "skills": "sql"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "275000.0",
    "skills": "python"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "275000.0",
    "skills": "java"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "275000.0",
    "skills": "cassandra"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "275000.0",
    "skills": "aws"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "275000.0",
    "skills": "spark"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "275000.0",
    "skills": "airflow"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "275000.0",
    "skills": "hadoop"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "275000.0",
    "skills": "tableau"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "250000.0",
    "skills": "sql"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "250000.0",
    "skills": "python"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "250000.0",
    "skills": "javascript"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "250000.0",
    "skills": "html"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "250000.0",
    "skills": "mongodb"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "250000.0",
    "skills": "vba"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "250000.0",
    "skills": "php"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "250000.0",
    "skills": "mongodb"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "250000.0",
    "skills": "aws"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "250000.0",
    "skills": "tensorflow"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "250000.0",
    "skills": "scikit-learn"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "250000.0",
    "skills": "excel"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "250000.0",
    "skills": "tableau"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "250000.0",
    "skills": "powerpoint"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "204500.0",
    "skills": "sql"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "204500.0",
    "skills": "python"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "204500.0",
    "skills": "scala"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "204500.0",
    "skills": "r"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "197500.0",
    "skills": "sql"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "197500.0",
    "skills": "python"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "197500.0",
    "skills": "r"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "197500.0",
    "skills": "snowflake"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "197500.0",
    "skills": "sheets"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "195000.0",
    "skills": "python"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "190600.0",
    "skills": "python"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "190600.0",
    "skills": "aws"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "186000.0",
    "skills": "sql"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "186000.0",
    "skills": "python"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "186000.0",
    "skills": "scala"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "186000.0",
    "skills": "r"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "185000.0",
    "skills": "sql"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "185000.0",
    "skills": "python"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "185000.0",
    "skills": "sql"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "185000.0",
    "skills": "python"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "185000.0",
    "skills": "databricks"
  },
  {
    "job_title": "Data Scientist",
    "salary_year_avg": "185000.0",
    "skills": "spark"
  }
]
*/