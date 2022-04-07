module.exports = {
  addNewUser: function (email) {
    return `INSERT INTO users (email) 
                    VALUES ("${email}");`;
  },
};

