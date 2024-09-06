/* 
Question: What are the most in-demand skills for data scientists?
-Join job postings to inner join table similar to query 2
-Identify the top 5 in-demand skills for a data scientist.
-Focus on all job postings.
-Why? Retrieves the top 5 skills with the highest demand in the job market,
 providing insights into the most valuable skills for job seekers.
 */


SELECT 
    skills,
    COUNT(s.job_id) AS demand_count
FROM    
    job_postings_fact AS j
    INNER JOIN skills_job_dim AS s ON j.job_id = s.job_id
    INNER JOIN skills_dim AS sd ON s.skill_id = sd.skill_id
WHERE
    job_title_short = 'Data Scientist' 
GROUP BY
    skills
ORDER BY 
    demand_count DESC
LIMIT 5;