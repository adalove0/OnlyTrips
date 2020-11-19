// this endpoint deletes a spceific trip from the user
// after the email is passed in(req.body.email) 
// and the ObjectId for the trip is passed in (req.body.id)
const router = require('express').Router();
const mongoose = require('mongoose');
mongoose.set('useFindAndModify', false);

var User = require('../models/User');
let Trip = require('../models/Trips');

//const body = req.body;

router.post('/', (req, res, next)=>{
    var o_id = new mongoose.Types.ObjectId(req.body.id)
    console.log(o_id);
    
    User.findOneAndUpdate({email: req.body.email},
        {$pullAll: {TripDetails: [o_id] } }
        ).exec(function (err, obj){
            console.log(obj)
            if (err){
                return res.status(400).send(err);
            }
            else{
                return res.status(200).json({
                    success: true,
                    message: 'Trip deleted successfully'
                });
            }
        })
})

module.exports = router;
