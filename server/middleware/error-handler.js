/* eslint-disable */
module.exports = () => {
  return (err, req, res, next) => {
    console.error(err)
    res.json({
      code: '-1',
      msg: '未知错误'
    })
  }
}
