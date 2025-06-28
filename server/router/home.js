const express = require('express')
const homeCtrl = require('../controller/home')

const router = express.Router()

// 获取今日热门视频菜谱列表
router.get('/getHotTodayVideoList', homeCtrl.getHotTodayVideoList)

// 获取今日热搜列表
router.get('/getHotTodaySearchList', homeCtrl.getHotTodaySearchList)

// 获取今日三餐列表
router.get('/getThreeMealsTodayList', homeCtrl.getThreeMealsTodayList)

// 获取首页系统栏位配置
router.get('/getHomeSystemColumnConfig', homeCtrl.getHomeSystemColumnConfig)

// 获取首页自定义栏位
router.get('/getHomeCustomColumns', homeCtrl.getHomeCustomColumns)

module.exports = router
