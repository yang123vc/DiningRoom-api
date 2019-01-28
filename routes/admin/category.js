/*菜品类别相关的路由*/
const express = require('express');
const pool = require('../../pool');
var router = express.Router();
module.exports = router;

/*API:GET/admin/category    RESTful风格的API
 *客户端获取所有的菜品类别，按菜品升序排列
 *返回值形如；
 *[{cid:1,cname:".."},{...}]
 */
router.get('/', (req, res) => {
    var sql = "SELECT * FROM dr_category ORDER BY cid"
    pool.query(sql, (err, result) => {
        if (err) throw err;
        var jsonDate = JSON.stringify(result);
        res.send('daData(' + jsonDate + ')');
    })
})

/*API: DELETE/admin/category/:cid
 *含义：根据表示菜品编号的路由参数，删除该菜品
 *返回值形如:
 *{code:200,msg:"1 category deleted"}
 *{code:400,msg:"0 category deleted"}
 */
router.delete('/:cid', (req, res) => {
    //注意：删除菜品类别前必须先把属于该类别的菜品的类别编号设置为NULL
    var sql = "UPDATE dr_dish SET categoryId=NULL WHERE categoryId=?"
    pool.query(sql, req.params.cid, (err, result) => {
        if (err) throw err;
        //致辞指定类别的菜品已经修改完毕

        var sql = "DElETE FROM dr_category WHERE cid=?";
        pool.query(sql, req.params.cid, (err, result) => {
            if (err) throw err;
            if (result.affectedRows > 0) {
                res.send({
                    code: 200,
                    msg: '1 category deleted'
                })
            } else {
                res.send({
                    code: 400,
                    msg: '0 category deleted'
                })
            }
        })
    })
})

/*API: POST/admin/category   非幂等
 *请求主体参数:{cname:'xxx'}
 *含义：添加新的菜品类别
 *返回值形如:
 *{code:200,msg:"1 category added,cid:x"}
 */
router.post('/',(req,res)=>{
    console.log('获取到请求数据：')
    // console.log(req.body)
    var data =req.body;
    var sql="INSERT INTO dr_category SET ?"
    pool.query(sql,data,(err,result)=>{//注意此次SQL语句的简写
        if(err)throw err
        res.send({code:200,msg:'1 category added'})
    })
})

/*API: PUT/admin/category
 *请求主体参数:{cid:xx, cname:'xxx'}
 *含义：根据菜品类别编号修改类别
 *返回值形如:
 *{code:200,msg:"1 category modified"}
 *{code:400,msg:"0 category modified,not exists"}
 *{code:401,msg:"0 category modified,no modification"}
 */
router.put('/',(req,res)=>{
    var data = req.body;  //请求数据{cid:xx , cname:'xx'}
    //此次可以对数据进行验证
    var sql="UPDATE dr_category SET ? WHERE cid=?";
    pool.query(sql,[data,data.cid],(err,result)=>{
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