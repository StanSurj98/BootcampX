-- Get all students without gmail.com in email or phone numbers
SELECT name, email, id, cohort_id
FROM students
WHERE
email NOT LIKE '%gmail.com'
AND
phone IS NULL;