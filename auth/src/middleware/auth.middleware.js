const jwt = require("jsonwebtoken");
const dotenv = require('dotenv');
dotenv.config();

module.exports = function (req, res, next) {
  //get token from header
  //when send a request to a protected route, need to send the token within the header
  const token = req.header("x-access-token");

  //check if not token
  if (!token) {
    return res.status(401).json({ message: "No token, authorization denied" });
  }

  //if the header includes token, verify token
  try {
    const decoded = jwt.verify(token,process.env.jwtSecret);
    console.log(decoded.currentUser);
    req.user = decoded.currentUser; //get user id after verify token, then assign user id to req.user
    return next();
  } catch (err) {
    console.log(err);
    res.status(401).json({ message: "token is not valid" });
  }
};