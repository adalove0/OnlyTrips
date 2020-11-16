const mongoose = require('mongoose');

// what does making it var instead of const do?
const TravelSchema = new mongoose.Schema({
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
    }]

});

module.exports = mongoose.model('Trips', TravelSchema);
