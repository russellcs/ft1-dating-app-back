// standard boilerplate
require("dotenv").config();
const express = require("express");
const app = express();
const pConnection = require("./mysql/connection");
const queries = require("./mysql/queriesUsers");
const cors = require("cors");
const bodyParser = require("body-parser");
const rateLimit = require("express-rate-limit");

const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 500, // Limit each IP to 500 requests per `window` (here, per 15 minutes)
  standardHeaders: true, // Return rate limit info in the `RateLimit-*` headers
  legacyHeaders: false, // Disable the `X-RateLimit-*` headers
});

// Apply the rate limiting middleware to all requests
app.use(limiter);

app.use(bodyParser.json());
app.use(cors());
app.use("/userImages", express.static("userImages"));
// go here if someone tries to access static file

async function validateToken(req, res, next) {
  console.log(req.headers);
  if (!req.headers.token) {
    res.send({ status: 0, error: "No token sent." });
    return;
  }
  const results = await pConnection(queries.checkUserToken(req.headers.token));
  if (results.length) {
    req.userId = results[0].userId;
    next();
  } else {
    res.send({ status: 0, error: "Sorry, wrong token." });
  }
}

// routes
app.get("/", () => {
  console.log("The server received a request");
});

app.use("/users", require("./routes/users"));
app.use("/messages", validateToken, require("./routes/messages"));
app.use("/matching", require("./routes/matching"));

//server on
const port = process.env.PORT || 6001;
app.listen(port, () => {
  console.log("The Server is running on port:", port);
});
