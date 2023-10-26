const mongoose = require('mongoose');

const proSchema = mongoose.Schema({
    id: {
        type: String,
        unique: true,
        required: true
    },
    userid: {
        type: String,
        required: true,
        trim: true,
        validate: {
          validator: (value) => {
            const re =
              /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
            return value.match(re);
          },
          message: "Please enter a valid email address",
        },
    },
    proTitle: {
        type: String,
        required: true,
    },
    proStartDate: {
        type: Date,
        required: true
    },
    proContent: {
        type: String,
        default:"There is Noting"
        
    },
    proEndDate: {
        type: Date,
        required: true
    },
    managerName: {
        type: String,
        required: true
    },
    managerEmail: {
        type: String,
        required: true,
        trim: true,
        validate: {
          validator: (value) => {
            const re =
              /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
            return value.match(re);
          },
          message: "Please enter a valid email address",
        },
    },
});

module.exports = mongoose.model("Project", proSchema);
