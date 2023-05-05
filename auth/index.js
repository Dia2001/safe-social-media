const mongoose = require("mongoose");

const db = "mongodb+srv://nguyenvandiatlvn3:123456789A@cluster0.ib7bjuw.mongodb.net/?retryWrites=true&w=majority";

  try {
    mongoose.set("strictQuery", true);
    mongoose.connect(db, {
      useNewUrlParser: true,
    });
    console.log("MongoDB connected successfully");
  } catch (err) {
    console.error(err.message);
    //exit process with failure
    process.exit(1);
  }