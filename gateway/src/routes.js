const httpProxy = require("express-http-proxy");
const dotenv = require("dotenv");
dotenv.config();
const authServiceProxy = httpProxy(process.env.AUTH_SERVICE_URL);

const express = require("express");
const cors = require("cors");

class Routes {
  constructor(app) {
    // app.use(
    //   cors({ origin: "http://localhost:3000"})
    // );
    // app.use(express.urlencoded({ extended: true }));
    // app.use(express.json());
    this.app = app;
  }

  /* creating app Routes starts */
  appRoutes() {
    this.app.get("/api/v1/auth", (req, res) => {
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
  }

  routesConfig() {
    this.appRoutes();
  }
}

module.exports = Routes;
