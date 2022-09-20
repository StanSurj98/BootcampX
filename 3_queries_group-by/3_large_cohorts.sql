-- Return cohorts that has 18 or more students
SELECT cohorts.name AS cohort_name, COUNT(students.*) AS student_count
FROM cohorts
JOIN students ON cohorts.id = students.cohort_id
GROUP BY cohorts.name
HAVING COUNT(students.*) >= 18
ORDER BY student_count; -- This alias can go here since it runs last in the engine