const router = require('express').Router();
const mongoose = require('mongoose');

let User = require('../models/User');


router.post('/', (req, res, next)=>{
    const body = req.body;
    console.log("here");
    User.findOne({email: req.body.email.toLowerCase()}, function(err,obj){
        if (err)
            return res.status(400).send(err.details[0].message);
        
        console.log(obj.TripDetails);
        return res.obj.TripDetails;

    })
})

module.exports = router;
