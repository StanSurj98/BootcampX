-- Get total duration any particular student has spent on ALL assignments
-- Try using 'Ibrahim Schimmel' for now

SELECT SUM(assignment_submissions.duration) AS total_duration
FROM
assignment_submissions 
JOIN 
students ON students.id = student_id
WHERE students.name = 'Ibrahim Schimmel';
