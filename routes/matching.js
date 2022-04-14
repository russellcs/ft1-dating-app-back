const express = require("express");
const app = express.Router();
const queries = require("../mysql/queriesMatching");
const pConnection = require("../mysql/connection");
const queriesMatching = require("../mysql/queriesMatching");
const utils = require("../utils");

app.post("/seen", async (req, res) => {
  // route adds foreign id to current users seen list
  try {
    let result = await pConnection(
      queries.addToSeen(req.body.user_id, req.body.foreign_id)
    );
    res.send({ status: 1 });
  } catch (error) {
    res.send({ status: 0, error: "Database refused to add to seen list" });
  }
});

app.post("/likes", async (req, res) => {
  // route adds foreign id to current users seen list
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
  // route pulls all users from DB + reformats to front-end structure

  // get data for all users
  try {
    const results = await pConnection(
      queriesMatching.pullUserDetails(req.params.user_id)
    );

    //loop over all users, create individual object/array for each user
    const formattedDataArray = [];

    for (let i = 0; i < results.length; i++) {
      let userDetails = results[i];

      //pull preferred genders for each user from DB
      //loop over results of prefered genders to create formatted array of integers
      const preferredGenders = await pConnection(
        queriesMatching.getPreferredGenders(userDetails.user_id)
      );

      const preferredGendersArray = [];
      for (let j = 0; j < preferredGenders.length; j++) {
        preferredGendersArray.push(preferredGenders[j].genderId);
      }
      
      //pull likes data for each user from DB
      //loop over results of likes data to create formatted array of integers
      const likesList = await pConnection(
        queriesMatching.getUsersLikesList(userDetails.user_id)
      );

      const likesListArray = utils.formatToIdArray(likesList)

      //pull seen data for each user from DB
      //loop over results of seen data to create formatted array of integers
      const seenList = await pConnection(queriesMatching.getUsersSeenList(userDetails.user_id));

      const seenListArray = utils.formatToIdArray(seenList)

      //pull blocked data for each user from DB
      //loop over results of blocked data to create formatted array of integers
      const blockedList = await pConnection(queriesMatching.getUsersBlockedList(userDetails.user_id));

      const blockedListArray = utils.formatToIdArray(blockedList)


      //pull matches data for each user from DB
      //loop over results of matches data to create formatted array of integers
      const matchesList = await pConnection(queriesMatching.getMatchesList(userDetails.user_id));

      const matchesListArray = utils.formatToIdArray(matchesList)
      

      //format data into front end structure for each user
      const formattedData = {
        userId: userDetails.user_id,
        signUpTimeStamp: userDetails.entry_date,
        personalDetails: {
          name: {
            firstName: userDetails.first_name,
            lastName: userDetails.last_name,
          },
          dob: utils.timeConverter(userDetails.dob),
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
          smokers: Number(userDetails.smoker),
        },
        preferences: {
          lifeStyle: {
            marriage: userDetails.lifestyle_marriage,
            casual: userDetails.lifestyle_casual,
            openToKids: userDetails.lifestyle_open_to_kids,
          },
          age: {
            min: Number(userDetails.min_age),
            max: Number(userDetails.max_age),
          },
          height: {
            min: Number(userDetails.min_height),
            max: Number(userDetails.max_height),
          },
          gender: preferredGendersArray,
          kidsAccepted: Number(userDetails.kids_accepted),
          smokers: userDetails.smokers,
          acceptedDistance: Number(userDetails.accepted_distance),
        },
        seen: seenListArray,
        likes: likesListArray,
        matches: matchesListArray,
        blocked: blockedListArray,
        login: {
          email: userDetails.email,
          password: userDetails.password,
        },
        status: {
          type: userDetails.type,
          // lastLoginTimestamp: Date.now()
          //QUERY LAST LOGIN
        },
      };

      formattedDataArray.push(formattedData);
    }

    res.send({
      status: 1,
      payload: formattedDataArray,
    });
  } catch (error) {
    res.send({ status: 0 });
  }
});

module.exports = app;
