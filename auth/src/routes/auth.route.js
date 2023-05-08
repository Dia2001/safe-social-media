const express = require("express");
const router = express.Router();
const authMiddleware = require("../middleware/auth.middleware");
const User = require("../models/user.model");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const config = require("config");
const { check, validationResult } = require("express-validator");
const dotenv = require('dotenv');
dotenv.config();
//@route GET api/auth
//@desc  Test route
//@access Public

//protected route
router.get("/", authMiddleware, async (req, res) => {
  try {
    //find the user by id and return the user data except the password
    const user = await User.findById(req.user.id).select("-password");
    return res.status(200).json(user);
  } catch (err) {
    console.error(err.message);
    return res.status(500).send("server error");
  }
});

//@route POST api/auth
//@desc  authentication and login route
//@access Public
router.post(
  "/login",
  //validation
  [
    check("email", "please include a valid email").isEmail(),
    check("password", "password is required").exists(),
  ],
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({
        err: errors.array(),
      });
    }

    const { email, password } = req.body;
    try {
      //check if email match
      let user = await User.findOne({ email: email });
      console.log("foundUser", user);
      if (!user) {
        return res.status(400).json({
          errors: [{ message: "invalid credentials (invalid email)" }],
        });
      }
      //check if password match
      const isPasswordMatch = await bcrypt.compare(password, user.password);
      if (!isPasswordMatch) {
        return res.status(400).json({
          errors: [{ message: "invalid credentials (invalid password)" }],
        });
      }
      //create jwt and return jwt
      const payload = {
        currentUser: {
          id: user.id,
        },
      };
      const token = jwt.sign(payload,process.env.jwtSecret, {
        expiresIn: 360000,
      });
      return res.status(200).json({ message: "login successfully", token });
    } catch (err) {
      console.error(err.message);
      return res.status(500).send("server error");
    }
  }
);
module.exports = router;
