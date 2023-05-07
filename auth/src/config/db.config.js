const mongoose = require("mongoose");
//const config = require("config");

// const db = config.get("mongoURI");
const dotenv = require('dotenv');
dotenv.config();

const connectDB = async () => {
  try {
    mongoose.set("strictQuery", true);
    await mongoose.connect(
      process.env.mongoURI,
      {
        useNewUrlParser: true,
      }
    );
    console.log("MongoDB connected successfully");
  } catch (err) {
    console.error(err.message);
    //exit process with failure
    process.exit(1);
  }
};

module.exports = connectDB;
