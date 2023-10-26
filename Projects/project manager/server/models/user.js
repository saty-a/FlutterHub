const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
  name: {
    require: true,
    type: String,
    trim: true,
  },
   email: {
      required: true,
      type: String,
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
  password: {
    require: true,
    type: String,
    validator: (value) => {
      return value.length >= 6;
    },
    message: "password must contain atleast 6 letters",
  },
  confirmPass: {
    require: true,
    type: String,

    validator: (value) => {
      return value.match(password);
    },
    message: "password does not match",
  },
});
const User = mongoose.model("User", userSchema);
module.exports = User;
