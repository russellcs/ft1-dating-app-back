const pConnection = require("./mysql/connection");
const queries = require("./mysql/queriesUsers");

module.exports = {
    validateToken: async (req, res, next) => {
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
}