const express = require('express')
const homeCtrl = require('../controller/home')

const router = express.Router()

// 获取今日热门视频菜谱列表
router.get('/getHotTodayVideoList', homeCtrl.getHotTodayVideoList)

// 获取今日热搜列表
router.get('/getHotTodaySearchList', homeCtrl.getHotTodaySearchList)

// 获取今日三餐列表
router.get('/getThreeMealsTodayList', homeCtrl.getThreeMealsTodayList)

// 获取首页推荐列表
router.get('/getRecommentList', homeCtrl.getRecommentList)

module.exports = router
