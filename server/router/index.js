const express = require('express')

const router = express.Router()

router.get('/', (req, res) => {
  res.render('../public/index.html')
})

router.use('/home', require('./home'))

module.exports = router
