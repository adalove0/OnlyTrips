const mongoose = require('mongoose');

const TravelSchema = new mongoose.Schema({
    creator: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User' 
    },

    numPeople: {
        type: Number,
        required: true
    },

    startDate: {
        type: Date,
        required: true
    },

    endDate: {
        type: Date,
        required: true
    },

    destination: [{
        city: {type: String, required :true},
        state: {type: String, required:true }
    }],
    
    budget :[{
        travelCost: {type: Number},
        foodCost: {type: Number},
        lodgingCost: {type: Number},
        miscellaneousCost: {type: Number}
    }]

});

module.exports = mongoose.model('Trips', TravelSchema);
