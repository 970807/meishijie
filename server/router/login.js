const express = require('express')
const loginCtrl = require('../controller/login')

const router = express.Router()

// 生成验证码
router.get('/getVerificationCode', loginCtrl.getVerificationCode)

// 通过手机号注册
router.post('/registerByPhone', loginCtrl.registerByPhone)

module.exports = router
