const express = require('express');
const pool = require('../../pool');
var router = express.Router()

module.exports = router;

router.get('/',(req,res)=>{
    pool.query('SELECT * FROM dr_table ORDER BY tid',(err,result)=>{
        if(err) throw err
        res.send(result);
    })
})