-- Get total number of ARs for a SPECIFIC teacher name 'Waylon Boehm'

SELECT 
COUNT(assistance_requests.*) AS total_assistances, teachers.name as name
FROM
assistance_requests
JOIN
teachers ON teachers.id = teacher_id
WHERE teachers.name = 'Waylon Boehm'
GROUP BY teachers.name;