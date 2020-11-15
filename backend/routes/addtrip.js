const router = require('express').Router();
const mongoose = require('mongoose');

let User = require('../models/User');


router.post('/', (req, res, next)=>{

    const body = req.body;
    console.log(req.body.email);

    User.findOne({email: req.body.email.toLowerCase()}, function(err,obj){
        if (err)
            return res.status(400).send(err.details[0].message);
        
        obj.userTrips.push(req.body.trip);
        
        obj.save(function (err){
            if (err)
                return res.status(400).send(err.details[0].message);
            else{
                return res.status(200).json({
                    success: true,
                    message: 'Added trip successfully'
                });
            }
        })
    })
})

module.exports = router;
