const mysql = require("mysql"); //pull in the driver

const connection = mysql.createConnection({
  // database: "ft1",
  // user: "root",
  // password: "",
  // host: "localhost",
  // port: 3306,
  database: process.env.DBDATABASE,
  user: process.env.DBUSER,
  password: process.env.DBPASSWORD,
  host: process.env.DBHOST,
  port: process.env.DBPORT,
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
