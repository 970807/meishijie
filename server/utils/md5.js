const crypto = require('crypto')

module.exports = (str) => {
  return crypto
    .createHash('md5')
    .update('meishijie' + str)
    .digest('hex')
}
