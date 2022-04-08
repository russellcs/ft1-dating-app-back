module.exports = {
  addToSeen: function (user_id, foreign_id) {
    console.log(user_id);

    // `ALTER TABLE seen ADD UNIQUE seen_combination (user_id, foreign_id);``
    return `INSERT IGNORE seen (user_id, foreign_id) 
           VALUES ("${user_id}", "${foreign_id}");`;
  },

  addToLikes: function (user_id, foreign_id) {
    // `ALTER TABLE likes ADD UNIQUE likes_combination (user_id, foreign_id);``
    return `INSERT IGNORE likes (user_id, foreign_id) 
           VALUES ("${user_id}", "${foreign_id}");`;
  },

  pullUserDetails: function (user_id) {
    return `SELECT
                user_details.user_id,
                email,
                user_details.entry_date,
                first_name,
                last_name,
                dob,
                location_town,
                location_postcode,
                location_longitude,
                location_latitude,
                kids,
                religion,
                height,
                gender,
                smoker,
                min_height,
                max_height,
                min_age,
                max_age, 
                status, 
                type,
                lifestyle_marriage, 
                lifestyle_casual, 
                lifestyle_open_to_kids,
                kids_accepted, 
                accepted_distance, 
                smokers, 
                password
            FROM
                user_details
            JOIN 
                users ON user_details.user_id = users.id
            JOIN 
                users_preferences_heights ON users.id = users_preferences_heights.user_id
            JOIN 
                users_preferences_ages ON users_preferences_heights.user_id = users_preferences_ages.user_id
            JOIN 
                preferences ON users_preferences_ages.user_id = preferences.user_id
            WHERE
                user_details.user_id = ${user_id};`;
  },

  //   pullUserPreferences: function (user_id) {
  //     return `SELECT lifestyle_marriage, lifestyle_casual, lifestyle_open_to_kids, kids_accepted
  //               FROM preferences
  //                   WHERE user_id = ${user_id};`;
  //   },

  getAcceptedGenders: function (user_id) {
    return `SELECT 
                gender_id 
            FROM 
                users_preferences_genders 
            WHERE 
                user_id = ${user_id};`;
  },

  getGenderName: function (user_id) {
    return `SELECT
                NAME
            FROM
                users
            JOIN users_preferences_genders ON users.id = users_preferences_genders.user_id
            JOIN genders ON users_preferences_genders.gender_id = genders.id
            WHERE user_id = ${user_id};`;
  },
};


// module.exports = formatData;
