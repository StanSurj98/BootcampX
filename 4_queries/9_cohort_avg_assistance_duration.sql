-- Get average TOTAL amount of time being spent on an assistance request for all cohorts. 
-- This is just the average of the total_duration column from the previous query.
-- This is one row of info

SELECT 
AVG(total_duration) AS average_total_duration
-- Remember! You KNOW that "if i had a table of this data, I could draw FROM it..." 
-- turn it into a table! then reference it by using a nested SELECT inside the FROM clause
FROM (
  SELECT SUM(completed_at - started_at) AS total_duration
  FROM assistance_requests
  JOIN students ON students.id = student_id
  JOIN cohorts ON cohorts.id = cohort_id
  GROUP BY cohorts.name
) AS total_durations_table; -- NOTE: Must have alias if nested FROM