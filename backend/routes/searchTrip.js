const router = require('express').Router();
const mongoose = require('mongoose');
let Trip = require('../models/Trips');

router.post('/', (req, res) => {
    var o_id = new mongoose.Types.ObjectId(req.body.id)
    const key = new RegExp(req.body.cityKey, 'i')

    Trip.find({creator: o_id,"destination.city": key}).then(docs => {
        return res.status(200).json({
            success: true,
            user: docs,
            message: 'Found trips'
        });
    }).catch(err => 
        console.log(err));
})


module.exports = router;
