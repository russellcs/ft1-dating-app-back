const express = require("express");
const app = express.Router();
const queries = require("../mysql/queriesUsers");
const pConnection = require("../mysql/connection");
const fs = require("fs");
// add new user (email only)
app.post("/", async (req, res) => {
  console.log(req.body);
  try {
    //adds to users table
    const result = await pConnection(
      queries.addNewUser(req.body.email, req.body.password)
    );
    //sets to personalDetails
    await pConnection(
      queries.setUserPersonalDetails(req.body, result.insertId)
    );
    // sets logged in status
    await pConnection(queries.setLogIn(result.insertId));
    //sets users preferences
    await pConnection(queries.setUserPreferences(req.body, result.insertId));
    //sets users age preferences
    await pConnection(queries.setUserPrefAges(req.body, result.insertId));
    //sets user gender preferences
    await pConnection(queries.setUserPrefGender(req.body, result.insertId));
    //sets user height preferences
    /// NOTE I HAVE CHANGED max_height type to SMALLINT
    await pConnection(queries.setUserPrefHeight(req.body, result.insertId));
    // sets user religion preferences
    await pConnection(queries.setUserPrefReligion(req.body, result.insertId));
    res.send({ status: 1 });
  } catch (error) {
    res.send({ status: 0, error: "Database refused to insert a new user" });
  }

  /* queries users
      - log out // This needs it's own table?
*/
});

//store a selfie
app.post("/selfie", (req, res) => {
  let base64Data = req.body.selfie.replace(/^data:image\/jpeg;base64,/, "");
  base64Data += base64Data.replace("+", " ");
  binaryData = Buffer.from(base64Data, "base64").toString("binary");

  fs.writeFile(
    `./userImages/${req.body.user_id}.jpg`,
    binaryData,
    "binary",
    function (err) {
      console.log(err); // writes out file without error, but it's not a valid image
    }
  );
});

module.exports = app;
