SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date ::DATE AS date
FROM
    job_postings_fact
LIMIT
    10;




SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time,
    EXTRACT(MONTH FROM job_posted_date) AS month_posted
FROM
    job_postings_fact
LIMIT
    10;

CREATE TABLE january_jobs AS
    SELECT *
    FROM 
        job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date)=1;



CREATE TABLE feb_jobs AS
    SELECT *
    FROM 
        job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date)=2;


CREATE TABLE march_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date)=3;


SELECT 
    job_posted_date
FROM
    march_jobs;

SELECT 
    job_title_short,
    job_location,
    COUNT(job_title_short) total_count,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New_York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS job_category
FROM
    job_postings_fact
WHERE 
    job_title_short = 'Data Scientist'
GROUP BY
    job_location, job_title_short
ORDER BY
    total_count DESC;

--Label new column as follows:
--'Anywhere' jobs as 'Remote'
--'New_York, NY' jobs as 'Local'
-- Otherwise 'Onsite'



/* Find the count of the number of remote job postings per skills
    -Display the top 5 skills by their demand in remote jobs
    -Include skill ID, name, and count of postings requiring the skill
*/
WITH remote_job_skills AS (
    SELECT 
        skill_id,
        COUNT(*) AS skills_count
    FROM 
        skills_job_dim AS s
        INNER JOIN job_postings_fact AS j ON s.skill_id = j.job_id
    WHERE j.job_work_from_home = TRUE AND 
        j.job_title_short = 'Data Scientist'

    GROUP BY 
        skill_id
)
SELECT 
    skills.skill_id,
    skills AS skill_name,
    skills_count
FROM
    remote_job_skills
    INNER JOIN skills_dim AS skills ON skills.skill_id = remote_job_skills.skill_id
ORDER BY skills_count DESC
LIMIT 5

--Using Union in table
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

UNION

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    feb_jobs;

--Using Union All
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

UNION All

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    feb_jobs;


/*
Find job postings from the first quarter that have a salary greater than $70K
-Combine job posting tables from the first quarter of 2023 (Jan-Mar)
-Gets job postings with an average yearly salary > $70,000
*/
SELECT 
    job_title_short,
    job_location,
    job_via,
    salary_year_avg,
    job_posted_date::DATE
FROM(
    SELECT * 
    FROM january_jobs
    UNION All
    SELECT * 
    FROM feb_jobs
    UNION All
    SELECT *
    FROM march_jobs
) AS qtr_1
WHERE 
    salary_year_avg > 70000 
ORDER BY 
    salary_year_avg DESC;
