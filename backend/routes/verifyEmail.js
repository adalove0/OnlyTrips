const router = require('express').Router();
const mongoose = require('mongoose');
const User = require('../models/User');

router.post('/', (req, res, next)=>{

    User.findOne({token: req.body.token}, function(error,obj){
        User.token = null;
        User.confirmed = true;
        User.save();
    })

});



module.exports = router;
