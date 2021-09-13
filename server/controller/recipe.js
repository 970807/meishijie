const db = require('../db/index.js')

exports.getDetail = async (req, res, next) => {
  try {
    const { id } = req.params
    const r = await db.query('select * from recipe_detail_list where id=?', id)
    if (r.length < 1) {
      return res.json({ code: '-1', message: '获取详情失败，菜谱id不存在' })
    }
    res.json({
      code: '200',
      data: r[0]
    })
  } catch (err) {
    next(err)
  }
}
