/* eslint-disable no-console */
const express = require("express");
const http = require("http");
const cors = require("cors");
const Routes = require("./routes");
const multer=require("multer");

class Server {
  constructor() {
    this.app = express();

    this.app.use(cors({
      origin: '*'
    }));
    this.app.use(express.urlencoded({ extended: true }));
    this.app.use(express.json());
    this.http = http.Server(this.app);
  }

  /* Including app Routes starts */
  includeRoutes() {
    new Routes(this.app).routesConfig();
  }
  /* Including app Routes ends */

  startTheServer() {
    this.includeRoutes();

    console.log("getway")
    const port = process.env.NODE_SERVER_POST || 9999;
    const host = process.env.NODE_SERVER_HOST || "localhost";
    console.log(process.env.NODE_SERVER_HOST)
    this.http.listen(port, () => {
      console.log(`Listening on http://${host}`);
    });
  }
}

module.exports = new Server();
