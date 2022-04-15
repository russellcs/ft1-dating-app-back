module.exports = {
	addNewMessage: function (user_id, foreign_id, content) {
		return `INSERT INTO messages 
              (user_id, foreign_id, content)
                 VALUES ("${user_id}", "${foreign_id}", "${content}");`;
	},

	deleteMessage: function (id) {
		return `DELETE FROM messages
              WHERE id = ${id};`;
	},

	blockUser: function (user_id, foreign_id) {
		return `INSERT INTO blocked
              (user_id, foreign_id)
                VALUES ("${user_id}", "${foreign_id}");`;
	},

	getUserMessages: function (user_id) {
		return `SELECT content, entry_date, foreign_id AS foreignId
              FROM messages
                WHERE user_id = ${user_id}
                  ORDER BY entry_date ASC;`;
	},
};
