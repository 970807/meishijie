const db = require('../db/index.js')
const md5 = require('../utils/md5')

exports.registerByAccountValidator = async (req, res, next) => {
  try {
    const { account, password } = req.body
    if (!account || !password) {
      return res.json({
        code: '-1',
        msg: '账号或密码不能为空'
      })
    }
    if (account.length < 3 || account.length > 12) {
      return res.json({
        code: '-1',
        msg: '账号的长度需在3到12位之间'
      })
    }
    if (password.length < 6 || password.length > 18) {
      return res.json({
        code: '-1',
        msg: '密码的长度需在6到18位之间'
      })
    }
    // 查找账号是否存在
    const r = await db.query(
      'select * from user_list where account = ?',
      account
    )
    if (r.length > 0) {
      return res.json({
        code: '-1',
        msg: '注册失败，该账号已存在'
      })
    }
    next()
  } catch (err) {
    next(err)
  }
}

exports.loginByAccountValidator = async (req, res, next) => {
  try {
    const { account, password } = req.body
    if (!account || !password) {
      return res.json({
        code: '-1',
        msg: '账号或密码不能为空'
      })
    }
    if (account.length < 3 || account.length > 12) {
      return res.json({
        code: '-1',
        msg: '账号的长度需在3到12位之间'
      })
    }
    if (password.length < 6 || password.length > 18) {
      return res.json({
        code: '-1',
        msg: '密码的长度需在6到18位之间'
      })
    }
    // 查找对应账号
    const r = await db.query(
      'select * from user_list where account = ?',
      account
    )
    if (r.length === 0) {
      return res.json({
        code: '-1',
        msg: '登录失败，账号不存在'
      })
    }
    const userInfo = r[0]
    if (userInfo.password !== md5(password)) {
      return res.json({
        code: '-1',
        msg: '登录失败，密码错误'
      })
    }
    req.userId = userInfo.id
    next()
  } catch (err) {
    next(err)
  }
}
