const db = require('../db/index.js')

exports.getHotTodayVideoList = async (req, res, next) => {
  try {
    const hotTodayVideoList = await db.base(
      'select * from hot_today_video_list',
      null
    )
    res.json(hotTodayVideoList)
  } catch (err) {
    next(err)
  }
}

exports.getHotTodaySearchList = async (req, res, next) => {
  try {
    const hotTodaySearchList = await db.base(
      'select * from hot_today_search_list',
      null
    )
    res.json(hotTodaySearchList)
  } catch (err) {
    next(err)
  }
}

exports.getThreeMealsTodayList = async (req, res, next) => {
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
    next(err)
  }
}

exports.getRecommentList = async (req, res, next) => {
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
    next(err)
  }
}
