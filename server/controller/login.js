const tools = require('../utils/tools')

let verificationCodeMap = []

// 生成随机字符串
function getRandomString(len = 4) {
  const strs = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'
  let res = ''
  for (let i = 0; i < len; i++) {
    res += strs.charAt(Math.floor(Math.random() * strs.length))
  }
  return res
}

// 生成验证码
exports.getVerificationCode = (req, res, next) => {
  const clearVerificationCodeMapByPhone = (phone) => {
    verificationCodeMap = verificationCodeMap.filter(
      (item) => item.phone !== phone
    )
  }
  try {
    const phone = req.query.phone
    const errMsg = tools.verifyPhoneNumber(phone)
    if (errMsg) {
      res.json({
        code: '-1',
        msg: errMsg
      })
      return
    }
    const verificationCode = getRandomString()
    if (verificationCodeMap.find((item) => item.phone === phone)) {
      clearVerificationCodeMapByPhone(phone)
    }
    verificationCodeMap.push({
      phone,
      verificationCode
    })
    setTimeout(() => {
      clearVerificationCodeMapByPhone(phone)
    }, 3 * 60 * 1000)
    res.json({
      code: '200',
      data: verificationCode
    })
  } catch (err) {
    next(err)
  }
}

// 通过手机号注册
exports.registerByPhone = (req, res, next) => {
  try {
    const { phone, verificationCode } = req.body
    const errMsg = tools.verifyPhoneNumber(phone)
    if (errMsg) {
      res.json({
        code: '-1',
        msg: errMsg
      })
      return
    }
    if (
      !verificationCodeMap.find(
        (item) =>
          item.phone === phone && item.verificationCode === verificationCode
      )
    ) {
      res.json({
        code: '-1',
        msg: '验证码有误，请重新输入'
      })
      return
    }
    res.json({ phone, verificationCode })
  } catch (err) {
    next(err)
  }
}
