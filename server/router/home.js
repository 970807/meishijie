const express = require('express')
const db = require('../db/index.js')

const router = express.Router()

router.get('/getHotTodayVideoList', async (req, res) => {
  try {
    const hotTodayVideoList = await db.base(
      'select * from hot_today_video_list',
      null
    )
    res.json(hotTodayVideoList)
  } catch (err) {
    console.error(err)
    res.status(500).end()
  }
})

router.get('/getHotTodaySearchList', async (req, res) => {
  try {
    const hotTodaySearchList = await db.base(
      'select * from hot_today_search_list',
      null
    )
    res.json(hotTodaySearchList)
  } catch (err) {
    console.error(err)
    res.status(500).end()
  }
})

router.get('/getThreeMealsTodayList', async (req, res) => {
  try {
    Promise.all([
      db.base('select * from three_meals_today_first_category_list', null),
      db.base('select * from three_meals_today_second_category_list', null)
    ]).then(([firstCategoryList, secondCategoryList]) => {
      const threeMealsTodayList = []
      for (const item of firstCategoryList) {
        threeMealsTodayList.push({
          ...item,
          list: secondCategoryList.filter((item2) => item2.parentId === item.id)
        })
      }
      res.json(threeMealsTodayList)
    })
  } catch (err) {
    console.error(err)
    res.status(500).end()
  }
})

router.get('/getRecommentList', async (req, res) => {
  try {
    Promise.all([
      db.base('select * from home_recomment_first_category_list', null),
      db.base('select * from home_recomment_second_category_list', null)
    ]).then(([firstCategoryList, secondCategoryList]) => {
      const recommentList = []
      for (const item of firstCategoryList) {
        recommentList.push({
          ...item,
          list: secondCategoryList.filter((item2) => item2.parentId === item.id)
        })
      }
      res.json(recommentList)
    })
  } catch (err) {
    console.error(err)
    res.status(500).end()
  }
})

module.exports = router
