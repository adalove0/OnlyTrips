// takes in the trip object with updated information
// and updates it in the DB

const router = require('express').Router();
const mongoose = require('mongoose');

let Trip = require('../models/Trips');

router.post('/', (req, res, next)=>{

    Trip.findOneAndUpdate
});








module.exports = router;
