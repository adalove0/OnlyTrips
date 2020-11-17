const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const app = express();
const mongoose = require("mongoose");

const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(bodyParser.json());

mongoose.connect(
  "mongodb+srv://ash:o3LGLnokqxyyAdd3@cluster0.1lp73.mongodb.net/User?retryWrites=true&w=majority",
  { useNewUrlParser: true, useCreateIndex: true, useUnifiedTopology: true }
);
const connection = mongoose.connection;

connection.once("open", () => {
  console.log("Database connected");
});

const userSignUp = require("./routes/signup");
const userLogin = require("./routes/login");
const userTravel = require("./routes/travelPage");
const userAddTrip = require("./routes/addtrip");
const userDeleteTrip = require("./routes/deletetrip");

app.use("/signup", userSignUp);
app.use("/login", userLogin);
app.use("/travel", userTravel);
app.use("/addTrip", userAddTrip);
app.use("/deleteTrip", userDeleteTrip);

app.listen(PORT, () => {
	console.log(`Server listening on port ${PORT}.`);
});

// For Heroku deployment
// Server static assets if in production
if (process.env.NODE_ENV === 'production')
{
	// Set static folder
	app.use(express.static('/app/frontend/src'));

	app.get('*', (req, res)=>
	{
		res.sendFile(path.resolve("app", 'frontend', 'public', 'index.html'));
	}
}


process.on("SIGINT", function () {
  console.log("\nGracefully shutting down from SIGINT (Ctrl-C)");
  // some other closing procedures go here
  process.exit(1);
});
