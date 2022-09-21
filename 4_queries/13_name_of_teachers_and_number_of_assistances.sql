-- Get name of teachers that assisted like #12 also for 'JUL02'
-- BUT this time, also include the # of assistances they did

SELECT 
DISTINCT teachers.name as teachers,
cohorts.name as cohort,
COUNT(assistance_requests) as total_assistances
FROM
teachers
JOIN
assistance_requests ON teachers.id = teacher_id
JOIN
students ON students.id = student_id
JOIN
cohorts ON cohorts.id = students.cohort_id
WHERE 
cohorts.name = 'JUL02'
GROUP BY
-- Group by BOTH teachers and cohorts, since we're counting up all ARs per cohort per teacher
teachers.name, cohorts.name
ORDER BY 
teachers;