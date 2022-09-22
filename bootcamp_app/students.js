const { Pool } = require('pg');

// Specifying connection configuration
const pool = new Pool({
  user: 'stanleysurjanto',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});


// So that we can use CLI
const specifyCohort = process.argv[2];
const limit = process.argv[3];
// !! IMPORTANT !! The $ templating from the values array is to prevent SQL text hacking!! 
// watch andy's lecture from sep21, 2022 about node-postgres for his info on this!! 
const values = [specifyCohort, limit]
// Anyone can just delete your DB from the CLI if you use string template literals!!! 
const text = `
  SELECT students.id AS student_id, students.name AS name, cohorts.name AS cohort
  FROM students JOIN cohorts ON cohorts.id = cohort_id
  WHERE cohorts.name = $1
  LIMIT $2;
`; // also notice we use BACKTICKS `` for the text query

// Queries SQL syntax and returns a promise object
// pool.query(`SELECT... FROM... WHERE ${DO NOT DO THIS} LIMIT ${SERIOUSLY}`)
pool.query(text, values) 
.then((res) => {
  // !! NOTE !! 
  // Look at the response.ROWS property, otherwise just a huge response object
  console.log(res.rows);

  res.rows.forEach((user) => {
    console.log(`${user.name} has an id of ${user.student_id} and was in the ${user.cohort} cohort`);
  })
})
.catch(err => console.error('query error', err.stack));