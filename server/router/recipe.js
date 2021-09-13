const express = require('express')
const recipeCtrl = require('../controller/recipe')

const router = express.Router()

// 获取菜谱详情
router.get('/getDetail/:id', recipeCtrl.getDetail)

module.exports = router
