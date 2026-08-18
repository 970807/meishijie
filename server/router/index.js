const express = require('express')

const router = express.Router()

router.use('/common', require('./common'))
router.use('/home', require('./home'))
router.use('/login', require('./login'))
router.use('/user', require('./user'))
router.use('/recipe', require('./recipe'))

module.exports = router
