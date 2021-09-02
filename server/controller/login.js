const db = require('../db/index.js')
const md5 = require('../utils/md5')
const jwt = require('../utils/jwt')
const { jwtSecret } = require('../config/default.config')

// 通过账号密码注册
exports.registerByAccount = async (req, res, next) => {
  try {
    const { account, password } = req.body

    const curTime = new Date()
    const { insertId: userId } = await db.query('insert into user_list set ?', {
      account,
      password: md5(password),
      createTime: curTime,
      updateTime: curTime
    })
    // 生成token
    const token = await jwt.sign(
      {
        userId
      },
      jwtSecret
    )
    res.json({
      code: '200',
      data: { userId, account, token }
    })
  } catch (err) {
    next(err)
  }
}
