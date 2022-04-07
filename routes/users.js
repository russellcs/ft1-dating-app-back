const express = require("express");
const app = express.Router();
const queries = require("../mysql/queriesUsers");
const pConnection = require("../mysql/connection");

app.post("/", async (req, res) => {
  try {
    await pConnection(queries.addNewUser(req.body.email));
    res.send({ status: 1 });
  } catch (error) {
    res.send({ status: 0, error: "Database refused to insert a new user" });
  }
});

module.exports = app;
