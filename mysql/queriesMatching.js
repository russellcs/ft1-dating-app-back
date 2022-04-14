module.exports = {
  addToSeen: function (user_id, foreign_id) {
      // query puts foreign ID and current user ID in seen table in DB
      // Unique property added to ensure no duplicates
    // `ALTER TABLE seen ADD UNIQUE seen_combination (user_id, foreign_id);``
    return `INSERT IGNORE seen (user_id, foreign_id) 
           VALUES ("${user_id}", "${foreign_id}");`;
  },

  addToLikes: function (user_id, foreign_id) {
      // query puts foreign ID and current user ID in likes table in DB
      // Unique property added to ensure no duplicates
    // `ALTER TABLE likes ADD UNIQUE likes_combination (user_id, foreign_id);``
    return `INSERT IGNORE likes (user_id, foreign_id) 
           VALUES ("${user_id}", "${foreign_id}");`;
  },

  pullUserDetails: function (user_id) {
      // query pulls data from DB for all users
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
           -- WHERE
                -- user_details.user_id = ${user_id}
                ;`;
  },

  getPreferredGenders: function (user_id) {
      // query pulls accepted genders (for preferences) from DB for a specific user
    return `SELECT 
                gender_id AS genderId
            FROM 
                users_preferences_genders 
            WHERE 
                user_id = ${user_id};`;
  },

  getUsersLikesList: function (user_id) {
    // query pulls seen list for a user from DB for a specific user
  return `SELECT 
              foreign_id AS foreignId
          FROM 
              likes 
          WHERE 
              user_id = ${user_id};`;
},

getUsersBlockedList: function (user_id) {
    // query pulls seen list for a user from DB for a specific user
  return `SELECT 
              foreign_id AS foreignId
          FROM 
              blocked 
          WHERE 
              user_id = ${user_id};`;
},

getUsersSeenList: function (user_id) {
    // query pulls seen list for a user from DB for a specific user
  return `SELECT 
              foreign_id AS foreignId
          FROM 
              seen 
          WHERE 
              user_id = ${user_id};`;
},

getMatchesList: function (user_id) {
    return `SELECT 
                likes_left.foreign_id AS foreignId
            FROM 
                likes AS likes_left
            JOIN 
                likes
            ON 
                likes_left.foreign_id = likes.user_id 
            AND 
                likes_left.user_id = likes.foreign_id
            WHERE 
                likes_left.user_id = ${user_id};`
},

  getGenderName: function (user_id) {
      // query assigns gender name to gender integer
      // NOT USED - DELETE
    return `SELECT
                NAME
            FROM
                users
            JOIN users_preferences_genders ON users.id = users_preferences_genders.user_id
            JOIN genders ON users_preferences_genders.gender_id = genders.id
            WHERE user_id = ${user_id};`;
  },


};

