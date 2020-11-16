// adds a single trip into the array for the user
const router = require('express').Router();
const mongoose = require('mongoose');

var User = require('../models/User');
let Trip = require('../models/Trips');

//const body = req.body;

router.post('/', (req, res, next)=>{
    
    Trip.findOneAndRemove({'id' :req.body.trip}, function (err,offer){
        if (err)
            return res.status(400).send(err.details[0].message);
    })
    
})

module.exports = router;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    