const mysql = require("mysql"); //driver

const connection = mysql.createConnection({
  database: "findspar_ks",
  user: "findspar_ks",
  password: "74geIRyC:1]2pY",
  host: "findsparks.uk",
  port: "3306",
});

connection.connect();

function pConnection(query) {
  return new Promise((resolve, reject) => {
    connection.query(query, (err, results) => {
      if (err) {
        console.log(err);
        reject(err);
      }

      resolve(results);
    });
  });
}

module.exports = pConnection;
