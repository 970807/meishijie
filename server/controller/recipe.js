const db = require('../db/index.js')
const { formatTime } = require('../utils/tools')

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

const formatIngredientIdsStrToList = (str) => {
  return str
    .slice(0, -1)
    .split(';')
    .map((item) => {
      const [ingredientId, ingredientDose] = item.split(':')
      return { ingredientId: Number(ingredientId), ingredientDose }
    })
}

const getAllIngredientIdList = (list1, list2) => {
  let resList = [
    ...list1.map((item) => item.ingredientId),
    ...list2.map((item) => item.ingredientId)
  ]
  resList = [...new Set(resList)]
  return resList
}

const findIngredientNameByIngredientMap = (ingredientList, ingredientMap) => {
  const res = []
  for (const item of ingredientList) {
    const ingredientId = item.ingredientId
    const r = ingredientMap.find((item2) => item2.id === ingredientId)
    const ingredientName = r && r.ingredientName
    res.push({ ...item, ...{ ingredientName } })
  }
  return res
}

exports.getDetail = async (req, res, next) => {
  try {
    const { id } = req.params
    // 查询菜谱详情
    let [recipeDetail] = await db.query(
      'select * from recipe_detail_list where id=?',
      id
    )
    if (!recipeDetail) {
      return res.json({ code: '-1', message: '获取详情失败，该菜谱不存在' })
    }
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
        'select count(*) as count from recipe_detail_list where author_id=?',
        authorId
      )
    )
    // 根据作者id查询作者昵称
    promiseList.push(db.query('select * from user_list where id=?', authorId))

    let mainIngredientList = formatIngredientIdsStrToList(
      recipeDetail.mainIngredientIdsStr
    )
    let subIngredientList = formatIngredientIdsStrToList(
      recipeDetail.subIngredientIdsStr
    )
    // 主料和辅料的食材id
    const allIngredientIdList = getAllIngredientIdList(
      mainIngredientList,
      subIngredientList
    )
    promiseList.push(
      db.query('select * from recipe_ingredient_list where id in (?)', [
        allIngredientIdList
      ])
    )

    const r = await Promise.all(promiseList)
    const authorRecipeCount = r[0][0].count
    const authorInfo = r[1][0]
    const ingredientMap = r[2]
    recipeDetail.authorRecipeCount = authorRecipeCount

    let authorNickname = ''
    if (authorInfo) {
      const { account, phone, nickname } = authorInfo
      authorNickname = nickname || account || phone || ''
    }
    recipeDetail.authorNickname = authorNickname
    recipeDetail.authorAvatar = authorInfo && authorInfo.avatar
    recipeDetail.authorFanCount = authorInfo && authorInfo.fanCount

    mainIngredientList = findIngredientNameByIngredientMap(
      mainIngredientList,
      ingredientMap
    )
    subIngredientList = findIngredientNameByIngredientMap(
      subIngredientList,
      ingredientMap
    )
    recipeDetail.mainIngredientList = mainIngredientList
    recipeDetail.subIngredientList = subIngredientList
    delete recipeDetail.mainIngredientIdsStr
    delete recipeDetail.subIngredientIdsStr
    recipeDetail = formatTime(recipeDetail, ['createTime', 'updateTime'])
    res.json({
      code: '200',
      data: recipeDetail
    })
  } catch (err) {
    next(err)
  }
}
