-- List of students in any particular cohort, ordered by alphabetical
SELECT id, name
FROM students
WHERE cohort_id = 9
ORDER BY name ASC;