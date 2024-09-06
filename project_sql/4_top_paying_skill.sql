/*
Answer: What are the top skills based on salary?
-Look at the average salary associated with eaach skill for Data Scientist positions
-Focuses on roles with specified salaries, regardless of location
-Why? It reveals how different skills impact salary levels for Data Scientist and helps
    identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM    
    job_postings_fact AS j
    INNER JOIN skills_job_dim AS s ON j.job_id = s.job_id
    INNER JOIN skills_dim AS sd ON s.skill_id = sd.skill_id
WHERE
    job_title_short = 'Data Scientist' 
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY 
    avg_salary DESC
LIMIT 5;