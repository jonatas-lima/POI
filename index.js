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

    return stdout
  })
}

routes.get('/health', (req, res) => {
  return res.send('ok').status(200)
})

routes.get('/cpu', (req, res) => {
  console.log('stressing cpu...')
  return res.send(execCmd('stress-ng --cpu 0 --cpu-method all --cpu-load 90 -t 1m')).status(200)
})

routes.get('/memory', (req, res) => {
  console.log('stressing memory...')
  return res.send(execCmd('stress-ng --vm 10 --vm-bytes 3G -t 1m')).status(200)
})

app.use(routes)

app.listen(3000, () =>{
  console.log('listening on 3000')
})
