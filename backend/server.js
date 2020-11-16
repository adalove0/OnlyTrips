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
const userAddTrip = require('./routes/addtrip');


<<<<<<< HEAD
app.use('/signup', userSignin); 
app.use('/login', userLogin);
app.use('/travel', userTravel);
app.use('/addTrip', userAddTrip);
=======
app.use('/signup', usersRouter); 
app.use('/', userLogin);
//app.use('/travel', userTravel);
>>>>>>> dca30240136211ae9b7a9aab935260f5de6cb8c9

app.listen(3000, () => console.log("server starting")); // start Node + Express server on port 8080

process.on('SIGINT', function() {
  console.log( "\nGracefully shutting down from SIGINT (Ctrl-C)" );
  // some other closing procedures go here
  process.exit(1);
});
