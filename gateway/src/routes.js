const httpProxy = require("express-http-proxy");
const dotenv = require("dotenv");
dotenv.config();
console.log("chek"+process.env.AUTH_SERVICE_URL);
const authServiceProxy = httpProxy(process.env.AUTH_SERVICE_URL);
const postServiceProxy = httpProxy(process.env.POST_SERVICE_URL);
const express = require("express");
const cors = require("cors");

//       //configuaration multer
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

class Routes {
 
  constructor(app) {
    this.app = app;
  }

  /* creating app Routes starts */
  appRoutes() {
    this.app.get("/",(req, res) => {
      const jsonData = {
        message: "hello word"
      };
      res.json(jsonData);
    });

    this.app.get("/api/v1/auth", (req, res) => {
      authServiceProxy(req, res);
    });

    this.app.get("/api/v1/users/:id", (req, res) => {
      authServiceProxy(req, res);
    });

    this.app.post("/api/v1/auth/login", (req, res) => {
      console.log(req.body);
      console.log(
        `Proxying ${req.method} request to http://localhost:5010${req.url}`
      );
      console.log(authServiceProxy(req, res));
      authServiceProxy(req, res);
    });

    this.app.post("/api/v1/users", (req, res) => {
      console.log(
        `Proxying ${req.method} request to http://localhost:5010${req.url}`
      );
      authServiceProxy(req, res);
    });

    this.app.get("/api/v1/users/:id",(req, res) => {
      authServiceProxy(req, res);
    })
    
    this.app.put("/api/v1/users/:id",(req, res) => {
      authServiceProxy(req, res);
    })

    this.app.get("/home", (req, res) => {
      console.log("hello");
      postServiceProxy(req, res);
    });
    this.app.get("/home/:id", (req, res) => {
      postServiceProxy(req, res);
    });


    this.app.get('/images/*',(req,res)=>{
      postServiceProxy(req, res);
      console.log("Load image!")
    })

    this.app.post('/post-article',upload.single('image'),(req,res)=>{
      console.log(req.file);
      console.log(req.body.paragraph);
      postServiceProxy(req, res);
    })
    
  }

  routesConfig() {
    this.appRoutes();
  }
}

module.exports = Routes;
