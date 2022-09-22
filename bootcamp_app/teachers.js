const { Pool, Query } = require('pg');

// Specifying connection configuration
const pool = new Pool({
  user: 'stanleysurjanto',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

// Accept cohort name as user input in CLI - CASE SENSITIVE
const specifyCohort = process.argv[2];
const values = [specifyCohort];

// Get name of all teachers that assisted during a particular cohort
// Code is from BootcampX 4_queries/12
const text = `
  SELECT DISTINCT teachers.name as teachers, cohorts.name as cohort
  FROM
  teachers
  JOIN
  assistance_requests ON teachers.id = teacher_id
  JOIN
  students ON students.id = student_id
  JOIN
  cohorts ON cohorts.id = students.cohort_id
  WHERE 
  cohorts.name = $1
  ORDER BY 
  teachers;
`;

pool.query(text, values)
  .then((res) => {
    // console.log(res.rows);
    res.rows.forEach((row) => {
      console.log(`${row.cohort}: ${row.teachers}`);
    })
  })
  .catch(err => console.error(`query error`, err.stack));