const router = require('express').Router();
const mongoose = require('mongoose');

let User = require('../models/User');


router.post('/', (req, res, next)=>{
    const body = req.body;

    User.findOne({email: req.body.email.toLowerCase()}, function(err,obj){
        if (err)
            return res.status(400).send(err.details[0].message);
        
        return obj.userTrips;

    })
})

module.exports = router;
