// this endpoint returns the travel information
// after you pass in the ObjectId (as "id")
// obtained from "travelPage.js"
const router = require('express').Router();
const mongoose = require('mongoose');
var ObjectId = require('mongodb').ObjectId;

let User = require('../models/User');
let Trip = require('../models/Trips');

router.post('/', (req, res, next)=>{
   
    // makes sure the Id is a valid form for mongoose 
    // not really neccessary but it doesn't hurt
    var o_id = new mongoose.Types.ObjectId(req.body.id)
    
    Trip.findOne({_id: o_id}, function(err, obj){
        
        if (err)
            return res.status(400).send(err.details[0].message);
        else
            return res.status(200).json(obj);
    })
})

module.exports = router;
