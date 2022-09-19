-- Get all GRADUATED students without github linked
SELECT name, email, phone
FROM students
WHERE github IS NULL
AND
end_date IS NOT NULL; -- Meaning they HAVE an end date, graduated