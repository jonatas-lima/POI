const { exec } = require('child_process')
const express = require('express')

const app = express()
const routes = express.Router()

function execCmd(cmd) {
  exec(cmd, (error, stdout, stderr) => {
    if (error) {
      console.error(error)
    }
    if (stderr) {
      console.error(stderr)
    }

    console.log(stdout)
  })
}

routes.get('/health', (req, res) => {
  return res.send('ok').status(200)
})

routes.get('/cpu/stress', (req, res) => {
  execCmd('stress-ng --cpu 0 --cpu-method all -t 1m')
})

routes.get('/memory/stress', (req, res) => {
  execCmd('stress-ng --vm 8 --vm-bytes 80% -t 1m')
})

app.use(routes)

app.listen(3000, () =>{
  console.log('listening on 3000')
})
