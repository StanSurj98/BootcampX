-- Get each day, the num of assignments and total duration
-- Meaning... we will COUNT assignments, and SUM duration THEN GROUP BY day

SELECT 
day, 
-- count(*) works here since we working with 1 table
COUNT(*) AS number_of_assignments, 
SUM(duration) AS duration
FROM assignments
GROUP BY day
ORDER BY day;