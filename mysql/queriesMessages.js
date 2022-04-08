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
};
