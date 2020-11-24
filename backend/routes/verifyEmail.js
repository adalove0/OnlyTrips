const router = require('express').Router();
const mongoose = require('mongoose');
const User = require('../models/User');

router.post('/', (req, res, next)=>{

    User.findOne({token: req.body.token}, function(error,obj){
        obj.token = null;
        obj.confirmed = true;
        obj.save((err, user) => {
          if (err) {
            console.log(err);
            return res.send({
              success: false,
              message: "Error: Server Error",
            });
          } else {
            return res.status(200).json({
              success: true,
              message: "Verification successful",
            });
          }
        });
    })

});

module.exports = router;
