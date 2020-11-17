// this api returns the object with 
const router = require('express').Router();
const mongoose = require('mongoose');
const Trips = require('../models/Trips');


router.post('/', (req, res, next)=>{

    req.body.state;

    Trips.find(
        {"startDate": {"$regex" : "2020"/*, "$options": "i"*/}},
        function(err,obj){
        if (err)
            console.log(err);
        console.log(obj)
        }
    );

})

module.exports = router;
