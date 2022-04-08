// standard boilerplate
const express = require("express");
const app = express();

require("dotenv").config();

const cors = require("cors");
const bodyParser = require("body-parser");

app.use(bodyParser.json());
app.use(cors());

// routes
app.get("/", () => {
	console.log("The server received a request");
});

app.use("/users", require("./routes/users"));
app.use("/messages", require("./routes/messages"));
app.use("/matching", require("./routes/matching"));

//server on
const port = process.env.PORT || 6001;
app.listen(port, () => {
	console.log("The Server is running on port:", port);
});
