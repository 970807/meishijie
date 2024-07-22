const db = require('../db/index.js')

exports.getHotTodayVideoList = async (req, res, next) => {
  try {
    const hotTodayVideoList = await db.query(
      'select * from hot_today_video_list',
      null
    )
    res.json({
      code: '200',
      data: hotTodayVideoList
    })
  } catch (err) {
    next(err)
  }
}

exports.getHotTodaySearchList = async (req, res, next) => {
  try {
    const hotTodaySearchList = await db.query(
      'select * from hot_today_search_list',
      null
    )
    res.json({
      code: '200',
      data: hotTodaySearchList
    })
  } catch (err) {
    next(err)
  }
}

exports.getThreeMealsTodayList = async (req, res, next) => {
  try {
    const results = await db.query(
      'select * from today_three_meals_list order by sort'
    )
    const allRecipeIdList = results
      .map((item) => item.recipeListStr.slice(0, -1).split(';'))
      .flat(1)
      .map((item) => item.split(',')[0])
    const allRecipeList = await db.query(
      'select * from recipe_list where id in (?)',
      [allRecipeIdList]
    )
    const columnList = []
    for (const item of results) {
      const { id, columnTitle: label, showRecipeCount, recipeListStr } = item
      const recipeList = recipeListStr
        .slice(0, -1)
        .split(';')
        .map((item2) => {
          const [recipeId, sort, desc] = item2.split(',')
          return { recipeId, sort, desc }
        })
        .sort((a, b) => a.sort - b.sort)
        .slice(0, showRecipeCount)
        .map((item2) => {
          const r =
            allRecipeList.find((item3) => item3.id === item2.recipeId) || {}
          const { id, coverUrl, recipeName } = r
          return {
            id,
            coverUrl,
            recipeName,
            desc: item2.desc
          }
        })
      columnList.push({ id, label, list: recipeList })
    }
    res.json({ code: '200', data: columnList })
  } catch (err) {
    next(err)
  }
}

exports.getRecommentList = async (req, res, next) => {
  try {
    const results = await db.query(
      'select * from home_recommend_column_list order by sort'
    )
    const allRecipeIdList = results
      .map((item) => item.recipeListStr.slice(0, -1).split(';'))
      .flat(1)
      .map((item) => item.split(',')[0])
    const allRecipeList = await db.query(
      'select * from recipe_list where id in (?)',
      [allRecipeIdList]
    )
    const allAuthorIdList = []
    const columnList = []
    for (const item of results) {
      const { id, columnTitle, showRecipeCount, recipeListStr } = item
      const recipeList = recipeListStr
        .slice(0, -1)
        .split(';')
        .map((item2) => {
          const [recipeId, sort] = item2.split(',')
          return { recipeId, sort }
        })
        .sort((a, b) => a.sort - b.sort)
        .slice(0, showRecipeCount)
        .map((item2) => {
          const r =
            allRecipeList.find((item3) => item3.id === item2.recipeId) || {}
          const {
            id,
            authorId,
            coverUrl,
            isVideo,
            mainIngredientsStr,
            recipeName
          } = r
          allAuthorIdList.push(authorId)
          const ingredientStr = mainIngredientsStr
            .slice(0, -1)
            .split(';')
            .map((item3) => item3.split(':')[0])
            .join(',')
          return {
            id,
            authorId,
            coverUrl,
            isVideo: Boolean(isVideo),
            recipeName,
            ingredientStr
          }
        })
      columnList.push({ id, columnTitle, list: recipeList })
    }
    const authorList = await db.query(
      'select id,nickname,avatar from user_list where id in (?)',
      [allAuthorIdList]
    )
    for (const item of columnList) {
      for (const item2 of item.list) {
        const { nickname: authorName, avatar: authorAvatar } = authorList.find(
          (item3) => item3.id === item2.authorId
        )
        item2.authorName = authorName
        item2.authorAvatar = authorAvatar
      }
    }
    res.json({ code: '200', data: columnList })
  } catch (err) {
    next(err)
  }
}
