const express = require("express");
const router = express.Router();
const { check, validationResult } = require("express-validator");
const User = require("../models/user.model");
const gravatar = require("gravatar");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const dotenv = require('dotenv');

dotenv.config();

router.get("/:id", async (req, res) => {
  const user = await User.findById(req.params.id)
  res.status(201).json(user)
})

//update user's data
// router.put('/:id',async (req,res) =>{
//   try{
//     let dataUpdate= {phone:req.body.phone,name:req.body.name};
//     const newUser=await User.findByIdAndUpdate(req.params.id,dataUpdate);
//     console.log('hello');
//       const updateUser= newUser.save();
//       res.status(200).json(updateUser);
//     }catch(e){
//       res.status(400).send("Fault to update")
//     }

// })

router.put('/:id', async (req, res) => {
  try {
    const user = await User.findById(req.params.id);
    if (req.body.name != '')
      user.name = await req.body.name;
    
    if (req.body.phone != '' ) {
      user.phone = await req.body.phone;
    }
    await user.save();
    res.status(200).json(user);
  } catch (e) {
    console.log(e);
    res.status(400).send("Fault to update!")
  }

}
);


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
    console.log("check");
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      console.log(errors);
      return res.status(400).json({
        err: errors.array(),
      });
    }
    console.log(":))")
    //request, response
    const { name, email, password, phone } = req.body;
    try {
      //see if user already exists
      let user = await User.findOne({ email });
      if (user) {
        return res
          .status(400)
          .json({ errors: [{ message: "user already exists" }] });
      }

      //get user gravatar
      // const avatar = gravatar.url(email, {
      //   s: "200",
      //   r: "pg",
      //   d: "mm",
      // });
      const avatar = gravatar.url(email, { s: '100', r: 'x', d: 'retro' }, true)
      user = new User({ name, email, password, avatar, phone });

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
          console.log("hello")
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
