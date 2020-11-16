const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const app = express();

const mongoose = require('mongoose');

app.use(cors());
app.use(bodyParser.json());

mongoose.connect('mongodb+srv://ash:o3LGLnokqxyyAdd3@cluster0.1lp73.mongodb.net/User?retryWrites=true&w=majority', 
                  { useNewUrlParser: true, useCreateIndex: true,  useUnifiedTopology: true}
  );
const connection = mongoose.connection;

connection.once('open', () =>{
  console.log("Database connected");
})

const userSignin = require('./routes/signup');
const userLogin = require('./routes/login');
const userTravel = require('./routes/travelPage');
const userAddTrip = require('./routes/addTrip');
const userDeleteTrip = require('./routes/deleteTrip');
const userSingleTrip = require ('./routes/singleTrip');


app.use('/signup', userSignin); 
app.use('/', userLogin);
app.use('/travel', userTravel);
app.use('/addTrip', userAddTrip);
app.use('/deleteTrip', userDeleteTrip);
app.use('/singleTrip', userSingleTrip);

app.listen(3000, () => console.log("server starting")); // start Node + Express server on port 8080

process.on('SIGINT', function() {
  console.log( "\nGracefully shutting down from SIGINT (Ctrl-C)" );
  // some other closing procedures go here
  process.exit(1);
});
