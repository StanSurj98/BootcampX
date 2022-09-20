-- get CURRENTLY ENROLLED STUDENTS' (end_date IS NULL) average assignment completion time (duration)

SELECT 
students.name AS student,
AVG(assignment_submissions.duration) AS average_completion_time
FROM 
assignment_submissions
JOIN 
students ON students.id = student_id
WHERE
students.end_date IS NULL
GROUP BY students.name
ORDER BY average_completion_time DESC;