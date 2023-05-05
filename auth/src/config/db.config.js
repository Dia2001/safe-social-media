const mongoose = require("mongoose");
const config = require("config");

// const db = config.get("mongoURI");

const connectDB = async () => {
  try {
    mongoose.set("strictQuery", true);
    await mongoose.connect(
      "mongodb+srv://nguyenvandiatlvn3:123456789A@cluster0.ib7bjuw.mongodb.net/postmicros?retryWrites=true&w=majority",
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
