const express = require("express");
const app = express.Router();
const queries = require("../mysql/queriesUsers");
const pConnection = require("../mysql/connection");
const fs = require("fs");
// add new user (email only)
app.post("/", async (req, res) => {
  try {
    await pConnection(queries.addNewUser(req.body.email));
    res.send({ status: 1 });
  } catch (error) {
    res.send({ status: 0, error: "Database refused to insert a new user" });
  }

  /* queries users
      - multiple queries - add a whole user, not just email 

      - log in 
      - log out
*/
});

//store a selfie
app.post("/selfie", (req, res) => {
  let base64Data = req.body.selfie.replace(/^data:image\/jpeg;base64,/, "");
  base64Data += base64Data.replace("+", " ");
  binaryData = Buffer.from(base64Data, "base64").toString("binary");

  fs.writeFile(`./userImages/${req.body.user_id}.jpg`, binaryData, "binary", function (err) {
    console.log(err); // writes out file without error, but it's not a valid image
  });
});

module.exports = app;
