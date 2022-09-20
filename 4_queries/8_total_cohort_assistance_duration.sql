-- Total duration of ALL Assistance Requests PER cohort


SELECT 
cohorts.name AS cohort,
SUM(completed_at - started_at) AS total_duration
FROM
assistance_requests 
-- get the ARs per STUDENT joining using their student id
JOIN
students ON students.id = student_id
-- get the durations of all students PER COHORT, joining using their cohort id
JOIN
cohorts ON cohorts.id = students.cohort_id
-- GROUP the aggregated data per cohort name, and order
GROUP BY cohorts.name
ORDER BY total_duration;