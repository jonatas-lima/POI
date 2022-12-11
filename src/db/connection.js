const mongoose = require('mongoose')

module.exports = function connectDB() {
  console.log(process.env.DB_URL)
  console.log('Connecting to Mongo')
  mongoose.connect(
    process.env.DB_URL, {
      useCreateIndex: true,
      useNewUrlParser: true,
      useFindAndModify: false,
      useUnifiedTopology: true
    }
  )
}