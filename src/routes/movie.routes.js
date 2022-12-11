const express = require('express')

const routes = express.Router()

routes.get('/:id', (req, res) => {
  return res.json({
    ok: true,
  }).status(200)
})

routes
  .route('/:id/reviews')
  .get((req, res) => {
    return res.json({
      ok: true
    }).status(200)
  })
  .post((req, res) => {
    return res.json({
      ok: true
    }).status(201)
  })

module.exports = routes