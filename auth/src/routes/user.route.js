const express = require("express");
const router = express.Router();
const { check, validationResult } = require("express-validator");
const User = require("../models/user.model");
const gravatar = require("gravatar");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const dotenv = require('dotenv');
dotenv.config();

router.post(
  "/",
  //validation
  [
    check("name", "Name is required").not().isEmpty(),
    check("email", "Please include a valid email address").isEmail(),
    check(
      "password",
      "Please enter a password with at least 6 characters"
    ).isLength({ min: 6 }),
  ],

  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({
        err: errors.array(),
      });
    }
    //request, response
    const { name, email, password } = req.body;
    try {
      //see if user already exists
      let user = await User.findOne({ email });
      if (user) {
        return res
          .status(400)
          .json({ errors: [{ message: "user already exists" }] });
      }

      //get user gravatar
      const avatar = gravatar.url(email, {
        s: "200",
        r: "pg",
        d: "mm",
      });
      user = new User({ name, email, password, avatar });

      //encrypt password
      const salt = await bcrypt.genSalt(10);
      const hashPassword = await bcrypt.hash(password, salt);
      user.password = hashPassword;
      await user.save();

      //create jsonwebtoken, return jwt to authenticate and access protected routes
      const payload = {
        currentUser: {
          id: user.id,
        },
      };
      jwt.sign(
        payload,
        process.env.jwtSecret,
        { expiresIn: 360000 },
        (err, token) => {
          if (err) throw err;
          return res.json({ token });
        }
      );
      console.log(req.body);
      //catch errors
    } catch (err) {
      console.error(err);
      return res.status(500).send("server error");
    }
  }
);

module.exports = router;
