const db = require('../db/index.js')

exports.getHotTodayVideoList = async (req, res, next) => {
  try {
    const hotTodayVideoList = await db.query(
      `SELECT
        rl.id,
        rl.recipe_name,
        rl.cover_url,
        rl.video_url,
        ul.nickname AS author_name,
        ul.avatar AS authorAvatar
      FROM
        home_column_list_today_hot_video_recipe hc
      INNER JOIN
        recipe_list rl ON hc.recipe_id = rl.id
      INNER JOIN
        user_list ul ON rl.author_id = ul.id
      WHERE
        rl.publish = 1
      ORDER BY
        hc.sort_no ASC`
    )
    res.json({
      code: '200',
      data: hotTodayVideoList,
    })
  } catch (err) {
    next(err)
  }
}

exports.getHotTodaySearchList = async (req, res, next) => {
  try {
    const hotTodaySearchList = await db.query(
      'select id, keyword, super_hot, sort_no from home_column_list_today_hot_search order by sort_no asc'
    )
    res.json({
      code: '200',
      data: hotTodaySearchList,
    })
  } catch (err) {
    next(err)
  }
}

exports.getThreeMealsTodayList = async (req, res, next) => {
  try {
    const results = [
      { label: '早餐', type: 'breakfast', list: [] },
      { label: '午餐', type: 'lunch', list: [] },
      { label: '下午茶', type: 'afternoonTea', list: [] },
      { label: '晚餐', type: 'dinner', list: [] },
      { label: '夜宵', type: 'nightSnack', list: [] },
    ]
    const promiseArr = []
    for (const item of results) {
      const promise = db.query(
        `SELECT
          rl.id,
          rl.recipe_name,
          rl.cover_url,
          hc.recommend_words
        FROM
          home_column_list_today_three_meals hc
        INNER JOIN
          recipe_list rl ON hc.recipe_id = rl.id
        WHERE
          hc.type = ? AND rl.publish = 1
        ORDER BY
          hc.sort_no ASC
        LIMIT
          3
        `,
        item.type
      )
      promise.then((list) => (item.list = list))
      promiseArr.push(promise)
    }
    await Promise.all(promiseArr)
    res.json({ code: '200', data: results })
  } catch (err) {
    next(err)
  }
}

exports.getHomeSystemColumnConfig = async (req, res, next) => {
  try {
    const results = await db.query(
      'select id,column_name,available,sort_no from home_column_list where `system` = 1 order by sort_no asc'
    )
    res.json({ code: '200', data: results })
  } catch (err) {
    next(err)
  }
}

exports.getHomeCustomColumns = async (req, res, next) => {
  try {
    const columnList = await db.query(
      'SELECT id,column_name FROM home_column_list WHERE `system` = 0 AND available = 1 ORDER BY sort_no ASC'
    )
    const promiseArr = []
    for (const column of columnList) {
      const promise = db.query(
        `SELECT
          rl.id,
          rl.recipe_name,
          rl.cover_url,
          rl.is_video,
          rl.main_ingredients_str,
          ul.id AS author_id,
          ul.avatar AS author_avatar,
          ul.nickname AS author_name
        FROM
          home_column_list_recipe hc
        INNER JOIN
          recipe_list rl ON hc.recipe_id = rl.id
        INNER JOIN
          user_list ul ON rl.author_id = ul.id
        WHERE
          hc.column_id = ? AND rl.publish = 1
        ORDER BY
          hc.sort_no ASC`,
        [column.id]
      )
      promise.then((list = []) => {
        list.forEach((item) => {
          item.ingredientStr = item.mainIngredientsStr
            .slice(0, -1)
            .split(';')
            .map((item3) => item3.split(':')[0])
            .join(',')
          delete item.mainIngredientsStr
        })

        column.list = list
      })
      promiseArr.push(promise)
    }
    await Promise.all(promiseArr)
    res.json({ code: '200', data: columnList })
  } catch (err) {
    next(err)
  }
}
