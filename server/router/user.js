const express = require('express')
const userCtrl = require('../controller/user')
const auth = require('../middleware/auth')

const router = express.Router()

// 获取用户信息
router.get('/getUserInfo', auth, userCtrl.getUserInfo)

module.exports = router
