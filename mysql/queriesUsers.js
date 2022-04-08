module.exports = {
  addNewUser: function (email, password) {
    return `INSERT INTO users (email, password) 
                    VALUES ("${email}", "${password}")`;
  },
  setUserPersonalDetails: function (payload, userId) {
    return `INSERT INTO user_details (user_id, first_name, last_name, dob, location_town, location_postcode, location_longitude, location_latitude, religion, height, kids, gender, smoker)
          VALUES ("${userId}","${payload.first_name}","${payload.last_name}","${payload.dob}","${payload.location_town}","${payload.location_postcode}","${payload.location_longitude}","${payload.location_latitude}","${payload.religion}","${payload.height}","${payload.kids}","${payload.gender}","${payload.smoker}")`;
  },
  setLogIn: function (userId) {
    return `INSERT INTO log_login (user_id)
                    VALUES ("${userId}")`;
  },
  setUserPreferences: function (payload, userId) {
    return `INSERT INTO preferences (user_id, smokers, accepted_distance, kids_accepted, lifestyle_marriage, lifestyle_casual, lifestyle_open_to_kids)
              VALUES ("${userId}", "${payload.smokers}","${payload.accepted_distance}","${payload.kids_accepted}","${payload.lifestyle_marriage}","${payload.lifestyle_casual}","${payload.lifestyle_open_to_kids}")`;
  },
  setUserPrefAges: function (payload, userId) {
    return `INSERT INTO users_preferences_ages (user_id, min_age, max_age)
                  VALUES ("${userId}","${payload.min_age}","${payload.max_age}")`;
  },
  setUserPrefGender: function (payload, userId) {
    return `INSERT INTO users_preferences_genders (user_id, gender_id) 
                    VALUES ("${userId}", "${payload.genderPref}")`;
  },
  setUserPrefHeight: function (payload, userId) {
    return `INSERT INTO users_preferences_heights (user_id, min_height, max_height)
                  VALUES ("${userId}","${payload.min_height}","${payload.max_height}")`;
  },
  setUserPrefReligion: function (payload, userId) {
    return `INSERT INTO users_preferences_religions (user_id, religion_id)
                  VALUES ("${userId}","${payload.religionPref}")`;
  },
  //should use the naming convention of front-end for these variables? Or use the newly formed DB ones?
  // how does this cope with multi pref options, these are sent as an array?
};
