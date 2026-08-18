const express = require('express')
const commonCtrl = require('../controller/common')

const router = express.Router()

// 获取系统参数配置列表
router.get('/getSystemConfigs', commonCtrl.getSystemConfigs)

module.exports = router
