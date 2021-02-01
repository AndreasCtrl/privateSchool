var express = require("express");
var router = express.Router();
var dbconnection = require("../lib/db");

/* GET users listing. */
router.get("/", function (req, res, next) {
	const query = "SELECT * FROM trainers;";
	dbconnection.query(query, (err, result) => {
		if (err) {
			res.render("error", { message: "There was an error!", error: err });
		} else {
			res.render("trainers", { result });
		}
	});
});

router.post("/add", function (req, res, next) {
	const query = `INSERT INTO trainers(firstName, lastName) VALUES( ? , ?);`;
	dbconnection.execute(
		query,
		[req.body.firstName, req.body.lastName],
		function (err, status) {
			// NOT OK - Error!!!
			if (err) {
				res.render("error", {
					error: "Coun't add new trainer",
					message: "Error inserting data to the database!",
				});
			}
			// All OK!!!
			else {
				//res.render("books", { title: 'Books', books: '', message: "All ok!!!" });
				// res.render("books", {});
				res.redirect("/trainers");
			}
		}
	);
});

module.exports = router;
