-- Get total assignments submitted per cohort
SELECT 
cohorts.name AS cohort_name,
-- count all submissions
COUNT(assignment_submissions.*) AS total_submissions
FROM 
assignment_submissions
JOIN
-- must join to students first, connect student id foreign keys
students ON students.id = student_id
JOIN
-- THEN join by cohorts as now we have the cohort ids to separate by cohorts
cohorts ON cohorts.id = students.cohort_id
GROUP BY cohorts.name
ORDER BY total_submissions DESC;
