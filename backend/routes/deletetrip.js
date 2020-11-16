// adds a single trip into the array for the user
const router = require('express').Router();
const mongoose = require('mongoose');

var User = require('../models/User');
let Trip = require('../models/Trips');

//const body = req.body;

router.post('/', (req, res, next)=>{
    console.log(req.body.trip);
    Trip.deleteOne( req.body.trip , function (err,result) {
        if (err)
                return res.status(400).send(err.details[0].message);
        else{
            //console.log(result);
            return res.status(200).json({
                success: true,
                message: 'Deleted trip successfully'
            });
        }  
    });
})

module.exports = router;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    