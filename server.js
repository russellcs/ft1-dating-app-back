// standard boilerplate
require("dotenv").config();
const express = require("express");
const app = express();
const pConnection = require("./mysql/connection");
const queries = require("./mysql/queriesUsers");
const cors = require("cors");
const bodyParser = require("body-parser");

app.use(bodyParser.json());
app.use(cors());

async function validateToken(req, res, next) {
  console.log(req.headers)
  if (!req.headers.token) {
    res.send({ status: 0, error: "No token sent." });
    return;
  }
  const results = await pConnection(queries.checkUserToken(req.headers.token));
  if (results.length) {
    req.userId = results[0].userId;
    next();
  } else {
    res.send({ status: 0, error: "Sorry, wrong token." });
  }
}

// routes
app.get("/", () => {
  console.log("The server received a request");
});

app.use("/users", require("./routes/users"));
app.use("/messages", validateToken, require("./routes/messages"));
app.use("/matching", require("./routes/matching"));

//server on
const port = process.env.PORT || 6001;
app.listen(port, () => {
  console.log("The Server is running on port:", port);
});
