const bcrypt = require("bcrypt");
const mongoose = require('mongoose');

//const Trips = require('Trips');

const UserSchema = new mongoose.Schema({
  email: {
    type: String,
    minlength: 3,
    required: true,
    trim: true,
    unique: true,
  },
  name: {
    type: String,
    required: true,
  },
  password: {
    type: String,
    required: true,
    max: 100,
    min: 4,
  },
  age: {
    type: Number,
    required: true,
    default: -1,
  },
  location: [{
      city: { type: String, required: true },
      state: { type: String, default: " " },
      country: { type: String, required: true },
      zip: { type: Number, min: 00001, max: 99999, required: true },
    }],
  confirmed: {
    type: Boolean,
    default: false,
  },
  token: {
    type: String,
  },

  TripDetails: [{
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Trips' 
  }]
});

UserSchema.methods.generateHash = function (password) {
  return bcrypt.hashSync(password, bcrypt.genSaltSync(8), null);
};

UserSchema.methods.validPassword = function (password) {
  return bcrypt.compareSync(password, this.password);
};

module.exports = mongoose.model("User", UserSchema);