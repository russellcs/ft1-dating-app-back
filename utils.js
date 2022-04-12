module.exports = {
  getIndexById: (userId, users) => {
    return users.findIndex((user) => Number(user.userId) === Number(userId));
  },
  getUniqueId: (length) => {
    // return Math.round(Math.random() * 10000000000);
    const now = Date.now().toString();
    let uniqueId = "";
    const chars =
      "ABCDEFGHIJUKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
    const charsLength = chars.length;

    for (let index = 0; index < length - now.length; index++) {
      uniqueId += chars.charAt(Math.floor(Math.random() * charsLength));
    }
    return uniqueId + Date.now();
  },

  formatData: (inputArray) => {
    




  }



};
