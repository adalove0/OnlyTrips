// adds a single trip into the array for the user
const router = require('express').Router();
const mongoose = require('mongoose');

var User = require('../models/User');
let Trip = require('../models/Trips');

//const body = req.body;

router.post('/', (req, res, next)=>{

    Trip.create(req.body.trip, function(err, finalTrip){
        if (err)
            return res.status(400).send(err.details[0].message);

        User.findOne({email: req.body.email.toLowerCase()}, function(error,obj){
            if (error)
                return res.status(400).send(error.details[0].message);
        
            console.log(finalTrip);
            obj.TripDetails.push(finalTrip);
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // takes in the email passed in by front end and finds the user in db
    // and updates trip details by pushing req.body.trip to the end of array
    /*User.findOneAndUpdate({ email: req.body.email.toLowerCase() },
    { $push: { tripDetails: req.body.trip } },
    { 'new': false },
    (err, obj) => {
        //...
        //response code
        if(err) {
            return res.status(400).send(err.details[0].message)
        } else {
            return res.status(200).json({
                success: true,
                message: 'Added trip successfully'
            })
        }
    })*/
    
})

module.exports = router;

// takes in the email passed in by front end and finds the user in db
    /*User.findOne({email: req.body.email.toLowerCase()}, function(err,obj){
        if (err)
            return res.status(400).send(err.details[0].message);
        
        // adds the trip info to the trip array (at the end of array)
        //console.log(typeof req.body.trip === 'object' && req.body.trip !== null);

        //console.log(req.body.trip);
        obj.tripDetails.push(req.body.trip);
        //console.log(req.body.trip);
        
        // saves change
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
    })*/
