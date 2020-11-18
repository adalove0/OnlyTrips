const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const path = require('path');
const PORT = process.env.PORT || 5000;
const app = express();
app.set('port', (process.env.PORT || 5000));
const mongoose = require("mongoose");
app.use(cors());
app.use(bodyParser.json());

app.use((req, res, next) => 
{  
	res.setHeader('Access-Control-Allow-Origin', '*');
	res.setHeader(    
		'Access-Control-Allow-Headers',   
		'Origin, X-Requested-With, Content-Type, Accept, Authorization'
	);
	res.setHeader(
		'Access-Control-Allow-Methods',
		'GET, POST, PATCH, DELETE, OPTIONS'
	);
	next();
});

//require('dotenv').config();
//const url=process.env.MONGODB_URI;
//const client=new MongoClient(url);
//client.connect();

mongoose.connect(
  "mongodb+srv://ash:o3LGLnokqxyyAdd3@cluster0.1lp73.mongodb.net/User?retryWrites=true&w=majority",
  { useNewUrlParser: true, useCreateIndex: true, useUnifiedTopology: true }
);

const connection = mongoose.connection;

connection.once("open", () => {
  console.log("Database connected");
});

const userSignUp = require("./backend/routes/signup");
const userLogin = require("./backend/routes/login");
const userTravel = require("./backend/routes/travelPage");
const userAddTrip = require("./backend/routes/addtrip");
const userDeleteTrip = require("./backend/routes/deletetrip");
const userSearchTrip = require ("./backend/routes/searchTrip");

app.use("/signup", userSignUp);
app.use("/", userLogin);
app.use("/travel", userTravel);
app.use("/addTrip", userAddTrip);
app.use("/deleteTrip", userDeleteTrip);
app.use("/searchTrip", userSearchTrip);

app.listen(PORT, () => {
	console.log(`Server listening on port ${PORT}.`);
});

// For Heroku deployment
// Server static assets if in production
if (process.env.NODE_ENV === 'production')
{
	// Set static folder
	app.use(express.static('frontend/build'));
	app.get('*', (req, res)=>
	{
		res.sendFile(path.resolve(__dirname,'frontend','build','index.html'));
	});
}


process.on("SIGINT", function () {
  console.log("\nGracefully shutting down from SIGINT (Ctrl-C)");
  // some other closing procedures go here
  process.exit(1);
});
