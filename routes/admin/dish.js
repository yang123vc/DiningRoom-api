const express = require('express');
const pool = require('../../pool');
var router =express.Router()
module.exports = router;
/*
获取所有的菜品的菜品（按类别进行分类）
返回数据：
[
    {cid:1,cname:'肉类'，dishList:[{},{},.....]}
    {cid:1,cname:'菜类'，dishList:[{},{},.....]}
    ....
]
*/
router.get('/',(req,res)=>{
    pool.query("SELECT cid,cname FROM dr_category ORDER BY cid",(err,result)=>{
        if(err) throw err;
        var categoryList = result; //类别列表
        var finishCount = 0;  //已经查询完菜品的类别的数量
        for(let c of categoryList){
            //循环查询每个类别下有哪些菜品
            var sql="SELECT * FROM dr_dish WHERE categoryId=? ORDER BY did DESC"
            pool.query(sql,c.cid,(err,result)=>{
                if(err) throw err
                c.dishList = result;
                //必须保证所有的类别下的菜品都查询完成才能发送响应消息--这些查询都是异步执行的
                finishCount++;
                if(finishCount==categoryList.length){
                    res.send(categoryList);
                }
            })
        }
    })
})

/*
POST /admin/dish
请求参数：
接收客户端上传的菜品图片，保存在服务器上，返回该图片在服务器上的随机文件名
响应数据：{code:200,msg:'upload succ',fuleName:23433453-2352.jpg}
*/
const multer = require('multer')
const fs = require('fs');
var upload = multer({
    dest:'tmp/'//指定客户端上传的文件临时存储路劲
})




//定义 路由,使用文件上传中间件
router.post('/image',upload.single('dishImg'),(req,res)=>{
    // console.log(req.file);//客户端上传的文件
    // console.log(req.body);//客户端随同图片提交的字符数据
    //把客户端上传的文件从临时目录转移到永久的图片路劲下
    var tmpFile =req.file.path;//临时文件名
    var suffix = req.file.originalname.substring(req.file.originalname.lastIndexOf('.'));//原始文件名中的后缀部分
    var newFile= randFileName(suffix);//目标文件名
    fs.rename(tmpFile,"img/dish/"+newFile,()=>{
        res.send({code:200,msg:"upload succ",fileName:newFile}) //把临时文件转移
    })
})

//生成一个随机文件名
//参数：suffix表示要生成的文件名中的后缀
//形如：1351324631-8821.jpg
function randFileName(suffix){
    var time = new Date().getTime();//当前系统时间
    var num = Math.floor(Math.random()*(10000-1000) + 1000);//4位随机的数字
    return time + '-' + num + suffix;
}

// min max : Math.random()*(max-min)+min
/*POST/admin/dish
请求参数：{title：'xx' ,imgUrl:',,jpg',price:xx,details:'xx' categroyId:xx}
添加一个新的菜品
输出消息：
{code:200,msg:'dish added succ' dishId:4t5}
*/
router.post('/',(req,res)=>{
    var data =req.body;
    var sql="INSERT INTO dr_dish SET ?"
    pool.query(sql,data,(err,result)=>{
        if(err)throw err;
        res.send({code:200,msg:'dish added succ',dishId:result.insertId})//将INSERT语句产生的自增编号输出给客户端
    })
})

/*DELETE/admin/dish/:did
根据指定的菜品编号删除该菜品
输出消息：
{code:200,msg:'dish deleted succ' }
{code:200,msg:'dish not exists' }
*/


/*
PUT/admin/dish
请求参数：{did:xx,title:'xx',imgUrl:'...jpg',price:xx,detail:'xx',categoryId:xx}
根据指定的菜品编号修改菜品
输出数据：
{code:200,msg:'dish updated succ' }
{code:200,msg:'dish not exists' }
*/
router.put('/',(req,res)=>{
    var data = req.body;  //请求数据{did:xx,title:'xx',imgUrl:'...jpg',price:xx,detail:'xx',categoryId:xx}
    //此次可以对数据进行验证
    var sql="UPDATE dr_dish SET ? WHERE did=?";
    pool.query(sql,[data,data.did],(err,result)=>{
        if(err)throw err;
        
        if(result.changedRows>0){ //实际更新了一行
            res.send({code:200,msg:'1 category modified'})
        }else if(result.affectedRows==0){
            res.send({code:400,msg:'category not exists'})
        }else if(result.affectedRows==1 && result.changedRows==0){ //影响到1行 ，但修改了0行-新值与旧值完全一样
            res.send({code:401,msg:"no category modification"})
        }
    })
})