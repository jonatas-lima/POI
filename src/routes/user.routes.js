const express = require('express')

const routes = express.Router()

routes
  .route('/:username')
  .get((req, res) => {
    return res.json({
      ok: true,
    }).status(200)
  })

routes
  .route('/:id')
  .get((req, res) => { return res.json({ ok: true }).status(200) })
  .put((req, res) => { return res.json({ put: true }).status(204) })
  .delete((req, res) => { return res.json({ deleted: true }).status(204) })

routes
  .route('/:id/reviews')
  .get((req, res) => { return res.json({ ok: true }).status(200) })
  .post((req, res) => { return res.json({ created: true }).status(201) })
  .put((req, res) => { return res.json({ modified: true }).status(204) })

routes
  .route('/')
  .get((req, res) => { return res.json({ ok: true }).status(200) })
  .post((req, res) => { return res.json({ created: true }).status(201) })

module.exports = routes