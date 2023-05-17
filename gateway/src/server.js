/* eslint-disable no-console */
const express = require("express");
const http = require("http");
const cors = require("cors");
const Routes = require("./routes");
const multer=require("multer");

class Server {
  constructor() {
    // var corsOptions = {
    //   origin: "http://localhost:3000",
    // };
    // const app = express();
    // app.use(express.urlencoded({ extended: true }));
    // app.use(cors(corsOptions));
    // app.use(express.json());
    // this.app = app;
    this.app = express();
    // this.app.use(
    //   cors({ origin: "http://localhost:3000", optionsSuccessStatus: 200 })
    // );
    this.app.use(cors({
      origin: '*'
    }));
    this.app.use(express.urlencoded({ extended: true }));
    this.app.use(express.json());

    // this.app.use(function (req, res, next) {
    //   res.header("Access-Control-Allow-Origin", "*");
    //   res.header(
    //     "Access-Control-Allow-Headers",
    //     "Origin, X-Requested-With, Content-Type, Accept"
    //   );
    //   next();
    // });
    this.http = http.Server(this.app);
  }

  /* Including app Routes starts */
  includeRoutes() {
    new Routes(this.app).routesConfig();
  }
  /* Including app Routes ends */

  startTheServer() {
    this.includeRoutes();

    const port = process.env.NODE_SERVER_POST || 9999;
    const host = process.env.NODE_SERVER_HOST || "localhost";

    this.http.listen(port, host, () => {
      console.log(`Listening on http://${host}:${port}`);
    });
  }
}

module.exports = new Server();
