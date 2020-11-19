// does not work, will get back to it later

const router = require('express').Router();
const mongoose = require('mongoose');
var unirest = require("unirest");



router.post('/', (req, res, next)=>{

    var req = unirest("GET", "https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/referral/v1.0/United%20States/Dollars/object/miami/orlando/anytime/%7Binboundpartialdate%7D");

    req.query({
        "shortapikey": "ra66933236979928",
        "apiKey": "{shortapikey}"
    });

    req.headers({
        "x-rapidapi-key": "f6feebe342msh8db76edeba6c5b7p1478cejsn5e8e74e72b9c",
        "x-rapidapi-host": "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com",
        "useQueryString": true
    });


    req.end(function (res) {
        if (res.error) throw new Error(res.error);

        console.log(res.body);
    });
});
module.exports = router;
