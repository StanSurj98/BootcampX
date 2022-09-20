-- Average amount of time students are waiting for an assistance request
-- (started_at - created_at)

SELECT AVG(started_at - created_at) as average_wait_time
FROM
assistance_requests;