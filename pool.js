/*连接池*/
const mysql = require('mysql');
var pool=mysql.createPool({
    //本地测试
    // host:'127.0.0.1',
    // port:3306,
    // user:'root',
    // password:'',
    // database:'diningroom',
    // connectionLimit: 10
    //新浪云
    host     : process.env.MYSQL_HOST,
    port     : process.env.MYSQL_PORT,
    user     : process.env.ACCESSKEY,
    password : process.env.SECRETKEY,
    database : 'app_' + process.env.APPNAME,
    connectionLimit:3
});


module.exports = pool