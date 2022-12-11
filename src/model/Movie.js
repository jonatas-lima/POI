const mongoose = require('mongoose')

const movieSchema = new mongoose.Schema(
  {
    title: {
      type: String,
      trim: true,
      required: true
    },
    launchedAt: {
      type: Date,
      required: true
    },
    genre: [
      {
        type: String,
        required: true
      }
    ],
    totalRatings: {
      type: Number,
      default: 0
    },
    averageRating: {
      type: Number,
      default: 0,
      min: 0,
      max: 5
    },
    imdbRating: {
      type: Number,
      required: true
    }
  }
)

module.exports = mongoose.model('Movie', movieSchema)