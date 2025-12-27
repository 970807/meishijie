const express = require('express')
const recipeCtrl = require('../controller/recipe')
const validator = require('../middleware/validator.js')

const router = express.Router()

// 获取菜谱详情
router.get('/getDetail/:id', recipeCtrl.getDetail)

// 搜索菜谱
router.post('/search', recipeCtrl.search)

module.exports = router
