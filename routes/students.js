var express = require("express");
var router = express.Router();
var dbconnection = require("../lib/db");

/* GET users listing. */
router.get("/", function (req, res, next) {
	const query = "SELECT * FROM students;";
	dbconnection.query(query, (err, result) => {
		if (err) {
			res.render("error", { message: "There was an error!", error: err });
		} else {
			res.render("students", { result });
		}
	});
});

router.post("/add", function (req, res, next) {
	const query = `INSERT INTO students(firstName, lastName, dateOfBirth, tuitionFees) VALUES( ? , ? , ? , ? );`;
	const { firstName, lastName, dateOfBirth, tuitionFees } = req.body;
	dbconnection.execute(
		query,
		[firstName, lastName, dateOfBirth, tuitionFees],
		function (err, status) {
			if (err) {
				res.render("error", {
					error: "Coun't add new student",
					message: "Error inserting data to the database!",
				});
			} else {
				res.redirect("/students");
			}
		}
	);
});

module.exports = router;
