const express = require('express')
const userRoutes = require('./user.routes')
const movieRoutes = require('./movie.routes')
const reviewRoutes = require('./review.routes')

const router = express.Router()

router.use('/user', userRoutes)
router.use('/movie', movieRoutes)
router.use('/review', reviewRoutes)

module.exports = router