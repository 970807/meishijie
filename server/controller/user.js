exports.getUserInfo = (req, res, next) => {
  try {
    const userInfo = { ...req.userInfo }
    delete userInfo.password
    res.json({
      code: '200',
      data: userInfo,
    })
  } catch (err) {
    next(err)
  }
}
