const express = require("express");
const app = express.Router();
const queries = require("../mysql/queriesMatching");
const pConnection = require("../mysql/connection");
const queriesMatching = require("../mysql/queriesMatching");
const utils = require("../utils.js")


app.post("/seen", async (req, res) => {
  // console.log(req.body);
  try {
    let result = await pConnection(
      queries.addToSeen(req.body.user_id, req.body.foreign_id)
    );
    // console.log(result);
    res.send({ status: 1 });
  } catch (error) {
    // console.log("sqlerror", error.sqlMessage)
    res.send({ status: 0, error: "Database refused to add to seen list" });
  }
});

app.post("/likes", async (req, res) => {
  try {
    await pConnection(
      queries.addToLikes(req.body.user_id, req.body.foreign_id)
    );
    res.send({ status: 1 });
  } catch (error) {
    res.send({ status: 0, error: "Database refused to add to likes list" });
  }
});

app.get("/:user_id", async (req, res) => {
  // console.log("back end called!");
  try {
    const personalDetails = await pConnection(
      queriesMatching.pullUserDetails(req.params.user_id)
    );

    
utils.formattedData

    //loop over results, format and create users array
    const formattedDataArray = [];

    for (let i = 0; i < personalDetails.length; i++) {
      let userDetails = personalDetails[i];

      const acceptedGenders = await pConnection(
        queriesMatching.getAcceptedGenders(userDetails.user_id)
      );

      //loop over results of prefered genders to create int array
      const acceptedGendersArray = [];
      for (let j = 0; j < acceptedGenders.length; j++) {
        acceptedGendersArray.push(acceptedGenders[j].gender_id);
      }

      //format data into front end structure
      const formattedData = {
        userId: userDetails.user_id,
        signUpTimeStamp: userDetails.entry_date,
        personalDetails: {
          name: {
            firstName: userDetails.first_name,
            lastName: userDetails.last_name,
          },
          dob: userDetails.dob,
          //QUERY DOB
          location: {
            town: userDetails.location_town,
            postCode: userDetails.location_postcode,
            longitude: userDetails.location_longitude,
            latitude: userDetails.location_latitude,
          },
          kids: Number(userDetails.kids),
          religion: Number(userDetails.religion),
          height: Number(userDetails.height),
          gender: Number(userDetails.gender),
          // This is a mistake? Kid_accepted?
  //QUERY ACCEPTED KID INPUT HERE
          // kidsAccepted: Number(userDetails.kids_accepted),
          smokers: Number(userDetails.smoker),
        },
        preferences: {
          lifeStyle: {
            marriage: userDetails.lifestyle_marriage,
            casual: userDetails.lifestyle_casual,
            openToKids: userDetails.lifestyle_open_to_kids,
          },
          //QUERY LIFESTYLE COMBO
          age: {
            min: Number(userDetails.min_age),
            max: Number(userDetails.max_age),
          },
          height: {
            min: Number(userDetails.min_height),
            max: Number(userDetails.max_height),
          },
          gender: acceptedGendersArray,
          kidsAccepted: Number(userDetails.kids_accepted),
          smokers: userDetails.smokers,
          acceptedDistance: Number(userDetails.accepted_distance),
        },
        seen: [],
        likes: [],
        matches: [],
        blocked: [],
        login: {
          email: userDetails.email,
          password: userDetails.password,
        },
        status: {
          type: userDetails.type,
          // lastLoginTimestamp: Date.now()
          //QUERY LAST LOGIN
          //QUERY BLOCKED
        },
      };
      formattedDataArray.push(formattedData);
    }

    // const gender = await pConnection(
    //   queriesMatching.getGenderName(req.params.user_id)
    // );

    res.send({
      status: 1,
      payload: formattedDataArray,
    });
  } catch (error) {
    res.send({ status: 0 });
  }
});

module.exports = app;
