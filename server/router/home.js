const express = require('express')

const router = express.Router()

router.get('/getHotTodayVideoList', (req, res) => {
  const hotTodayVideoList = require('../data/hotTodayVideoList.json')
  res.json(hotTodayVideoList)
})

router.get('/getHotTodaySearchList', (req, res) => {
  const hotTodaySearchList = require('../data/hotTodaySearchList.json')
  res.json(hotTodaySearchList)
})

router.get('/getThreeMealsTodayList', (req, res) => {
  const threeMealsTodayList = require('../data/threeMealsTodayList.json')
  res.json(threeMealsTodayList)
})

router.get('/getRecommentList', (req, res) => {
  const recommentList = require('../data/recommentList.json')
  res.json(recommentList)
})

module.exports = router
