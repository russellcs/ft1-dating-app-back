module.exports = {
    addToSeen: function (user_id, foreign_id) {
        console.log(user_id)

        // `ALTER TABLE seen ADD UNIQUE seen_combination (user_id, foreign_id);``
        return `INSERT INTO seen (user_id, foreign_id) 
           VALUES ("${user_id}", "${foreign_id}");`;  
    },

    addToLikes: function (user_id, foreign_id) {

        // `ALTER TABLE likes ADD UNIQUE likes_combination (user_id, foreign_id);``
        return `INSERT INTO likes (user_id, foreign_id) 
           VALUES ("${user_id}", "${foreign_id}");`;  
    }
};
