/*
  封装数据库通用api
*/

const mysql = require('mysql')

exports.base = (sql, data) => {
  return new Promise((resolve, reject) => {
    const connection = mysql.createConnection({
      host: 'localhost',
      user: 'root',
      password: '123456',
      database: 'meishijie'
    })

    connection.connect()

    // 操作数据库（数据库操作也是异步的）
    connection.query(sql, data, function(err, results) {
      if (err) {
        reject(err)
      } else {
        resolve(results)
      }
    })

    connection.end()
  })
}
