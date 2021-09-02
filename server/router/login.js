const express = require('express')
const loginCtrl = require('../controller/login')
const validator = require('../middleware/validator.js')

const router = express.Router()

// 通过账号密码注册
router.post(
  '/registerByAccount',
  validator.registerByAccountValidator,
  loginCtrl.registerByAccount
)

// 通过账号密码登录
router.post(
  '/loginByAccount',
  validator.loginByAccountValidator,
  loginCtrl.loginByAccount
)

module.exports = router
