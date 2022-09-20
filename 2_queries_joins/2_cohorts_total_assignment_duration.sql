-- Get total amount of time that ALL students from a particular cohort has spent on assignments
SELECT SUM(assignment_submissions.duration) AS total_duration_cohort
FROM 
assignment_submissions
JOIN -- here joining assignments and students with IDs that match
students ON students.id = student_id
JOIN -- then joining students and cohorts referencing their cohort ids
cohorts ON cohorts.id = cohort_id
WHERE -- and ultimately ONLY summing the students part of the FEB12 named cohorts
cohorts.name = 'FEB12';