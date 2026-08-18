const db = require('../db/index.js')

exports.getSystemConfigs = async (req, res, next) => {
  try {
    // 需要获取的参数配置列表
    const configCodes = [
      'canLogin', // 允许登录
      'canRegister', // 允许注册
      'canPhoneLogin', // 允许手机号登录
      'githubCodeEntry', // 开启github源码入口
      'adminSystemEntry', // 开启去管理端入口
    ]
    const list = await db.query(
      'select category_id,param_code,param_name,param_type,param_value,description from param_configure_list where param_code in (?)',
      [configCodes],
    )
    res.json({
      code: '200',
      data: list ?? [],
    })
  } catch (err) {
    next(err)
  }
}
