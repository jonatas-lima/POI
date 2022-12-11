const mongoose = require('mongoose')
const Movie = require('./Movie')

const reviewSchema = new mongoose.Schema(
  {
    text: {
      type: String,
      trim: true,
      required: true
    },
    rating: {
      type: Number,
      required: true
    },
    recommend: {
      type: Boolean,
      required: true
    },
    author: {
      type: mongoose.SchemaTypes.ObjectId,
      ref: 'User',
      required: true
    },
    movie: {
      type: mongoose.SchemaTypes.ObjectId,
      ref: 'Movie',
      required: true
    },
    createdAt: {
      type: Date,
      default: Date.now
    }
  }
)

reviewSchema.statics.setAverageRatingToMovie = async function (movieId) {
  const statistics = await this.aggregate([
    {
      $match: { movie: movideId }
    },
    {
      $group: {
        _id: '$movie',
        totalRatings: { $sum: 1 },
        averageRating: { $avg: '$rating' }
      }
    }
  ])

  if (statistics.length === 0) {
    statistics[0].totalRatings = 0
    statistics[0].averageRating = 0
  }

  await Movie.findByIdAndUpdate(movieId, {
    totalRatings: statistics[0].totalRatings,
    averageRating: statistics[0].averageRating
  })
}

module.exports = mongoose.model('Review', reviewSchema)