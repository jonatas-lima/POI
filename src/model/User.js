const mongoose = require('mongoose')

const userSchema = new mongoose.Schema(
  {
    fullName: {
      type: String,
      trim: true,
      required: true
    },
    username: {
      type: String,
      trim: true,
      require: true
    },
    createdAt: {
      type: Date,
      default: Date.now
    },
    active: {
      type: Boolean,
      default: true
    }
  }
)

module.exports = mongoose.model('User', userSchema)