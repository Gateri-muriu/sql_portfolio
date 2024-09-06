/*
Answer: What are the most optimal skills to learn(aka it's high demand and a high-paying skill)?
-Identify skills in high demand and average salaries for Data Scientist roles
-Concentrates on remote positions with specified salaries
-Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offerinfg strategic insights for career development in data scientist.
*/


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
