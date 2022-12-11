const express = require('express')

const routes = express.Router()

routes.get('/:username', (req, res) => {
  return res.json({
    ok: true,
  }).status(200)
})

module.exports = routes