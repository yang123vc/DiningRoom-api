const express = require('express');
const pool = require('../../pool');
var router = express.Router()



module.exports = router;
/*
*API: GET /admin/login/:aname/:apwd
请求数据：{aname:'xx' apwd：'xxx'}
完成用户等陆验证(提示：有的项目中吃出选择POST请求)
返回数据：
{code：200，msg:'login succ'}
{code:400,msg:'aname or apwd err'}
*/
router.get("/login/:aname/:apwd",(req,res)=>{
    var aname = req.params.aname;
    var apwd = req.params.apwd;
    //需要对用户输入的密码执行加密函数
    var sql="SELECT aid FROM dr_admin WHERE aname=? AND apwd=PASSWORD(?)"
    pool.query(sql,[aname,apwd],(err,result)=>{
        if(err)throw err
        if(result.length>0){//查询到一行数据，登录成功
            res.send({code:200,msg:"login succ"})
        }else{//没有查询到数据
            res.send({code:400,msg:"uname or apwd err"})
        }
    })
})


/*
*API: PATCH /admin/login   
请求数据：{aname:'xx' oldPwd：'xxx',newPwd:'xxx'}
根据管理员和密码修改管理员密码
返回数据：
{code：200，msg:'modified succ'}
{code:400,msg:'aname or apwd err'}
{code:401,msg:'apwd or modifiedfkajodn'}
*/
router.patch('/',(req,res)=>{
    var data =req.body;
    // console.log(data)
    //首先根据aname/oldPwd查询该用户是否存在 1
    //如果查询到了用户，再修改其密码
    var sql="SELECT aid FROM dr_admin WHERE aname=? AND apwd=PASSWORD(?)"
    pool.query(sql,[data.aname,data.oldPwd],(err,result)=>{
        if(err) throw err;
        if(result.length==0){//查询到用户在修改
            res.send({code:400,msg:"password err为找到用户"})
            return;
        }
        var sql="UPDATE dr_admin SET apwd=PASSWORD(?) WHERE aname=?"
        pool.query(sql,[data.newPwd,data.aname],(err,result)=>{
            if(err)throw err
            if(result.changedRows>0){ //密码修改完成
                res.send({code:200,msg:"modify succ成功"})
            }else{//新旧密码一样
                res.send({code:401,msg:"pwd not modifiedfkajodn密码一样"})
            }
        })
    })
})


// const express = require('express');
// const pool = require('../../pool');
// var router =express.Router()
// module.exports = router;