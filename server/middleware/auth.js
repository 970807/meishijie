const { verify } = require('../utils/jwt')
const { jwtSecret } = require('../config/default.config')
const db = require('../db/index.js')

module.exports = async (req, res, next) => {
  // 从请求头获取 token 数据
  let token = req.headers.authorization
  token = token ? token.split('Bearer ')[1] : null
  if (!token) {
    return res.json({ code: '401' })
  }
  // 验证 token 是否有效
  try {
    const { userId } = await verify(token, jwtSecret)
    const r = await db.query('select * from user_list where id = ?', userId)
    if (r.length < 1) {
      return res.json({ code: '401' })
    }
    req.userInfo = r[0]
    next()
  } catch (err) {
    console.error(err.message)
    res.json({ code: '401' })
  }
}
