/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS(
    SELECT
    job_id,
    job_title,
    salary_year_avg,
    name AS company_name
FROM
    job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        -- job_location = 'New Zealand' OR
        -- job_location = 'Australia' AND 
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim
ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;

/*
The top 10 skills frequently mentioned in data analyst job postings are:

SQL - 8 occurrences
Python - 7 occurrences
Tableau - 6 occurrences
R - 4 occurrences
Snowflake - 3 occurrences
Pandas - 3 occurrences
Excel - 3 occurrences
Azure - 2 occurrences
Bitbucket - 2 occurrences
Go - 2 occurrences

[
  {
    "job_id": 1801353,
    "job_title": "Digital Data Analyst",
    "salary_year_avg": null,
    "company_name": "AKQA",
    "skills": "power bi"
  },
  {
    "job_id": 1376689,
    "job_title": "Data Analyst",
    "salary_year_avg": null,
    "company_name": "Ministry of Business, Innovation & Employment",
    "skills": "sas"
  },
  {
    "job_id": 1376689,
    "job_title": "Data Analyst",
    "salary_year_avg": null,
    "company_name": "Ministry of Business, Innovation & Employment",
    "skills": "vba"
  },
  {
    "job_id": 1376689,
    "job_title": "Data Analyst",
    "salary_year_avg": null,
    "company_name": "Ministry of Business, Innovation & Employment",
    "skills": "excel"
  },
  {
    "job_id": 1376689,
    "job_title": "Data Analyst",
    "salary_year_avg": null,
    "company_name": "Ministry of Business, Innovation & Employment",
    "skills": "sas"
  },
  {
    "job_id": 1740243,
    "job_title": "Project Coordinator / PowerBI Data Analyst",
    "salary_year_avg": null,
    "company_name": "Peoplebank",
    "skills": "sharepoint"
  },
  {
    "job_id": 287830,
    "job_title": "Data Analyst",
    "salary_year_avg": null,
    "company_name": "Franklin Smith",
    "skills": "python"
  },
  {
    "job_id": 287830,
    "job_title": "Data Analyst",
    "salary_year_avg": null,
    "company_name": "Franklin Smith",
    "skills": "r"
  },
  {
    "job_id": 287830,
    "job_title": "Data Analyst",
    "salary_year_avg": null,
    "company_name": "Franklin Smith",
    "skills": "gcp"
  },
  {
    "job_id": 579254,
    "job_title": "Configuration Data Analyst",
    "salary_year_avg": null,
    "company_name": "Babcock International",
    "skills": "sap"
  },
  {
    "job_id": 630244,
    "job_title": "Data Analyst",
    "salary_year_avg": null,
    "company_name": "Onit",
    "skills": "sql"
  },
  {
    "job_id": 630244,
    "job_title": "Data Analyst",
    "salary_year_avg": null,
    "company_name": "Onit",
    "skills": "python"
  },
  {
    "job_id": 630244,
    "job_title": "Data Analyst",
    "salary_year_avg": null,
    "company_name": "Onit",
    "skills": "go"
  },
  {
    "job_id": 630244,
    "job_title": "Data Analyst",
    "salary_year_avg": null,
    "company_name": "Onit",
    "skills": "postgresql"
  },
  {
    "job_id": 630244,
    "job_title": "Data Analyst",
    "salary_year_avg": null,
    "company_name": "Onit",
    "skills": "pandas"
  },
  {
    "job_id": 630244,
    "job_title": "Data Analyst",
    "salary_year_avg": null,
    "company_name": "Onit",
    "skills": "excel"
  },
  {
    "job_id": 1152666,
    "job_title": "Data Analyst",
    "salary_year_avg": null,
    "company_name": "Consult Recruitment",
    "skills": "sql"
  },
  {
    "job_id": 1152666,
    "job_title": "Data Analyst",
    "salary_year_avg": null,
    "company_name": "Consult Recruitment",
    "skills": "t-sql"
  },
  {
    "job_id": 1152666,
    "job_title": "Data Analyst",
    "salary_year_avg": null,
    "company_name": "Consult Recruitment",
    "skills": "sql server"
  },
  {
    "job_id": 1152666,
    "job_title": "Data Analyst",
    "salary_year_avg": null,
    "company_name": "Consult Recruitment",
    "skills": "word"
  }
]
*/