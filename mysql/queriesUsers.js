module.exports = {
  checkUserAndPassword: function () {
    return `SELECT count(*) AS count, id AS userId FROM users 
              WHERE email LIKE ? 
                AND password LIKE ?;`;
  },
  setUserToken: function (userId, token) {
    return `INSERT INTO tokens (user_id, token) VALUES ("${userId}", "${token}");`;
  },
  checkUserToken: function (token) {
    return `SELECT user_id AS userId FROM tokens WHERE token = "${token}";`;
  },
  addNewUser: function (payload) {
    return `INSERT INTO users (email, password) 
                    VALUES ("${payload.login.email}", "${payload.login.password}");`;
  },
  setUserPersonalDetails: function (payload, userId) {
    return `INSERT INTO user_details(
                        user_id,
                        first_name,
                        last_name,
                        dob,
                        location_town,
                        location_postcode,
                        location_longitude,
                        location_latitude,
                        religion,
                        height,
                        kids,
                        gender,
                        smoker
                    )
                VALUES(
                        "${userId}",
                        "${payload.name.firstName}",
                        "${payload.name.lastName}",
                        "${payload.dob}",
                        "${payload.location.town}",
                        "${payload.location.postCode}",
                        "${payload.location.longitude}",
                        "${payload.location.latitude}",
                        "${payload.religion}",
                        "${payload.height}",
                        "${payload.kids}",
                        "${payload.gender}",
                        "${payload.smokers}"
                    )`;
  },
  setLogIn: function (userId) {
    return `INSERT INTO log_login(user_id)
                  VALUES("${userId}")`;
  },
  setUserPreferences: function (payload, userId) {
    return `INSERT INTO preferences(
                        user_id,
                        smokers,
                        accepted_distance,
                        kids_accepted,
                        lifestyle_marriage,
                        lifestyle_casual,
                        lifestyle_open_to_kids
                    )
                  VALUES(
                        "${userId}",
                        "${payload.preferences.smokers}",
                        "${payload.preferences.acceptedDistance}",
                        "${payload.personalDetails.kidsAccepted}",
                        "${payload.preferences.lifeStyle.marriage}",
                        "${payload.preferences.lifeStyle.casual}",
                        "${payload.preferences.lifeStyle.openToKids}"
                    )`;
  },
  setUserPrefAges: function (payload, userId) {
    return `INSERT INTO users_preferences_ages(user_id, min_age, max_age)
                  VALUES(
                          "${userId}",
                          "${payload.min}",
                          "${payload.max}"
                  )`;
  },
  setUserPrefGender: function (payload, userId) {
    return `INSERT INTO users_preferences_genders(user_id, gender_id)
                  VALUES("${userId}", "${payload}")`;
  },
  setUserPrefHeight: function (payload, userId) {
    return `INSERT INTO users_preferences_heights(
                        user_id,
                        min_height,
                        max_height
                    )
                 VALUES(
                        "${userId}",
                        "${payload.min}",
                        "${payload.max}"
                    )`;
  },
  deleteToken: function (token) {
    return `
    DELETE
        FROM
              tokens
        WHERE
              token = "${token}"`;
  },
};
