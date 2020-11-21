const router = require('express').Router();
const mongoose = require('mongoose');
const bcrypt = require('bcrypt');

let User = require('../models/User');

router.post('/', (req, res, next)=>{
    //const body = req.body;
    // set userVar equal to the user info retrieved from database

    User.findOne({email: req.body.email.toLowerCase()}, function(err,obj){
        // first we check if we got any errors
        if (err)
            return res.status(400).send(err.details[0].message);

        // check to see we got something back
        if (obj == null)
        {
            return res.status(400).json({
                success: false,
                message: 'No account registered with that email'
            })
        }

        
        //  Now we check if they have verified
        if (obj.confirmed == false)
        {
            return res.status(400).json({
                success: false,
                message: 'Please verify your email and try again'
            })
        }
    
        // if we found a user (so userVar isn't null) and we compare the password and hash
        // and theyre the same then they succesfully login
        if (obj && bcrypt.compareSync(req.body.password, obj.password)){
            return res.status(200).json({
                success: true,
                user: obj,
                message: 'Login successful'
            });
        }
        else{
            return res.status(400).json({
                success: false,
                message: 'Incorrect email and/or password'
            });
        }

    }) 

})

module.exports = router;
