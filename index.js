console.log('准备启动API服务器...')
console.log(new Date().toLocaleString());

const PORT = 8090;
const express = require('express');
const cors = require("cors");
const bodyParser = require("body-parser");
const categoryRouter = require("./routes/admin/category");
const adminRouter = require("./routes/admin/admin");
const dishRouter = require("./routes/admin/dish");
const settingRouter = require("./routes/admin/settings");
const tableRouter = require("./routes/admin/table");

//允许以下地址来访问 服务器
var app = express();
//启动主服务器
app.listen(PORT,()=>{
    console.log('API服务器启动成功。。。'+PORT);
})
//使用中间件

// app.use(bodyParser.urleencode({});//把格式的请求主体数据解析出来放入req.body属性
app.use(bodyParser.json());//把application/json格式的请求主体数据解析出来放入req.body属性
app.use(cors({
    Origin:["http://localhost:5500","http://127.0.0.1:5500"],
    credentials:true
  })) 

// 挂载路由器
app.use('/admin/category',categoryRouter);
app.use('/admin',adminRouter);
app.use('/admin/dish',dishRouter)
app.use('/admin/setting',settingRouter)
app.use('/admin/table',tableRouter)


