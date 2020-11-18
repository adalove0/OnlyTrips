// this api returns the object with
const router = require('express').Router();
const mongoose = require('mongoose');
const Trips = require('../models/Trips');


router.post('/', (req, res, next)=>{
    
    console.log("please be in here");

    Trips.find(
    {"state": {$elemmatch: {$regex: new RegExp(req.body.state), "$options":"i"} } } ),
        function(err,obj){         
        
        console.log(obj)

        if (err)
            console.log(err);
    }

});

module.exports = router;
