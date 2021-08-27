const express = require('express')
const cors = require('cors')
const homeRouter = require('./router/home.js')

const app = express()

app.use(cors())

app.use(express.static('public'))

app.get('/', (req, res) => {
  res.render('./public/index.html')
})

app.use('/home', homeRouter)

app.listen(3000, () => {
  console.log('server running successful!')
})
