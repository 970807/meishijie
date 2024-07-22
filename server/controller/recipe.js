const db = require('../db/index.js')
const { formatTime } = require('../utils/tools')

const formatIngredientsStrToList = (str) => {
  return str
    .slice(0, -1)
    .split(';')
    .map((item) => {
      const [ingredientName, ingredientDose] = item.split(':')
      return { ingredientName, ingredientDose }
    })
}

const formatStepsStrToList = (str) => {
  const arr = str.slice(0, -1).split(';')
  return arr.map((item) => {
    const [img, content] = item.split(',')
    return { img, content }
  })
}

const formatFinishGoodImgStrToList = (str) => {
  return str.slice(0, -1).split(';')
}

exports.getDetail = async (req, res, next) => {
  try {
    const { id } = req.params
    // 查询菜谱详情
    let [recipeDetail] = await db.query(
      'select * from recipe_list where id=?',
      id
    )
    if (!recipeDetail) {
      return res.json({ code: '-1', message: '获取详情失败，该菜谱不存在' })
    }
    // 格式化主料
    recipeDetail.mainIngredientList = formatIngredientsStrToList(
      recipeDetail.mainIngredientsStr
    )
    delete recipeDetail.mainIngredientsStr
    recipeDetail.subIngredientList = formatIngredientsStrToList(
      recipeDetail.subIngredientsStr
    )
    delete recipeDetail.subIngredientsStr
    // 格式化菜谱步骤
    recipeDetail.stepList = formatStepsStrToList(recipeDetail.stepsStr)
    delete recipeDetail.stepsStr
    // 格式化成品图
    recipeDetail.finishFoodImgList = formatFinishGoodImgStrToList(
      recipeDetail.finishFoodImgsStr
    )
    delete recipeDetail.finishFoodImgsStr
    const authorId = recipeDetail.authorId
    const promiseList = []
    // 查询作者的菜谱数
    promiseList.push(
      db.query(
        'select count(*) as count from recipe_list where author_id=?',
        authorId
      )
    )
    // 根据作者id查询作者昵称
    promiseList.push(db.query('select * from user_list where id=?', authorId))

    // 菜谱浏览数+1
    recipeDetail.browerCount++
    promiseList.push(
      db.query('update recipe_list set brower_count=? where id=?', [
        recipeDetail.browerCount,
        id
      ])
    )

    const r = await Promise.all(promiseList)
    const authorRecipeCount = r[0][0].count
    const authorInfo = r[1][0]
    recipeDetail.authorRecipeCount = authorRecipeCount

    let authorNickname = ''
    if (authorInfo) {
      const { account, phone, nickname } = authorInfo
      authorNickname = nickname || account || phone || ''
    }
    recipeDetail.authorNickname = authorNickname
    recipeDetail.authorAvatar = authorInfo && authorInfo.avatar
    recipeDetail.authorFanCount = authorInfo && authorInfo.fanCount
    recipeDetail = formatTime(recipeDetail, ['createTime', 'updateTime'])

    res.json({
      code: '200',
      data: recipeDetail
    })
  } catch (err) {
    next(err)
  }
}
