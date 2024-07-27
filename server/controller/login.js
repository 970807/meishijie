const db = require('../db/index.js')
const md5 = require('../utils/md5')
const jwt = require('../utils/jwt')
const { jwtSecret } = require('../config/default.config')

async function generateTokenByUserId(userId) {
  // 生成token
  const token = await jwt.sign(
    {
      userId,
    },
    jwtSecret,
    {
      expiresIn: '12h',
    },
  )
  return token
}

// 通过账号密码注册
exports.registerByAccount = async (req, res, next) => {
  try {
    const { account, password } = req.body
    const curTime = new Date()
    const { insertId: userId } = await db.query('insert into user_list set ?', {
      account,
      password: md5(password),
      createTime: curTime,
      updateTime: curTime,
    })
    const token = await generateTokenByUserId(userId)
    res.json({
      code: '200',
      data: { userId, account, token },
    })
  } catch (err) {
    next(err)
  }
}

// 通过账号密码登录
exports.loginByAccount = async (req, res, next) => {
  try {
    // 登录成功，返回token
    const userId = req.userId
    const token = await generateTokenByUserId(userId)
    res.json({
      code: '200',
      data: { userId, token },
    })
  } catch (err) {
    next(err)
  }
}
