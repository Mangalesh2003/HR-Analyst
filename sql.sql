CREATE DATABASE project_hr_analysis;
USE project_hr_analysis;
show tables;
-- Total employees
SELECT COUNT(*) AS total_employees FROM HR_dataset;

-- Percent remote vs HQ
SELECT
    ROUND(SUM(CASE WHEN location = 'Remote' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS remote_pct,
    ROUND(SUM(CASE WHEN location = 'Headquarters' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS hq_pct
FROM HR_dataset;

-- Average age
SELECT ROUND(AVG(Age), 2) AS avg_age FROM HR_dataset;

SELECT
    YEAR(STR_TO_DATE(hire_date, '%d-%m-%Y')) AS hire_year,
    COUNT(*) AS hires
FROM HR_dataset
GROUP BY YEAR(STR_TO_DATE(hire_date, '%d-%m-%Y'))
ORDER BY hire_year;

SELECT
    gender,
    COUNT(*) AS employee_count
FROM HR_dataset
GROUP BY gender
ORDER BY employee_count DESC;

SELECT location_state, COUNT(*) AS employee_count
FROM HR_dataset
GROUP BY location_state
ORDER BY employee_count DESC;

SELECT department, COUNT(*) AS employee_count
FROM HR_dataset
GROUP BY department
ORDER BY employee_count DESC;

SELECT race, COUNT(*) AS employee_count
FROM HR_dataset
GROUP BY race
ORDER BY employee_count DESC;

-- Active employees vs terminated

SELECT      
COUNT(*) AS total,          
COUNT(CASE WHEN termdate = '' THEN 1 END) AS active_members,     
COUNT(CASE WHEN termdate != '' AND termdate IS NOT NULL THEN 1 END) AS terminated_members 
FROM HR_dataset;



























