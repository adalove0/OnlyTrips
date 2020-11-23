// adds a single trip into trip array the array for the user
// based on the email sent in
const router = require('express').Router();
const mongoose = require('mongoose');

var User = require('../models/User');
let Trip = require('../models/Trips');

//const body = req.body;

router.post('/', (req, res, next)=>{

    // creates a trip object with info passed in
    Trip.create(req.body.trip, function(err, finalTrip){
        if (err)
            return res.status(400).send(err);
        // finds the user based on the email and adds the trip object to the 
        // TripDetails array
        User.findOne({email: req.body.email.toLowerCase()}, function(error,obj){
            if (error)
                return res.status(400).send(error);
            console.log(obj)
            obj.TripDetails.push(finalTrip);
            
            obj.save(function (err){
                if (err)
                    return res.status(400).send(err);
                else{
                    return res.status(200).json({
                        success: true,
                        tripAdded: finalTrip,
                        message: 'Added trip successfully'
                    });
                }
            })
        })


    })
})

module.exports = router;