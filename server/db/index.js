/*
  封装数据库通用api
*/

const mysql = require('mysql')
const path = require('path')

const pool = mysql.createPool(
  require(path.join(__dirname, '../config/mysql.config.js'))
)

exports.query = (sql, data) => {
  return new Promise((resolve, reject) => {
    pool.getConnection((err, connection) => {
      if (err) {
        return reject(err)
      }
      if (!connection) {
        return reject(
          new Error('mysql连接池，创建连接失败！-- connection为undefined')
        )
      }
      // 操作数据库（数据库操作也是异步的）
      connection.query(sql, data, (err, results) => {
        connection.release()
        if (err) {
          return reject(err)
        }
        resolve(results)
      })
    })
  })
}
