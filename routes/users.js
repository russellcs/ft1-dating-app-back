const express = require("express");
const app = express.Router();
const queries = require("../mysql/queriesUsers");
const pConnection = require("../mysql/connection");
const fs = require("fs");
// const sendEmail = require("../email/sIBSDK");
const sendEmail = require("../email/nodeMailer");
const utils = require("../utils");
const sha256 = require("sha256");
const middleware = require("../middleware");

// add new user (email only)
app.post("/", async (req, res) => {
  // sendEmail(req.body.email, "Welcome new user", "Thanks for joining us!"); //commented out to stop email function

  try {
    // hashes the user submitted password for security
    const hashedPassword = sha256(
      req.body.login.password + process.env.HASHSALT
    );
    req.body.login.password = hashedPassword;
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
    console.log(error);
    res.send({ status: 0, error: "Database refused to insert a new user" });
  }
  /* queries users
      - log out // This needs it's own table?
*/
});

app.post("/login", async (req, res) => {
  //prevent hackers
  const hashedPassword = sha256(req.body.password + process.env.HASHSALT);

  if (req.body.password.includes("%")) res.send("Hack attempt detected!");

  const params = [req.body.email, hashedPassword];

  const userResult = await pConnection(queries.checkUserAndPassword(), params);

  if (userResult[0].count > 0) {
    const token = utils.getUniqueId(128);

    await pConnection(queries.setUserToken(userResult[0].userId, token));
    //start of testing code

    pConnection(`TRUNCATE TABLE blocked`);
    pConnection(`TRUNCATE TABLE seen`);
    //end of testing code
    res.send({ status: 1, userId: userResult[0].userId, token: token });
  } else {
    res.send({ status: 0 });
  }
});

app.delete("/logout/:token", middleware.validateToken, async (req, res) => {
  try {
    await pConnection(queries.deleteToken(req.params.token));
    res.send({ status: 1 });
  } catch (error) {
    res.send({ status: 0 });
  }
});

module.exports = app;
