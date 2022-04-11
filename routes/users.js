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
    const result = await pConnection(queries.addNewUser(req.body));
    //sets to personalDetails
    pConnection(
      queries.setUserPersonalDetails(req.body.personalDetails, result.insertId)
    );
    // sets logged in status
    pConnection(queries.setLogIn(result.insertId));
    //sets users preferences
    pConnection(queries.setUserPreferences(req.body, result.insertId));
    //sets users age preferences
    pConnection(
      queries.setUserPrefAges(req.body.preferences.age, result.insertId)
    );
    //sets user gender preferences
    req.body.preferences.gender.forEach((gender) => {
      pConnection(queries.setUserPrefGender(gender, result.insertId));
    });
    //sets user height preferences
    pConnection(
      queries.setUserPrefHeight(req.body.preferences.height, result.insertId)
    );
    // stores a selfie
    let base64Data = req.body.personalDetails.selfie.replace(
      /^data:image\/jpeg;base64,/,
      ""
    );
    base64Data += base64Data.replace("+", " ");
    binaryData = Buffer.from(base64Data, "base64").toString("binary");

    fs.writeFile(
      `./userImages/${result.insertId}.jpg`,
      binaryData,
      "binary",
      function (err) {
        console.log(err); // writes out file without error, but it's not a valid image
      }
    );

    res.send({ status: 1 });
  } catch (error) {
    res.send({ status: 0, error: "Database refused to insert a new user" });
  }
  /* queries users
      - log out // This needs it's own table?
*/
});

//store a selfie
// app.post("/selfie", (req, res) => {
//   let base64Data = req.body.selfie.replace(/^data:image\/jpeg;base64,/, "");
//   base64Data += base64Data.replace("+", " ");
//   binaryData = Buffer.from(base64Data, "base64").toString("binary");

//   fs.writeFile(
//     `./userImages/${req.body.user_id}.jpg`,
//     binaryData,
//     "binary",
//     function (err) {
//       console.log(err); // writes out file without error, but it's not a valid image
//     }
//   );
// });

module.exports = app;
