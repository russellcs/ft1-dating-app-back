const express = require("express");
const app = express.Router();
const queries = require("../mysql/queriesMatching");
const pConnection = require("../mysql/connection");
const queriesMatching = require("../mysql/queriesMatching");

/*  - add something to seen array
    - add to likes table

    - pull all users - stitching data back together across lots of tables
        -- register. jsx -stevens code backwards

*/

app.post("/seen", async (req, res) => {
  console.log(req.body);
  try {
    let result = await pConnection(
      queries.addToSeen(req.body.user_id, req.body.foreign_id)
    );
    console.log(result);
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
  console.log("back end called!");
  try {
    const personalDetails = await pConnection(
      //loop over results and create giant array
      queriesMatching.pullUserDetails(req.params.user_id)
    );
    console.log(queriesMatching.pullUserDetails(req.params.user_id));
    // const preferences = await pConnection(
    //   queriesMatching.pullUserPreferences(req.params.user_id)
    // );
    const gender = await pConnection(
      queriesMatching.getGenderName(req.params.user_id)
    );
    const acceptedGenders = await pConnection(
      queriesMatching.getAcceptedGenders(req.params.user_id)
    );

    const formatData = (personalDetails, acceptedGenders) => {
      return {
        userId: personalDetails[0].user_id,
        signUpTimeStamp: personalDetails[0].entry_date,
        personalDetails: {
          name: {
            firstName: personalDetails[0].first_name,
            lastName: personalDetails[0].last_name,
          },
          //   selfie: { image },
          //QUERY SELFIE
          dob: personalDetails[0].dob,
          //QUERY DOB
          location: {
            town: personalDetails[0].location_town,
            postCode: personalDetails[0].location_postcode,
            longitude: personalDetails[0].location_longitude,
            latitude: personalDetails[0].location_latitude,
          },
          kids: Number(personalDetails[0].kids),
          religion: Number(personalDetails[0].religion),
          height: Number(personalDetails[0].height),
          gender: Number(personalDetails[0].gender),
          kidsAccepted: Number(personalDetails[0].kids_accepted),
          smokers: Number(personalDetails[0].smoker),
        },
        preferences: {
          lifeStyle: {
            marriage: personalDetails[0].lifeStyle_marriage,
            casual: personalDetails[0].lifeStyle_casual,
            openToKids: personalDetails[0].lifeStyle_open_to_kids,
          },
          //QUERY LIFESTYLE COMBO
          age: {
            min: Number(personalDetails[0].min_age),
            max: Number(personalDetails[0].max_age),
          },
          height: {
            min: Number(personalDetails[0].min_height),
            max: Number(personalDetails[0].max_height),
          },
          //   gender: acceptedGenders,
          //QUERY ACCEPTED GENDERS
          //QUERY ACCEPTED KID INPUT HERE
          kidsAccepted: Number(personalDetails[0].kids_accepted),
          smokers: personalDetails[0].smokers,
          acceptedDistance: Number(personalDetails[0].accepted_distance),
        },
        seen: [],
        likes: [],
        matches: [],
        blocked: [],
        login: {
          email: personalDetails[0].email,
          password: personalDetails[0].password,
        },
        status: {
          type: personalDetails[0].type,
          // lastLoginTimestamp: Date.now()
          //QUERY LAST LOGIN
          //QUERY BLOCKED
        },
      };
    };

    const payload = formatData(personalDetails, acceptedGenders);

    res.send({
      status: 1,
      payload,
      //   payload: { personalDetails, acceptedGenders, gender },
    });
  } catch (error) {
    res.send({ status: 0 });
  }
});

module.exports = app;
