const { exec } = require('child_process')
const express = require('express')

const app = express()
const routes = express.Router()

routes.get('/cpu/stress', (req, res) => {
  exec('stress-ng --cpu 0 --cpu-method all -t 1m', (error, stdout, stderr) => {
    return res.send(stdout).status(200)
  })
})

routes.get('/memory/stress', (req, res) => {

})

routes.get('/io/stress', (req, res) => {

})

routes.get('/stress', (req, res) => {

})

app.use(routes)

app.listen(3000, () =>{
  console.log('listening on 3000')
})