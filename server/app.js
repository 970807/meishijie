const express = require('express')
const cors = require('cors')
const router = require('./router')
const errorHandler = require('./middleware/error-handler')

const app = express()

app.use(cors())

app.use(express.static('public'))
app.use(express.static('public/dist'))

app.use(router)

app.use(errorHandler)

app.listen(3000, () => {
  console.log('server is running successful!')
})
