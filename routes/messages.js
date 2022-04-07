const express = require("express");
const app = express.Router();
const queries = require("../mysql/queriesUsers");
const pConnection = require("../mysql/connection");

/*  - add a message to back end
    - delete a message
    - block a user based on message 

    - pull all messages for certain user id - excluding those on blocked list
    
*/

module.exports = app;
