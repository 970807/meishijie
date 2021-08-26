const express = require('express')
const cors = require('cors')
const homeRouter = require('./router/home.js')

const app = express()

app.use(cors())

app.use(express.static('public'))

app.use('/home', homeRouter)

app.listen(3000, () => {
  console.log('running server successful!')
})
