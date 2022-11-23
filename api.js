var express = require('express');
var bodyParser = require('body-parser');
var cors = require('cors');
var config = require('./dbconfig');
var app = express();
var router = express.Router();
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cors());
app.use('/api', router);

config.connect(function(){
    console.log("Connected");
});

router.use((request,response,next)=>{
   console.log('middleware');
   next();
})

router.route('/plants/searchbyname').post(async(request,response)=>{
   var localName =request.body.local_name;
   var scName = request.body.local_name;
   console.log(`${localName}`);
   console.log(`${scName}`);
   var res1= await config.query(`Select * from demodata where local_name = ($1) or 
   scientific_name=($2)`,[localName,scName],
   (err, res)=>{
        console.log(request.body);
       if(!err){
           console.log("getName");
           console.log(res.rows);
         return response.json(res.rows);
       }
       else{
           console.log(err);
           return null;
       }
   });
 })
router.route('/plants/details').get(async(request,response)=>{
    var res1= await config.query("Select * from demodata",
    (err, res)=>{
 
        if(!err){
            console.log("details");
            console.log(res.rows);
            return response.json(res.rows);
        }
        else{
            console.log("error");
            return null;
        }
    });
})    
router.route('/plants/searchbyid').post(async(request,response)=>{
    var uid = request.body.uid;
   console.log(`${uid}`);
    var res1= config.query(`Select * from demodata where uid= ($1)`,[uid],
    (err, res)=>{
         console.log(request.body);
        if(!err){
            console.log("getName");
            console.log(res.rows);
          return response.json(res.rows);
        }
        else{
            console.log(err);
            return null;
        }
    });
})
router.route('/plants/insert').post(async(request,response)=>{
    
    var uid = request.body.uid;
   console.log(`${uid}`);
   var local_name = request.body.local_name;
   console.log(`${local_name}`);
   var scientific_name = request.body.scientific_name;
   console.log(`${scientific_name}`);
    var sql="insert into demodata (uid,local_name,scientific_name) values (($1),($2),($3))";
    config.query(sql,[uid,local_name,scientific_name],function(err,result){
        if(!err){
            console.log("records inserted \n"+result.rowCount+" rows affected.")
            return response.json({"status":200, "message":"record inserted"})
            
        }
        else{
            console.log(err.message)
            return response.json({"status":500, "message":"record not inserted"})
            
        }
    })

})


 router.route('/campaign/detailsadmin').get(async(request,response)=>{
     var res1= await config.query("Select cdate,clocation,ctype from campaign order by cdate desc",
     (err, res)=>{
  
         if(!err){
             console.log("details");
             console.log(res.rows);
             return response.json(res.rows);
         }
         else{
             console.log("error");
             return null;
         }
  
     });
 })    
 router.route('/campaign/detailsuser').get(async(request,response)=>{
    var res1= await config.query("Select cdate,clocation,ctype from campaign where cdate > cast(current_date as text)",
    (err, res)=>{
 
        if(!err){
            console.log("details");
            console.log(res.rows);
            return response.json(res.rows);
        }
        else{
            console.log("error");
            return null;
        }
    });
}) 
 router.route('/campaign/insert').post(async(request,response)=>{
     
     var cdate = request.body.cdate;
    console.log(`${cdate}`);
    var clocation = request.body.clocation;
    console.log(`${clocation}`);
    var clocation = request.body.ctype;
    console.log(`${ctype}`);
    var sql="insert into campaign (cdate,clocation,ctype) values (($1),($2),($3))";
     config.query(sql,[cdate,clocation],function(err,result){
         if(!err){
             console.log("records inserted \n"+result.rowCount+" rows affected.")
             return response.json({"status":200, "message":"record inserted"})
         }
         else{
             console.log(err.message)
             return response.json({"status":500, "message":"record not inserted"})
         }
     })
 })
 router.route('/diversity/insert').post(async(request,response)=>{
    
    var dtotalplants = request.body.dtotalplants;
   console.log(`${dtotalplants}`);
   var dspeices = request.body.dspeices;
   console.log(`${dspeices}`);
   var sql="insert into diversity (dtotalplants,dspeices) values (($1),($2))";
    config.query(sql,[dtotalplants,dspeices],function(err,result){
        if(!err){
            console.log("records inserted \n"+result.rowCount+" rows affected.")
            return response.json({"status":200, "message":"record inserted"})
        }
        else{
            console.log(err.message)
            return response.json({"status":500, "message":"record not inserted"})    
        }
    })
})
router.route('/diversity/details').get(async(request,response)=>{
    var res1= await config.query("select dtotalplants,dspeices from diversity where did=(select max(did) from diversity)",
    (err, res)=>{
 
        if(!err){
            console.log("details");
            console.log(res.rows);
            return response.json(res.rows);
        }
        else{
            console.log("error");
            return null;
        }
    });
})  
router.route('/feedback/insert').post(async(request,response)=>{
    
    var fname = request.body.fname;
   console.log(`${fname}`);
   var feedback = request.body.feedback;
   console.log(`${feedback}`);
   var sql="insert into feedback (fname,feedback) values (($1),($2))";
    config.query(sql,[fname,feedback],function(err,result){
        if(!err){
            console.log("records inserted \n"+result.rowCount+" rows affected.")
            return response.json({"status":200, "message":"record inserted"})
        }
        else{
            console.log(err.message)
            return response.json({"status":500, "message":"record not inserted"})    
        }
    })
})
router.route('/feedback/details').get(async(request,response)=>{
    var res1= await config.query("select fname,feedback from feedback",
    (err, res)=>{
 
        if(!err){
            console.log("details");
            console.log(res.rows);
            return response.json(res.rows);
        }
        else{
            console.log("error");
            return null;
        }
    });
}) 
var port = process.env.PORT || 8090;
app.listen(port);
console.log('Plant API is runnning at ' + port);
