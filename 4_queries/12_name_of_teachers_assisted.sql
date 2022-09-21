-- Get name of all teachers that performed assistance requests DURING a particular cohort
-- Using 'JUL02'
-- Get instructors and cohorts' names, don't repeat instructor names (DISTINCT)

SELECT 
DISTINCT teachers.name as teachers,
cohorts.name as cohort
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
ORDER BY 
teachers;