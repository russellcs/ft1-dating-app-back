// standard boilerplate
require("dotenv").config();
const express = require("express");
const app = express();
const pConnection = require("./mysql/connection");
const queries = require("./mysql/queriesUsers");
const cors = require("cors");
const bodyParser = require("body-parser");
const rateLimit = require("express-rate-limit");
const middleware = require("./middleware")

// code to limit hackers ingress - restricts number of requests allowed per hour
const limiter = rateLimit({
	windowMs: 15 * 60 * 1000, // 15 minutes
	max: 1000, // Limit each IP to 500 requests per `window` (here, per 15 minutes)
	standardHeaders: true, // Return rate limit info in the `RateLimit-*` headers
	legacyHeaders: false, // Disable the `X-RateLimit-*` headers
});

// Apply the rate limiting middleware to all requests
// app.use(limiter);

app.use(bodyParser.json());
app.use(cors());
app.use("/userImages", express.static("userImages"));
// go here if someone tries to access static file

// routes
app.get("/", () => {
	console.log("The server received a request");
});

app.use("/users", require("./routes/users"));
app.use("/messages", middleware.validateToken, require("./routes/messages"));
app.use("/matching", middleware.validateToken, require("./routes/matching"));

//server on
const port = process.env.PORT || 6001;
app.listen(port, () => {
	console.log("The Server is running on port:", port);
});