const express = require("express");
const bodyParser = require("body-parser");
const mysql = require("mysql2");

const app = express();
const port = 3000;


const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "Rishi2003",
  database: "mydb",
});

connection.connect((error) => {
  if (error) {
    console.error("Error connecting to MySQL database:", error);
  } else {
    console.log("Connected to MySQL database!");
  }
});


app.use(bodyParser.json());


app.get("/getme", (req, res) => {
  connection.query("SELECT * FROM names", function (err, results, fields) {
    if (err) {
      console.error("Error querying database:", err);
      res.status(500).json({ error: "Error querying database" });
    } else {
      console.log(results);
      res.json(results);
    }
  });
});


app.get("/sendme/:name", (req, res) => {
  const name = req.params.name;
  connection.query(
    "INSERT INTO names (name) VALUES (?)",
    [name],
    function (err, results, fields) {
      if (err) {
        console.error("Error querying database:", err);
        res.status(500).json({ error: "Error querying database" });
      } else {
        console.log(results);
        res.send("Done");
      }
    }
  );
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});

process.on("SIGINT", () => {
  console.log("Closing MySQL connection and shutting down the server.");
  connection.end();
  process.exit();
});
