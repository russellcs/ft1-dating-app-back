const pConnection = require("./mysql/connection");
const queriesMatching = require("./mysql/queriesMatching");

const express = require("express");
const app = express.Router();
const queries = require("./mysql/queriesMatching");

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

  timeConverter:(UNIX_timestamp) => {
    const a = new Date(UNIX_timestamp);
    var months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    var newYear = a.getFullYear();
    var newMonth = months[a.getMonth()];
    var newDate = a.getDate();
    var time = { year: newYear, months: newMonth, day: newDate };
    // var time = `${newYear}-${newMonth}-${newDate}`;
    return time;
  }


};
