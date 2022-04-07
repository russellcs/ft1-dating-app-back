const express = require("express");
const app = express.Router();
const queries = require("../mysql/queriesMatching");
const pConnection = require("../mysql/connection");

/*  - add something to seen array
    - add to likes table

    - pull all users - stitching data back together across lots of tables
*/

app.post("/seen", async(req, res) => {
    try {        
        let result = await pConnection(queries.addToSeen(req.body.user_id, req.body.foreign_id));
        console.log(result)
        res.send({status: 1 })
    } catch (error) {
        console.log("sqlerror", error.sqlMessage)
        res.send({ status: 0, error: "Database refused to add to seen list" });
    }
})

app.post("/likes", async(req, res) => {
    try {        
        await pConnection(queries.addToLikes(req.body.user_id, req.body.foreign_id));
        res.send({status: 1 })
    } catch (error) {
        res.send({ status: 0, error: "Database refused to add to likes list" });
    }
})


module.exports = app;
