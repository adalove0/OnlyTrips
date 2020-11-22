const router = require('express').Router();
const object = require('@hapi/joi/lib/types/object');
const mongoose = require('mongoose');
const crypto = require("crypto");


router.post('/', (req, res, next)=>{


    User.findOne({email: req.body.email.toLowerCase()}, function(err,obj){
        if (err)
            return res.status(400).send(err);

        // check to see we got something back
        if (obj == null)
        {
            return res.status(400).json({
                success: false,
                message: 'No account registered with that email'
            })
        }
        
        if (obj.confirmed == false)
        {
            return res.status(400).json({
                success: false,
                message: 'Please verify your email before resetting your password'
            })
        }

        if ((obj.securityQuestionOne.localCompare(req.bodysecurityQuestionOne) != 0)  || 
            (obj.securityQuestionTwo.localCompare(req.bodysecurityQuestionTwo) != 0)){
                return res.status(400).json({
                    success: false,
                    message: 'Security answers do not match'
                });
        }

        else
        {
            object.password = object.generateHash(req.body.password);
            object.save((err, user) => {
                if (err) {
                  console.log(err);
                  return res.send({
                    success: false,
                    message: "Error: Server Error2",
                  });
                } else {
                  return res.status(200).json({
                    success: true,
                    message: "Password successfully changed",
                  });
                }
              });

        }
        
        
    });
});



module.exports = router;
