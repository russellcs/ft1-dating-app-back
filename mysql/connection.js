const mysql = require("mysql"); //driver

const connection = mysql.createConnection({
  database: process.env.DATABASE,
  user: process.env.USER,
  password: process.env.PASSWORD,
  host: process.env.HOST,
  port: process.env.PORT,
});

connection.connect();

function asyncMySQL(query) {
  return new Promise((resolve, reject) => {
    connection.query(query, (err, results) => {
      if (err) {
        console.log(err);
        reject();
      }

      resolve(results);
    });
  });
}

module.exports = asyncMySQL;
