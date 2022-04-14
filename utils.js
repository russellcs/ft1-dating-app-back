const pConnection = require("./mysql/connection");
const queriesMatching = require("./mysql/queriesMatching");

const express = require("express");
const app = express.Router();
const queries = require("./mysql/queriesMatching");

module.exports = {
  // takes pulled data from DB and reformats to clean array of integers
  formatToIdArray: (list) => {
    // const list = await pConnection(queriesMatching.nameOfQuery(userDetails.user_id));
    const listArray = [];
    for (let j = 0; j < list.length; j++) {
      listArray.push(list[j].foreignId);
    }
    return listArray;
  },

  getIndexById: (userId, users) => {
    return users.findIndex((user) => Number(user.userId) === Number(userId));
  },
  
  getUniqueId: (length) => {
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

  // converts unix timstamp to object with year, months and day keys
  timeConverter: (UNIX_timestamp) => {
    const a = new Date(UNIX_timestamp);
    var months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    var newYear = a.getFullYear();
    var newMonth = months[a.getMonth()];
    var newDate = a.getDate();
    var time = { year: newYear, months: newMonth, day: newDate };
    return time;
  },


};

