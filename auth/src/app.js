// const db = "mongodb+srv://nguyenvandiatlvn3:123456789A@cluster0.ib7bjuw.mongodb.net/postmicros?retryWrites=true&w=majority";
const express = require("express");
const connectDB = require("./config/db.config");
const cors = require("cors");
const app = express();
const userRouter = require("./routes/user.route");
const authRouter = require("./routes/auth.route");

var corsOptions = {
  origin: "http://localhost:3001",
};

//connect database
connectDB();

// parse requests of content-type - application/x-www-form-urlencoded
app.use(express.urlencoded({ extended: true }));

//middleware
app.use(cors(corsOptions));

app.use(express.json());

app.use("/api/v1/users", userRouter);
app.use("/api/v1/auth", authRouter);

app.get("/", (req, res) => res.send("API running..."));

const PORT = process.env.PORT || 5010;

app.listen(PORT, () => console.log(`server listening on port: ${PORT}`));
