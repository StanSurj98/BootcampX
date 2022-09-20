-- Get the current avg time it takes to complete an AR

-- For EACH AR, we need to (completed_at - started_at) to see the time...
-- THEN we AVG that 

SELECT AVG(completed_at - started_at) AS average_assistance_request_duration
FROM assistance_requests;
