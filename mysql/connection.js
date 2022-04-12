const mysql = require("mysql"); //driver

const connection = mysql.createConnection({
  database: process.env.DBDATABASE,
  user: process.env.DBUSER,
  password: process.env.DBPASSWORD,
  host: process.env.DBHOST,
  port: process.env.DBPORT,
});

connection.connect();

function pConnection(query) {
  return new Promise((resolve, reject) => {
    connection.query(query, (err, results) => {
      if (err) {
        console.log(err);
        reject(err);
      }
      console.log("pConnection: ", results); //
      resolve(results);
    });
  });
}

module.exports = pConnection;
