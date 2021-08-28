/* eslint-disable */
module.exports = () => {
  return (err, req, res, next) => {
    console.error(err)
    res.status(500).end()
  }
}
