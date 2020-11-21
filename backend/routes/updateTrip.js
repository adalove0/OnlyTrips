// takes in the trip object with updated information
// and updates it in the DB
// make sure that in the req id is declared as "id" and not "_id"
// it returns the new trip info if successful

const router = require('express').Router();
const mongoose = require('mongoose');
mongoose.set('useFindAndModify', false);

let Trip = require('../models/Trips');

router.post('/', (req, res, next)=>{

    var o_id = new mongoose.Types.ObjectId(req.body.id);

    Trip.findOneAndUpdate({_id: o_id}, {"$set": {"creator": req.body.trip.creator, "numPeople" : req.body.trip.numPeople, "startDate" : req.body.trip.startDate,
                           "endDate" : req.body.trip.endDate, "destination" : req.body.trip.destination, 
                           "budget": req.body.trip.budget}}, {new: true}, (err,obj) =>{
        if (err)
            return res.status(400).send(err);
        else{
            return res.status(200).json({
                success: true,
                newTripInfo: obj,
                message: 'Updated trip successfully'
            });

        }
            
        })
});








module.exports = router;
