const express = require('express')

const router = express.Router()

router.get('/', (req, res) => {
  res.render('/index.html')
})

router.use('/home', require('./home'))
router.use('/login', require('./login'))

module.exports = router
