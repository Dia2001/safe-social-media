require("dotenv").config();
require("./config/database").connect();
const express = require("express");
const cors = require("cors");
var bcrypt=require("bcryptjs");
const jwt=require("jsonwebtoken");
const app = express();
const axios=require('axios')
const auth=require('./middleware/auth')
app.use(express.json());
//importing user context
const Post=require("./models/post");
const Image=require("./models/image");
const port=process.env.PORT

//allow client access your image 
app.use(cors({
    origin: '*'
}));
app.use(express.static('public'));
app.use("/images", express.static("images"));

//configuaration multer
const path=require('path')
const multer=require("multer");
const storage=multer.diskStorage({
    destination:(req,file,cb)=>{
        cb(null,"./public/images")
    },
    filename:(req,file,cb)=>{
        console.log(file);
        cb(null,Date.now()+path.extname(file.originalname))
    }
})
const upload=multer({storage:storage})

// upload
app.post('/upload_post',upload.single('image'), (req, res)=>{
    res.send("Image Uploaded");
    const newImage = new Image({
        image:{
            name:req.file.originalname,
            data: req.file.originalname,
            contentType:req.file.mimetype
        },
        isPost:true,
        //lack of user id
    })
    newImage.save().then(()=>res.status(201).send('successfully uploaded'))
})

app.get('/',(req, res) =>{
    res.send("localhost is running")
})
//post without image
app.post("/post",auth, async (req, res)=>{
    // const token =req.headers["x-access-token"];
    //get information of user
    try{
        const paragraph=req.body.paragraph
        //validate if text is satify
        if(!(paragraph>0&&paragraph<225))
        {
            const post=await Post.create({
              text: paragraph,
              user:req.user.user_id
            })

            res.status(201).json(post);
        }
        else
        {
            res.status(404).send("bad paragraph")
        }
    }catch(e){
        console.error(e);
    }
});


//post with image and paragraph
app.post('/post-article',auth,upload.single('image'),async (req, res) =>{
    try{
      //check if paragraph not null and less then 225 characters
      const paragraph = req.body.paragraph;
      if(!(paragraph>0&&paragraph<225))
      {
            //check if have image include
            console.log(req.file)
           if(req.file!=null){
                   const post=Post.create({
                       text:paragraph,
                       user:req.user.id,
                       image:req.file.filename
                   }).then(()=>res.status(201).send('Post with image and paragraph'))
           
            }else{
                const post=Post.create({
                    text:paragraph,
                    user:req.user.id,
                }).then(()=>res.status(201).send('Post without image'))
            }
      }else
     {
        res.status(401).send('error ')
        throw new Error("Invalid paragraph")
     }
    }catch(e){
        console.log(e);
    }
})

app.get("/home", (req, res) => {
   console.log("get all");
   Post.find({}).then((posts)=>res.json(posts))
})

//get all posts by id_user
app.get("/home/:id",async (req, res) => {
    
    //find user by id_user
    try{
        const user=await axios.get(`http://localhost:3040/user/${req.params.id}`)
        if(user!==null){
            const postsOfUser=await Post.where({user:user.data._id})
            res.status(201).json(postsOfUser)
        }
    }catch(e){
        console.log(e)
    }
        
    //find all posts by id_user

})

app.listen(port,()=>{
    console.log(`server is running at ${port}`);
});
