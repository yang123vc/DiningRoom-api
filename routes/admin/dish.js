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
    pool.query("SELECT cid,cname FROM dr_category",(err,result)=>{
        if(err) throw err;
        var categoryList = resutl;
        var count = 0;
        for(var c of categoryList){
            //循环查询每个类别下有哪些菜品
            var sql="SELECT * FROM dr_dish WHERE categoryId=?"
            pool.query(sql,c.cid,(err,result)=>{
                c.dishList = result;
                count++;
                if(count==categoryList.length){
                    res.send(categoryList)
                }
            })
        }
    })
})