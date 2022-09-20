-- Get average duration of AR for each cohort
-- Select cohort name & avg time

SELECT 
cohorts.name AS name, 
AVG(completed_at - started_at) AS average_assistance_time
FROM assistance_requests
-- JOIN on students submitting the requests
JOIN students ON students.id = assistance_requests.student_id
-- and since we want to sort by cohort eventually, we need the cohorts table too 
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY average_assistance_time;