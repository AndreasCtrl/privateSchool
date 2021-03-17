var mysql2 = require("mysql2");

var connection = mysql2.createConnection({
	host: "localhost",
	user: "root",
	password: "*********",
	database: "private_school_db",
	port: 3306,
});

connection.connect(function (error) {
	if (error) {
		console.log(error);
	} else {
		console.log("Connected to private_school_db!");
	}
});

module.exports = connection;
