// this endpoint returns an array of objects.
// each object represents a trip the user has added
const router = require('express').Router();
const mongoose = require('mongoose');

let User = require('../models/User');


router.post('/', (req, res, next)=>{
    const body = req.body;
    console.log("here");
    User.findOne({email: req.body.email.toLowerCase()}, function(err,obj){
        if (err)
            return res.status(400).send(err.details[0].message);
        else{
            return res.status(200).send(obj.TripDetails);
        }
        //return res.obj.TripDetails;

    });
})

module.exports = router;
