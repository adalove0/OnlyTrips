const router = require("express").Router();
const crypto = require("crypto");
let User = require("../models/User");

// VALIDATION

const Joi = require("@hapi/joi");
const boolean = require("@hapi/joi/lib/types/boolean");

//this really only does stuff for email to make sure its valid email
const valSchema = Joi.object({
  email: Joi.string().email(),
  name: Joi.string(),
  password: Joi.string(),
  age: Joi.number(),
  location: Joi.object(),
  confirmed: Joi.boolean(),
  token: Joi.string(),
});

router.post("/", (req, res, next) => {
  // makes sure the email is a valid email
  const { error } = valSchema.validate(req.body);
  //res.send(error);

  if (error) return res.status(400).send(error.details[0].message);

  const body = req.body;

  // checks if email they entered is already used for another acc
  User.find(
    {
      email: req.body.email,
    },
    (err, previousUsers) => {
      if (err) {
        return res.send({
          success: false,
          messgae: "Error: Servor error1",
        });
      } else if (previousUsers.length > 0) {
        return res.send({
          succcess: false,
          message: "Error: Account already exists",
        });
      } else {
        // if email doesnt already belong to a diff account and the email is valid
        // we need to send authentication
        const newUser = new User();
        //email = email.toLowerCase();
        // set the user fields to their respective values
        newUser.email = req.body.email.toLowerCase();
        newUser.name = req.body.name;
        newUser.password = newUser.generateHash(req.body.password);
        newUser.age = req.body.age;
        newUser.location = req.body.location;
        newUser.confirmed = false;
        newUser.token = crypto.randomBytes(64).toString("hex");

        const msg = {
          from: "onlytripsrus@gmail.com",
          to: req.body.email,
          subject: "Onlytrips - verify your email",
          text: `
                Hello, thank you for registering on our site. Please copy and paste the address below to verify
                your account. http://reqheadershost/verify-email?token=${newUser.token}
                `,
          html: `
                    <h1>Hello,</h1>
                    <p>thank you for registering on our site.</p>
                    <p>Please copy and paste the address below to verify your account.</p>
                    <a href ="http://reqheadershost/verify-email?token=${newUser.token}" >Verify your account</a>
                `,
        };

        newUser.save((err, user) => {
          if (err) {
            console.log(err);
            return res.send({
              success: false,
              message: "Error: Server Error2",
            });
          } else {
            return res.status(200).json({
              success: true,
              message: "Signed up",
            });
          }
        });
      }
    }
  );
});

module.exports = router;

/*module.exports = (app) =>{

    app.post('/', async (req, res, next) =>  {
        console.log('hit this post');
        const { body } = req;
        const {
            email,
            name,
            password,
            age,
            location
        } = body;

        if (!email) {
            return res.send({
                success: false,
                message: 'Error: Email cannot be blank.'
            }); 
        }
        if (!name) {
            return res.send({
                success: false,
                message: 'Error: Name cannot be blank.'
            }); 
        }

        if (!password) {
            return res.send({
                success: false,
                message: 'Error: Password cannot be blank.'
            }); 
        }

        if (!age) {
            return res.send({
                success: false,
                message: 'Error: Age cannot be blank.'
            }); 
        }

        if (!location) {
            return res.send({
                success: false,
                message: 'Error: Location cannot be blank.'
            }); 
        }

        console.log('here');
        email = email.toLowerCase();

        User.find({
            email: email
        }, (err, previousUsers) => {
            if (err){
                return res.send({
                    success: false,
                    messgae: 'Error: Servor error'
                }) 
            } else if (previousUsers.length > 0){
                return res.send({
                    succcess:false,
                    message: 'Error: Account already exists'
                })
            }
            const newUser = new User();

            newUser.email = email;
            newUser.name = name;
            newUser.password = newUser.generateHash(password);
            newUser.age = age;
            newUser.location = location;
            
            newUser.save((err, user) =>{
                 if(err){
                    return res.send({
                        success: false,
                        message: 'Error: Server Error'
                    });
                }
                    return res.send({
                        success:true,
                        message: 'Signed up'
                    });
                });
            });
        });
}*/
