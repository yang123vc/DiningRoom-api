const express = require('express');
const pool = require('../../pool');
var router = express.Router()

module.exports = router;

router.get('/',(req,res)=>{
    pool.query('SELECT * FROM dr_settings LIMIT 1',(err,result)=>{
        if(err) throw err
        res.send(result[0]);
    })
})




router.get('/',(req,res)=>{
    pool.query('UPDATE dr_settings SET ?',req.body,(err,result)=>{
        if(err) throw err
        res.send({code:200,msg:'stiing updated succ'})
    })
})

