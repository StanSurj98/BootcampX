-- Get which assignments result in the MOST assistance requests made 
-- List each assignment and its total number of assistance requests

SELECT 
assignments.id, 
name, 
day, 
chapter, 
-- count of ARs as a total_requests, we will determine what it is later on
COUNT(assistance_requests) AS total_requests
FROM 
assignments
JOIN
-- join together the correct assignments with the ARs
assistance_requests ON assignments.id = assignment_id
-- THEN we group it by id, meaning we count the total requests for each unique assignment
GROUP BY assignments.id
ORDER BY total_requests DESC;